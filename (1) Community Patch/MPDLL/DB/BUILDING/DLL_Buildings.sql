alter table Buildings add ResetDamageValue integer default 0;
alter table Buildings add ReduceDamageValue integer default 0;


create table Building_EnableUnitPurchase(
	BuildingType text references Buildings(Type),
	UnitClassType text references UnitClasses(Type),
	YieldType text references Yields(Type),
	CostModifier integer default -1
);

create table Building_YieldFromOtherYield(
	BuildingType text references Buildings(Type),
	InYieldType text references Yields(Type),
	InYieldValue integer not null,
	OutYieldType text references Yields(Type),
	OutYieldValue integer not null
);

alter table Buildings add MinorFriendshipAnchorChange integer default 0;
alter table Buildings add MinorQuestFriendshipMod integer default 0;
alter table Buildings add GoldenAgeUnitCombatModifier integer default 0;
alter table Buildings add GoldenAgeMeterMod integer default 0;

alter table Buildings add AllowInstantYield boolean default 0;
alter table Buildings add RiverOrCoastal boolean default 0;
alter table Buildings add MinNumReligions integer default 0;
alter table Buildings add PolicyNeededType text references Policies(Type);

create table Building_BuildingsNeededInCity(
	BuildingType text references Buildings(Type),
	PreBuildingType text references Buildings(Type)
);
create table Building_BuildingsNeededGlobal(
	BuildingType text references Buildings(Type),
	PreBuildingType text references Buildings(Type)
);
create table Building_ClassesNeededGlobal(
	BuildingType text references Buildings(Type), 
	BuildingClassType text references BuildingClasses(Type)
);

alter table Buildings add TradeRouteSeaGoldBonusGlobal integer default 0;
alter table Buildings add TradeRouteLandGoldBonusGlobal integer default 0;
alter table Buildings add LandmarksTourismPercentGlobal integer default 0;
alter table Buildings add GreatWorksTourismModifierGlobal integer default 0;
alter table Buildings add CityStateTradeRouteProductionModifierGlobal integer default 0;

alter table Buildings add GlobalProductionNeededUnitModifier integer default 0;
alter table Buildings add GlobalProductionNeededBuildingModifier integer default 0;
alter table Buildings add GlobalProductionNeededProjectModifier integer default 0;

alter table Buildings add GlobalProductionNeededUnitMax integer default 0;
alter table Buildings add GlobalProductionNeededBuildingMax integer default 0;
alter table Buildings add GlobalProductionNeededProjectMax integer default 0;

alter table Buildings add DummyBuilding boolean default 0;
alter table Buildings add GlobalEspionageSpeedModifier integer default 0;
alter table Buildings add InstantResearchFromFriendlyGreatScientist integer default 0;

alter table Buildings add NoPuppet boolean default 0;
alter table Buildings add HumanOnly integer default 0;

alter table Buildings add UnitMaxExperienceLocal integer default 0;
alter table Buildings add ExtraSellRefund integer default 0;
alter table Buildings add ExtraSellRefundModifierPerEra integer default 0;
alter table Buildings add CityDefenseModifierGlobal integer default 0;

create table Building_TradeRouteFromTheCityYields (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	YieldValue integer default 0
);

alter table Buildings add GlobalGrowthFoodNeededModifier integer default 0;
alter table Buildings add SecondCapitalsExtraScore integer default 0;
alter table Buildings add FoodKeptFromPollution integer default 0;
alter table Buildings add NotNeedOccupied boolean default 0;
alter table Buildings add TechNoPrereqClasses text references Technologies(Type);

alter table Buildings add OriginalCapitalOnly boolean default 0;

