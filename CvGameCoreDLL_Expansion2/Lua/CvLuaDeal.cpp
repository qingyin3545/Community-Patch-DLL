/*	-------------------------------------------------------------------------------------------------------
	© 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */

#include "CvGameCoreDLLPCH.h"
#include "../CvGameCoreDLLPCH.h"
#include "../CustomMods.h"
#include "../CvDealAI.h"
#include "../CvDiplomacyAI.h"
#include "CvLuaSupport.h"
#include "CvLuaDeal.h"

#pragma warning(disable:4800 ) //forcing value to bool 'true' or 'false'

	//Utility macro for registering methods
#define Method(Name)			\
	lua_pushcclosure(L, l##Name, 0);	\
	lua_setfield(L, t, #Name);


using namespace CvLuaArgs;
TradedItemList::iterator CvLuaDeal::m_iterator;

//------------------------------------------------------------------------------
void CvLuaDeal::PushMethods(lua_State* L, int t)
{
	Method(ClearItems);
	Method(GetNumItems);

	Method(GetStartTurn);
	Method(GetEndTurn);
	Method(GetDuration);

	Method(GetOtherPlayer);
	Method(GetFromPlayer);
	Method(GetToPlayer);
	Method(SetFromPlayer);
	Method(SetToPlayer);

	Method(GetSurrenderingPlayer);
	Method(SetSurrenderingPlayer);
	Method(GetDemandingPlayer);
	Method(SetDemandingPlayer);
	Method(GetRequestingPlayer);
	Method(SetRequestingPlayer);

	Method(ResetIterator);
	Method(GetNextItem);

	Method(GetGoldAvailable);

	Method(IsPossibleToTradeItem);
	Method(GetReasonsItemUntradeable);
	Method(BlockTemporaryForPermanentTrade);

	Method(IsCheckedForRenewal);
	Method(GetRenewDealMessage);
	Method(AddGoldTrade);
	Method(AddGoldPerTurnTrade);
	Method(AddMapTrade);
	Method(AddResourceTrade);
	Method(AddCityTrade);
	Method(AddAllowEmbassy);
	Method(AddOpenBorders);
	Method(AddDefensivePact);
	Method(AddResearchAgreement);
	Method(AddPeaceTreaty);
	Method(AddThirdPartyPeace);
	Method(AddThirdPartyWar);
	Method(AddDeclarationOfFriendship);
	Method(AddVoteCommitment);

	Method(RemoveByType);
	Method(RemoveResourceTrade);
	Method(RemoveCityTrade);
	Method(RemoveThirdPartyPeace);
	Method(RemoveThirdPartyWar);
	Method(RemoveVoteCommitment);

	Method(ChangeGoldTrade);
	Method(ChangeGoldPerTurnTrade);
	Method(ChangeResourceTrade);
	Method(ChangeThirdPartyWarDuration);
	Method(ChangeThirdPartyPeaceDuration);

	Method(AddTechTrade);
	Method(AddVassalageTrade);
	Method(AddRevokeVassalageTrade);
	Method(RemoveTechTrade);

	Method(AddDiplomaticMarriage);
	Method(AddDualEmpireTreaty);
	Method(RemoveDiplomaticMarriage);
	Method(RemoveDualEmpireTreaty);

	Method(GetNumResource);

	// DEPRECATED
	Method(AddUnitTrade);
	Method(AddTradeAgreement);
	Method(AddPermamentAlliance);
	Method(AddSurrender);
	Method(AddTruce);
	Method(AddThirdPartyEmbargo);
	Method(RemoveUnitTrade);
	Method(RemoveThirdPartyEmbargo);
	Method(ChangeThirdPartyEmbargoDuration);
}

//------------------------------------------------------------------------------
int CvLuaDeal::lRemoveByType(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	int args = lua_gettop(L);

	if(args == 1)
		pkDeal->RemoveByType((TradeableItems) lua_tointeger(L, 2), NO_PLAYER);
	else
		pkDeal->RemoveByType((TradeableItems) lua_tointeger(L, 2), (PlayerTypes) lua_tointeger(L, 3));

	return 0;
}


//------------------------------------------------------------------------------
void CvLuaDeal::HandleMissingInstance(lua_State* L)
{
	DefaultHandleMissingInstance(L);
}
//------------------------------------------------------------------------------
const char* CvLuaDeal::GetTypeName()
{
	return "Deal";
}
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Lua Methods
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
int CvLuaDeal::lIsPossibleToTradeItem(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes) lua_tointeger(L, 2);
	const PlayerTypes eToPlayer = (PlayerTypes) lua_tointeger(L, 3);
	const TradeableItems eItem = (TradeableItems) lua_tointeger(L, 4);
	const int iData1 = lua_tointeger(L, 5);
	const int iData2 = lua_tointeger(L, 6);
	const int iData3 = lua_tointeger(L, 7);
	const bool bFlag1 = lua_toboolean(L, 8);

	const bool bResult = pkDeal->IsPossibleToTradeItem(eFromPlayer, eToPlayer, eItem, iData1, iData2, iData3, bFlag1);
	lua_pushboolean(L, bResult);
	return 1;
}

int CvLuaDeal::lGetReasonsItemUntradeable(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes) lua_tointeger(L, 2);
	const PlayerTypes eToPlayer = (PlayerTypes) lua_tointeger(L, 3);
	const TradeableItems eItem = (TradeableItems) lua_tointeger(L, 4);
	const int iData1 = lua_tointeger(L, 5);
	const int iData2 = lua_tointeger(L, 6);
	const int iData3 = lua_tointeger(L, 7);
	const bool bFlag1 = lua_toboolean(L, 8);

	CvString sResult = pkDeal->GetReasonsItemUntradeable(eFromPlayer, eToPlayer, eItem, iData1, iData2, iData3, bFlag1);
	lua_pushstring(L, sResult);
	return 1;
}

