/*	-------------------------------------------------------------------------------------------------------
	© 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#pragma once

//
//  AUTHOR:	Eric MacDonald  --  8/2003
//					Mustafa Thamer 11/2004
//					Jon Shafer - 03/2005
//
//  PURPOSE: All Civ4 info classes and the base class for them
//
#ifndef CV_INFO_H
#define CV_INFO_H

#include "CvDiplomacyAIEnums.h"
#include "CvGameCoreStructs.h"

#include <unordered_map>

#pragma warning( disable: 4251 )		// needs to have dll-interface to be used by clients of class
#pragma warning( disable: 4127 )

#if defined(MOD_BALANCE_CORE_RESOURCE_MONOPOLIES)
struct ResourceMonopolySettings
{
	ResourceMonopolySettings() :
		m_bGlobalMonopoly(false),
		m_bStrategicMonopoly(false)
	{};

	bool operator<(const ResourceMonopolySettings& t) const
	{
		return this->m_bGlobalMonopoly < t.m_bGlobalMonopoly || (this->m_bGlobalMonopoly == t.m_bGlobalMonopoly && this->m_bStrategicMonopoly < t.m_bStrategicMonopoly);
	}

	bool operator==(const ResourceMonopolySettings& t) const
	{
		return this->m_bGlobalMonopoly == t.m_bGlobalMonopoly && this->m_bStrategicMonopoly == t.m_bStrategicMonopoly;
	}

	bool m_bGlobalMonopoly;
	bool m_bStrategicMonopoly;
};

struct MonopolyGreatPersonRateModifierKey
{
	MonopolyGreatPersonRateModifierKey() :
		m_iSpecialist(0),
		m_sMonopoly()
	{};

	bool operator<(const MonopolyGreatPersonRateModifierKey& t) const
	{
		return this->m_iSpecialist < t.m_iSpecialist || (this->m_iSpecialist == t.m_iSpecialist && this->m_sMonopoly < t.m_sMonopoly);
	}

	bool operator==(const MonopolyGreatPersonRateModifierKey& t) const
	{
		return this->m_iSpecialist == t.m_iSpecialist && this->m_sMonopoly == t.m_sMonopoly;
	}

	int m_iSpecialist;
	ResourceMonopolySettings m_sMonopoly;
};

struct CombatModifiers
{
	CombatModifiers() :
		m_iAttackMod(0),
		m_iDefenseMod(0)
	{};

	int m_iAttackMod;
	int m_iDefenseMod;
};
#endif

#if defined(MOD_RESOURCES_PRODUCTION_COST_MODIFIERS)
struct ProductionCostModifiers
{
	ProductionCostModifiers() :
		m_iRequiredEra(-1),
		m_iObsoleteEra(-1),
		m_iCostModifier(0)
	{};

	int m_iRequiredEra;
	int m_iObsoleteEra;
	int m_iCostModifier;
};
#endif

class CvDatabaseUtility;

//------------------------------------------------------------------------------
// CvBaseInfo: New basic info adapter for game data.
//------------------------------------------------------------------------------
class CvBaseInfo
{
public:
	CvBaseInfo();

	int GetID() const
	{
		return m_iID;
	}

	const char* GetCivilopedia() const
	{
		return m_strCivilopedia.c_str();
	}

	const char* GetDescription() const
	{
		return m_strDescription.c_str();
	}

	const char* GetDescriptionKey() const
	{
		return m_strDescriptionKey.c_str();
	}

	const char* GetHelp() const
	{
		return m_strHelp.c_str();
	}

	const char* GetDisabledHelp() const
	{
		return m_strDisabledHelp.c_str();
	}

	const char* GetStrategy() const
	{
		return m_strStrategy.c_str();
	}

	const char* GetText() const;
	const char* GetTextKey() const;

	const char* GetType() const
	{
		return m_strType.c_str();
	}

	bool CacheResult(Database::Results& kResults);
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

	virtual bool operator==(const CvBaseInfo&) const;

	template<typename BaseInfo, typename Visitor>
	static void Serialize(BaseInfo& baseInfo, Visitor& visitor);
	virtual void readFrom(FDataStream&);
	virtual void writeTo(FDataStream&) const;

private:
	int m_iID;
	CvString m_strCivilopedia;
	CvString m_strDescription;
	CvString m_strDescriptionKey;
	CvString m_strHelp;
	CvString m_strDisabledHelp;
	CvString m_strStrategy;
	CvString m_strType;
	CvString m_strTextKey;
	CvString m_strText;
};

FDataStream& operator<<(FDataStream&, const CvBaseInfo&);
FDataStream& operator>>(FDataStream&, CvBaseInfo&);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  CLASS:      CvHotkeyInfo
//!  \brief		Holds the hotkey info for an info class.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvHotKeyInfo : public CvBaseInfo
{
public:
	CvHotKeyInfo();

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

	int getActionInfoIndex() const;
	void setActionInfoIndex(int i);

	int getHotKeyVal() const;
	void setHotKeyVal(int i);
	int getHotKeyPriority() const;
	void setHotKeyPriority(int i);
	int getHotKeyValAlt() const;
	void setHotKeyValAlt(int i);
	int getHotKeyPriorityAlt() const;
	void setHotKeyPriorityAlt(int i);
	int getOrderPriority() const;
	void setOrderPriority(int i);

	bool isAltDown() const;
	void setAltDown(bool b);
	bool isShiftDown() const;
	void setShiftDown(bool b);
	bool isCtrlDown() const;
	void setCtrlDown(bool b);
	bool isAltDownAlt() const;
	void setAltDownAlt(bool b);
	bool isShiftDownAlt() const;
	void setShiftDownAlt(bool b);
	bool isCtrlDownAlt() const;
	void setCtrlDownAlt(bool b);

	const char* getHotKey() const;
	void setHotKey(const char* szVal);

	const char* getHelp() const;
	const char* getDisabledHelp() const;

	std::string getHotKeyDescription() const;
	const char* getHotKeyString() const;
	void setHotKeyDescription(const char* szHotKeyDescKey, const char* szHotKeyAltDescKey, const char* szHotKeyString);

	static CvString CreateHotKeyFromDescription(const char* pszHotKey, bool bShift, bool bAlt, bool bCtrl);
	static CvString CreateKeyStringFromKBCode(const char* pszHotKey);

protected:
	int GetHotKeyInt(const char* pszHotKeyVal);

	int m_iActionInfoIndex;

	int m_iHotKeyVal;
	int m_iHotKeyPriority;
	int m_iHotKeyValAlt;
	int m_iHotKeyPriorityAlt;
	int m_iOrderPriority;

	bool m_bAltDown;
	bool m_bShiftDown;
	bool m_bCtrlDown;
	bool m_bAltDownAlt;
	bool m_bShiftDownAlt;
	bool m_bCtrlDownAlt;

	CvString m_strHotKey;
	CvString m_strHotKeyDescriptionKey;
	CvString m_strHotKeyAltDescriptionKey;
	CvString m_strHotKeyString;
	CvString m_strHelp;
	CvString m_strDisabledHelp;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvSpecialistInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvSpecialistInfo : public CvHotKeyInfo
{
public:

	CvSpecialistInfo();
	virtual ~CvSpecialistInfo();

	int getCost() const;

	int getGreatPeopleUnitClass() const;
	int getGreatPeopleRateChange() const;
	int getCulturePerTurn() const;
	int getMissionType() const;
	void setMissionType(int iNewType);
	int getExperience() const;

	bool isVisible() const;

	// Arrays
	int getYieldChange(int i) const;
	const int* getYieldChangeArray() const;

	const char* getTexture() const;
	void setTexture(const char* szVal);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

#ifdef MOD_SPECIALIST_RESOURCES
	struct ResourceInfo {
		ResourceTypes m_eResource = NO_RESOURCE;
		int m_iQuantity = 0;

		// optional:
		PolicyTypes m_eRequiredPolicy = NO_POLICY;
		TechTypes m_eRequiredTech = NO_TECH;
	};
	std::vector<ResourceInfo>& GetResourceInfo() { return m_vResourceInfo; }
#endif

protected:
	int m_iCost;

	int m_iGreatPeopleUnitClass;
	int m_iGreatPeopleRateChange;
	int m_iCulturePerTurn;
	int m_iMissionType;
	int m_iExperience;

	bool m_bVisible;

	CvString m_strTexture;

	// Arrays

	int* m_piYieldChange;

#ifdef MOD_SPECIALIST_RESOURCES
	std::vector<ResourceInfo> m_vResourceInfo;
#endif

private:
	CvSpecialistInfo(const CvSpecialistInfo&);
	CvSpecialistInfo& operator=(const CvSpecialistInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvMissionInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvMissionInfo : public CvHotKeyInfo
{
public:
	CvMissionInfo();

	int getTime() const;

	bool isSound() const;
	bool isTarget() const;
	bool isBuild() const;
	bool getVisible() const;
	EntityEventTypes getEntityEvent() const;

	const char* getWaypoint() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iTime;

	bool m_bSound;
	bool m_bTarget;
	bool m_bBuild;
	bool m_bVisible;
	EntityEventTypes m_eEntityEvent;

	CvString m_strWaypoint;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvControlInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvControlInfo : public CvHotKeyInfo
{
	//Empty?
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCommandInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCommandInfo : public CvHotKeyInfo
{
public:
	CvCommandInfo();

	int getAutomate() const;
	void setAutomate(int i);

	bool getConfirmCommand() const;
	bool getVisible() const;
	bool getAll() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iAutomate;

	bool m_bConfirmCommand;
	bool m_bVisible;
	bool m_bAll;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvAutomateInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvAutomateInfo : public CvHotKeyInfo
{
public:
	CvAutomateInfo();

	int getCommand() const;
	void setCommand(int i);
	int getAutomate() const;
	void setAutomate(int i);

	bool getConfirmCommand() const;
	void setConfirmCommand(bool bVal);
	bool getVisible() const;
	void setVisible(bool bVal);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iCommand;
	int m_iAutomate;

	bool m_bConfirmCommand;
	bool m_bVisible;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvActionInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvActionInfo
{
public:
	CvActionInfo();

	int getMissionData() const;
	int getCommandData() const;

	int getAutomateType() const;
	int getInterfaceModeType() const;
	int getMissionType() const;
	int getCommandType() const;
	int getControlType() const;
	int getOriginalIndex() const;
	void setOriginalIndex(int i);

	bool isConfirmCommand() const;
	bool isVisible() const;
	ActionSubTypes getSubType() const;
	void setSubType(ActionSubTypes eSubType);

	// functions to replace the CvInfoBase calls
	const char* GetType() const;
	const char* GetDescription() const;
	const char* GetCivilopedia() const;
	const char* GetHelp() const;
	const char* GetDisabledHelp() const;
	const char* GetStrategy() const;
	const char* GetTextKey() const;

	// functions to replace the CvHotkey calls
	int getActionInfoIndex() const;
	int getHotKeyVal() const;
	int getHotKeyPriority() const;
	int getHotKeyValAlt() const;
	int getHotKeyPriorityAlt() const;
	int getOrderPriority() const;

	bool isAltDown() const;
	bool isShiftDown() const;
	bool isCtrlDown() const;
	bool isAltDownAlt() const;
	bool isShiftDownAlt() const;
	bool isCtrlDownAlt() const;

	const char* getHotKey() const;

	std::string getHotKeyDescription() const;
	const char* getHotKeyString() const;

protected:
	int m_iOriginalIndex;
	ActionSubTypes m_eSubType;

private:
	CvHotKeyInfo* getHotkeyInfo() const;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// class	: CvMultiUnitFormationInfo
//
// \brief	: Holds information relating to a formation of multiple units (for AI use)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvFormationSlotEntry
{
public:
	CvFormationSlotEntry():
		m_primaryUnitType(NO_UNITAI),
		m_secondaryUnitType(NO_UNITAI),
		m_ePositionType(NO_MUPOSITION),
		m_requiredSlot(false)
	{
	}

	UnitAITypes m_primaryUnitType;
	UnitAITypes m_secondaryUnitType;
	MultiunitPositionTypes m_ePositionType;
	bool m_requiredSlot;
};

class CvMultiUnitFormationInfo : public CvBaseInfo
{
public:
	const char* getFormationName() const;
	size_t getNumFormationSlotEntries() const;
	size_t getNumFormationSlotEntriesRequired() const;
	const CvFormationSlotEntry& getFormationSlotEntry(size_t index) const;
	void addFormationSlotEntry(const CvFormationSlotEntry& slotEntry);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	CvString m_strFormationName;
	std::vector<CvFormationSlotEntry> m_vctSlotEntries;
};



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvSpecialUnitInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvSpecialUnitInfo : public CvBaseInfo
{
public:
	CvSpecialUnitInfo();
	virtual ~CvSpecialUnitInfo();

	bool isValid() const;
	bool isCityLoad() const;

	// Arrays
	bool isCarrierUnitAIType(int i) const;
	int getProductionTraits(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	bool m_bValid;
	bool m_bCityLoad;

	// Arrays
	bool* m_pbCarrierUnitAITypes;
	int* m_piProductionTraits;

private:
	CvSpecialUnitInfo(const CvSpecialUnitInfo&);
	CvSpecialUnitInfo& operator=(const CvSpecialUnitInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvUnitClassInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvUnitClassInfo :	public CvBaseInfo
{
public:
	CvUnitClassInfo();

	int getMaxGlobalInstances() const;
	int getMaxTeamInstances() const;
	int getMaxPlayerInstances() const;
	int getInstanceCostModifier() const;
	int getDefaultUnitIndex() const;
	void setDefaultUnitIndex(int i);
#if defined(MOD_BALANCE_CORE)
	int getUnitInstancePerCity() const;
#endif
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iMaxGlobalInstances;
	int m_iMaxTeamInstances;
	int m_iMaxPlayerInstances;
	int m_iInstanceCostModifier;
	int m_iDefaultUnitIndex;
#if defined(MOD_BALANCE_CORE)
	int m_iUnitInstancePerCity;
#endif
};

#if defined(MOD_BALANCE_CORE)
// Forward declaration
class CvCorporationEntry;
#endif

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvBuildingClassInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvBuildingClassInfo :	public CvBaseInfo
{
public:
#if defined(MOD_BALANCE_CORE)
	// So when we load in Corporations, they can touch this
	friend class CvCorporationEntry;
#endif
	CvBuildingClassInfo();
	virtual ~CvBuildingClassInfo();

	int getMaxGlobalInstances() const;
	int getMaxTeamInstances() const;
	int getMaxPlayerInstances() const;
	int getExtraPlayerInstances() const;
	int getDefaultBuildingIndex() const;
	void setDefaultBuildingIndex(int i);

	bool isNoLimit() const;
	bool isMonument() const;

	// Arrays
	int getVictoryThreshold(int i) const;

#if defined(MOD_BALANCE_CORE)
	CorporationTypes getCorporationType() const;
	bool IsHeadquarters() const;
	bool IsOffice() const;
	bool IsFranchise() const;
#endif

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iMaxGlobalInstances;
	int m_iMaxTeamInstances;
	int m_iMaxPlayerInstances;
	int m_iExtraPlayerInstances;
	int m_iDefaultBuildingIndex;

	bool m_bNoLimit;
	bool m_bMonument;

	// Arrays
	int* m_piVictoryThreshold;

#if defined(MOD_BALANCE_CORE)
	CorporationTypes m_eCorporationType;
	bool m_bIsHeadquarters;
	bool m_bIsOffice;
	bool m_bIsFranchise;
#endif

private:
	CvBuildingClassInfo(const CvBuildingClassInfo&);
	CvBuildingClassInfo& operator=(const CvBuildingClassInfo&);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Helper Functions to serialize arrays of variable length
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
namespace BuildingClassArrayHelpers
{
void Read(FDataStream& kStream, int* paiArray);
void Write(FDataStream& kStream, int* paiArray, int iArraySize);
}
namespace UnitClassArrayHelpers
{
void Read(FDataStream& kStream, int* paiArray);
void Write(FDataStream& kStream, int* paiArray, int iArraySize);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCivilizationBaseInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCivilizationBaseInfo : public CvBaseInfo
{
public:
	CvCivilizationBaseInfo();
	virtual		~CvCivilizationBaseInfo();

	bool isAIPlayable() const;
	bool isPlayable() const;

	const char* getShortDescription() const;
	void setShortDescriptionKey(const char* szVal);
	const char* getShortDescriptionKey() const;

	const GUID& getPackageID() const;

	virtual	bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:

	bool		m_bAIPlayable;
	bool		m_bPlayable;

	CvString	m_strShortDescription;
	CvString	m_strShortDescriptionKey;

	GUID		m_kPackageID;

private:
	CvCivilizationBaseInfo(const CvCivilizationBaseInfo&);
	CvCivilizationBaseInfo& operator=(const CvCivilizationBaseInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCivilizationInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCivilizationInfo : public CvCivilizationBaseInfo
{
public:
	CvCivilizationInfo();
	virtual ~CvCivilizationInfo();

	int getDefaultPlayerColor() const;
	int getArtStyleType() const;
	int getNumCityNames() const;
	int getNumSpyNames() const;
	const char* getArtStylePrefix() const;
	const char* getArtStyleSuffix() const;

	int getNumLeaders() const;

	const char* GetDawnOfManAudio() const;

	const char* getAdjective() const;
	void setAdjectiveKey(const char* szVal);
	const char* getAdjectiveKey() const;

	const char* getFlagTexture() const;
	const char* getArtDefineTag() const;
	void setArtDefineTag(const char* szVal);
	void setArtStylePrefix(const char* szVal);
	void setArtStyleSuffix(const char* szVal);

	ReligionTypes GetReligion() const;

	// Arrays
	int getCivilizationBuildings(int i) const;
	int getCivilizationUnits(int i) const;
	bool isCivilizationBuildingOverridden(int i) const;
	bool isCivilizationUnitOverridden(int i) const;
	int getCivilizationFreeUnitsClass(int i) const;
	int getCivilizationFreeUnitsDefaultUnitAI(int i) const;

	bool isLeaders(int i) const;
	bool IsBlocksMinor(int i) const;
	bool isCivilizationFreeBuildingClass(int i) const;
	bool isCivilizationFreeTechs(int i) const;
	bool isCivilizationDisableTechs(int i) const;

	bool isCoastalCiv() const;
	bool isFirstCoastalStart() const;

	const char* getCityNames(int i) const;
	const char* getSpyNames(int i) const;

	const char* getSoundtrackKey() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	// allocate and initialize the civilization's default buildings
	void InitBuildingDefaults(int*& piDefaults, CvDatabaseUtility& kUtility);

	// allocate and initialize the civilization's default units
	void InitUnitDefaults(int*& piDefaults, CvDatabaseUtility& kUtility);

	int m_iDefaultPlayerColor;
	int m_iArtStyleType;
	int m_iNumLeaders;				 // the number of leaders the Civ has, this is needed so that random leaders can be generated easily

	CvString m_strArtDefineTag;
	CvString m_strArtStylePrefix;
	CvString m_strArtStyleSuffix;

	CvString m_strAdjective;
	CvString m_strAdjectiveKey;

	CvString m_strDawnOfManAudio;

	CvString m_strSoundtrackKey;

	// Arrays
	int* m_piCivilizationBuildings;
	int* m_piCivilizationUnits;
	int* m_piCivilizationFreeUnitsClass;
	int* m_piCivilizationFreeUnitsDefaultUnitAI;

	bool* m_pbLeaders;
	bool* m_pbCivilizationFreeBuildingClass;
	bool* m_pbCivilizationFreeTechs;
	bool* m_pbCivilizationDisableTechs;
	bool* m_pbReligions;
	bool m_bCoastalCiv;
	bool m_bPlaceFirst;

	std::vector<CvString> m_vCityNames;
	std::vector<CvString> m_vSpyNames;

	std::vector<bool> m_CivilizationBuildingOverridden;
	std::vector<bool> m_CivilizationUnitOverridden;

	std::vector<bool> m_BlockedMinors;

private:
	CvCivilizationInfo(const CvCivilizationInfo&);
	CvCivilizationInfo& operator=(const CvCivilizationInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvVictoryInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvVictoryInfo : public CvBaseInfo
{
public:
	CvVictoryInfo();
	virtual ~CvVictoryInfo();

	int getPopulationPercentLead() const;
	int getLandPercent() const;
	int getMinLandPercent() const;
	int getCityCulture() const;
	int getNumCultureCities() const;
	int getTotalCultureRatio() const;
	int getVictoryDelayTurns() const;

	bool IsWinsGame() const;
	bool isTargetScore() const;
	bool isEndScore() const;
	bool isConquest() const;
	bool isInfluential() const;
	bool isDiploVote() const;
	bool isPermanent() const;
	bool IsReligionInAllCities() const;
	bool IsFindAllNaturalWonders() const;

	const char* getMovie() const;

	// Accessor Functions (Arrays)
	int GetVictoryPointAward(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iPopulationPercentLead;
	int m_iLandPercent;
	int m_iMinLandPercent;
	int m_iCityCulture;
	int m_iNumCultureCities;
	int m_iTotalCultureRatio;
	int m_iVictoryDelayTurns;

	bool m_bWinsGame;
	bool m_bTargetScore;
	bool m_bEndScore;
	bool m_bConquest;
	bool m_bInfluential;
	bool m_bDiploVote;
	bool m_bPermanent;
	bool m_bReligionInAllCities;
	bool m_bFindAllNaturalWonders;

	CvString m_strMovie;

	int* m_piVictoryPointAwards;

private:
	CvVictoryInfo(const CvVictoryInfo&);
	CvVictoryInfo& operator=(const CvVictoryInfo&);
};


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvSmallAwardInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvSmallAwardInfo : public CvBaseInfo
{
public:
	CvSmallAwardInfo();
	virtual ~CvSmallAwardInfo();

	CvString GetNotificationString() const;
	CvString GetTeamNotificationString() const;

	int GetNumVictoryPoints() const;

	int GetNumCities() const;
	int GetCityPopulation() const;
#if defined(MOD_BALANCE_CORE)
	int GetInfluence() const;
	int GetDuration() const;
	int GetGPPointsGlobal() const;
	int GetGPPoints() const;
	int GetExperience() const;
	int GetGold() const;
	int GetCulture() const;
	int GetFaith() const;
	int GetScience() const;
	int GetFood() const;
	int GetProduction() const;
	int GetGAP() const;
	int GetHappiness() const;
	int GetTourism() const;
	int GetGeneralPoints() const;
	int GetAdmiralPoints() const;
	int GetJuggernauts() const;
	int GetRandom() const;
#endif

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	CvString m_szNotification;
	CvString m_szTeamNotification;

	int m_iNumVictoryPoints;

	int m_iNumCities;
	int m_iCityPopulation;

#if defined(MOD_BALANCE_CORE)
	int m_iCSInfluence;
	int m_iDuration;
	int m_iGPPoints;
	int m_iGPPointsGlobal;
	int m_iExperience;
	int m_iGold;
	int m_iCulture;
	int m_iFaith;
	int m_iScience;
	int m_iFood;
	int m_iProduction;
	int m_iGAP;
	int m_iHappiness;
	int m_iGeneralPoints;
	int m_iAdmiralPoints;
	int m_iJuggernauts;
	int m_iTourism;
	int m_iRand;
#endif

private:
	CvSmallAwardInfo(const CvSmallAwardInfo&);
	CvSmallAwardInfo& operator=(const CvSmallAwardInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvHurryInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvHurryInfo :	public CvBaseInfo
{
public:
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvHandicapInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvHandicapInfo : public CvBaseInfo
{
public:
	CvHandicapInfo();
	virtual ~CvHandicapInfo();

	// Player Bonuses
	int getMapPlacementPriority() const;
	int getStartingGold() const;
	int getStartingPolicyPoints() const;
	int getAdvancedStartPointsMod() const;
	int getHappinessDefault() const;
	int getHappinessDefaultCapital() const;
	int getExtraHappinessPerLuxury() const;
	int getEmpireSizeUnhappinessMod() const;
	int getPopulationUnhappinessMod() const;
	int getFreeCulturePerTurn() const;
	int getMaintenanceFreeUnits() const;
	int getUnitSupplyBase() const;
	int getUnitSupplyPerCity() const;
	int getUnitSupplyPopulationPercent() const;
	int getUnitSupplyPerEraFlat() const;
	int getUnitSupplyPerEraModifier() const;
	int getUnitSupplyBonusPercent() const;
	int getStartingUnitMultiplier() const;
	int getStartingWorkerUnits() const;
	int getStartingDefenseUnits() const;
	int getStartingExploreUnits() const;
	int getWorkRateModifier() const;
	int getImprovementCostPercent() const;
	int getBuildingCostPercent() const;
	int getUnitCostPercent() const;
	int getInflationPercent() const;
	int getUnitUpgradePercent() const;
	int getUnitUpgradePerEraModifier() const;
	int getGrowthPercent() const;
	int getGrowthPerEraModifier() const;
	int getResearchPercent() const;
	int getResearchPerEraModifier() const;
	int getTechCatchUpMod() const;
	int getPolicyPercent() const;
	int getPolicyPerEraModifier() const;
	int getPolicyCatchUpMod() const;
	int getProphetPercent() const;
	int getGreatPeoplePercent() const;
	int getGoldenAgePercent() const;
	int getCivilianPercent() const;
	int getCivilianPerEraModifier() const;
	int getTrainPercent() const;
	int getTrainPerEraModifier() const;
	int getWorldTrainPercent() const;
	int getConstructPercent() const;
	int getConstructPerEraModifier() const;
	int getWorldConstructPercent() const;
	int getCreatePercent() const;
	int getCreatePerEraModifier() const;
	int getWorldCreatePercent() const;
	int getProcessBonus() const;
	int getProcessPerEraModifier() const;
	int getFreeXP() const;
	int getFreeXPPercent() const;
	int getFreeXPPercentVSHuman() const;
	int getCombatBonus() const;
	int getResistanceCap() const;
	int getVisionBonus() const;
	int getSpySecurityModifier() const;
	// VP Difficulty Bonus
	int getDifficultyBonusTurnInterval() const;
	int getYieldAmountForDifficultyBonus(int iEra, int iHistoricEvent, int iYield) const;

	// AI Bonuses
	int getAIStartingGold() const;
	int getAIStartingPolicyPoints() const;
	int getAIAdvancedStartPointsMod() const;
	int getAIHappinessDefault() const;
	int getAIHappinessDefaultCapital() const;
	int getAIExtraHappinessPerLuxury() const;
	int getAIEmpireSizeUnhappinessMod() const;
	int getAIPopulationUnhappinessMod() const;
	int getAIFreeCulturePerTurn() const;
	int getAIMaintenanceFreeUnits() const;
	int getAIUnitSupplyBase() const;
	int getAIUnitSupplyPerCity() const;
	int getAIUnitSupplyPopulationPercent() const;
	int getAIUnitSupplyPerEraFlat() const;
	int getAIUnitSupplyPerEraModifier() const;
	int getAIUnitSupplyBonusPercent() const;
	int getAIStartingUnitMultiplier() const;
	int getAIStartingWorkerUnits() const;
	int getAIStartingDefenseUnits() const;
	int getAIStartingExploreUnits() const;
	int getAIWorkRateModifier() const;
	int getAIImprovementCostPercent() const;
	int getAIBuildingCostPercent() const;
	int getAIUnitCostPercent() const;
	int getAIInflationPercent() const;
	int getAIUnitUpgradePercent() const;
	int getAIUnitUpgradePerEraModifier() const;
	int getAIGrowthPercent() const;
	int getAIGrowthPerEraModifier() const;
	int getAIResearchPercent() const;
	int getAIResearchPerEraModifier() const;
	int getAITechCatchUpMod() const;
	int getAIPolicyPercent() const;
	int getAIPolicyPerEraModifier() const;
	int getAIPolicyCatchUpMod() const;
	int getAIProphetPercent() const;
	int getAIGreatPeoplePercent() const;
	int getAIGoldenAgePercent() const;
	int getAICivilianPercent() const;
	int getAICivilianPerEraModifier() const;
	int getAITrainPercent() const;
	int getAITrainPerEraModifier() const;
	int getAIWorldTrainPercent() const;
	int getAIConstructPercent() const;
	int getAIConstructPerEraModifier() const;
	int getAIWorldConstructPercent() const;
	int getAICreatePercent() const;
	int getAICreatePerEraModifier() const;
	int getAIWorldCreatePercent() const;
	int getAIProcessBonus() const;
	int getAIProcessPerEraModifier() const;
	int getAIFreeXP() const;
	int getAIFreeXPPercent() const;
	int getAIFreeXPPercentVSHuman() const;
	int getAICombatBonus() const;
	int getAIResistanceCap() const;
	int getAIVisionBonus() const;
	int getAISpySecurityModifier() const;
	// VP Difficulty Bonus
	int getAIDifficultyBonusTurnInterval() const;
	int getYieldAmountForAIDifficultyBonus(int iEra, int iHistoricEvent, int iYield) const;

	// City-States
	int getStartingCityStateWorkerUnits() const;
	int getStartingCityStateDefenseUnits() const;
	int getCityStateUnitSupplyBase() const;
	int getCityStateUnitSupplyPerCity() const;
	int getCityStateUnitSupplyPopulationPercent() const;
	int getCityStateUnitSupplyPerEraFlat() const;
	int getCityStateUnitSupplyPerEraModifier() const;
	int getCityStateUnitSupplyBonusPercent() const;
	int getCityStateWorkRateModifier() const;
	int getCityStateGrowthPercent() const;
	int getCityStateGrowthPerEraModifier() const;
	int getCityStateCivilianPercent() const;
	int getCityStateCivilianPerEraModifier() const;
	int getCityStateTrainPercent() const;
	int getCityStateTrainPerEraModifier() const;
	int getCityStateConstructPercent() const;
	int getCityStateConstructPerEraModifier() const;
	int getCityStateCreatePercent() const;
	int getCityStateCreatePerEraModifier() const;
	int getCityStateFreeXP() const;
	int getCityStateFreeXPPercent() const;
	int getCityStateCombatBonus() const;
	int getCityStateVisionBonus() const;

	// Barbarians
	int getEarliestBarbarianReleaseTurn() const;
	int getBonusVSBarbarians() const;
	int getAIBonusVSBarbarians() const;
	int getBarbarianCampGold() const;
	int getAIBarbarianCampGold() const;
	int getBarbarianSpawnDelay() const;
	int getBarbarianLandTargetRange() const;
	int getBarbarianSeaTargetRange() const;

	// AI Behavior Modifiers
	// Weighted Randomized Choices
	int getCityProductionChoiceCutoffThreshold() const;
	int getTechChoiceCutoffThreshold() const;
	int getPolicyChoiceCutoffThreshold() const;
	int getBeliefChoiceCutoffThreshold() const;
	// Tactical AI
	int getTacticalSimMaxCompletedPositions() const;
	int getTacticalSimMaxBranches() const;
	int getTacticalSimMaxChoicesPerUnit() const;
	// Diplomacy AI
	int getLandDisputePercent() const;
	int getWonderDisputePercent() const;
	int getMinorCivDisputePercent() const;
	int getVictoryDisputePercent() const;
	int getVictoryDisputeMod() const;
	int getVictoryBlockPercent() const;
	int getVictoryBlockMod() const;
	int getWonderBlockPercent() const;
	int getWonderBlockMod() const;
	int getTechBlockPercent() const;
	int getTechBlockMod() const;
	int getPolicyBlockPercent() const;
	int getPolicyBlockMod() const;
	int getPeaceTreatyDampenerTurns() const;
	int getAggressionIncrease() const;
	int getHumanStrengthPerceptionMod() const;
	int getHumanTradeModifier() const;
	int getHumanOpinionChange() const;
	int getHumanWarApproachChangeFlat() const;
	int getHumanWarApproachChangePercent() const;
	int getHumanHostileApproachChangeFlat() const;
	int getHumanHostileApproachChangePercent() const;
	int getHumanDeceptiveApproachChangeFlat() const;
	int getHumanDeceptiveApproachChangePercent() const;
	int getHumanGuardedApproachChangeFlat() const;
	int getHumanGuardedApproachChangePercent() const;
	int getHumanAfraidApproachChangeFlat() const;
	int getHumanAfraidApproachChangePercent() const;
	int getHumanNeutralApproachChangeFlat() const;
	int getHumanNeutralApproachChangePercent() const;
	int getHumanFriendlyApproachChangeFlat() const;
	int getHumanFriendlyApproachChangePercent() const;
	int getAIOpinionChange() const;
	int getAIWarApproachChangeFlat() const;
	int getAIWarApproachChangePercent() const;
	int getAIHostileApproachChangeFlat() const;
	int getAIHostileApproachChangePercent() const;
	int getAIDeceptiveApproachChangeFlat() const;
	int getAIDeceptiveApproachChangePercent() const;
	int getAIGuardedApproachChangeFlat() const;
	int getAIGuardedApproachChangePercent() const;
	int getAIAfraidApproachChangeFlat() const;
	int getAIAfraidApproachChangePercent() const;
	int getAINeutralApproachChangeFlat() const;
	int getAINeutralApproachChangePercent() const;
	int getAIFriendlyApproachChangeFlat() const;
	int getAIFriendlyApproachChangePercent() const;

	// Arrays
	int getNumGoodies() const;
	int getGoodies(int i) const;
	int isFreeTechs(int i) const;
	int isAIFreeTechs(int i) const;

	int getAIStrategicResourceMod() const;
	int getAIStrategicResourceModPerEra() const;
	int getAIMinExpansionFlavor() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	// Player Bonuses
	int m_iMapPlacementPriority;
	int m_iStartingGold;
	int m_iStartingPolicyPoints;
	int m_iAdvancedStartPointsMod;
	int m_iHappinessDefault;
	int m_iHappinessDefaultCapital;
	int m_iExtraHappinessPerLuxury;
	int m_iEmpireSizeUnhappinessMod;
	int m_iPopulationUnhappinessMod;
	int m_iFreeCulturePerTurn;
	int m_iMaintenanceFreeUnits;
	int m_iUnitSupplyBase;
	int m_iUnitSupplyPerCity;
	int m_iUnitSupplyPopulationPercent;
	int m_iUnitSupplyPerEraFlat;
	int m_iUnitSupplyPerEraModifier;
	int m_iUnitSupplyBonusPercent;
	int m_iStartingUnitMultiplier;
	int m_iStartingWorkerUnits;
	int m_iStartingDefenseUnits;
	int m_iStartingExploreUnits;
	int m_iWorkRateModifier;
	int m_iImprovementCostPercent;
	int m_iBuildingCostPercent;
	int m_iUnitCostPercent;
	int m_iInflationPercent;
	int m_iUnitUpgradePercent;
	int m_iUnitUpgradePerEraModifier;
	int m_iGrowthPercent;
	int m_iGrowthPerEraModifier;
	int m_iResearchPercent;
	int m_iResearchPerEraModifier;
	int m_iTechCatchUpMod;
	int m_iPolicyPercent;
	int m_iPolicyPerEraModifier;
	int m_iPolicyCatchUpMod;
	int m_iProphetPercent;
	int m_iGreatPeoplePercent;
	int m_iGoldenAgePercent;
	int m_iCivilianPercent;
	int m_iCivilianPerEraModifier;
	int m_iTrainPercent;
	int m_iTrainPerEraModifier;
	int m_iWorldTrainPercent;
	int m_iConstructPercent;
	int m_iConstructPerEraModifier;
	int m_iWorldConstructPercent;
	int m_iCreatePercent;
	int m_iCreatePerEraModifier;
	int m_iWorldCreatePercent;
	int m_iProcessBonus;
	int m_iProcessPerEraModifier;
	int m_iFreeXP;
	int m_iFreeXPPercent;
	int m_iFreeXPPercentVSHuman;
	int m_iCombatBonus;
	int m_iResistanceCap;
	int m_iVisionBonus;
	int m_iSpySecurityModifier;
	// VP Difficulty Bonus
	int m_iDifficultyBonusTurnInterval;

	// AI Bonuses
	int m_iAIStartingGold;
	int m_iAIStartingPolicyPoints;
	int m_iAIAdvancedStartPointsMod;
	int m_iAIHappinessDefault;
	int m_iAIHappinessDefaultCapital;
	int m_iAIExtraHappinessPerLuxury;
	int m_iAIEmpireSizeUnhappinessMod;
	int m_iAIPopulationUnhappinessMod;
	int m_iAIFreeCulturePerTurn;
	int m_iAIMaintenanceFreeUnits;
	int m_iAIUnitSupplyBase;
	int m_iAIUnitSupplyPerCity;
	int m_iAIUnitSupplyPopulationPercent;
	int m_iAIUnitSupplyPerEraFlat;
	int m_iAIUnitSupplyPerEraModifier;
	int m_iAIUnitSupplyBonusPercent;
	int m_iAIStartingUnitMultiplier;
	int m_iAIStartingWorkerUnits;
	int m_iAIStartingDefenseUnits;
	int m_iAIStartingExploreUnits;
	int m_iAIWorkRateModifier;
	int m_iAIImprovementCostPercent;
	int m_iAIBuildingCostPercent;
	int m_iAIUnitCostPercent;
	int m_iAIInflationPercent;
	int m_iAIUnitUpgradePercent;
	int m_iAIUnitUpgradePerEraModifier;
	int m_iAIGrowthPercent;
	int m_iAIGrowthPerEraModifier;
	int m_iAIResearchPercent;
	int m_iAIResearchPerEraModifier;
	int m_iAITechCatchUpMod;
	int m_iAIPolicyPercent;
	int m_iAIPolicyPerEraModifier;
	int m_iAIPolicyCatchUpMod;
	int m_iAIProphetPercent;
	int m_iAIGreatPeoplePercent;
	int m_iAIGoldenAgePercent;
	int m_iAICivilianPercent;
	int m_iAICivilianPerEraModifier;
	int m_iAITrainPercent;
	int m_iAITrainPerEraModifier;
	int m_iAIWorldTrainPercent;
	int m_iAIConstructPercent;
	int m_iAIConstructPerEraModifier;
	int m_iAIWorldConstructPercent;
	int m_iAICreatePercent;
	int m_iAICreatePerEraModifier;
	int m_iAIWorldCreatePercent;
	int m_iAIProcessBonus;
	int m_iAIProcessPerEraModifier;
	int m_iAIFreeXP;
	int m_iAIFreeXPPercent;
	int m_iAIFreeXPPercentVSHuman;
	int m_iAICombatBonus;
	int m_iAIResistanceCap;
	int m_iAIVisionBonus;
	int m_iAISpySecurityModifier;
	// VP Difficulty Bonus
	int m_iAIDifficultyBonusTurnInterval;

	// City-States
	int m_iStartingCityStateWorkerUnits;
	int m_iStartingCityStateDefenseUnits;
	int m_iCityStateUnitSupplyBase;
	int m_iCityStateUnitSupplyPerCity;
	int m_iCityStateUnitSupplyPopulationPercent;
	int m_iCityStateUnitSupplyPerEraFlat;
	int m_iCityStateUnitSupplyPerEraModifier;
	int m_iCityStateUnitSupplyBonusPercent;
	int m_iCityStateWorkRateModifier;
	int m_iCityStateGrowthPercent;
	int m_iCityStateGrowthPerEraModifier;
	int m_iCityStateCivilianPercent;
	int m_iCityStateCivilianPerEraModifier;
	int m_iCityStateTrainPercent;
	int m_iCityStateTrainPerEraModifier;
	int m_iCityStateConstructPercent;
	int m_iCityStateConstructPerEraModifier;
	int m_iCityStateCreatePercent;
	int m_iCityStateCreatePerEraModifier;
	int m_iCityStateFreeXP;
	int m_iCityStateFreeXPPercent;
	int m_iCityStateCombatBonus;
	int m_iCityStateVisionBonus;

	// Barbarians
	int m_iEarliestBarbarianReleaseTurn;
	int m_iBonusVSBarbarians;
	int m_iAIBonusVSBarbarians;
	int m_iBarbarianCampGold;
	int m_iAIBarbarianCampGold;
	int m_iBarbarianSpawnDelay;
	int m_iBarbarianLandTargetRange;
	int m_iBarbarianSeaTargetRange;

	// AI Behavior Modifiers
	// Weighted Randomized Choices
	int m_iCityProductionChoiceCutoffThreshold;
	int m_iTechChoiceCutoffThreshold;
	int m_iPolicyChoiceCutoffThreshold;
	int m_iBeliefChoiceCutoffThreshold;
	// Tactical AI
	int m_iTacticalSimMaxCompletedPositions;
	int m_iTacticalSimMaxBranches;
	int m_iTacticalSimMaxChoicesPerUnit;
	// Diplomacy AI
	int m_iLandDisputePercent;
	int m_iWonderDisputePercent;
	int m_iMinorCivDisputePercent;
	int m_iVictoryDisputePercent;
	int m_iVictoryDisputeMod;
	int m_iVictoryBlockPercent;
	int m_iVictoryBlockMod;
	int m_iWonderBlockPercent;
	int m_iWonderBlockMod;
	int m_iTechBlockPercent;
	int m_iTechBlockMod;
	int m_iPolicyBlockPercent;
	int m_iPolicyBlockMod;
	int m_iPeaceTreatyDampenerTurns;
	int m_iAggressionIncrease;
	int m_iHumanStrengthPerceptionMod;
	int m_iHumanTradeModifier;
	int m_iHumanOpinionChange;
	int m_iHumanWarApproachChangeFlat;
	int m_iHumanWarApproachChangePercent;
	int m_iHumanHostileApproachChangeFlat;
	int m_iHumanHostileApproachChangePercent;
	int m_iHumanDeceptiveApproachChangeFlat;
	int m_iHumanDeceptiveApproachChangePercent;
	int m_iHumanGuardedApproachChangeFlat;
	int m_iHumanGuardedApproachChangePercent;
	int m_iHumanAfraidApproachChangeFlat;
	int m_iHumanAfraidApproachChangePercent;
	int m_iHumanNeutralApproachChangeFlat;
	int m_iHumanNeutralApproachChangePercent;
	int m_iHumanFriendlyApproachChangeFlat;
	int m_iHumanFriendlyApproachChangePercent;
	int m_iAIOpinionChange;
	int m_iAIWarApproachChangeFlat;
	int m_iAIWarApproachChangePercent;
	int m_iAIHostileApproachChangeFlat;
	int m_iAIHostileApproachChangePercent;
	int m_iAIDeceptiveApproachChangeFlat;
	int m_iAIDeceptiveApproachChangePercent;
	int m_iAIGuardedApproachChangeFlat;
	int m_iAIGuardedApproachChangePercent;
	int m_iAIAfraidApproachChangeFlat;
	int m_iAIAfraidApproachChangePercent;
	int m_iAINeutralApproachChangeFlat;
	int m_iAINeutralApproachChangePercent;
	int m_iAIFriendlyApproachChangeFlat;
	int m_iAIFriendlyApproachChangePercent;

	// Arrays
	int m_iNumGoodies;
	int* m_piGoodies;
	bool* m_pbFreeTechs;
	bool* m_pbAIFreeTechs;
	int* m_pppiDifficultyBonus;
	int* m_pppiAIDifficultyBonus;

	// SP AI extra buff
	int m_iAIStrategicResourceMod = 0;
	int m_iAIStrategicResourceModPerEra = 0;
	int m_iAIMinExpansionFlavor = 0;

private:
	CvHandicapInfo(const CvHandicapInfo&);
	CvHandicapInfo& operator=(const CvHandicapInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvGameSpeedInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvGameSpeedInfo :	public CvBaseInfo
{
public:
	CvGameSpeedInfo();
	virtual ~CvGameSpeedInfo();

	int GetDealDuration() const;
#if defined(MOD_BALANCE_CORE)
	int GetStartingHappiness() const;
#endif
	int getGrowthPercent() const;
	int getTrainPercent() const;
	int getInstantYieldPercent() const;
	int getDifficultyBonusPercent() const;
	int getConstructPercent() const;
	int getCreatePercent() const;
	int getResearchPercent() const;
	int getGoldPercent() const;
	int getGoldGiftMod() const;
	int getBuildPercent() const;
	int getImprovementPercent() const;
	int getGreatPeoplePercent() const;
	int getCulturePercent() const;
	int getFaithPercent() const;
	int getBarbPercent() const;
	int getFeatureProductionPercent() const;
	int getUnitDiscoverPercent() const;
	int getUnitHurryPercent() const;
	int getUnitTradePercent() const;
	int getGoldenAgePercent() const;
	int getHurryPercent() const;
	int getInflationOffset() const;
	int getReligiousPressureAdjacentCity() const;
	int getInflationPercent() const;
	int getVictoryDelayPercent() const;
	int getMinorCivElectionFreqMod() const;
	int getOpinionDurationPercent() const;
	int getSpyRatePercent() const;
	int getPeaceDealDuration() const;
	int getRelationshipDuration() const;
#if defined(MOD_TRADE_ROUTE_SCALING)
	int getTradeRouteSpeedMod() const;
#endif
	int getMilitaryRatingDecayPercent() const;
#if defined(MOD_BALANCE_CORE)
	int getPietyMax() const;
	int getPietyMin() const;
#endif
	int getLeaguePercent() const;
	int getNumTurnIncrements() const;

	int getTechCostPerTurnMultiplier() const;
	int getMinimumVoluntaryVassalTurns() const;
	int getMinimumVassalTurns() const;
	int getNumTurnsBetweenVassals() const;
	int getMinimumVassalLiberateTurns() const;
	int getMinimumVassalTaxTurns() const;

	GameTurnInfo& getGameTurnInfo(int iIndex) const;
	void allocateGameTurnInfos(const int iSize);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iDealDuration;
#if defined(MOD_BALANCE_CORE)
	int m_iStartingHappiness;
#endif
	int m_iGrowthPercent;
	int m_iTrainPercent;
	int m_iInstantYieldPercent;
	int m_iDifficultyBonusPercent;
	int m_iConstructPercent;
	int m_iCreatePercent;
	int m_iResearchPercent;
	int m_iGoldPercent;
	int m_iGoldGiftMod;
	int m_iBuildPercent;
	int m_iImprovementPercent;
	int m_iGreatPeoplePercent;
	int m_iCulturePercent;
	int m_iFaithPercent;
	int m_iBarbPercent;
	int m_iFeatureProductionPercent;
	int m_iUnitDiscoverPercent;
	int m_iUnitHurryPercent;
	int m_iUnitTradePercent;
	int m_iGoldenAgePercent;
	int m_iHurryPercent;
	int m_iInflationOffset;
	int m_iReligiousPressureAdjacentCity;
	int m_iInflationPercent;
	int m_iVictoryDelayPercent;
	int m_iMinorCivElectionFreqMod;
	int m_iOpinionDurationPercent;
	int m_iSpyRatePercent;
	int m_iPeaceDealDuration;
	int m_iRelationshipDuration;
#if defined(MOD_TRADE_ROUTE_SCALING)
	int m_iTradeRouteSpeedMod;
#endif
	int m_iMilitaryRatingDecayPercent;
#if defined(MOD_BALANCE_CORE)
	int m_iPietyMax;
	int m_iPietyMin;
#endif
	int m_iLeaguePercent;

	int m_iTechCostPerTurnMultiplier;
	int m_iMinimumVoluntaryVassalTurns;
	int m_iMinimumVassalTurns;
	int m_iNumTurnsBetweenVassals;
	int m_iMinimumVassalLiberateTurns;
	int m_iMinimumVassalTaxTurns;

	int m_iNumTurnIncrements;

	CvString m_strGameSpeedName;
	GameTurnInfo* m_pGameTurnInfo;

private:
	CvGameSpeedInfo(const CvGameSpeedInfo&);
	CvGameSpeedInfo& operator=(const CvGameSpeedInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CvTurnTimerInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvTurnTimerInfo :	public CvBaseInfo
{
public:
	CvTurnTimerInfo();

	int getBaseTime() const;
	int getCityResource() const;
	int getUnitResource() const;
	int getFirstTurnMultiplier() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	virtual bool operator==(const CvTurnTimerInfo&) const;

	template<typename TurnTimerInfo, typename Visitor>
	static void Serialize(TurnTimerInfo& turnTimerInfo, Visitor& visitor);
	virtual void readFrom(FDataStream& loadFrom);
	virtual void writeTo(FDataStream& saveTo) const;

protected:
	int m_iBaseTime;
	int m_iCityResource;
	int m_iUnitResource;
	int m_iFirstTurnMultiplier;
};

FDataStream& operator<<(FDataStream&, const CvTurnTimerInfo&);
FDataStream& operator>>(FDataStream&, CvTurnTimerInfo&);

#if defined(MOD_EVENTS_DIPLO_MODIFIERS)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CvDiploModifierInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvDiploModifierInfo :	public CvBaseInfo
{
public:
	CvDiploModifierInfo();

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	virtual bool operator==(const CvDiploModifierInfo&) const;
	
	bool isForFromCiv(CivilizationTypes eFromCiv);
	bool isForToCiv(CivilizationTypes eToCiv);

	template<typename DiploModifierInfo, typename Visitor>
	static void Serialize(DiploModifierInfo& diploModifierInfo, Visitor& visitor);
	virtual void readFrom(FDataStream& loadFrom);
	virtual void writeTo(FDataStream& saveTo) const;

protected:
	CivilizationTypes m_eFromCiv;
	CivilizationTypes m_eToCiv;
};

FDataStream& operator<<(FDataStream&, const CvDiploModifierInfo&);
FDataStream& operator>>(FDataStream&, CvDiploModifierInfo&);
#endif

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvBuildInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvBuildInfo : public CvHotKeyInfo
{
public:
	CvBuildInfo();
	virtual ~CvBuildInfo();

	int getTime() const;
	int getCost() const;
#if defined(MOD_CIV6_WORKER)
	int getBuilderCost() const;
#endif
	int getCostIncreasePerImprovement() const;
	int getTechPrereq() const;
#if defined(MOD_BALANCE_CORE)
	int getTechObsolete() const;
	bool isKillOnlyCivilian() const;
	bool IsFreeBestDomainUnit() const;
	bool IsCultureBoost() const;
#endif
	int getImprovement() const;
	int getRoute() const;
	int getEntityEvent() const;
	int getMissionType() const;
	void setMissionType(int iNewType);

	bool isKill() const;
	bool isRepair() const;
	bool IsRemoveRoute() const;
	bool IsWater() const;
	bool IsCanBeEmbarked() const;

	// Arrays
	int getFeatureTech(int i) const;
	int getFeatureTime(int i) const;
	int getFeatureProduction(int i) const;
	int getFeatureCost(int i) const;
	int getTechTimeChange(int i) const;

	bool isFeatureRemove(int i) const;
	int getFeatureObsoleteTech(int i) const;
	bool isFeatureRemoveOnly(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iTime;
	int m_iCost;
#if defined(MOD_CIV6_WORKER)
	int m_iBuilderCost;
#endif
	int m_iCostIncreasePerImprovement;
	int m_iTechPrereq;
#if defined(MOD_BALANCE_CORE)
	bool m_bKillOnlyCivilian;
	int m_iTechObsolete;
	bool m_bFreeBestDomainUnit;
	bool m_bCultureBoost;
#endif
	int m_iImprovement;
	int m_iRoute;
	int m_iEntityEvent;
	int m_iMissionType;

	bool m_bKill;
	bool m_bRepair;
	bool m_bRemoveRoute;
	bool m_bWater;
	bool m_bCanBeEmbarked;

	// Arrays
	int* m_paiFeatureTech;
	int* m_paiFeatureTime;
	int* m_paiFeatureProduction;
	int* m_paiFeatureCost;
	int* m_paiTechTimeChange;
	bool* m_pabFeatureRemove;
	int* m_paiFeatureObsoleteTech;
	bool* m_pabFeatureRemoveOnly;

private:
	CvBuildInfo(const CvBuildInfo&);
	CvBuildInfo& operator=(const CvBuildInfo&);
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Helper Functions to serialize arrays of variable length (based on number of builds defined in game)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
namespace BuildArrayHelpers
{
void Read(FDataStream& kStream, short* paiBuildArray);
void Write(FDataStream& kStream, short* paiBuildArray, int iArraySize);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CvGoodyInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvGoodyInfo :	public CvBaseInfo
{
public:
	CvGoodyInfo();

	int getGold() const;
	int getNumGoldRandRolls() const;
	int getGoldRandAmount() const;
	int getMapOffset() const;
	int getMapRange() const;
	int getMapProb() const;
	int getExperience() const;
	int getHealing() const;
	int getDamagePrereq() const;
	int getPopulation() const;
#if defined(MOD_BALANCE_CORE)
	int getProduction() const;
	int getGoldenAge() const;
	int getFreeTiles() const;
	int getScience() const;
	// New Goodies modmod
	int getFood() const;
	int getBorderGrowth() const;
	//
#endif
	int getCulture() const;
	int getFaith() const;
	int getProphetPercent() const;
	int getPantheonPercent() const;
	int getRevealNearbyBarbariansRange() const;
	int getBarbarianUnitProb() const;
	int getMinBarbarians() const;
	int getUnitClassType() const;
	int getBarbarianUnitClass() const;

	bool isTech() const;
	bool isRevealUnknownResource() const;
	bool isUpgradeUnit() const;
	bool isPantheonFaith() const;
	bool isBad() const;

	const char* getSound() const;
	void setSound(const char* szVal);

	const char* GetChooseDesc() const;
	void SetChooseDesc(const char* szVal);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iGold;
	int m_iNumGoldRandRolls;
	int m_iGoldRandAmount;
	int m_iMapOffset;
	int m_iMapRange;
	int m_iMapProb;
	int m_iExperience;
	int m_iHealing;
	int m_iDamagePrereq;
	int m_iPopulation;
#if defined(MOD_BALANCE_CORE)
	int m_iProduction;
	int m_iGoldenAge;
	int m_iFreeTiles;
	int m_iScience;
	int m_iFood;
	int m_iBorderGrowth;
#endif
	int m_iCulture;
	int m_iFaith;
	int m_iProphetPercent;
	int m_iPantheonPercent;
	int m_iRevealNearbyBarbariansRange;
	int m_iBarbarianUnitProb;
	int m_iMinBarbarians;
	int m_iUnitClassType;
	int m_iBarbarianUnitClass;

	bool m_bTech;
	bool m_bRevealUnknownResource;
	bool m_bUpgradeUnit;
	bool m_bPantheonFaith;
	bool m_bBad;

	CvString m_strSound;
	CvString m_strChooseDesc;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvRouteInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvRouteInfo :	public CvBaseInfo
{
public:
	CvRouteInfo();
	virtual ~CvRouteInfo();

	int GetGoldMaintenance() const;

	int getValue() const;
	int getMovementCost() const;
	int getFlatMovementCost() const;

	bool IsIndustrial() const;

	// Arrays
	int getYieldChange(int i) const;
	int getTechMovementChange(int i) const;
	int getResourceQuantityRequirement(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iGoldMaintenance;
	int m_iValue;
	int m_iMovementCost;
	int m_iFlatMovementCost;

	bool m_bIndustrial;

	// Arrays
	int* m_piYieldChange;
	int* m_piTechMovementChange;
	int* m_piResourceQuantityRequirements;

private:
	CvRouteInfo(const CvRouteInfo&);
	CvRouteInfo& operator=(const CvRouteInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvResourceClassInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvResourceClassInfo :	public CvBaseInfo
{
public:
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvResourceInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvResourceInfo : public CvBaseInfo
{
public:
	CvResourceInfo();
	virtual ~CvResourceInfo();

	int getResourceClassType() const;
	int getChar() const;
	void setChar(int i);
	int getTechReveal() const;
	int getPolicyReveal() const;
	int getTechCityTrade() const;
	int getImproveTech() const;
	int getTechObsolete() const;
	int getAIStopTradingEra() const;
	int getStartingResourceQuantity() const;
	int getHappiness() const;
	int getWonderProductionMod() const;
	EraTypes getWonderProductionModObsoleteEra() const;
	int getMinAreaSize() const;
	int getMinLatitude() const;
	int getMaxLatitude() const;
#if defined(MOD_BALANCE_CORE_RESOURCE_MONOPOLIES)
	int getMonopolyHappiness() const;
	int getMonopolyGALength() const;
	int getMonopolyAttackBonus() const;
	int getMonopolyDefenseBonus() const;
	int getMonopolyMovementBonus() const;
	int getMonopolyHealBonus() const;
	int getMonopolyXPBonus() const;
	bool isMonopoly() const;
#endif

	bool isPresentOnAllValidPlots() const;
	bool isOneArea() const;
	bool isHills() const;
	bool isFlatlands() const;
	bool isNoRiverSide() const;
	bool isOnlyMinorCivs() const;

	CivilizationTypes GetRequiredCivilization() const;

	ResourceUsageTypes getResourceUsage() const;

	const char* GetIconString() const;
	void SetIconString(const char* szVal);

	const char* getArtDefineTag() const;
	void setArtDefineTag(const char* szVal);
	const char* getArtDefineTagHeavy() const;
	void setArtDefineTagHeavy(const char* szVal);

	const char* getAltArtDefineTag() const;
	void setAltArtDefineTag(const char* szVal);
	const char* getAltArtDefineTagHeavy() const;
	void setAltArtDefineTagHeavy(const char* szVal);

	// Arrays
	int getYieldChange(int i) const;
	int* getYieldChangeArray();
	int getImprovementChange(int i) const;

#if defined(MOD_BALANCE_CORE_RESOURCE_MONOPOLIES)
	int getYieldChangeFromMonopoly(int i) const;
	int* getYieldChangeFromMonopolyArray();

	int getCityYieldModFromMonopoly(int i) const;
	int* getCityYieldModFromMonopolyArray();

	int getMonopolyAttackBonus(MonopolyTypes eMonopoly) const;
	int getMonopolyDefenseBonus(MonopolyTypes eMonopoly) const;

	int getMonopolyGreatPersonRateModifier(SpecialistTypes eSpecialist, MonopolyTypes eMonopoly) const;
	int getMonopolyGreatPersonRateChange(SpecialistTypes eSpecialist, MonopolyTypes eMonopoly) const;
#endif
#if defined(MOD_RESOURCES_PRODUCTION_COST_MODIFIERS)
	bool isHasUnitCombatProductionCostModifiersLocal() const;
	int getUnitCombatProductionCostModifiersLocal(UnitCombatTypes eUnitCombat, EraTypes eUnitEra) const;
	std::vector<ProductionCostModifiers> getUnitCombatProductionCostModifiersLocal(UnitCombatTypes eUnitCombat) const;

	bool isHasBuildingProductionCostModifiersLocal() const;
	int getBuildingProductionCostModifiersLocal(EraTypes eBuildingEra) const;
	std::vector<ProductionCostModifiers> getBuildingProductionCostModifiersLocal() const;
#endif

	int getResourceQuantityType(int i) const;

	bool isTerrain(int i) const;
	bool isFeature(int i) const;
	bool isFeatureTerrain(int i) const;

#ifdef MOD_GLOBAL_CORRUPTION
	int GetCorruptionScoreChange() const;
#endif
#ifdef MOD_RESOURCE_EXTRA_BUFF
	struct YieldInfo {
		YieldTypes eYield = NO_YIELD;
		LuaFormulaTypes eFormula = NO_LUA_FORMULA;
		EraTypes eStartEra = NO_ERA;
		EraTypes eEndEra = NO_ERA;
	};

	LuaFormulaTypes GetUnHappinessModifierFormula() const;
	LuaFormulaTypes GetCityConnectionTradeRouteGoldModifierFormula() const;
	LuaFormulaTypes GetGoldHurryCostModifierFormula() const;

	const std::vector<YieldInfo>& GetGlobalYieldModifiers() const;
#endif
	int getNotificationTurn() const;
	bool isNoDefaultNotification() const;
	int GetCreateResouceWightModifier() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iResourceClassType;
	int m_iChar;
	int m_iTechReveal;
	int m_iPolicyReveal;
	int m_iTechCityTrade;
	int m_iTechImproveable;
	int m_iTechObsolete;
	int m_iAIStopTradingEra;
	int m_iStartingResourceQuantity;
	int m_iHappiness;
	int m_iWonderProductionMod;
	int m_iMinAreaSize;
	int m_iMinLatitude;
	int m_iMaxLatitude;
#if defined(MOD_BALANCE_CORE_RESOURCE_MONOPOLIES)
	int m_iMonopolyHappiness;
	int m_iMonopolyGALength;
	bool m_bIsMonopoly;
	int m_iMonopolyAttackBonus;
	int m_iMonopolyDefenseBonus;
	int m_iMonopolyMovementBonus;
	int m_iMonopolyHealBonus;
	int m_iMonopolyXPBonus;
#endif

	bool m_bPresentOnAllValidPlots;
	bool m_bOneArea;
	bool m_bHills;
	bool m_bFlatlands;
	bool m_bNoRiverSide;
	bool m_bOnlyMinorCivs;

	CivilizationTypes m_eRequiredCivilization;
	ResourceUsageTypes m_eResourceUsage;
	EraTypes m_eWonderProductionModObsoleteEra;

	CvString m_strIconString;
	CvString m_strArtDefineTag;
	CvString m_strArtDefineTagHeavy;
	CvString m_strAltArtDefineTag;
	CvString m_strAltArtDefineTagHeavy;

	// Arrays
	int* m_piYieldChange;
#if defined(MOD_BALANCE_CORE_RESOURCE_MONOPOLIES)
	int* m_piYieldChangeFromMonopoly;
	int* m_piCityYieldModFromMonopoly;
	std::map<ResourceMonopolySettings, CombatModifiers> m_piiMonopolyCombatModifiers;
	std::map<MonopolyGreatPersonRateModifierKey, int> m_piMonopolyGreatPersonRateModifiers;
	std::map<MonopolyGreatPersonRateModifierKey, int> m_piMonopolyGreatPersonRateChanges;
#endif
#if defined(MOD_RESOURCES_PRODUCTION_COST_MODIFIERS)
	std::map<int, std::vector<ProductionCostModifiers>> m_piiiUnitCombatProductionCostModifiersLocal;
	std::vector<ProductionCostModifiers> m_aiiiBuildingProductionCostModifiersLocal;
#endif
	int* m_piResourceQuantityTypes;
	int* m_piImprovementChange;

	bool* m_pbTerrain;
	bool* m_pbFeature;
	bool* m_pbFeatureTerrain;

#ifdef MOD_GLOBAL_CORRUPTION
	int m_iCorruptionScoreChange = 0;
#endif
#ifdef MOD_RESOURCE_EXTRA_BUFF
	LuaFormulaTypes m_eUnHappinessModifierFormula = NO_LUA_FORMULA;
	LuaFormulaTypes m_eCityConnectionTradeRouteGoldModifierFormula = NO_LUA_FORMULA;
	LuaFormulaTypes m_eGoldHurryCostModifierFormula = NO_LUA_FORMULA;

	std::vector<YieldInfo> m_vGlobalYieldModifiers;
#endif
	int m_iNotificationTurn = 0;
	bool m_bNoDefaultNotification = false;
	int m_iCreateResouceWightModifier = 0;

private:
	CvResourceInfo(const CvResourceInfo&);
	CvResourceInfo& operator=(const CvResourceInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvFeatureInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvFeatureInfo : public CvBaseInfo
{
public:
	CvFeatureInfo();
	virtual ~CvFeatureInfo();

	int getStartingLocationWeight() const;
	int getMovementCost() const;
	int getSeeThroughChange() const;
	int getAppearanceProbability() const;
	int getDisappearanceProbability() const;
	int getGrowthProbability() const;
	int getGrowthTerrainType() const;
	int getDefenseModifier() const;
	int getInfluenceCost() const;
	int getTurnDamage() const;
	int getExtraTurnDamage() const;
	int getFirstFinderGold() const;
	int getInBorderHappiness() const;
	int getAdjacentUnitFreePromotion() const;
#if defined(MOD_BALANCE_CORE)
	int getPromotionIfOwned() const;
	int getLocationUnitFreePromotion() const;
	int getAdjacentSpawnLocationUnitFreePromotion() const;
	int getSpawnLocationUnitFreePromotion() const;
#endif

	bool isYieldNotAdditive() const;
	bool isNoCoast() const;
	bool isNoRiver() const;
	bool isNoAdjacent() const;
	bool isRequiresFlatlands() const;
	bool isRequiresRiver() const;
	bool isAddsFreshWater() const;
	bool isImpassable() const;
#if defined(MOD_BALANCE_CORE)
	int GetPrereqPassable() const;
#endif
	bool isNoCity() const;
	bool isNoImprovement() const;
	bool isVisibleAlways() const;
	bool isNukeImmune() const;
	bool IsRough() const;

	bool IsNaturalWonder(bool orPseudoNatural = false) const;
	bool IsPseudoNaturalWonder() const;

	const char* getArtDefineTag() const;
	void setArtDefineTag(const char* szTag);

	int getWorldSoundscapeScriptId() const;
	const char* getEffectTypeTag() const;

	const char* getEffectType() const;
	int getEffectProbability() const;


	int getYieldChange(int i) const;
	int getRiverYieldChange(int i) const;
	int getHillsYieldChange(int i) const;
	int getCoastalLandYieldChange(int i) const;
	int getFreshWaterYieldChange(int i) const;
	int GetTechYieldChanges(int i, int j) const;
	int GetEraYieldChanges(int i) const;
	int get3DAudioScriptFootstepIndex(int i) const;

	bool isTerrain(int i) const;

	// Set each time the game is started
	bool IsClearable() const;
	void SetClearable(bool bValue);

	// Other
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iStartingLocationWeight;
	int m_iMovementCost;
	int m_iSeeThroughChange;
	int m_iAppearanceProbability;
	int m_iDisappearanceProbability;
	int m_iGrowthProbability;
	int m_iGrowthTerrainType;
	int m_iDefenseModifier;
	int m_iInfluenceCost;
	int m_iTurnDamage;
	int m_iExtraTurnDamage;
	int m_iFirstFinderGold;
	int m_iInBorderHappiness;
	int m_iAdjacentUnitFreePromotion;
#if defined(MOD_BALANCE_CORE)
	int m_iPromotionIfOwned;
	int m_iLocationUnitFreePromotion;
	int m_iSpawnLocationUnitFreePromotion;
	int m_iAdjacentSpawnLocationUnitFreePromotion;
#endif

	bool m_bYieldNotAdditive;
	bool m_bNoCoast;
	bool m_bNoRiver;
	bool m_bNoAdjacent;
	bool m_bRequiresFlatlands;
	bool m_bRequiresRiver;
	bool m_bAddsFreshWater;
	bool m_bImpassable;
#if defined(MOD_BALANCE_CORE)
	int m_iPrereqTechPassable;
#endif
	bool m_bNoCity;
	bool m_bNoImprovement;
	bool m_bVisibleAlways;
	bool m_bNukeImmune;
	bool m_bRough;
	bool m_bNaturalWonder;
#if defined(MOD_PSEUDO_NATURAL_WONDER)
	bool m_bPseudoNaturalWonder;
#endif

	// Set each time the game is started
	bool m_bClearable;

	int m_iWorldSoundscapeScriptId;

	CvString m_strEffectType;
	int m_iEffectProbability;
	CvString m_strEffectTypeTag;		// Effect type for effect macros

	// Arrays
	int* m_piYieldChange;
	int* m_piRiverYieldChange;
	int* m_piHillsYieldChange;
	int* m_piCoastalLandYieldChange;
	int* m_piFreshWaterChange;
	int** m_ppiTechYieldChanges;
	int* m_piEraYieldChange;
	int* m_pi3DAudioScriptFootstepIndex;
	bool* m_pbTerrain;

private:
	CvString m_strArtDefineTag;

	CvFeatureInfo(const CvFeatureInfo&);
	CvFeatureInfo& operator=(const CvFeatureInfo&);
};


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvYieldInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvYieldInfo : public CvBaseInfo
{
public:
	CvYieldInfo();

	const char* getIconString() const;
	const char* getColorString() const;
	int getHillsChange() const;
	int getMountainChange() const;
	int getLakeChange() const;
	int getCityChange() const;
	int getPopulationChangeOffset() const;
	int getPopulationChangeDivisor() const;
	int getMinCity() const;
#if defined(MOD_BALANCE_CORE)
	int getMinCityFlatFreshWater() const;
	int getMinCityFlatNoFreshWater() const;
	int getMinCityHillFreshWater() const;
	int getMinCityHillNoFreshWater() const;
	int getMinCityMountainFreshWater() const;
	int getMinCityMountainNoFreshWater() const;
#endif
	int getGoldenAgeYield() const;
	int getGoldenAgeYieldThreshold() const;
	int getGoldenAgeYieldMod() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	CvString m_strIconString;
	CvString m_strColorString;
	int m_iHillsChange;
	int m_iMountainChange;
	int m_iLakeChange;
	int m_iCityChange;
	int m_iPopulationChangeOffset;
	int m_iPopulationChangeDivisor;
	int m_iMinCity;
#if defined(MOD_BALANCE_CORE)
	int m_iMinCityFlatFreshWater;
	int m_iMinCityFlatNoFreshWater;
	int m_iMinCityHillFreshWater;
	int m_iMinCityHillNoFreshWater;
	int m_iMinCityMountainFreshWater;
	int m_iMinCityMountainNoFreshWater;
#endif
	int m_iGoldenAgeYield;
	int m_iGoldenAgeYieldThreshold;
	int m_iGoldenAgeYieldMod;
};


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvTerrainInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvTerrainInfo : public CvBaseInfo
{
public:

	CvTerrainInfo();
	virtual ~CvTerrainInfo();

	int getMovementCost() const;
	int getSeeFromLevel() const;
	int getSeeThroughLevel() const;
	int getBuildModifier() const;
	int getDefenseModifier() const;
	int getInfluenceCost() const;
	int getTurnDamage() const;
	int getExtraTurnDamage() const;
#if defined(MOD_BALANCE_CORE)
	int getLocationUnitFreePromotion() const;
	int getSpawnLocationUnitFreePromotion() const;
	int getAdjacentSpawnLocationUnitFreePromotion() const;

	int getAdjacentUnitFreePromotion() const;
#endif

	bool isWater() const;
	bool isImpassable() const;
#if defined(MOD_BALANCE_CORE)
	int GetPrereqPassable() const;
#endif
	bool isFound() const;
	bool isFoundCoast() const;
	bool isFoundFreshWater() const;

	const char* getArtDefineTag() const;
	void setArtDefineTag(const char* szTag);

	int getWorldSoundscapeScriptId() const;
	const char* getEffectTypeTag() const;

	// Arrays
	int getYield(int i) const;
	int getRiverYieldChange(int i) const;
	int getHillsYieldChange(int i) const;
	int getCoastalLandYieldChange(int i) const;
	int getFreshWaterYieldChange(int i) const;
	int GetTechYieldChanges(int i, int j) const;
	int get3DAudioScriptFootstepIndex(int i) const;

	// Other
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iMovementCost;
	int m_iSeeFromLevel;
	int m_iSeeThroughLevel;
	int m_iBuildModifier;
	int m_iDefenseModifier;
	int m_iInfluenceCost;
	int m_iTurnDamage;
	int m_iExtraTurnDamage;
#if defined(MOD_BALANCE_CORE)
	int m_iLocationUnitFreePromotionTerrain;
	int m_iSpawnLocationUnitFreePromotionTerrain;
	int m_iAdjacentSpawnLocationUnitFreePromotionTerrain;
	int m_iAdjacentUnitFreePromotionTerrain;
#endif

	bool m_bWater;
	bool m_bImpassable;
#if defined(MOD_BALANCE_CORE)
	int m_iPrereqTechPassable;
#endif
	bool m_bFound;
	bool m_bFoundCoast;
	bool m_bFoundFreshWater;

	int m_iWorldSoundscapeScriptId;

	// Arrays
	int* m_piYields;
	int* m_piRiverYieldChange;
	int* m_piHillsYieldChange;
	int* m_piCoastalLandYieldChange;
	int* m_piFreshWaterChange;
	int** m_ppiTechYieldChanges;
	int* m_pi3DAudioScriptFootstepIndex;

	CvString m_strEffectTypeTag;		// Effect type for effect macros

private:
	CvString m_strArtDefineTag;

	CvTerrainInfo(const CvTerrainInfo&);
	CvTerrainInfo& operator=(const CvTerrainInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvInterfaceModeInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvInterfaceModeInfo :	public CvHotKeyInfo
{
public:
	CvInterfaceModeInfo();

	int getCursorIndex() const;
	int getMissionType() const;

	bool getVisible() const;
	bool getHighlightPlot() const;
	bool getSelectType() const;
	bool getSelectAll() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iCursorIndex;
	int m_iMissionType;

	bool m_bVisible;
	bool m_bHighlightPlot;
	bool m_bSelectType;
	bool m_bSelectAll;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvLeaderHeadInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvLeaderHeadInfo : public CvBaseInfo
{
public:
	CvLeaderHeadInfo();
	virtual ~CvLeaderHeadInfo();

	int GetVictoryCompetitiveness() const;
	int GetWonderCompetitiveness() const;
	int GetMinorCivCompetitiveness() const;
	int GetBoldness() const;
	int GetDiploBalance() const;
	int GetWarmongerHate() const;
	int GetDoFWillingness() const;
	int GetDenounceWillingness() const;
	int GetWorkWithWillingness() const;
	int GetWorkAgainstWillingness() const;
	int GetLoyalty() const;
	int GetForgiveness() const;
	int GetNeediness() const;
	int GetMeanness() const;
	int GetChattiness() const;

	int GetWarBias(bool bMinor) const;
	int GetHostileBias(bool bMinor) const;
	int GetDeceptiveBias() const;
	int GetGuardedBias() const;
	int GetAfraidBias() const;
	int GetNeutralBias(bool bMinor) const;
	int GetFriendlyBias(bool bMinor) const;

	VictoryPursuitTypes GetPrimaryVictoryPursuit() const;
	VictoryPursuitTypes GetSecondaryVictoryPursuit() const;
	VictoryPursuitTypes VictoryPursuitTypeFromString(const char* szStr);

	const char* getArtDefineTag() const;
	void setArtDefineTag(const char* szVal);

	// Arrays
	bool hasTrait(int i) const;
	int getFlavorValue(int i) const;

	// Other
	const char* getLeaderHead() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iVictoryCompetitiveness;
	int m_iWonderCompetitiveness;
	int m_iMinorCivCompetitiveness;
	int m_iBoldness;
	int m_iDiploBalance;
	int m_iWarmongerHate;
	int m_iDoFWillingness;
	int m_iDenounceWillingness;
	int m_iWorkWithWillingness;
	int m_iWorkAgainstWillingness;
	int m_iLoyalty;
	int m_iForgiveness;
	int m_iNeediness;
	int m_iMeanness;
	int m_iChattiness;

	int* m_piMajorCivApproachBiases;
	int* m_piMinorCivApproachBiases;

	CvString m_strArtDefineTag;

	VictoryPursuitTypes m_ePrimaryVictoryPursuit;
	VictoryPursuitTypes m_eSecondaryVictoryPursuit;

	// Arrays
	bool* m_pbTraits;

	int* m_piFlavorValue;

private:
	CvLeaderHeadInfo(const CvLeaderHeadInfo&);
	CvLeaderHeadInfo& operator=(const CvLeaderHeadInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvWorldInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvWorldInfo :	public CvBaseInfo
{
public:
	CvWorldInfo();
	int getDefaultPlayers() const;
	int getDefaultMinorCivs() const;
	int getFogTilesPerBarbarianCamp() const;
	int getNumNaturalWonders() const;
	int getUnitNameModifier() const;
	int getTargetNumCities() const;
	int getNumFreeBuildingResources() const;
	int getBuildingClassPrereqModifier() const;
	int getGridWidth() const;
	int getGridHeight() const;
	int getMaxActiveReligions() const;
	int getTerrainGrainChange() const;
	int getFeatureGrainChange() const;
	int getResearchPercent() const;
	int getNumCitiesUnhappinessPercent() const;
	int GetNumCitiesPolicyCostMod() const;
	int GetNumCitiesTechCostMod() const;
#if defined(MOD_TRADE_ROUTE_SCALING)
	int GetNumCitiesTourismCostMod() const;
	int GetNumCitiesUnitSupplyMod() const;
	int getTradeRouteDistanceMod() const;
#endif
#if defined(MOD_BALANCE_CORE)
	int getMinDistanceCities() const;
	int getMinDistanceCityStates() const;
	int getReformationPercent() const;
#endif
	int GetEstimatedNumCities() const;

	static CvWorldInfo CreateCustomWorldSize(const CvWorldInfo& kTemplate, int iWidth, int iHeight);
	static CvWorldInfo CreateCustomWorldSize(const CvWorldInfo& kTemplate, int iWidth, int iHeight, int iPlayers, int iMinorCivs);

	//Cached result overrides.
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	template<typename WorldInfo, typename Visitor>
	static void Serialize(WorldInfo& worldInfo, Visitor& visitor);
	virtual void readFrom(FDataStream&);
	virtual void writeTo(FDataStream&) const;
	virtual bool operator==(const CvWorldInfo&) const;
	bool operator != (const CvWorldInfo&) const;

	// Class specific

	// A special method to read the serialized info before there was any versioning
	void readFromVersion0(FDataStream&);


protected:
	int m_iDefaultPlayers;
	int m_iDefaultMinorCivs;
	int m_iFogTilesPerBarbarianCamp;
	int m_iNumNaturalWonders;
	int m_iUnitNameModifier;
	int m_iTargetNumCities;
	int m_iNumFreeBuildingResources;
	int m_iBuildingClassPrereqModifier;
	int m_iGridWidth;
	int m_iGridHeight;
	int m_iMaxActiveReligions;
	int m_iTerrainGrainChange;
	int m_iFeatureGrainChange;
	int m_iResearchPercent;
	int m_iNumCitiesUnhappinessPercent;
	int m_iNumCitiesPolicyCostMod;
	int m_iNumCitiesTechCostMod;
#if defined(MOD_TRADE_ROUTE_SCALING)
	int m_iNumCitiesTourismCostMod;
	int m_iNumCitiesUnitSupplyMod;
	int m_iTradeRouteDistanceMod;
#endif
#if defined(MOD_BALANCE_CORE)
	int m_iMinDistanceCities;
	int m_iMinDistanceCityStates;
	int m_iReformationPercent;
#endif
	int m_iEstimatedNumCities;
};

FDataStream& operator<<(FDataStream&, const CvWorldInfo&);
FDataStream& operator>>(FDataStream&, CvWorldInfo&);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvClimateInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvClimateInfo: public CvBaseInfo
{
public:
	CvClimateInfo();

	int getDesertPercentChange() const
	{
		return m_iDesertPercentChange;
	}

	int getJungleLatitude() const
	{
		return m_iJungleLatitude;
	}

	int getHillRange() const
	{
		return m_iHillRange;
	}

	int getMountainPercent() const
	{
		return m_iMountainPercent;
	}

	float getSnowLatitudeChange() const
	{
		return m_fDesertBottomLatitudeChange;
	}

	float getTundraLatitudeChange() const
	{
		return m_fTundraLatitudeChange;
	}

	float getGrassLatitudeChange() const
	{
		return m_fGrassLatitudeChange;
	}

	float getDesertBottomLatitudeChange() const
	{
		return m_fDesertBottomLatitudeChange;
	}

	float getDesertTopLatitudeChange() const
	{
		return m_fDesertTopLatitudeChange;
	}

	float getIceLatitude() const
	{
		return m_fIceLatitude;
	}

	float getRandIceLatitude() const
	{
		return m_fRandIceLatitude;
	}

	//Cached result overrides.
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

	template<typename ClimateInfo, typename Visitor>
	static void Serialize(ClimateInfo& climateInfo, Visitor& visitor);
	virtual void readFrom(FDataStream&);
	virtual void writeTo(FDataStream&) const;

protected:
	int m_iDesertPercentChange;
	int m_iJungleLatitude;
	int m_iHillRange;
	int m_iMountainPercent;

	float m_fSnowLatitudeChange;
	float m_fTundraLatitudeChange;
	float m_fGrassLatitudeChange;
	float m_fDesertBottomLatitudeChange;
	float m_fDesertTopLatitudeChange;
	float m_fIceLatitude;
	float m_fRandIceLatitude;
};

FDataStream& operator<<(FDataStream&, const CvClimateInfo&);
FDataStream& operator>>(FDataStream&, CvClimateInfo&);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvSeaLevelInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvSeaLevelInfo :	public CvBaseInfo
{
public:
	CvSeaLevelInfo();

	int getSeaLevelChange() const
	{
		return m_iSeaLevelChange;
	}

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

	template<typename SeaLevelInfo, typename Visitor>
	static void Serialize(SeaLevelInfo& seaLevelInfo, Visitor& visitor);
	virtual void readFrom(FDataStream&);
	virtual void writeTo(FDataStream&) const;

private:
	int m_iSeaLevelChange;
};

FDataStream& operator<<(FDataStream&, const CvSeaLevelInfo&);
FDataStream& operator>>(FDataStream&, CvSeaLevelInfo&);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvProcessInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvProcessInfo : public CvBaseInfo
{
public:
	CvProcessInfo();
	virtual ~CvProcessInfo();

	int getTechPrereq() const;
	int getRequiredPolicy() const;
	int getDefenseValue() const;

#if defined(MOD_CIVILIZATIONS_UNIQUE_PROCESSES)
	CivilizationTypes GetRequiredCivilization() const;
#endif

	// Arrays
	int getProductionToYieldModifier(int i) const;
	int GetFlavorValue(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iTechPrereq;
	int m_iRequiredPolicy;
	int m_iDefenseValue;

#if defined(MOD_CIVILIZATIONS_UNIQUE_PROCESSES)
	CivilizationTypes m_eRequiredCivilization;
#endif

	// Arrays
	int* m_paiProductionToYieldModifier;
	int* m_paiFlavorValue;

private:
	CvProcessInfo(const CvProcessInfo&);
	CvProcessInfo& operator=(const CvProcessInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvVoteInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvVoteInfo : public CvBaseInfo
{
public:
	CvVoteInfo();
	virtual ~CvVoteInfo();

	int getPopulationThreshold() const;
	int getMinVoters() const;
	bool isSecretaryGeneral() const;
	bool isVictory() const;
	bool isNoNukes() const;
	bool isCityVoting() const;
	bool isCivVoting() const;
	bool isDefensivePact() const;
	bool isOpenBorders() const;
	bool isForcePeace() const;
	bool isForceNoTrade() const;
	bool isForceWar() const;
	bool isAssignCity() const;
	bool isVoteSourceType(int i) const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iPopulationThreshold;
	int m_iMinVoters;
	bool m_bSecretaryGeneral;
	bool m_bVictory;
	bool m_bNoNukes;
	bool m_bCityVoting;
	bool m_bCivVoting;
	bool m_bDefensivePact;
	bool m_bOpenBorders;
	bool m_bForcePeace;
	bool m_bForceNoTrade;
	bool m_bForceWar;
	bool m_bAssignCity;
	bool* m_abVoteSourceTypes;

private:
	CvVoteInfo(const CvVoteInfo&);
	CvVoteInfo& operator=(const CvVoteInfo&);

};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvEntityEventInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvEntityEventInfo : public CvBaseInfo
{
public:
	CvEntityEventInfo();

	AnimationPathTypes getAnimationPathType(int iIndex = 0) const;
	int getAnimationPathCount() const;

	bool getUpdateFormation() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

private:
	std::vector<AnimationPathTypes>	m_vctAnimationPathType;
	bool							m_bUpdateFormation;
};


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvEraInfo
//  DESC:   Contains information about the eras of the game
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvEraInfo : public CvBaseInfo
{
public:
	CvEraInfo();
	virtual ~CvEraInfo();

	int getStartingUnitMultiplier() const;
	int getStartingDefenseUnits() const;
	int getStartingCityStateDefenseUnits() const;
	int getStartingWorkerUnits() const;
	int getStartingExploreUnits() const;
	int getUnitSupplyBase() const;
	int getResearchAgreementCost() const;
	int getEmbarkedUnitDefense() const;
	int getStartingGold() const;
	int getStartingCulture() const;
	int getFreePopulation() const;
	int getLaterEraBuildingConstructMod() const;
	int getStartPercent() const;
	int getBuildingMaintenancePercent() const;
	int getGrowthPercent() const;
	int getTrainPercent() const;
	int getConstructPercent() const;
	int getCreatePercent() const;
	int getResearchPercent() const;
	int getBuildPercent() const;
	int getImprovementPercent() const;
	int getGreatPeoplePercent() const;
	int getEventChancePerTurn() const;
	int getSpiesGrantedForPlayer() const;
	int getSpiesGrantedForEveryone() const;
	int getFaithCostMultiplier() const;
	int getDiploEmphasisReligion() const;
	int getDiploEmphasisLatePolicies() const;
	int getTradeRouteFoodBonusTimes100() const;
	int getTradeRouteProductionBonusTimes100() const;
	int getLeaguePercent() const;
	int getWarmongerPercent() const;
	bool getVassalageEnabled() const;

	const char* GetCityBombardEffectTag() const;
	uint GetCityBombardEffectTagHash() const;

	const char* getAudioUnitVictoryScript() const;
	const char* getAudioUnitDefeatScript() const;

	int GetNumEraVOs() const;
	const char* GetEraVO(int iIndex);

	const char* getArtPrefix() const;

	const char* getShortDesc() const;
	const char* getAbbreviation() const;

	bool isNoGoodies() const;
	bool isNoBarbUnits() const;
	bool isNoReligion() const;

	// Arrays


	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iStartingUnitMultiplier;
	int m_iStartingDefenseUnits;
	int m_iStartingCityStateDefenseUnits;
	int m_iStartingWorkerUnits;
	int m_iStartingExploreUnits;
	int m_iUnitSupplyBase;
	int m_iResearchAgreementCost;
	int m_iEmbarkedUnitDefense;
	int m_iStartingGold;
	int m_iStartingCulture;
	int m_iFreePopulation;
	int m_iLaterEraBuildingConstructMod;
	int m_iStartPercent;
	int m_iBuildingMaintenancePercent;
	int m_iGrowthPercent;
	int m_iTrainPercent;
	int m_iConstructPercent;
	int m_iCreatePercent;
	int m_iResearchPercent;
	int m_iBuildPercent;
	int m_iImprovementPercent;
	int m_iGreatPeoplePercent;
	int m_iEventChancePerTurn;
	int m_iSpiesGrantedForPlayer;
	int m_iSpiesGrantedForEveryone;
	int m_iFaithCostMultiplier;
	int m_iDiploEmphasisReligion;
	int m_iDiploEmphasisLatePolicies;
	int m_iTradeRouteFoodBonusTimes100;
	int m_iTradeRouteProductionBonusTimes100;
	int m_iLeaguePercent;
	int m_iWarmongerPercent;
	bool m_bVassalageEnabled;

	CvString m_strCityBombardEffectTag;
	CvString m_strAudioUnitVictoryScript;
	CvString m_strAudioUnitDefeatScript;
	CvString m_strArtPrefix;
	CvString m_strShortDesc;
	CvString m_strAbbreviation;

	uint m_uiCityBombardEffectTagHash;

	bool m_bNoGoodies;
	bool m_bNoBarbUnits;
	bool m_bNoReligion;

	std::vector<CvString> m_vEraVOs;

private:
	CvEraInfo(const CvEraInfo&);
	CvEraInfo& operator=(const CvEraInfo&);
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvColorInfo
//  DESC:   Used to manage different types of Art Styles
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvColorInfo : public CvBaseInfo
{
public:
	const CvColorA& GetColor() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	CvColorA m_Color;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvPlayerColorInfo
//  DESC:   Used to manage different types of Art Styles
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvPlayerColorInfo : public CvBaseInfo
{
public:
	CvPlayerColorInfo();

	int GetColorTypePrimary() const;
	int GetColorTypeSecondary() const;
	int GetColorTypeText() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

private:
	int m_iColorTypePrimary;
	int m_iColorTypeSecondary;
	int m_iColorTypeText;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvGameOptionInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvGameOptionInfo : public CvBaseInfo
{
public:
	CvGameOptionInfo();

	bool getDefault() const;
	bool getVisible() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

private:
	bool m_bDefault;
	bool m_bVisible;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvMPOptionInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvMPOptionInfo : public CvBaseInfo
{
public:
	CvMPOptionInfo();

	bool getDefault() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

private:
	bool m_bDefault;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvPlayerOptionInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvPlayerOptionInfo : public CvBaseInfo
{
public:
	CvPlayerOptionInfo();

	bool getDefault() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

private:
	bool m_bDefault;
};


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvVoteSourceInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvVoteSourceInfo : public CvBaseInfo
{
public:
	CvVoteSourceInfo();
	virtual ~CvVoteSourceInfo();

	int getVoteInterval() const;
	int getFreeSpecialist() const;
	int getPolicy() const;
	const CvString& getPopupText() const;
	const CvString& getSecretaryGeneralText() const;

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iVoteInterval;
	int m_iFreeSpecialist;
	int m_iPolicy;

	CvString m_strPopupText;
	CvString m_strSecretaryGeneralText;

private:
	CvVoteSourceInfo(const CvVoteSourceInfo&);
	CvVoteSourceInfo& operator=(const CvVoteSourceInfo&);
};

#if defined(MOD_BALANCE_CORE_EVENTS)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvEventLinkingInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvEventLinkingInfo
{
	friend class CvModEventInfo;

public:
	CvEventLinkingInfo() :
	  m_bCheckWorld(false),
	  m_bActive(false),
	  m_iEvent(-1),
	  m_iEventChoice(-1),
	  m_iCityEvent(-1),
	  m_iCityEventChoice(-1)
	  {
	  };
	  int GetLinkingEvent() {return m_iEvent;};
	  int GetLinkingEventChoice() {return m_iEventChoice;};
	  int GetCityLinkingEvent() {return m_iCityEvent;};
	  int GetCityLinkingEventChoice() {return m_iCityEventChoice;};
	  bool CheckOtherPlayers() {return m_bCheckWorld;};
	  bool CheckForActive() {return m_bActive;};

protected:
	bool m_bCheckWorld;
	bool m_bActive;
	int m_iEvent;
	int m_iEventChoice;
	int m_iCityEvent;
	int m_iCityEventChoice;
};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvModEventInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvModEventInfo : public CvBaseInfo
{
public:
	CvModEventInfo();
	virtual ~CvModEventInfo();

	bool IgnoresGlobalCooldown() const;
	int getPrereqTech() const;
	int getObsoleteTech() const;
	int getMinimumNationalPopulation() const;
	int getMinimumNumberCities() const;
	int getUnitTypeRequired() const;
	int getEventClass() const;
	int getRandomChance() const;
	int getRandomChanceDelta() const;
	int getRequiredCiv() const;
	int getRequiredEra() const;
	int getObsoleteEra() const;
	int getYieldMinimum(YieldTypes eYield) const;
	int getRequiredPolicy() const;
	int getRequiredIdeology() const;
	int getRequiredImprovement() const;
	int getRequiredReligion() const;
	bool hasPantheon() const;
	int getNumChoices() const;
	int getBuildingRequired() const;
	int getBuildingLimiter() const;
	int getCooldown() const;
	bool isRequiresHolyCity() const;
	bool isGlobal() const;
	bool isEraScaling() const;
	bool isRequiresIdeology() const;
	bool isRequiresWar() const;
	bool isRequiresWarMinor() const;
	const char* getSplashArt() const;
	const char* getEventAudio() const;
	int getResourceRequired(ResourceTypes eResource) const;
	int getFeatureRequired(FeatureTypes eFeature) const;
	int getRequiredStateReligion() const;
	bool hasStateReligion() const;
	bool isUnhappy() const;
	bool isSuperUnhappy() const;
	bool isOneShot() const;
	bool hasMetAnotherCiv() const;
	bool isInDebt() const;
	bool isLosingMoney() const;
	bool isMaster() const;
	bool isVassal() const;
	int getNumCoastalRequired() const;
	bool isTradeCapped() const;
		
	CvEventLinkingInfo *GetLinkerInfo(int i) const;
	int GetNumLinkers() const {return m_iLinkerInfos;};

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:

	bool m_bIgnoresGlobalCooldown;
	int m_iPrereqTech;
	int m_iObsoleteTech;
	int m_iMinimumNationalPopulation;
	int m_iMinimumNumberCities;
	int m_iUnitTypeRequired;
	int m_iEventClass;
	int m_iRandomChance;
	int m_iRandomChanceDelta;
	int m_iRequiredCiv;
	int m_iRequiredEra;
	int m_iObsoleteEra;
	int m_iRequiredImprovement;
	int m_iRequiredPolicy;
	int m_iIdeology;
	int m_iRequiredReligion;
	bool m_bRequiredPantheon;
	int m_iNumChoices;
	int m_iBuildingRequired;
	int m_iBuildingLimiter;
	int m_iCooldown;
	int* m_piMinimumYield;
	bool m_bRequiresHolyCity;
	bool m_bGlobal;
	bool m_bEraScaling;
	bool m_bRequiresIdeology;
	bool m_bRequiresWar;
	bool m_bRequiresWarMinor;
	CvString m_strSplashArt;
	CvString m_strEventAudio;
	int* m_piRequiredResource;
	int* m_piRequiredFeature;
	int m_iRequiredStateReligion;
	bool m_bHasStateReligion;
	bool m_bUnhappy;
	bool m_bSuperUnhappy;
	bool m_bOneShot;
	bool m_bMetAnotherCiv;
	bool m_bInDebt;
	bool m_bLosingMoney;
	bool m_bVassal;
	bool m_bMaster;
	int m_iCoastal;
	bool m_bTradeCapped;
	
	CvEventLinkingInfo* m_paLinkerInfo;
	int m_iLinkerInfos;

private:
	CvModEventInfo(const CvModEventInfo&);
	CvModEventInfo& operator=(const CvModEventInfo&);
};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvEventNotificationInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvEventNotificationInfo
{
	friend class CvModEventChoiceInfo;

public:
	CvEventNotificationInfo() :
	  m_bWorldEvent(false),
	  m_bNeedPlayerID(false),
	  m_iVariable1(-1),
	  m_iVariable2(-1)
	  {
	  };
	  CvString GetDescription() {return m_strDescription;};
	  CvString GetShortDescription() {return m_strShortDescription;};
	  bool IsWorldEvent() {return m_bWorldEvent;};
	  bool IsNeedPlayerID() {return m_bNeedPlayerID;};
	  int GetVariable1() {return m_iVariable1;};
	  int GetVariable2() {return m_iVariable2;};
	  CvString GetNotificationString() {return m_strNotificationType;};

protected:
	CvString m_strNotificationType;
	CvString m_strDescription;
	CvString m_strShortDescription;
	bool m_bWorldEvent;
	bool m_bNeedPlayerID;
	int m_iVariable1;
	int m_iVariable2;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvEventChoiceLinkingInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvEventChoiceLinkingInfo
{
	friend class CvModEventChoiceInfo;

public:
	CvEventChoiceLinkingInfo() :
	  m_bCheckWorld(false),
	  m_bActive(false),
	  m_iEvent(-1),
	  m_iEventChoice(-1),
	  m_iCityEvent(-1),
	  m_iCityEventChoice(-1)
	  {
	  };
	  int GetLinkingEvent() {return m_iEvent;};
	  int GetLinkingEventChoice() {return m_iEventChoice;};
	  int GetCityLinkingEvent() {return m_iCityEvent;};
	  int GetCityLinkingEventChoice() {return m_iCityEventChoice;};
	  bool CheckOtherPlayers() {return m_bCheckWorld;};
	  bool CheckForActive() {return m_bActive;};

protected:
	bool m_bCheckWorld;
	bool m_bActive;
	int m_iEvent;
	int m_iEventChoice;
	int m_iCityEvent;
	int m_iCityEventChoice;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvModEventChoiceInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvModEventChoiceInfo : public CvBaseInfo
{
public:
	CvModEventChoiceInfo();
	virtual ~CvModEventChoiceInfo();

	bool isParentEvent(EventTypes eEvent) const;
	int getEventPolicy() const;
	int getEventBuilding() const;
	int getEventDuration() const;
	bool isEventDurationScaling() const;
	int getEventPromotion() const;
	int getEventTech() const;
	int getEventYield(YieldTypes eYield) const;
	int getPreCheckEventYield(YieldTypes eYield) const;
	int getEventChance() const;
	bool IsEraScaling() const;
	bool Expires() const;
	int getEventResourceChange(ResourceTypes eResource) const;
	int getFlavorValue(int i) const;
	const char* getEventChoiceSoundEffect() const;
	int getNumFreePolicies() const;
	int getNumFreeTechs() const;
	int getNumFreeGreatPeople() const;
	int getGoldenAgeTurns() const;
	int getWLTKD() const;
	int getResistanceTurns() const;
	int getRandomBarbs() const;
	int getNumFreeSpecificUnits(int i) const;
	int getNumFreeUnits(int i) const;
	int getFreeScaledUnits() const;
	int getSpecialistsGreatPersonPointsPerTurn() const;
	int getEventConvertReligion(int i) const;
	int getEventConvertReligionPercent(int i) const;
	int getCityYield(int i) const;
	int getBuildingClassYield(int i, int j) const;
	int getBuildingClassYieldModifier(int i, int j) const;
	int getTerrainYield(int i, int j) const;
	int getFeatureYield(int i, int j) const;
	int getImprovementYield(int i, int j) const;
	int getResourceYield(int i, int j) const;
	int getGlobalSpecialistYieldChange(int i, int j) const;
	int getPlayerHappiness() const;
	int getCityHappinessGlobal() const;
	int getBasicNeedsMedianModifierGlobal() const;
	int getGoldMedianModifierGlobal() const;
	int getScienceMedianModifierGlobal() const;
	int getCultureMedianModifierGlobal() const;
	int getReligiousUnrestModifierGlobal() const;
	const char* getDisabledTooltip() const;
	
	CvEventNotificationInfo *GetNotificationInfo(int i) const;
	int GetNumNotifications() const {return m_iNotificationInfos;};

	// Filters

	int getPrereqTech() const;
	int getObsoleteTech() const;
	int getMinimumNationalPopulation() const;
	int getMinimumNumberCities() const;
	int getUnitTypeRequired() const;
	int getRequiredCiv() const;
	int getRequiredEra() const;
	int getObsoleteEra() const;
	int getYieldMinimum(YieldTypes eYield) const;
	int getRequiredPolicy() const;
	int getRequiredIdeology() const;
	int getRequiredImprovement() const;
	int getRequiredReligion() const;
	bool hasPantheon() const;
	int getBuildingRequired() const;
	int getBuildingLimiter() const;
	bool isRequiresHolyCity() const;
	bool isRequiresIdeology() const;
	bool isRequiresWar() const;
	bool isRequiresWarMinor() const;
	int getResourceRequired(ResourceTypes eResource) const;
	int getFeatureRequired(FeatureTypes eFeature) const;
	int getRequiredStateReligion() const;
	bool hasStateReligion() const;
	bool isUnhappy() const;
	bool isSuperUnhappy() const;
	bool isOneShot() const;
	bool hasMetAnotherCiv() const;
	bool isInDebt() const;
	bool isLosingMoney() const;
	bool isMaster() const;
	bool isVassal() const;
	int getNumCoastalRequired() const;
	bool isCoastalOnly() const;
	bool isTradeCapped() const;
	bool isCapitalEffectOnly() const;
	bool isInstantYieldAllCities() const;
		
	CvEventChoiceLinkingInfo *GetLinkerInfo(int i) const;
	int GetNumLinkers() const {return m_iLinkerInfos;};

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iEventPolicy;
	int m_iEventBuilding;
	int m_iEventPromotion;
	int m_iEventTech;
	int m_iEventDuration;
	bool m_bEventDurationScaling; 
	int m_iEventChance;
	bool* m_pbParentEventIDs;
	bool m_bEraScaling;
	bool m_bExpires;
	int* m_piFlavor;
	int* m_piEventYield;
	int* m_piPreCheckEventYield;
	int* m_piResourceChange;
	int* m_piConvertReligion;
	int* m_piConvertReligionPercent;
	int* m_piCityYield;
	int m_iFreeScaledUnits;
	int m_iSpecialistsGreatPersonPointsPerTurn;
	CvString m_strEventChoiceSoundEffect;
	int m_iNumFreePolicies;
	int m_iNumFreeTechs;
	int m_iNumFreeGreatPeople;
	int m_iNumGoldenAgeTurns;
	int m_iNumWLTKD;
	int m_iResistanceTurns;
	int m_iRandomBarbs;
	int* m_piNumFreeUnits;
	int* m_piNumFreeSpecificUnits;
	int** m_ppiBuildingClassYield;
	int** m_ppiBuildingClassYieldModifier;
	int m_iPlayerHappiness;
	int m_iCityHappinessGlobal;
	int** m_ppiTerrainYield;
	int** m_ppiFeatureYield;
	int** m_ppiImprovementYield;
	int** m_ppiResourceYield;
	int** m_ppiSpecialistYield;
	int m_iBasicNeedsMedianModifierGlobal;
	int m_iGoldMedianModifierGlobal;
	int m_iScienceMedianModifierGlobal;
	int m_iCultureMedianModifierGlobal;
	int m_iReligiousUnrestModifierGlobal;
	CvString m_strDisabledTooltip;
	//Filters

	int m_iPrereqTech;
	int m_iObsoleteTech;
	int m_iMinimumNationalPopulation;
	int m_iMinimumNumberCities;
	int m_iUnitTypeRequired;
	int m_iRequiredCiv;
	int m_iRequiredEra;
	int m_iObsoleteEra;
	int m_iRequiredImprovement;
	int m_iRequiredPolicy;
	int m_iIdeology;
	int m_iRequiredReligion;
	bool m_bRequiredPantheon;
	int m_iBuildingRequired;
	int m_iBuildingLimiter;
	int* m_piMinimumYield;
	bool m_bRequiresHolyCity;
	bool m_bRequiresIdeology;
	bool m_bRequiresWar;
	bool m_bRequiresWarMinor;
	int* m_piRequiredResource;
	int* m_piRequiredFeature;
	int m_iRequiredStateReligion;
	bool m_bHasStateReligion;
	bool m_bUnhappy;
	bool m_bSuperUnhappy;
	bool m_bOneShot;
	bool m_bMetAnotherCiv;
	bool m_bInDebt;
	bool m_bLosingMoney;
	bool m_bVassal;
	bool m_bMaster;
	int m_iCoastal;
	bool m_bCoastalOnly;
	bool m_bTradeCapped;
	bool m_bCapitalEffectOnly;
	bool m_bInstantYieldAllCities;

	CvEventNotificationInfo* m_paNotificationInfo;
	int m_iNotificationInfos;

	CvEventChoiceLinkingInfo* m_paLinkerInfo;
	int m_iLinkerInfos;

private:
	CvModEventChoiceInfo(const CvModEventChoiceInfo&);
	CvModEventChoiceInfo& operator=(const CvModEventChoiceInfo&);
};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCityEventLinkingInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCityEventLinkingInfo
{
	friend class CvModCityEventInfo;

public:
	CvCityEventLinkingInfo() :
	  m_bCheckWorld(false),
	  m_bActive(false),
	  m_bOnlyActiveCity(false),
	  m_iEvent(-1),
	  m_iEventChoice(-1),
	  m_iCityEvent(-1),
	  m_iCityEventChoice(-1)
	  {
	  };
	  int GetLinkingEvent() {return m_iEvent;};
	  int GetLinkingEventChoice() {return m_iEventChoice;};
	  int GetCityLinkingEvent() {return m_iCityEvent;};
	  int GetCityLinkingEventChoice() {return m_iCityEventChoice;};
	  bool CheckOtherPlayers() {return m_bCheckWorld;};
	  bool CheckForActive() {return m_bActive;};
	  bool CheckOnlyActiveCity() {return m_bOnlyActiveCity;};

protected:
	bool m_bCheckWorld;
	bool m_bActive;
	bool m_bOnlyActiveCity;
	int m_iEvent;
	int m_iEventChoice;
	int m_iCityEvent;
	int m_iCityEventChoice;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvModCityEventInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvModCityEventInfo : public CvBaseInfo
{
public:
	CvModCityEventInfo();
	virtual ~CvModCityEventInfo();

	int getEventClass() const;
	bool IgnoresGlobalCooldown() const;
	int getPrereqTech() const;
	int getObsoleteTech() const;
	int getMinimumPopulation() const;
	int getRandomChance() const;
	int getRandomChanceDelta() const;
	int getRequiredCiv() const;
	int getRequiredEra() const;
	int getObsoleteEra() const;
	int getYieldMinimum(YieldTypes eYield) const;
	int getRequiredPolicy() const;
	int getRequiredIdeology() const;
	int getRequiredImprovement() const;
	int getRequiredReligion() const;
	int getNumChoices() const;
	int getBuildingRequired() const;
	int getBuildingLimiter() const;
	int getCooldown() const;
	bool isRequiresHolyCity() const;
	bool isRequiresIdeology() const;
	bool isRequiresWar() const;
	bool isCapital() const;
	bool isCoastal() const;
	bool isRiver() const;
	bool isEraScaling() const;
	bool isRequiresWarMinor() const;
	const char* getSplashArt() const;
	const char* getEventAudio() const;
	int getRequiredStateReligion() const;
	bool hasStateReligion() const;
	bool isUnhappy() const;
	bool isSuperUnhappy() const;
	bool isRequiresGarrison() const;
	int getLocalResourceRequired() const;
	bool isResistance() const;
	bool isWLTKD() const;
	bool isOccupied() const;
	bool isRazing() const;
	bool hasAnyReligion() const;
	bool isPuppet() const;
	bool hasTradeConnection() const;
	bool hasCityConnection() const;
	bool isNearNaturalWonder() const;
	bool isNearMountain() const;
	bool hasPantheon() const;
	int hasNearbyFeature() const;
	int hasNearbyTerrain() const;
	int getMaximumPopulation() const;
	bool isOneShot() const;
	bool hasMetAnotherCiv() const;
	bool isInDebt() const;
	bool isLosingMoney() const;
	bool isMaster() const;
	bool isVassal() const;
	bool hasPlayerReligion() const;
	bool lacksPlayerReligion() const;
	bool hasPlayerMajority() const;
	bool lacksPlayerMajority() const;

	bool isEspionageSetup() const;
	bool IsCounterSpy() const;

	CvCityEventLinkingInfo *GetLinkerInfo(int i) const;
	int GetNumLinkers() const {return m_iCityLinkerInfos;};

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iEventClass;
	bool m_bIgnoresGlobalCooldown;
	int m_iPrereqTech;
	int m_iObsoleteTech;
	int m_iMinimumPopulation;
	int m_iRandomChance;
	int m_iRandomChanceDelta;
	int m_iRequiredCiv;
	int m_iRequiredEra;
	int m_iObsoleteEra;
	int m_iRequiredImprovement;
	int m_iRequiredPolicy;
	int m_iIdeology;
	int m_iRequiredReligion;
	int m_iNumChoices;
	int m_iBuildingRequired;
	int m_iBuildingLimiter;
	int m_iCooldown;
	bool m_bRequiresHolyCity;
	int* m_piMinimumYield;
	bool m_bRequiresIdeology;
	bool m_bRequiresWar;
	bool m_bCapital;
	bool m_bCoastal;
	bool m_bIsRiver;
	bool m_bEraScaling;
	bool m_bRequiresWarMinor;
	CvString m_strSplashArt;
	CvString m_strEventAudio;
	int m_iRequiredStateReligion;
	bool m_bRequiresGarrison;
	bool m_bHasStateReligion;
	bool m_bUnhappy;
	bool m_bSuperUnhappy;
	int m_iLocalResourceRequired;
	bool m_bIsResistance;
	bool m_bIsWLTKD;
	bool m_bIsOccupied;
	bool m_bIsRazing;
	bool m_bHasAnyReligion;
	bool m_bIsPuppet;
	bool m_bTradeConnection;
	bool m_bCityConnection;
	bool m_bNearNaturalWonder;
	bool m_bNearMountain;
	bool m_bPantheon;
	int m_iNearbyFeature;
	int m_iNearbyTerrain;
	int m_iMaximumPopulation;
	bool m_bOneShot;
	bool m_bMetAnotherCiv;
	bool m_bInDebt;
	bool m_bLosingMoney;
	bool m_bVassal;
	bool m_bMaster;
	bool m_bHasPlayerReligion;
	bool m_bLacksPlayerReligion;
	bool m_bHasPlayerMajority;
	bool m_bLacksPlayerMajority;

	bool m_bEspionageSetup;
	bool m_bIsCounterSpy;
	
	CvCityEventLinkingInfo* m_paCityLinkerInfo;
	int m_iCityLinkerInfos;

private:
	CvModCityEventInfo(const CvModCityEventInfo&);
	CvModCityEventInfo& operator=(const CvModCityEventInfo&);
};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCityEventNotificationInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCityEventNotificationInfo
{
	friend class CvModEventCityChoiceInfo;

public:
	CvCityEventNotificationInfo() :
	  m_bNeedCityCoordinates(false),
	  m_iVariable(-1),
	  m_strNotificationType(""),
	  m_strDescription(""),
	  m_strShortDescription(""),
	  m_bWorldEvent(false),
	  m_bEspionageEvent(false),
	  m_bNeedPlayerID(false)
	  {
	  };
	  int GetVariable() {return m_iVariable;};
	  CvString GetDescription() {return m_strDescription;};
	  CvString GetShortDescription() {return m_strShortDescription;};
	  bool IsWorldEvent() {return m_bWorldEvent;};
	  bool IsEspionageEvent() { return m_bEspionageEvent;};
	  bool IsNeedPlayerID() {return m_bNeedPlayerID;};
	  bool IsNeedCityCoordinates() {return m_bNeedCityCoordinates;};
	  CvString GetNotificationString() {return m_strNotificationType;};

protected:
	bool m_bNeedCityCoordinates;
	int m_iVariable;
	CvString m_strNotificationType;
	CvString m_strDescription;
	CvString m_strShortDescription;
	bool m_bWorldEvent;
	bool m_bEspionageEvent;
	bool m_bNeedPlayerID;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvCityEventChoiceLinkingInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvCityEventChoiceLinkingInfo
{
	friend class CvModEventCityChoiceInfo;

public:
	CvCityEventChoiceLinkingInfo() :
	  m_bCheckWorld(false),
	  m_bActive(false),
	  m_bOnlyActiveCity(false),
	  m_iEvent(-1),
	  m_iEventChoice(-1),
	  m_iCityEvent(-1),
	  m_iCityEventChoice(-1)
	  {
	  };
	  int GetLinkingEvent() {return m_iEvent;};
	  int GetLinkingEventChoice() {return m_iEventChoice;};
	  int GetCityLinkingEvent() {return m_iCityEvent;};
	  int GetCityLinkingEventChoice() {return m_iCityEventChoice;};
	  bool CheckOtherPlayers() {return m_bCheckWorld;};
	  bool CheckForActive() {return m_bActive;};
	  bool CheckOnlyActiveCity() {return m_bOnlyActiveCity;};

protected:
	bool m_bCheckWorld;
	bool m_bActive;
	bool m_bOnlyActiveCity;
	int m_iEvent;
	int m_iEventChoice;
	int m_iCityEvent;
	int m_iCityEventChoice;
};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvModEventCityChoiceInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvModEventCityChoiceInfo : public CvBaseInfo
{
public:
	CvModEventCityChoiceInfo();
	virtual ~CvModEventCityChoiceInfo();

	bool isParentEvent(CityEventTypes eCityEvent) const;
	int getEventBuilding() const;
	int getEventBuildingDestruction() const;
	int getEventDuration() const;
	bool isEventDurationScaling() const; 
	int getEventChance() const;
	bool IsEraScaling() const;
	bool Expires() const;
	int getEventYield(YieldTypes eYield) const;
	int getPreCheckEventYield(YieldTypes eYield) const;
	int getEventGPChange(SpecialistTypes eSpecialist) const;
	int getImprovementDestruction(ImprovementTypes eImprovement) const;
	int getBuildingDestructionChance(int i) const;
	int getCityWideDestructionChance() const;
	int getCityStrategicResourcePillage() const;
	int getPillageResourceTilesChance() const;
	int getPillageRoadsChance() const;
	int getPillageFortificationsChance() const;
	int getMutuallyExclusiveGroup() const;
	int getBlockBuildingTurns() const;
	int getFlavorValue(int i) const;
	int getWLTKD() const;
	int getGrowthMod() const;
	int getResistanceTurns() const;
	int getRandomBarbs() const;
	int getRandomBarbsPerEra() const;
	int getFreeScaledUnits() const;
	int getSpecialistsGreatPersonPointsPerTurn() const;
	int getCityHappiness() const;
	int getReligiousPressureModifier() const;
	int getBasicNeedsMedianModifier() const;
	int getGoldMedianModifier() const;
	int getScienceMedianModifier() const;
	int getCultureMedianModifier() const;
	int getReligiousUnrestModifier() const;
	int getNumFreeSpecificUnits(int i) const;
	int getNumFreeUnits(int i) const;
	int getEventConvertReligion(int i) const;
	int getEventConvertReligionPercent(int i) const;
	const char* getEventChoiceSoundEffect() const;
	int getCityYield(int i) const;
	int getCityYieldModifier(int i) const;
	int getYieldSiphon(int i) const;
	int getYieldOnSpyIdentified(int i) const;
	int getYieldOnSpyKilled(int i) const;
	int getBuildingClassYield(int i, int j) const;
	int getBuildingClassYieldModifier(int i, int j) const;
	int getTerrainYield(int i, int j) const;
	int getFeatureYield(int i, int j) const;
	int getImprovementYield(int i, int j) const;
	int getResourceYield(int i, int j) const;
	int getEventResourceChange(ResourceTypes eResource) const;
	int getCitySpecialistYieldChange(int i, int j) const;
	const char* getDisabledTooltip() const;
	const char* getSpyMissionEffect() const;
	int getEventPromotion() const;
	int ConvertsCityToPlayerReligion() const;
	int ConvertsCityToPlayerMajorityReligion() const;

	
	//espionage
	int GetNetworkPointsNeededScaled() const;
	int GetSpyIdentificationChance() const;
	int GetSpyKillChance() const;
	int GetSpyLevelRequired() const;
	int getStealTech() const;
	int getStealGW() const;
	int getSapCityTurns() const;
	int getNoTourismTurns() const;
	int getStealFromTreasuryPercent() const;
	bool isEspionageMission() const;
	bool isEnemyUnhappy() const;
	bool isEnemySuperUnhappy() const;
	// Counterspies
	bool isCounterspyMission() const;
	int getCounterspyNPRateReduction() const;
	bool isCounterspyBlockSapCity() const;
	int getCityDefenseModifierBase() const;
	int getCityDefenseModifier() const;
	EventChoiceTypes GetTriggerPlayerEventChoice() const;

	//Filters
	int getPrereqTech() const;
	int getObsoleteTech() const;
	int getMinimumPopulation() const;
	int getRequiredCiv() const;
	int getRequiredEra() const;
	int getObsoleteEra() const;
	int getYieldMinimum(YieldTypes eYield) const;
	int getRequiredPolicy() const;
	int getRequiredIdeology() const;
	int getRequiredImprovement() const;
	int getRequiredReligion() const;
	int getBuildingRequired() const;
	int getBuildingLimiter() const;
	bool isRequiresHolyCity() const;
	bool isRequiresIdeology() const;
	bool isRequiresWar() const;
	bool isRequiresWarMinor() const;
	bool isCapital() const;
	bool isCoastal() const;
	bool isRiver() const;
	int getRequiredStateReligion() const;
	bool hasStateReligion() const;
	bool isUnhappy() const;
	bool isSuperUnhappy() const;
	bool isRequiresGarrison() const;
	int getLocalResourceRequired() const;
	bool isResistance() const;
	bool isWLTKD() const;
	bool isOccupied() const;
	bool isRazing() const;
	bool hasAnyReligion() const;
	bool isPuppet() const;
	bool isNotPuppet() const;
	bool hasTradeConnection() const;
	bool hasCityConnection() const;
	bool isNearNaturalWonder() const;
	bool isNearMountain() const;
	bool hasPantheon() const;
	int hasNearbyFeature() const;
	int hasNearbyTerrain() const;
	int getMaximumPopulation() const;
	bool isOneShot() const;
	bool hasMetAnotherCiv() const;
	bool isInDebt() const;
	bool isLosingMoney() const;
	bool isMaster() const;
	bool isVassal() const;
	bool hasPlayerReligion() const;
	bool lacksPlayerReligion() const;
	bool hasPlayerMajority() const;
	bool lacksPlayerMajority() const;

	CvCityEventNotificationInfo *GetNotificationInfo(int i) const;
	int GetNumNotifications() const {return m_iCityNotificationInfos;};

	CvCityEventChoiceLinkingInfo *GetLinkerInfo(int i) const;
	int GetNumLinkers() const {return m_iCityLinkerInfos;};

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

protected:
	int m_iEventBuilding;
	int m_iEventBuildingDestruction;
	int m_iEventDuration;
	bool m_bEventDurationScaling; 
	int m_iEventChance;
	bool m_bEraScaling;
	bool m_bExpires;
	int m_iEventPromotion;
	int* m_piDestroyImprovement;
	int* m_piEventYield;
	int* m_piPreCheckEventYield;
	int* m_piFlavor;
	int* m_piGPChange;
	int m_iNumWLTKD;
	int m_iGrowthMod;
	int m_iResistanceTurns;
	int m_iRandomBarbs;
	int m_iRandomBarbsPerEra;
	int m_iFreeScaledUnits;
	int m_iSpecialistsGreatPersonPointsPerTurn;
	int* m_piBuildingDestructionChance;
	int* m_piNumFreeUnits;
	int* m_piNumFreeSpecificUnits;
	int* m_piConvertReligion;
	int* m_piConvertReligionPercent;
	int m_iLocalResourceRequired;
	CvString m_strEventChoiceSoundEffect;
	int* m_piCityYield;
	int* m_piCityYieldModifier;
	int** m_ppiBuildingClassYield;
	int** m_ppiBuildingClassYieldModifier;
	int** m_ppiTerrainYield;
	int** m_ppiFeatureYield;
	int ** m_ppiSpecialistYield;
	int** m_ppiImprovementYield;
	int** m_ppiResourceYield;
	bool* m_pbParentEventIDs;
	int m_iCityWideDestructionChance;
	int m_iCityStrategicResourcePillage;
	int m_iPillageResourceTilesChance;
	int m_iPillageRoadsChance;
	int m_iPillageFortificationsChance;
	int m_iMutuallyExclusiveGroup;
	int m_iBlockBuildingTurns;
	int m_iCityHappiness;
	int m_iReligiousPressureModifier;
	int m_iBasicNeedsMedianModifier;
	int m_iGoldMedianModifier;
	int m_iScienceMedianModifier;
	int m_iCultureMedianModifier;
	int m_iReligiousUnrestModifier;
	int* m_piResourceChange;
	int* m_piYieldSiphon;
	int* m_piYieldOnSpyIdentified;
	int* m_piYieldOnSpyKilled;
	CvString m_strDisabledTooltip;
	CvString m_strSpyMissionEffect;
	int m_iConvertsCityToPlayerReligion;
	int m_iConvertsCityToPlayerMajorityReligion;
	int m_iTriggerPlayerEventChoice;

	// Espionage
	int m_iNetworkPointsNeeded;
	int m_bNetworkPointsScaling; 
	int m_iSpyIdentificationChance;
	int m_iSpyKillChance;
	int m_iSpyLevelRequired;
	bool m_bIsEspionageMission;
	int m_iStealTech;
	int m_iStealGW;
	int m_iSapCityTurns;
	int m_iNoTourismTurns;
	int m_iStealFromTreasuryPercent;
	// Counterspies
	bool m_bIsCounterspyMission;
	int m_iCounterspyNPRateReduction;
	bool m_bCounterspyBlockSapCity;
	int m_iCityDefenseModifierBase;
	int m_iCityDefenseModifier;

	//Filters
	int m_iPrereqTech;
	int m_iObsoleteTech;
	int m_iMinimumPopulation;
	int m_iRequiredCiv;
	int m_iRequiredEra;
	int m_iObsoleteEra;
	int m_iRequiredImprovement;
	int m_iRequiredPolicy;
	int m_iIdeology;
	int m_iRequiredReligion;
	int m_iBuildingRequired;
	int m_iBuildingLimiter;
	bool m_bRequiresHolyCity;
	int* m_piMinimumYield;
	bool m_bRequiresIdeology;
	bool m_bRequiresWar;
	bool m_bCapital;
	bool m_bCoastal;
	bool m_bIsRiver;
	bool m_bRequiresWarMinor;
	int m_iRequiredStateReligion;
	bool m_bRequiresGarrison;
	bool m_bHasStateReligion;
	bool m_bUnhappy;
	bool m_bSuperUnhappy;
	bool m_bEnemyUnhappy;
	bool m_bEnemySuperUnhappy;
	bool m_bIsResistance;
	bool m_bIsWLTKD;
	bool m_bIsOccupied;
	bool m_bIsRazing;
	bool m_bHasAnyReligion;
	bool m_bIsPuppet;
	bool m_bIsNotPuppet;
	bool m_bTradeConnection;
	bool m_bCityConnection;
	bool m_bNearNaturalWonder;
	bool m_bNearMountain;
	bool m_bPantheon;
	int m_iNearbyFeature;
	int m_iNearbyTerrain;
	int m_iMaximumPopulation;
	bool m_bOneShot;
	bool m_bMetAnotherCiv;
	bool m_bInDebt;
	bool m_bLosingMoney;
	bool m_bVassal;
	bool m_bMaster;
	bool m_bHasPlayerReligion;
	bool m_bLacksPlayerReligion;
	bool m_bHasPlayerMajority;
	bool m_bLacksPlayerMajority;

	CvCityEventNotificationInfo* m_paCityNotificationInfo;
	int m_iCityNotificationInfos;
	CvCityEventChoiceLinkingInfo* m_paCityLinkerInfo;
	int m_iCityLinkerInfos;

private:
	CvModEventCityChoiceInfo(const CvModEventCityChoiceInfo&);
	CvModEventCityChoiceInfo& operator=(const CvModEventCityChoiceInfo&);
};

#endif

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  class : CvDomainInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
typedef CvBaseInfo CvDomainInfo;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Helper Functions to serialize arrays of variable length (based on number of features defined in game)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
namespace FeatureArrayHelpers
{
void Read(FDataStream& kStream, int* paiFeatureArray);
void Write(FDataStream& kStream, int* paiFeatureArray, int iArraySize);
void ReadYieldArray(FDataStream& kStream, int** ppaaiFeatureYieldArray, int iNumYields);
void WriteYieldArray(FDataStream& kStream, int** ppaaiFeatureYieldArray, int iArraySize);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Helper Functions to serialize arrays of variable length (based on number of terrains defined in game)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
namespace TerrainArrayHelpers
{
void Read(FDataStream& kStream, int* paiTerrainArray);
void Write(FDataStream& kStream, int* paiTerrainArray, int iArraySize);
void ReadYieldArray(FDataStream& kStream, int** ppaaiTerrainYieldArray, int iNumYields);
void WriteYieldArray(FDataStream& kStream, int** ppaaiTerrainYieldArray, int iArraySize);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  struct : PolicyResourceInfo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
struct PolicyResourceInfo
{
	PolicyTypes ePolicy = NO_POLICY;
	ResourceTypes eResource = NO_RESOURCE;
	int iQuantity = 0;

	// optional conditions
	bool bMustCoastal = false;
	CityScaleTypes eCityScale = NO_CITY_SCALE;
};
inline FDataStream& operator<<(FDataStream& os, const PolicyResourceInfo& kResourceInfo)
{
	os << (int)kResourceInfo.ePolicy;
	os << (int)kResourceInfo.eResource;
	os << kResourceInfo.iQuantity;
	os << kResourceInfo.bMustCoastal;
	os << (int)kResourceInfo.eCityScale;
	return os;
}
inline FDataStream& operator>>(FDataStream& is, PolicyResourceInfo& kResourceInfo)
{
	is >> (int&)kResourceInfo.ePolicy;
	is >> (int&)kResourceInfo.eResource;
	is >> kResourceInfo.iQuantity;
	is >> kResourceInfo.bMustCoastal;
	is >> (int&)kResourceInfo.eCityScale;
	return is;
}

#endif