alter table Policies add CapitalTradeRouteGoldChange integer default 0;
alter table Policies add CapitalTradeRouteRangeChange integer default 0;
alter table Policies add InstantFoodThresholdPercent integer default 0;
alter table Policies add NationalWonderCityCostModifier integer default 0;
alter table Policies add GlobalHappinessFromFaithPercent integer default 0;
alter table Policies add HappinessPerReligionInCity integer default 0;
alter table Policies add MinorBullyInfluenceLossModifier integer default 0;
alter table Policies add MinorLocalBullyScoreModifier integer default 0;
alter table Policies add MinorAllyBullyScoreModifier integer default 0;
alter table Policies add HappinessInWLTKDCities integer default 0;
alter table Policies add WaterBuildSpeedModifier integer default 0;
alter table Policies add DeepWaterNavalStrengthCultureModifier integer default 0;

alter table Policies add IdeologyPressureModifier integer default 0;
alter table Policies add IdeologyUnhappinessModifier integer default 0;
alter table Policies add DifferentIdeologyTourismModifier integer default 0;
alter table Policies add SpyLevelUpWhenRigging boolean default 0;
alter table Policies add NullifyInfluenceModifier boolean default 0;
alter table Policies add DiplomatPropagandaModifier integer default 0;

alter table Policies add NoResistance boolean default 0;
alter table Policies add FreePromotionRemoved text references UnitPromotions(Type);
-- SP-TODO: Column Name RemoveCurrentPromotion -> CurrentPromotionRemoved
alter table Policies add CurrentPromotionRemoved text references UnitPromotions(Type);
alter table Policies add RemoveOceanImpassableCombatUnit boolean default 0;

alter table Policies add SettlerPopConsume integer default 0;
alter table Policies add ScienceModifierFromRANum integer default 0;
alter table Policies add CityExtraProductionCount integer default 0;
alter table Policies add NoOccupiedUnhappinessGarrisonedCity boolean default 0;
alter table Policies add CaptureCityResistanceTurnsChangeFormula text references LuaFormula(Type);

-- SP-TODO: Column Name GreatScientistBeakerPolicyModifier -> ScienceBeakerMod
alter table Policies add ScienceBeakerMod integer default 0;
alter table Policies add ProductionBeakerMod integer default 0;
alter table Policies add OriginalCapitalCaptureTech integer default 0;
alter table Policies add OriginalCapitalCapturePolicy integer default 0;
alter table Policies add OriginalCapitalCaptureGreatPerson integer default 0;
alter table Policies add ReligionProductionModifier integer default 0;
alter table Policies add UpgradeAllTerritory boolean default 0;
alter table Policies add WLTKDFromGoldenAgeLengthModifier integer default 0;
-- SP-TODO: Column Name AlwaysWeLoveKindDayInGoldenAge -> AlwaysWLTKDInGoldenAge
alter table Policies add AlwaysWLTKDInGoldenAge boolean default 0;

create table Policy_EraSettlerProductionModifier (
    PolicyType text references Policies(Type),
    EraType text references Eras(Type),
    Modifier integer default 0
);

create table Policy_BuildSpeedModifier (
    PolicyType text references Policies(Type),
    BuildType text references Builds(Type),
    Modifier integer default 0
);

-- only Culture, Tourism, GoldenAge in CP
create table Policy_GreatPersonOutputModifierPerGWs (
    PolicyType text references Policies(Type),
    GreatPersonType text references GreatPersons(Type),
    Modifier integer default 0
);

create table Policy_MinorsTradeRouteYieldRate (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Rate integer default 0
);

create table Policy_InternalTradeRouteDestYieldRate (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Rate integer default 0
);

create table Policy_CityWithWorldWonderYieldModifier (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Policy_TradeRouteCityYieldModifier (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Policy_CityNumberCityYieldModifier (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Policy_YieldModifierPerArtifacts (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

-- SP-TODO: Column Name Policy_YieldPerPopChanges -> Policy_YieldPerPopChangesTimes100
create table Policy_YieldPerPopChangesTimes100 (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Policy_HappinessYieldModifier (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    YieldFormula text references LuaFormula(Type)
);

create table PolicyBranch_CivilizationLocked (
    PolicyBranchType text references PolicyBranchTypes(Type),
    CivilizationType text references Civilizations(Type)
);

-- Deprecated
alter table Policies add Dummy integer default 0; -- Use IsDummy
alter table Policies add InstantFoodKeptPercent integer default 0; -- No FoodKept in CP
alter table Policies add HappinessPerPolicy integer default 0; -- Use HappinessPerXPolicies
alter table Policies add NumTradeRouteBonus integer default 0; -- Use FreeTradeRoute
alter table Policies add RiggingElectionInfluenceModifier integer default 0; -- Use RigElectionInfluenceModifier
alter table Policies add ExtraSpies integer default 0; -- Use FreeSpy
alter table Policies add TourismModifierPerGPCreation boolean default 0; -- Too specialized
alter table Policies add SettlerProductionEraModifier integer default 0; -- Use Policy_EraSettlerProductionModifier
alter table Policies add SettlerProductionStartEra text references Eras(Type); -- Use Policy_EraSettlerProductionModifier
alter table Policies add FreeBuildingClass text references BuildingClasses(Type); -- Use AllCityFreeBuilding
create table Policy_CityLoveKingDayYieldMod ( -- Use Policy_WLTKDYieldMod
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Modifier integer default 0
);