int CvLuaDeal::lBlockTemporaryForPermanentTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const TradeableItems eItem = (TradeableItems) lua_tointeger(L, 2);
	const PlayerTypes eFromPlayer = (PlayerTypes) lua_tointeger(L, 3);
	const PlayerTypes eToPlayer = (PlayerTypes) lua_tointeger(L, 4);

	const bool bResult = pkDeal->BlockTemporaryForPermanentTrade(eItem, eFromPlayer, eToPlayer);
	lua_pushboolean(L, bResult);
	return 1;
}


//------------------------------------------------------------------------------
int CvLuaDeal::lResetIterator(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	m_iterator = pkDeal->m_TradedItems.begin();
	return 0;
}

//------------------------------------------------------------------------------
int CvLuaDeal::lGetNextItem(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);

	if(m_iterator == pkDeal->m_TradedItems.end())
		return 0;

	const CvTradedItem& item = (*m_iterator);
	lua_pushinteger(L, item.m_eItemType);
	lua_pushinteger(L, item.m_iDuration);
	lua_pushinteger(L, item.m_iFinalTurn);
	lua_pushinteger(L, item.m_iData1);
	lua_pushinteger(L, item.m_iData2);
	lua_pushinteger(L, item.m_iData3);
	lua_pushboolean(L, item.m_bFlag1);
	lua_pushinteger(L, item.m_eFromPlayer);

	m_iterator++;

	return 8;
}

