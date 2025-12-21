--******************** New Yield Bonus ********************--
alter table Traits add TradeRouteLandGoldBonus integer default 0;
alter table Traits add TradeRouteSeaGoldBonus integer default 0;
alter table Traits add GreatWorksTourism integer default 0;
alter table Traits add ShareAllyResearchPercent integer default 0;
alter table Traits add CultureBonusUnitStrengthModify integer default 0;
alter table Traits add OthersTradeBonusModifier integer default 0;
create table Trait_SeaTradeRouteYieldTimes100 (
	TraitType text references Traits(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Trait_SeaTradeRouteYieldPerEraTimes100 (
	TraitType text references Traits(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Trait_RiverPlotYieldChanges (
	TraitType text references Traits(Type),
	YieldType text not null references Yields(Type),
	Yield integer default 0
);
create table Trait_EraMountainCityYieldChanges (
    TraitType text references Traits(Type),
    EraType text references Eras(Type),
    YieldType text references Yields(Type),
    Yield integer not null
);
create table Trait_EraCoastCityYieldChanges (
    TraitType text references Traits(Type),
    EraType text references Eras(Type),
    YieldType text references Yields(Type),
    Yield integer not null
);
create table Trait_CityYieldPerAdjacentFeature (
    TraitType text references Traits(Type),
    FeatureType text references Features(Type),
    YieldType text references Yields(Type),
    MaxValue integer default 0
);
create table Trait_CityYieldModifierFromAdjacentFeature (
    TraitType text references Traits(Type),
    FeatureType text references Features(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
create table Trait_PerMajorReligionFollowerYieldModifier (
    TraitType text references Traits(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
create table Trait_PerMajorReligionFollowerYieldModifierTimes100 (
    TraitType text references Traits(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
create table Trait_PerMajorReligionFollowerYieldModifierMax (
    TraitType text references Traits(Type),
    YieldType text references Yields(Type),
    Max integer default 0
);
--******************** New Unit/Combat Bonus ********************--
alter table Traits add TrainedAll boolean default 0;
alter table Traits add NoDoDeficit boolean default 0;
alter table Traits add FreeGreatPeoplePerEra integer default 0;
alter table Traits add OwnedReligionUnitCultureExtraTurns integer default 0;
alter table Traits add InfluenceFromGreatPeopleBirth integer default 0;
alter table Traits add GoodyUnitUpgradeFirst boolean default 0;

alter table Traits add UnitMaxHitPointChangePerRazedCityPop integer default 0;
alter table Traits add UnitMaxHitPointChangePerRazedCityPopLimit integer default 0;

alter table Traits add AllyCityStateCombatModifier integer default 0;
alter table Traits add AllyCityStateCombatModifierMax integer default -1;
alter table Traits add AttackBonusAdjacentWhenUnitKilled integer default 0;
alter table Traits add KilledAttackBonusDecreasePerTurn integer default 0;
alter table Traits add AwayFromCapitalCombatModifier integer default 0;
alter table Traits add AwayFromCapitalCombatModifierMax integer default 0;

alter table Traits add PromotionWhenKilledUnit text references UnitPromotions(Type);
alter table Traits add PromotionRadiusWhenKilledUnit integer default 0;
alter table Traits add CiviliansFreePromotion text references UnitPromotions(Type);
create table Trait_FreePromotionUnitClasses(
    TraitType text references Traits(Type), 
    UnitClassType text references UnitClasses(Type),
    PromotionType text references UnitPromotions(Type)
);
--******************** New War Bonus ********************--
alter table Traits add NoResistance boolean default 0;
alter table Traits add GoldenAgeOnWar boolean default 0;
alter table Traits add CanConquerUC boolean default 0; 
alter table Traits add FreePolicyWhenFirstConquerMajorCapital integer default 0;
alter table Traits add InstantTourismBombWhenFirstConquerMajorCapital integer default 0; -- apply tourism (x turn) pressure to all civs
--******************** Other Bonus ********************--
alter table Traits add CanDiplomaticMarriage boolean default 0;
alter table Traits add AbleToDualEmpire boolean default 0;
alter table Traits add CanFoundCoastCity boolean default 0;

alter table Traits add CanPurchaseWonderInGoldenAge boolean default 0;
insert into Defines(Name, Value) values('WONDER_GOLDEN_AGE_PURCHASE_MODIFIER', 200);
alter table Traits add NumFreeWorldWonderPerCity integer default 0;
alter table Traits add TriggersIdeologyTech text references Technologies(Type);

alter table Traits add GoldenAgeResearchTotalCostModifier integer default 0;
alter table Traits add GoldenAgeResearchCityCountCostModifier integer default 0;
alter table Traits add GoldenAgeGrowThresholdModifier integer default 0;
alter table Traits add GoldenAgeMinorPerTurnInfluence integer default 0;
alter table Traits add AdequateLuxuryCompleteQuestInfluenceModifier integer default 0;
alter table Traits add AdequateLuxuryCompleteQuestInfluenceModifierMax integer default -1;

-- SP-TODO: Column Name WLKDLengthChangeModifier -> WLTKDLengthChangeModifier
alter table Traits add WLTKDLengthChangeModifier integer default 0;
-- SP-TODO: Column Name WLKDCityNoResearchCost -> WLTKDCityNoResearchCost
alter table Traits add WLTKDCityNoResearchCost boolean default 0;

create table Trait_BuildingClassFaithCost (
    TraitType text references Traits(Type),
    BuildingClassType text references BuildingClasses(Type),
    Cost integer default 0
);
--******************** catgrep's Byzantium ********************--
alter table Traits add SpreadReligionFromKilledUnitStrengthPercent integer default 0;
alter table Traits add SpreadReligionRadius integer default 0;
alter table Traits add InflictDamageChangePerCapturedHolyCity integer default 0;
alter table Traits add DamageChangePerCapturedHolyCity integer default 0;
alter table Traits add SiegeDamagePercentIfSameReligion integer default 0;
alter table Traits add FaithPurchaseCombatUnitCostPercent integer default 0;

-- Deprecated
alter table Traits add CanFoundMountainCity boolean default 0; -- Use MountainPass
create table Era_MountainCityYieldChanges ( --Use Trait_EraMountainCityYieldChanges
    EraType text references Eras(Type),
    YieldType text references Yields(Type),
    Yield integer not null
);
create table Era_CoastCityYieldChanges ( --Use Trait_EraCoastCityYieldChanges
    EraType text references Eras(Type),
    YieldType text references Yields(Type),
    Yield integer not null
);