create table Building_YieldMultiplier (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

alter table Buildings add LiberatedInfluence integer default 0;  
alter table Buildings add GlobalCityStrengthMod integer default 0;
alter table Buildings add GlobalRangedStrikeModifier integer default 0;
alter table Buildings add ExtraDamageHeal integer default 0;
alter table Buildings add ExtraDamageHealPercent integer default 0;
alter table Buildings add ExtraAttacks integer default 0;
alter table Buildings add ImmueVolcanoDamage integer default 0;
alter table Buildings add ForbiddenForeignSpyGlobal boolean default 0;
alter table Buildings add ForbiddenForeignSpy boolean default 0;
alter table Buildings add WaterTileDamage integer default 0;
alter table Buildings add WaterTileMovementReduce integer default 0;
alter table Buildings add WaterTileTurnDamage integer default 0;
alter table Buildings add PlagueMod integer default 0;
alter table Buildings add PlagueModGlobal integer default 0;
alter table Buildings add LandTileDamage integer default 0;
alter table Buildings add LandTileMovementReduce integer default 0;
alter table Buildings add LandTileTurnDamage integer default 0;
alter table Buildings add WaterTileDamageGlobal integer default 0;
alter table Buildings add WaterTileMovementReduceGlobal integer default 0;
alter table Buildings add WaterTileTurnDamageGlobal integer default 0;
alter table Buildings add LandTileDamageGlobal integer default 0;
alter table Buildings add LandTileMovementReduceGlobal integer default 0;
alter table Buildings add LandTileTurnDamageGlobal integer default 0;
alter table Buildings add ResearchTotalCostModifier integer default 0;
alter table Buildings add CityCollateralDamage boolean default 0;
alter table Buildings add ExtraUnitPlayerInstances integer default 0;
alter table Buildings add BombardRange integer default 0;
alter table Buildings add BombardIndirect integer default 0;
alter table Buildings add MinorCivFriendship integer default 0;
alter table Buildings add FreePromotion2 text references UnitPromotions(Type);
alter table Buildings add FreePromotion3 text references UnitPromotions(Type);
alter table Buildings add MoveAfterCreated integer default 0;
alter table Buildings add ResearchTotalCostModifierGoldenAge integer default 0;
alter table Buildings add TradeRouteRiverBonusModifier integer default 0;

create table Building_TerrainYieldModifier (
	BuildingType text references Buildings(Type),
	TerrainType text references Terrains(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_FeatureYieldModifiers (
	BuildingType text references Buildings(Type),
	FeatureType text references Features(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_ImprovementYieldModifiers (
	BuildingType text references Buildings(Type),
	ImprovementType text references Improvements(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_EmpireResourceAnds (
	BuildingType text references Buildings(Type),
	ResourceType text references Resources(Type)
);
create table Building_EmpireResourceOrs (
	BuildingType text references Buildings(Type),
	ResourceType text references Resources(Type)
);

create table Building_YieldPerEspionageSpy (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_UnitTypePrmoteHealGlobal (
	BuildingType text references Buildings(Type),
	UnitType text references Units(Type),
	Heal integer default 0
);

create table Building_ResourceFromImprovement (
	BuildingType text references Buildings(Type),
	ResourceType text references Resources(Type),
	ImprovementType text references Improvements(Type),
	Value integer default 0
);

create table Building_TerrainYieldChangesGlobal (
	BuildingType text references Buildings(Type),
	TerrainType text references Terrains(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_FeatureYieldChangesGlobal (
	BuildingType text references Buildings(Type),
	FeatureType text references Features(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_CityWithWorldWonderYieldModifierGlobal (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_YieldFromProcessModifierGlobal (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_SpecialistYieldModifiers (
	BuildingType text references Buildings(Type),
	SpecialistType text references Specialists(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_SpecialistYieldModifiersGlobal (
	BuildingType text references Buildings(Type),
	SpecialistType text references Specialists(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_TradeRouteFromTheCityYieldsPerEra (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	YieldValue integer default 0
);
create table Building_YieldChangesPerEra (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_RiverPlotYieldChangesGlobal (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_LocalPlotAnds (
	BuildingType text references Buildings(Type),
	PlotType text references Plots(Type)
);

create table Building_DomainFreeExperiencesPerPop (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Modifier integer default 0
);

create table Building_DomainFreeExperiencesPerPopGlobal (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Modifier integer default 0
);

create table Building_DomainFreeExperiencesPerTurn (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Value integer default 0
);

create table Building_DomainFreeExperiencesPerTurnGlobal (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Value integer default 0
);
create table Building_YieldModifiersChangesPerEra (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_CityStateTradeRouteYieldModifiers (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);
create table Building_CityStateTradeRouteYieldModifiersGlobal (
	BuildingType text references Buildings(Type),
	YieldType text references Yields(Type),
	Yield integer default 0
);

create table Building_DomainEnemyCombatModifier (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Modifier integer default 0
);

create table Building_DomainEnemyCombatModifierGlobal (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Modifier integer default 0
);

create table Building_DomainFriendsCombatModifierLocal (
	BuildingType text references Buildings(Type),
	DomainType text references Domains(Type),
	Modifier integer default 0
);