//------------------------------------------------------------------------------
int CvLuaDeal::lGetRenewDealMessage(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const PlayerTypes eOtherPlayer = (PlayerTypes)lua_tointeger(L, 3);

	int iDealValueToMe = 0;
	bool bCantMatchOffer = false;
	bool bDealAcceptable = GET_PLAYER(eFromPlayer).GetDealAI()->IsDealWithHumanAcceptable(pkDeal, eOtherPlayer, iDealValueToMe, &bCantMatchOffer, false);
	DiploMessageTypes eMessage = bDealAcceptable ? DIPLO_MESSAGE_RENEW_DEAL : DIPLO_MESSAGE_WANT_MORE_RENEW_DEAL;
	lua_pushstring(L, GET_PLAYER(eFromPlayer).GetDiplomacyAI()->GetDiploStringForMessage(eMessage));
	return 1;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddGoldTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iAmount = lua_tointeger(L, 3);

	pkDeal->AddGoldTrade(eFromPlayer, iAmount);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddGoldPerTurnTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iAmount = lua_tointeger(L, 3);
	const int iDuration = lua_tointeger(L, 4);

	pkDeal->AddGoldPerTurnTrade(eFromPlayer, iAmount, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddMapTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);

	pkDeal->AddMapTrade(eFromPlayer);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddResourceTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const ResourceTypes eResource = (ResourceTypes)lua_tointeger(L, 3);
	const int iAmount = lua_tointeger(L, 4);
	const int iDuration = lua_tointeger(L, 5);

	pkDeal->AddResourceTrade(eFromPlayer, eResource, iAmount, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddCityTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iCityID = lua_tointeger(L, 3);

	pkDeal->AddCityTrade(eFromPlayer, iCityID);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddAllowEmbassy(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);

	pkDeal->AddAllowEmbassy(eFromPlayer);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddOpenBorders(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iDuration = lua_tointeger(L, 3);

	pkDeal->AddOpenBorders(eFromPlayer, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddDefensivePact(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iDuration = lua_tointeger(L, 3);

	pkDeal->AddDefensivePact(eFromPlayer, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddResearchAgreement(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iDuration = lua_tointeger(L, 3);

	pkDeal->AddResearchAgreement(eFromPlayer, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddPeaceTreaty(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const int iDuration = lua_tointeger(L, 3);

	pkDeal->AddPeaceTreaty(eFromPlayer, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddThirdPartyPeace(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const TeamTypes eThirdPartyTeam = (TeamTypes)lua_tointeger(L, 3);
	const int iDuration = lua_tointeger(L, 4);

	pkDeal->AddThirdPartyPeace(eFromPlayer, eThirdPartyTeam, iDuration);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddThirdPartyWar(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const TeamTypes eThirdPartyTeam = (TeamTypes)lua_tointeger(L, 3);

	pkDeal->AddThirdPartyWar(eFromPlayer, eThirdPartyTeam);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddDeclarationOfFriendship(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);

	pkDeal->AddDeclarationOfFriendship(eFromPlayer);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddVoteCommitment(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes) lua_tointeger(L, 2);
	const int iResolutionID = lua_tointeger(L, 3);
	const int iVoteChoice = lua_tointeger(L, 4);
	const int iNumVotes = lua_tointeger(L, 5);
	const bool bRepeal = lua_toboolean(L, 6);

	pkDeal->AddVoteCommitment(eFromPlayer, iResolutionID, iVoteChoice, iNumVotes, bRepeal);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddTechTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);
	const TechTypes eTech = (TechTypes)lua_tointeger(L, 3);

	pkDeal->AddTechTrade(eFromPlayer, eTech);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddVassalageTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);

	pkDeal->AddVassalageTrade(eFromPlayer);
	return 0;
}
//------------------------------------------------------------------------------
int CvLuaDeal::lAddRevokeVassalageTrade(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes)lua_tointeger(L, 2);

	pkDeal->AddRevokeVassalageTrade(eFromPlayer);
	return 0;
}

//------------------------------------------------------------------------------
int CvLuaDeal::lRemoveVoteCommitment(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes eFromPlayer = (PlayerTypes) lua_tointeger(L, 2);
	const int iResolutionID = lua_tointeger(L, 3);
	const int iVoteChoice = lua_tointeger(L, 4);
	const int iNumVotes = lua_tointeger(L, 5);
	const bool bRepeal = lua_toboolean(L, 6);

	pkDeal->RemoveVoteCommitment(eFromPlayer, iResolutionID, iVoteChoice, iNumVotes, bRepeal);
	return 0;
}

//------------------------------------------------------------------------------
int CvLuaDeal::lGetNumResource(lua_State* L)
{
	CvDeal* pkDeal = GetInstance(L);
	const PlayerTypes ePlayer = (PlayerTypes) lua_tointeger(L, 2);
	const PlayerTypes eOtherPlayer = pkDeal->GetOtherPlayer(ePlayer);
	const ResourceTypes eResource = (ResourceTypes) lua_tointeger(L, 3);
	
	int iResult = 0;
	int iNumAvailable = GET_PLAYER(ePlayer).getNumResourceAvailable(eResource, false);
	int iNumInRenewDeal = 0;
	int iNumInExistingDeal = 0;

	// count any that are in the renew deal
	std::vector<CvDeal*> pRenewDeals = GET_PLAYER(ePlayer).GetDiplomacyAI()->GetDealsToRenew(eOtherPlayer);
	if (pRenewDeals.size() > 0)
	{
		for (uint i = 0; i < pRenewDeals.size(); i++)
		{
			if (pRenewDeals[i]->IsCheckedForRenewal()) continue;
			iNumInRenewDeal += pRenewDeals[i]->GetNumResourcesInDeal(ePlayer, eResource);
			iNumInRenewDeal -= pRenewDeals[i]->GetNumResourcesInDeal(eOtherPlayer, eResource);
		}
	}
	// remove any that are in this deal
	for (auto it = pkDeal->m_TradedItems.begin(); it != pkDeal->m_TradedItems.end(); ++it)
	{
		if (it->m_eItemType == TRADE_ITEM_RESOURCES && it->m_eFromPlayer == ePlayer && (ResourceTypes)it->m_iData1 == eResource)
		{
			iNumInExistingDeal += it->m_iData2;
		}
	}

	iResult = iNumAvailable + iNumInRenewDeal - iNumInExistingDeal;
	lua_pushinteger(L, iResult);
	return 1;
}


//------------------------------------------------------------------------------
// DEPRECATED
int CvLuaDeal::lAddUnitTrade(lua_State* L)
{
	luaL_error(L, "AddUnitTrade - function is deprecated");
}
int CvLuaDeal::lAddTradeAgreement(lua_State* L)
{
	luaL_error(L, "AddTradeAgreement - function is deprecated");
}
int CvLuaDeal::lAddPermamentAlliance(lua_State* L)
{
	luaL_error(L, "AddPermamentAlliance - function is deprecated");
}
int CvLuaDeal::lAddSurrender(lua_State* L)
{
	luaL_error(L, "AddSurrender - function is deprecated");
}
int CvLuaDeal::lAddTruce(lua_State* L)
{
	luaL_error(L, "AddTruce - function is deprecated");
}
int CvLuaDeal::lAddThirdPartyEmbargo(lua_State* L)
{
	luaL_error(L, "AddThirdPartyEmbargo - function is deprecated");
}
int CvLuaDeal::lRemoveUnitTrade(lua_State* L)
{
	luaL_error(L, "RemoveUnitTrade - function is deprecated");
}
int CvLuaDeal::lRemoveThirdPartyEmbargo(lua_State* L)
{
	luaL_error(L, "RemoveThirdPartyEmbargo - function is deprecated");
}
int CvLuaDeal::lChangeThirdPartyEmbargoDuration(lua_State* L)
{
	luaL_error(L, "ChangeThirdPartyEmbargoDuration - function is deprecated");
}