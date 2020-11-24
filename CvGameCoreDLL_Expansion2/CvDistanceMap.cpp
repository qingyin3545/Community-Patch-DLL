/*	-------------------------------------------------------------------------------------------------------
	� 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#include "CvGameCoreDLLPCH.h"
#include "CvDistanceMap.h"
#include "CvGameCoreUtils.h"

// must be included after all other headers
#include "LintFree.h"

struct SCityTiebreak : public STiebreakGenerator
{
	int operator()(int iOwner, int iFeatureID) const
	{
		CvCity* pCurrentCity = GET_PLAYER((PlayerTypes)iOwner).getCity(iFeatureID);
		//it can happen that there is no current city if the plot has never been updated because it's very remote
		if (pCurrentCity)
			return pCurrentCity->getGameTurnFounded();
		else
			return INT_MAX;
	}
};

/// Constructor
CvDistanceMap::CvDistanceMap(void)
{
}

/// Destructor
CvDistanceMap::~CvDistanceMap(void)
{
}

void CvDistanceMap::Reset(int nPlots, unsigned short iDefaultDistance)
{
	m_vData = std::vector< SContent >(nPlots, SContent(iDefaultDistance));
}

//	-----------------------------------------------------------------------------------------------
int CvDistanceMap::GetClosestFeatureDistance(const CvPlot& plot)
{
	if ((size_t)plot.GetPlotIndex() < m_vData.size())
		return int( m_vData[ plot.GetPlotIndex() ].distance ); 

	return INT_MAX;
}

//	-----------------------------------------------------------------------------------------------
int CvDistanceMap::GetClosestFeatureID(const CvPlot& plot)
{
	if ((size_t)plot.GetPlotIndex() < m_vData.size())
		return int( m_vData[ plot.GetPlotIndex() ].feature );

	return -1;
}

//	-----------------------------------------------------------------------------------------------
int CvDistanceMap::GetClosestFeatureOwner(const CvPlot& plot)
{
	if ((size_t)plot.GetPlotIndex() < m_vData.size())
		return int( m_vData[ plot.GetPlotIndex() ].owner );

	return -1;
}

//	-----------------------------------------------------------------------------------------------
bool CvDistanceMap::UpdateDistanceIfLower(int iPlotIndex, int iOwner, int iID, int iDistance, const STiebreakGenerator& tiebreak)
{
	if ((size_t)iPlotIndex < m_vData.size())
	{
		//direct update
		if (iDistance < m_vData[iPlotIndex].distance)
		{
			m_vData[iPlotIndex] = SContent(iDistance,iOwner,iID);
			return true;
		}
		else if (iDistance == m_vData[iPlotIndex].distance)
		{
			int iOldTiebreak = tiebreak(m_vData[iPlotIndex].owner, m_vData[iPlotIndex].feature);
			int iNewTiebreak = tiebreak(iOwner, iID);

			if (iNewTiebreak < iOldTiebreak)
			{
				m_vData[iPlotIndex] = SContent(iDistance,iOwner,iID);
				return true;
			}
		}
	}

	return false;
}

//	-----------------------------------------------------------------------------------------------
void CvDistanceMapWrapper::SetDirty()
{
	m_bDirty = true;
}

int CvDistanceMapWrapper::GetDistance(const CvPlot& plot, bool bMajorsOnly, PlayerTypes eSpecificPlayer)
{
	if (IsDirty())
		Update();

#ifdef VPDEBUG
	if (eSpecificPlayer!=NO_PLAYER && !majorPlayers.empty() && (size_t)eSpecificPlayer >= majorPlayers.size())
		OutputDebugString("warning: GetFeatureOwner called for invalid player\n");
#endif

	if (eSpecificPlayer!=NO_PLAYER && (size_t)eSpecificPlayer < majorPlayers.size())
		return majorPlayers[eSpecificPlayer].GetClosestFeatureDistance(plot);
	else if (bMajorsOnly)
		return allMajorPlayers.GetClosestFeatureDistance(plot);
	else
		return allPlayers.GetClosestFeatureDistance(plot);
}

int CvDistanceMapWrapper::GetFeatureId(const CvPlot& plot, bool bMajorsOnly, PlayerTypes eSpecificPlayer)
{
	if (IsDirty())
		Update();

#ifdef VPDEBUG
	if (eSpecificPlayer!=NO_PLAYER && !majorPlayers.empty() && (size_t)eSpecificPlayer >= majorPlayers.size())
		OutputDebugString("warning: GetFeatureOwner called for invalid player\n");
#endif

	if (eSpecificPlayer!=NO_PLAYER && (size_t)eSpecificPlayer < majorPlayers.size())
		return majorPlayers[eSpecificPlayer].GetClosestFeatureID(plot);
	else if (bMajorsOnly)
		return allMajorPlayers.GetClosestFeatureID(plot);
	else
		return allPlayers.GetClosestFeatureID(plot);
}

int CvDistanceMapWrapper::GetFeatureOwner(const CvPlot& plot, bool bMajorsOnly, PlayerTypes eSpecificPlayer)
{
	if (IsDirty())
		Update();

	if (eSpecificPlayer!=NO_PLAYER && (size_t)eSpecificPlayer < majorPlayers.size())
		return majorPlayers[eSpecificPlayer].GetClosestFeatureOwner(plot);
	else if (bMajorsOnly)
		return allMajorPlayers.GetClosestFeatureOwner(plot);
	else
		return allPlayers.GetClosestFeatureOwner(plot);
}

/// Updates the lookup table
void CvDistanceMapByTurns::Update()
{
	int iMaxTurns = 36;
	int iVeryFar = iMaxTurns * 2;

	const CvMap& map = GC.getMap();
	int nPlots = map.numPlots();

	//default
	PathType ePathType = PT_ARMY_MIXED;
	if (m_domain == DOMAIN_LAND)
		ePathType = PT_ARMY_LAND;
	if (m_domain == DOMAIN_SEA)
		ePathType = PT_ARMY_WATER;

	allPlayers.Reset(nPlots, iVeryFar);
	allMajorPlayers.Reset(nPlots, iVeryFar);
	//initialize to empty
	majorPlayers = vector<CvDistanceMap>(MAX_MAJOR_CIVS);

	//in principle for all players but we filter later
	for (int i = 0; i < MAX_PLAYERS; i++) //include the barbarians!
	{
		CvPlayer& thisPlayer = GET_PLAYER((PlayerTypes)i);
		if (!thisPlayer.isAlive())
			continue;

		if (thisPlayer.isMajorCiv())
			majorPlayers[i].Reset(nPlots, iVeryFar);

		int iCityIndex = 0;
		for(CvCity* pLoopCity = thisPlayer.firstCity(&iCityIndex); pLoopCity != NULL; pLoopCity = thisPlayer.nextCity(&iCityIndex))
		{
			//do not set a player - that way we can traverse unrevealed plots and foreign territory
			SPathFinderUserData data(NO_PLAYER, ePathType, -1, iMaxTurns);
			ReachablePlots turnsFromCity = GC.GetStepFinder().GetPlotsInReach(pLoopCity->plot(), data);

			for (ReachablePlots::iterator it = turnsFromCity.begin(); it != turnsFromCity.end(); ++it)
			{
				//important, compute the estimated turns from the normalized path cost!
				allPlayers.UpdateDistanceIfLower(it->iPlotIndex, i, pLoopCity->GetID(), it->iTurns, SCityTiebreak());
				if (thisPlayer.isMajorCiv())
				{
					majorPlayers[i].UpdateDistanceIfLower(it->iPlotIndex, i, pLoopCity->GetID(), it->iTurns, SCityTiebreak());
					allMajorPlayers.UpdateDistanceIfLower(it->iPlotIndex, i, pLoopCity->GetID(), it->iTurns, SCityTiebreak());
				}
			}
		}
	}

	m_bDirty = false;
}

/// Updates the lookup table
void CvDistanceMapByPlots::Update()
{
	const CvMap& map = GC.getMap();
	int nPlots = map.numPlots();

	allPlayers.Reset(nPlots, SHRT_MAX);
	allMajorPlayers.Reset(nPlots, SHRT_MAX);
	majorPlayers = vector<CvDistanceMap>(MAX_MAJOR_CIVS);

	// since we know there are very few cities compared to the number of plots,
	// we don't need to do the full distance transform
	for (int i = 0; i < MAX_PLAYERS; i++) //include the barbarians!
	{
		CvPlayer& thisPlayer = GET_PLAYER((PlayerTypes)i);
		if (!thisPlayer.isAlive())
			continue;

		if (i < MAX_MAJOR_CIVS)
			majorPlayers[i].Reset(nPlots, SHRT_MAX);

		// for each city
		int iCityIndex = 0;
		for (CvCity* pLoopCity = thisPlayer.firstCity(&iCityIndex); pLoopCity != NULL; pLoopCity = thisPlayer.nextCity(&iCityIndex))
		{
			CvPlot* pCityPlot = pLoopCity->plot();

			for (int iPlotIndex = 0; iPlotIndex < nPlots; iPlotIndex++)
			{
				CvPlot* pPlot = map.plotByIndexUnchecked(iPlotIndex);
				if (!pPlot)
					continue;

				int iDistance = plotDistance(pCityPlot->getX(), pCityPlot->getY(), pPlot->getX(), pPlot->getY());

				allPlayers.UpdateDistanceIfLower(iPlotIndex, i, pLoopCity->GetID(), iDistance, SCityTiebreak());
				if (thisPlayer.isMajorCiv())
				{
					majorPlayers[i].UpdateDistanceIfLower(iPlotIndex, i, pLoopCity->GetID(), iDistance, SCityTiebreak());
					allMajorPlayers.UpdateDistanceIfLower(iPlotIndex, i, pLoopCity->GetID(), iDistance, SCityTiebreak());
				}
			}
		}
	}

	m_bDirty = false;
}

void CvDistanceMap::Dump(const char* filename)
{
	ofstream out(filename);
	if (out)
	{
		out << "#x,y,water,owner,id,distance\n"; 
		for (int i=0; i<GC.getMap().numPlots(); i++)
		{
			CvPlot* pPlot =  GC.getMap().plotByIndexUnchecked(i);
			out << pPlot->getX() << "," << pPlot->getY() << "," << (pPlot->isWater() ? 1 : 0) << "," 
				<< GetClosestFeatureOwner(*pPlot) << "," << GetClosestFeatureID(*pPlot) << ","  << GetClosestFeatureDistance(*pPlot) << "\n";
		}
	}
	out.close();

}

