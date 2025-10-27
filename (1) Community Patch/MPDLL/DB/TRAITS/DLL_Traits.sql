-- Insert SQL Rules Here
alter table Traits add CanDiplomaticMarriage boolean default 0;
alter table Traits add AbleToDualEmpire boolean default 0;


alter table Traits add AdequateLuxuryCompleteQuestInfluenceModifier integer default 0;
alter table Traits add AdequateLuxuryCompleteQuestInfluenceModifierMax integer default -1;
alter table Traits add AllyCityStateCombatModifier integer default 0;
alter table Traits add AllyCityStateCombatModifierMax integer default -1;
alter table Traits add CanFoundMountainCity boolean default 0;
alter table Traits add CanFoundCoastCity boolean default 0;
alter table Traits add GoldenAgeMinorPerTurnInfluence integer default 0;

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

alter table Traits add CiviliansFreePromotion text references UnitPromotions(Type);
create table Trait_FreePromotionUnitClasses(
    TraitType text references Traits(Type), 
    UnitClassType text references UnitClasses(Type),
    PromotionType text references UnitPromotions(Type)
);

alter table Traits add TradeRouteLandGoldBonus integer default 0;
alter table Traits add TradeRouteSeaGoldBonus integer default 0;

alter table Traits add FreePolicyWhenFirstConquerMajorCapital integer default 0;
alter table Traits add InstantTourismBombWhenFirstConquerMajorCapital integer default 0; -- apply tourism (x turn) pressure to all civs

alter table Traits add UnitMaxHitPointChangePerRazedCityPop integer default 0;
alter table Traits add UnitMaxHitPointChangePerRazedCityPopLimit integer default 0;

alter table Traits add GreatWorksTourism integer default 0;
alter table Traits add RiverCorruptionScoreChange integer default 0;

alter table Traits add GoldenAgeResearchTotalCostModifier integer default 0;
alter table Traits add GoldenAgeResearchCityCountCostModifier integer default 0;
alter table Traits add GoldenAgeGrowThresholdModifier integer default 0;

alter table Traits add ShareAllyResearchPercent integer default 0;

alter table Traits add CultureBonusUnitStrengthModify integer default 0;

alter table Traits add NaturalWonderCorruptionScoreChange integer default 0;
alter table Traits add NaturalWonderCorruptionRadius integer default 0;
alter table Traits add TriggersIdeologyTech text references Technologies(Type);

alter table Traits add PromotionWhenKilledUnit text references UnitPromotions(Type);
alter table Traits add PromotionRadiusWhenKilledUnit integer default 0;
alter table Traits add AttackBonusAdjacentWhenUnitKilled integer default 0;
alter table Traits add KilledAttackBonusDecreasePerTurn integer default 0;

alter table Traits add NoDoDeficit boolean default 0;
alter table Traits add OwnedReligionUnitCultureExtraTurns integer default 0;

create table Trait_CityYieldModifierFromAdjacentFeature (
    TraitType text references Traits(Type),
    FeatureType text references Features(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Trait_CityYieldPerAdjacentFeature (
    TraitType text references Traits(Type),
    FeatureType text references Features(Type),
    YieldType text references Yields(Type),
    MaxValue integer default 0
);

alter table Traits add TrainedAll boolean default 0; 
alter table Traits add CanConquerUC boolean default 0; 

alter table Traits add NumFreeWorldWonderPerCity integer default 0;

alter table Traits add FreeGreatPeoplePerEra integer default 0;
alter table Traits add AwayFromCapitalCombatModifier integer default 0;
alter table Traits add AwayFromCapitalCombatModifierMax integer default 0;
alter table Traits add InfluenceFromGreatPeopleBirth integer default 0;
alter table Traits add WLKDLengthChangeModifier integer default 0;
alter table Traits add WLKDCityNoResearchCost boolean default 0;
alter table Traits add GoodyUnitUpgradeFirst boolean default 0;
alter table Traits add OthersTradeBonusModifier integer default 0;
alter table Traits add CanPurchaseWonderInGoldenAge boolean default 0;

create table Trait_SeaTradeRouteYieldPerEraTimes100 (
	TraitType text references Traits(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Trait_SeaTradeRouteYieldTimes100 (
	TraitType text references Traits(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Trait_BuildingClassFaithCost (
    TraitType text references Traits(Type),
    BuildingClassType text references BuildingClasses(Type),
    Cost integer default 0
);