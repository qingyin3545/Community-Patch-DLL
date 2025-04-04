/*	-------------------------------------------------------------------------------------------------------
	© 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#pragma once

#ifndef CIV5_UNIT_CLASSES_H
#define CIV5_UNIT_CLASSES_H

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  CLASS:      CvUnitEntry
//!  \brief		A single entry from the UnitInfo XML file
//
//!  Key Attributes:
//!  - Used to be called CvUnitInfo
//!  - Populated from XML\GameInfo\CIV5UnitInfos.xml
//!  - Array of these contained in CvUnitXMLEntries class
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvUnitEntry: public CvBaseInfo
{
public:
	CvUnitEntry(void);
	virtual ~CvUnitEntry(void);

	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);

	// Accessor Functions (Non-Arrays)
	int GetProductionCost() const;
	int GetFaithCost() const;
	bool IsRequiresFaithPurchaseEnabled() const;
#if defined(MOD_GLOBAL_EXCLUDE_FROM_GIFTS)
	bool IsNoMinorGifts() const;
#endif
	bool IsPurchaseOnly() const;
	bool CanMoveAfterPurchase() const;
#if defined(MOD_GLOBAL_MOVE_AFTER_UPGRADE)
	bool CanMoveAfterUpgrade() const;
#endif
#if defined(MOD_GLOBAL_CANNOT_EMBARK)
	bool CannotEmbark() const;
#endif
	int GetHurryCostModifier() const;
	int GetMinAreaSize() const;
	int GetMoves() const;
	bool IsImmobile() const;
	int GetBaseSightRange() const;
	int GetRange() const;
	int GetAirInterceptRange() const;
	int GetBaseLandAirDefense() const;
	int GetAirUnitCap() const;
	int GetNukeDamageLevel() const;
	int GetWorkRate() const;
	int GetNumFreeTechs() const;
	int GetBaseBeakersTurnsToCount() const;
	int GetBaseCultureTurnsToCount() const;
	int GetBaseGoldTurnsToCount() const;
	int GetBaseProductionTurnsToCount() const;
	int GetBaseTurnsForGAPToCount() const;
	int GetBaseWLTKDTurns() const;
	int GetBaseHurry() const;
	int GetHurryMultiplier() const;
	bool IsRushBuilding() const;
	int GetBaseGold() const;
	int GetScaleFromNumGWs() const;
	int GetScaleFromNumThemes() const;
	int GetNumGoldPerEra() const;
	int GetNumInfPerEra() const;
	int GetRestingPointChange() const;
	int GetProductionCostPerEra() const;
#if defined(MOD_BALANCE_CORE)
	int GetNumFreeLux() const;
	int GetBeliefUnlock() const;
	bool IsFreeUpgrade() const;
#endif
	bool IsSpreadReligion() const;
	int GetReligionSpreads() const;
	int GetReligiousStrength() const;
	bool IsFoundReligion() const;
	bool IsRequiresEnhancedReligion() const;
	bool IsProhibitsSpread() const;
	bool IsRemoveHeresy() const;
#if defined(MOD_CIV6_WORKER)
	int GetBuilderStrength() const;
#endif
	bool IsCanBuyCityState() const;
#if defined(MOD_GLOBAL_SEPARATE_GREAT_ADMIRAL)
	bool IsCanRepairFleet() const;
	bool IsCanChangePort() const;
#endif
	int GetCombat() const;
#if defined(MOD_GLOBAL_STACKING_RULES)
	int StackCombat() const;
#endif
#if defined(MOD_CARGO_SHIPS)
	int CargoCombat() const;
	int GetSpecialUnitCargoLoad() const;
#endif
	void SetCombat(int iNum);
	int GetRangedCombat() const;
	bool IsNoSupply() const;
	int GetMaxHitPoints() const;
	int GetSpecialCargo() const;
	int GetDomainCargo() const;

	int GetExtraMaintenanceCost() const;
	bool IsNoMaintenance() const;
	int GetUnhappiness() const;
	int GetUnitClassType() const;
	int GetSpecialUnitType() const;
	int GetUnitCaptureClassType() const;
	int GetUnitCombatType() const;
#if defined(MOD_GLOBAL_PROMOTION_CLASSES)
	int GetUnitPromotionType() const;
#endif
#if defined(MOD_EVENTS_CAN_MOVE_INTO)
	bool IsSendCanMoveIntoEvent() const;
#endif
	inline DomainTypes GetDomainType() const { return (DomainTypes)m_iDomainType; } //this is used very often
	int GetCivilianAttackPriority() const;
	UnitAITypes GetDefaultUnitAIType() const;
	int GetPrereqPillageTech() const;
	int GetPrereqAndTech() const;
	int GetObsoleteTech() const;
#if defined(MOD_BALANCE_CORE)
	int GetEra() const;
	int GetCostScalerNumberBuilt() const;
#endif
	int GetPolicyType() const;
	int GetGoodyHutUpgradeUnitClass() const;
	int GetGroupSize() const;			// the initial number of individuals in the unit group
	int GetGroupDefinitions() const;	// the number of UnitMeshGroups for this unit
	int GetMeleeWaveSize() const;
	int GetRangedWaveSize() const;
	int GetNumUnitNames() const;
	int GetCommandType() const;
	void SetCommandType(int iNewType);

	bool IsFoodProduction() const;
	bool IsNoBadGoodies() const;
	bool IsRivalTerritory() const;
	bool IsMilitarySupport() const;
	bool IsMilitaryProduction() const;
	bool IsPillage() const;
	bool IsFound() const;
	bool IsFoundAbroad() const;
#if defined(MOD_BALANCE_CORE_SETTLER_ADVANCED)
	bool IsFoundMid() const;
	bool IsFoundLate() const;
	int GetNumColonyFound() const;
	bool IsCityAttackSupport() const;
#endif
#if defined(MOD_BALANCE_CORE)
	int IsGPExtra() const;
	int GetGoodyModifier() const;
	int GetSupplyCapBoost() const;
#endif
	int GetCultureBombRadius() const;
	int GetNumberOfCultureBombs() const;
	int GetGoldenAgeTurns() const;
	int GetFreePolicies() const;
	int GetOneShotTourism() const;
	int GetOneShotTourismPercentOthers() const;
	int GetTourismBonusTurns() const;
	bool IsIgnoreBuildingDefense() const;
	bool IsPrereqResources() const;
	bool IsSuicide() const;
	bool IsCaptureWhileEmbarked() const;
	bool IsRangeAttackOnlyInDomain() const;
	bool IsTrade() const;
	int GetNumExoticGoods() const;

	float GetUnitMaxSpeed() const;
	float GetUnitPadTime() const;

	int GetProjectPrereq() const;
	int GetSpaceshipProject() const;

	int GetLeaderPromotion() const;
	int GetLeaderExperience() const;

	const char* GetUnitArtInfoTag() const;
	const bool GetUnitArtInfoCulturalVariation() const;
	const bool GetUnitArtInfoEraVariation() const;
	int GetUnitFlagIconOffset() const;
	int GetUnitPortraitOffset() const;

	const char* GetUnitNames(int i) const;
	GreatWorkType GetGreatWorks(int i) const;
	bool IsGreatWorkUnit() const;

#if defined(MOD_GLOBAL_STACKING_RULES)
	int GetNumberStackingUnits() const;
#endif

#if defined(MOD_BALANCE_CORE)
	EraTypes GetGreatPersonEra(int i) const;
	int GetResourceType() const;
	bool IsPuppetPurchaseOverride() const;
	bool IsMinorCivGift() const;
	bool IsInvalidMinorCivGift() const;
	int GetCooldown() const;
	int GetGlobalFaithCooldown() const;
	int GetLocalFaithCooldown() const;
	PromotionTypes GetFriendlyLandsPromotion() const;
	bool IsMounted() const;
	bool IsCultureFromExperienceDisbandUpgrade() const;
	bool IsUnitEraUpgrade() const;
	bool IsWarOnly() const;
	bool IsWLTKDFromBirth() const;
	bool IsGoldenAgeFromBirth() const;
	bool IsCultureBoost() const;
	bool IsExtraAttackHealthOnKill() const;
	bool IsHighSeaRaider() const;
#endif
	// Accessor Functions (Arrays)
	int GetPrereqAndTechs(int i) const;
	int GetResourceQuantityRequirement(int i) const;
	int GetResourceQuantityExpended(int i) const;
	int GetBuildingProductionModifier(BuildingTypes eBuilding) const;
	int GetYieldOnBountyToKiller(YieldTypes eYield) const;
	int GetYieldFromKills(YieldTypes eYield) const;
	int GetYieldFromBarbarianKills(YieldTypes eYield) const;
	int GetYieldOnCompletion(YieldTypes eYield) const;
	int GetProductionTraits(int i) const;
	int GetFlavorValue(int i) const;
	bool GetUpgradeUnitClass(int i) const;
	bool GetUnitAIType(int i) const;
	bool GetNotUnitAIType(int i) const;
	bool GetBuilds(int i) const;
	bool GetGreatPeoples(int i) const;
	bool GetBuildings(int i) const;
	bool GetBuildingClassRequireds(int i) const;
	int GetScalingFromOwnedImprovements(int i) const;
#if defined(MOD_BALANCE_CORE)
	bool GetBuildOnFound(int i) const;
	bool GetBuildingClassPurchaseRequireds(int i) const;
	int GetEraCombatStrength(int i) const;
	int GetUnitNewEraCombatType(int i, int j) const;
	int* GetUnitNewEraCombatTypeChangesArray(int i);
	int GetUnitNewEraPromotions(int i, int j) const;
	int* GetUnitNewEraPromotionsChangesArray(int i);
#endif

	int GetResourceQuantityTotal(int i) const;

	bool GetFreePromotions(int i) const;

	// Derived fields (not in XML)
	int GetCargoSpace() const;  // (from free promotions)
	int GetPower() const;
	void DoUpdatePower();

	UnitMoveRate GetMoveRate(int numHexes) const;

#if defined(MOD_TROOPS_AND_CROPS_FOR_SP)
	bool IsNoTroops() const;
	bool IsCannotBeEstablishedCorps() const;
#endif
#if defined(MOD_NUCLEAR_WINTER_FOR_SP)
	int GetNuclearWinterProcess() const;
#endif
	int GetBoundLandImprovement() const;
	int GetBoundWaterImprovement() const;

	int GetCombatStrengthChangeAfterKilling() const;
	int GetRangedCombatStrengthChangeAfterKilling() const;

private:

	int m_iProductionCost;
	int m_iFaithCost;
	bool m_bRequiresFaithPurchaseEnabled;
#if defined(MOD_GLOBAL_EXCLUDE_FROM_GIFTS)
	bool m_bNoMinorGifts;
#endif
	bool m_bPurchaseOnly;
	bool m_bMoveAfterPurchase;
#if defined(MOD_GLOBAL_MOVE_AFTER_UPGRADE)
	bool m_bMoveAfterUpgrade;
#endif
#if defined(MOD_GLOBAL_CANNOT_EMBARK)
	bool m_bCannotEmbark;
#endif
	int m_iHurryCostModifier;
	int m_iMinAreaSize;
	int m_iMoves;
	bool m_bImmobile; //may still have moves>0 for attacks?
	int m_iBaseSightRange;
	int m_iRange;
	int m_iAirInterceptRange;
	int m_iBaseLandAirDefense;
	int m_iAirUnitCap;
	int m_iNukeDamageLevel;
	int m_iWorkRate;
	int m_iNumFreeTechs;
	int m_iBaseBeakersTurnsToCount;
	int m_iBaseCultureTurnsToCount;
	int m_iBaseGoldTurnsToCount;
	int m_iBaseProductionTurnsToCount;
	int m_iBaseTurnsForGAPToCount;
	int m_iBaseWLTKDTurns;
	int m_iBaseHurry;
	int m_iHurryMultiplier;
	bool m_bRushBuilding;
	int m_iBaseGold;
	int m_iScaleFromNumGWs;
	int m_iScaleFromNumThemes;
	int m_iNumGoldPerEra;
	int m_iNumInfPerEra;
	int m_iRestingPointChange;
	int m_iProductionCostPerEra;
#if defined(MOD_BALANCE_CORE)
	int m_iNumFreeLux;
	bool m_bFreeUpgrade;
#endif
	bool m_bSpreadReligion;
	int m_iReligionSpreads;
	int m_iReligiousStrength;
	bool m_bFoundReligion;
	bool m_bRequiresEnhancedReligion;
	bool m_bProhibitsSpread;
	bool m_bRemoveHeresy;
#if defined(MOD_CIV6_WORKER)
	int m_iBuilderStrength;
#endif
	bool m_bCanBuyCityState;
#if defined(MOD_GLOBAL_SEPARATE_GREAT_ADMIRAL)
	bool m_bCanRepairFleet;
	bool m_bCanChangePort;
#endif
	int m_iCombat;
#if defined(MOD_GLOBAL_STACKING_RULES)
	int m_iStackCombat;
#endif
#if defined(MOD_CARGO_SHIPS)
	int m_iCargoCombat;
	int m_iSpecialUnitCargoLoad;
#endif
	int m_iRangedCombat;
	bool m_bNoSupply;
	int m_iMaxHitPoints;
	int m_iSpecialCargo;

	int m_iDomainCargo;
	int m_iExtraMaintenanceCost;
	bool m_bNoMaintenance;
	int m_iUnhappiness;
	int m_iUnitClassType;
	int m_iSpecialUnitType;
	int m_iUnitCaptureClassType;
	int m_iUnitCombatType;
#if defined(MOD_GLOBAL_PROMOTION_CLASSES)
	int m_iUnitPromotionType;
#endif
#if defined(MOD_EVENTS_CAN_MOVE_INTO)
	bool m_bSendCanMoveIntoEvent;
#endif
	int m_iDomainType;
	int m_iCivilianAttackPriority;
	int m_iDefaultUnitAIType;
	int m_iPrereqPillageTech;
	int m_iPrereqAndTech;
	int m_iObsoleteTech;
	int m_iPolicyType;
	int m_iGoodyHutUpgradeUnitClass;
	int m_iGroupSize;
	int m_iGroupDefinitions;
	int m_iUnitMeleeWaveSize;
	int m_iUnitRangedWaveSize;
	int m_iNumUnitNames;
	int m_iCommandType;
	int m_iLeaderExperience;

	bool m_bFoodProduction;
	bool m_bNoBadGoodies;
	bool m_bRivalTerritory;
	bool m_bMilitarySupport;
	bool m_bMilitaryProduction;
	bool m_bPillage;
	bool m_bFound;
	bool m_bFoundAbroad;
#if defined(MOD_BALANCE_CORE)
	bool m_bFoundMid;
	bool m_bFoundLate;
	int m_iFoundColony;
	bool m_bIsCityAttackSupport;
	int m_iGPExtra;
	int m_iGoodyModifier;
	int m_iSupplyCapBoost;
#endif
#if defined(MOD_BALANCE_CORE)
	int m_iResourceType;
	int m_iCostScalerNumBuilt;
	bool m_bPuppetPurchaseOverride;
	bool m_bMinorCivGift;
	bool m_bNoMinorCivGift;
	bool m_bIsMounted;
	int m_iCooldown;
	int m_iGlobalFaithCooldown;
	int m_iLocalFaithCooldown;
	int m_iFriendlyLandsPromotion;
	int m_iBeliefUnlock;
	bool m_bCultureFromExperienceOnDisband;
	bool m_bIsConvertUnit;
	bool m_bUnitEraUpgrade;
	bool m_bWarOnly;
	bool m_bWLTKD;
	bool m_bGoldenAge;
	bool m_bCultureBoost;
	bool m_bExtraAttackHealthOnKill;
	bool m_bHighSeaRaider;
#endif
	int m_iCultureBombRadius;
	int m_iNumberOfCultureBombs;
	int m_iGoldenAgeTurns;
	int m_iFreePolicies;
	int m_iOneShotTourism;
	int m_iOneShotTourismPercentOthers;
	int m_iTourismBonusTurns;
	bool m_bIgnoreBuildingDefense;
	bool m_bPrereqResources;
	bool m_bSuicide;
	bool m_bCaptureWhileEmbarked;
	bool m_bRangeAttackOnlyInDomain;
	int m_iProjectPrereq;
	int m_iSpaceshipProject;
	int m_iLeaderPromotion;
	bool m_bTrade;
	int m_iNumExoticGoods;

#if defined(MOD_GLOBAL_STACKING_RULES)
	int m_iNumberStackingUnits;
#endif

	// This is not loaded from XML, but cached so we don't have to recalculate every time
	int m_iCachedPower;

	int m_iUnitFlagIconOffset;
	int m_iUnitPortraitOffset;

	CvString m_strUnitArtInfoTag;
	bool m_bUnitArtInfoCulturalVariation;
	bool m_bUnitArtInfoEraVariation;

	UnitMoveRate m_unitMoveRate[12];

	// Arrays
	int* m_piPrereqAndTechs;
	int* m_piResourceQuantityRequirements;
	int* m_piResourceQuantityExpended;
	int* m_piProductionTraits;
	int* m_piFlavorValue;
	int* m_piProductionModifierBuildings;
	int* m_piYieldOnBountyToKiller;
	int* m_piYieldFromKills;
	int* m_piYieldFromBarbarianKills;
	int* m_piYieldOnCompletion;

	bool* m_pbUpgradeUnitClass;
	bool* m_pbUnitAIType;
	bool* m_pbNotUnitAIType;
	bool* m_pbBuilds;
	bool* m_pbGreatPeoples;
	bool* m_pbBuildings;
	bool* m_pbBuildingClassRequireds;
#if defined(MOD_BALANCE_CORE)
	int* m_piScalingFromOwnedImprovements;
	bool* m_pbBuildOnFound;
	bool* m_pbBuildingClassPurchaseRequireds;
	int* m_piEraCombatStrength;
	int** m_ppiEraUnitCombatType;
	int** m_ppiEraUnitPromotions;
#endif

	std::map<int, int> m_piResourceQuantityTotals;

	bool* m_pbFreePromotions;

	CvString* m_paszEarlyArtDefineTags;
	CvString* m_paszLateArtDefineTags;
	CvString* m_paszMiddleArtDefineTags;
	CvString* m_paszUnitNames;
	GreatWorkType* m_paeGreatWorks;
#if defined(MOD_BALANCE_CORE)
	EraTypes* m_paeGreatPersonEra;
#endif

#if defined(MOD_TROOPS_AND_CROPS_FOR_SP)
	bool m_bNoTroops = false;
	bool m_bCannotBeEstablishedCorps = false;
#endif
#if defined(MOD_NUCLEAR_WINTER_FOR_SP)
	int m_iNuclearWinterProcess = 0;
#endif
	int m_iBoundLandImprovement = NO_IMPROVEMENT;
	int m_iBoundWaterImprovement = NO_IMPROVEMENT;

	int m_iCombatStrengthChangeAfterKilling = 0;
	int m_iRangedCombatStrengthChangeAfterKilling = 0;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  CLASS:      CvUnitXMLEntries
//!  \brief		Game-wide information about units
//
//! Key Attributes:
//! - Plan is it will be contained in CvGameRules object within CvGame class
//! - Populated from XML\GameInfo\CIV5UnitInfos.xml
//! - Contains an array of CvUnitEntry from the above XML file
//! - One instance for the entire game
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvUnitXMLEntries
{
public:
	CvUnitXMLEntries(void);
	~CvUnitXMLEntries(void);

	// Accessor functions
	std::vector<CvUnitEntry*>& GetUnitEntries();
	int GetNumUnits();
	_Ret_maybenull_ CvUnitEntry* GetEntry(int index);

	void DeleteArray();

private:
	std::vector<CvUnitEntry*> m_paUnitEntries;
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Helper Functions to serialize arrays of variable length (based on number of units defined in game)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
namespace UnitArrayHelpers
{
void Read(FDataStream& kStream, int* paiUnitArray);
void Write(FDataStream& kStream, int* paiUnitArray, int iArraySize);
}

#endif //CIV5_UNIT_CLASSES_H