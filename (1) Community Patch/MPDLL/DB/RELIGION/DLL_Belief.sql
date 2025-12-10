alter table Beliefs add AllowYieldPerBirth boolean default 0;
alter table Beliefs add CityExtraMissionarySpreads integer default 0;
alter table Beliefs add HolyCityPressureModifier integer default 0;
alter table Beliefs add HolyCityUnitExperence integer default 0;
alter table Beliefs add LandmarksTourismPercent integer default 0;
alter table Beliefs add FreePromotionForProphet text references UnitPromotions(Type);

alter table Beliefs add GreatPersonPointsPerCity boolean default 0;
alter table Beliefs add GreatPersonPointsCapital boolean default 0;
alter table Beliefs add GreatPersonPointsHolyCity boolean default 0;
alter table Beliefs add InquisitorProhibitSpreadInAlly boolean default 0;

alter table Beliefs add SameReligionMinorRecoveryModifier integer default 0;
alter table Beliefs add InquisitionFervorTimeModifier integer default 0;
alter table Beliefs add GoldenAgeModifier integer default 0;
alter table Beliefs add ExtraSpies integer default 0;

create table Belief_TerrainYieldChangesAdditive (
    BeliefType text references Beliefs(Type),
    TerrainType text references Terrains(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Belief_TerrainCityYieldChanges (
    BeliefType text references Beliefs(Type),
    TerrainType text references Terrains(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Belief_TerrainCityFoodConsumption (
    BeliefType text references Beliefs(Type),
    TerrainType text references Terrains(Type),
    Modifier integer default 0
);

create table Belief_LakePlotYieldChanges (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Belief_RiverPlotYieldChanges (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

alter table Beliefs add CuttingBonusModifier integer default 0;
alter table Beliefs add FounderFreePromotion text references UnitPromotions(Type);
alter table Beliefs add FollowingCityFreePromotion text references UnitPromotions(Type);

--Per 25 will add about 1 AI-judge score if leader's this flavor is 6
--common  AI-popular beliefs` score about 100-200,common no-AI-choose beliefs` score about 20-40
create table Belief_ExtraFlavors (
    BeliefType text references Beliefs(Type),
    FlavorType text references Flavors(Type),
    Flavor integer default 0
);
create table Belief_CivilizationFlavors (
    BeliefType text references Beliefs(Type),
    CivilizationType text references Civilizations(Type),
    Flavor integer default 0
);
--Yield = Modifier * cutting-production
create table Belief_CuttingInstantYieldModifier (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Modifier integer default 0
);
create table Belief_CuttingInstantYield (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
--Need define Belief_MaxYieldModifierPerFollower before use this, Actual value = 100 + Modifier
create table Belief_YieldModifierPerFollowerTimes100 (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Modifier integer default 0
);

create table Belief_HolyCityYieldPerForeignFollowers (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    PerForeignFollowers integer default 0
);

create table Belief_CityYieldPerOtherReligion (
    BeliefType text references Beliefs(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Belief_ImprovementAdjacentCityYieldChanges (
    BeliefType text references Beliefs(Type),
    ImprovementType text references Improvements(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);