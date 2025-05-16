ALTER TABLE Buildings ADD COLUMN 'ResetDamageValue' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ReduceDamageValue' INTEGER DEFAULT 0;


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

alter table Buildings add column `MinorFriendshipAnchorChange` int not null default 0;
alter table Buildings add column `MinorQuestFriendshipMod` int not null default 0;
alter table Buildings add column `GoldenAgeUnitCombatModifier` int not null default 0;
alter table Buildings add column `GoldenAgeMeterMod` int not null default 0;

ALTER TABLE Buildings ADD COLUMN 'AllowInstantYield' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'RiverOrCoastal' BOOLEAN DEFAULT 0;
alter table Buildings add column `MinNumReligions` int not null default 0;

CREATE TABLE Building_BuildingsNeededInCity(
	BuildingType text references Buildings(Type),
	PreBuildingType text references Buildings(Type)
);
CREATE TABLE Building_BuildingsNeededGlobal(
	BuildingType text references Buildings(Type),
	PreBuildingType text references Buildings(Type)
);
CREATE TABLE Building_ClassesNeededGlobal(
	'BuildingType' text , 
	'BuildingClassType' text , 
	foreign key (BuildingType) references Buildings(Type), 
	foreign key (BuildingClassType) references BuildingClasses(Type)
);

ALTER TABLE Buildings ADD 'TradeRouteSeaGoldBonusGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'TradeRouteLandGoldBonusGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'LandmarksTourismPercentGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'GreatWorksTourismModifierGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'CityStateTradeRouteProductionModifierGlobal' INTEGER DEFAULT 0;

ALTER TABLE Buildings ADD 'GlobalProductionNeededUnitModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'GlobalProductionNeededBuildingModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'GlobalProductionNeededProjectModifier' INTEGER DEFAULT 0;

ALTER TABLE Buildings ADD 'GlobalProductionNeededUnitMax' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'GlobalProductionNeededBuildingMax' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'GlobalProductionNeededProjectMax' INTEGER DEFAULT 0;

ALTER TABLE Buildings ADD 'DummyBuilding' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'GlobalEspionageSpeedModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'InstantResearchFromFriendlyGreatScientist' INTEGER DEFAULT 0;

ALTER TABLE Buildings ADD 'NoPuppet' BOOLEAN DEFAULT 0;

ALTER TABLE Buildings ADD 'UnitMaxExperienceLocal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'ExtraSellRefund' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'ExtraSellRefundModifierPerEra' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'CityDefenseModifierGlobal' INTEGER DEFAULT 0;

CREATE TABLE Building_TradeRouteFromTheCityYields (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'YieldValue' int default 0 not null
);

ALTER TABLE Buildings ADD 'GlobalGrowthFoodNeededModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'SecondCapitalsExtraScore' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'FoodKeptFromPollution' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD 'NotNeedOccupied' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD 'TechNoPrereqClasses' TEXT DEFAULT NULL REFERENCES Technologies(Type);

ALTER TABLE Buildings ADD 'OriginalCapitalOnly' BOOLEAN DEFAULT 0;

CREATE TABLE Building_YieldMultiplier (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);

ALTER TABLE Buildings ADD COLUMN 'LiberatedInfluence' INTEGER DEFAULT 0;  
ALTER TABLE Buildings ADD COLUMN 'GlobalCityStrengthMod' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'GlobalRangedStrikeModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ExtraDamageHeal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ExtraDamageHealPercent' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ExtraAttacks' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD ImmueVolcanoDamage INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ForbiddenForeignSpyGlobal' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ForbiddenForeignSpy' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileDamage' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileMovementReduce' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileTurnDamage' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'PlagueMod' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'PlagueModGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileDamage' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileMovementReduce' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileTurnDamage' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileDamageGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileMovementReduceGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'WaterTileTurnDamageGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileDamageGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileMovementReduceGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'LandTileTurnDamageGlobal' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ResearchTotalCostModifier' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'CityCollateralDamage' BOOLEAN DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'ExtraUnitPlayerInstances' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD BombardRange INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD BombardIndirect INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD COLUMN 'MinorCivFriendship' INTEGER DEFAULT 0;
ALTER TABLE Buildings ADD FreePromotion2 TEXT DEFAULT NULL;
ALTER TABLE Buildings ADD FreePromotion3 TEXT DEFAULT NULL;
ALTER TABLE Buildings ADD COLUMN 'MoveAfterCreated' INTEGER DEFAULT 0;

CREATE TABLE Building_TerrainYieldModifier (
	'BuildingType' text no null references Buildings(Type),
	'TerrainType' text no null references Terrains(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_FeatureYieldModifiers (
	'BuildingType' text no null references Buildings(Type),
	'FeatureType' text no null references Features(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_ImprovementYieldModifiers (
	'BuildingType' text no null references Buildings(Type),
	'ImprovementType' text no null references Improvements(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);

CREATE TABLE Building_EmpireResourceAnds (
	'BuildingType' text no null references Buildings(Type),
	'ResourceType' text no null references Resources(Type)
);
CREATE TABLE Building_EmpireResourceOrs (
	'BuildingType' text no null references Buildings(Type),
	'ResourceType' text no null references Resources(Type)
);

CREATE TABLE Building_YieldPerEspionageSpy (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);

ALTER TABLE Buildings ADD 'HumanOnly' INTEGER DEFAULT 0;

CREATE TABLE Building_UnitTypePrmoteHealGlobal (
	'BuildingType' text no null references Buildings(Type),
	'UnitType' text references Units(Type),
	'Heal' int default 0 not null
);

CREATE TABLE Building_ResourceFromImprovement (
	'BuildingType' text no null references Buildings(Type),
	'ResourceType' text references Resources(Type),
	'ImprovementType' text references Improvements(Type),
	'Value' int default 0 not null
);

CREATE TABLE Building_TerrainYieldChangesGlobal (
	'BuildingType' text no null references Buildings(Type),
	'TerrainType' text no null references Terrains(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_FeatureYieldChangesGlobal (
	'BuildingType' text no null references Buildings(Type),
	'FeatureType' text no null references Features(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_CityWithWorldWonderYieldModifierGlobal (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_YieldFromProcessModifierGlobal (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
CREATE TABLE Building_SpecialistYieldModifiersGlobal (
	'BuildingType' text no null references Buildings(Type),
	'SpecialistType' text references Specialists(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);

CREATE TABLE "Building_TradeRouteFromTheCityYieldsPerEra" (
	"BuildingType"	text references Buildings(Type),
	"YieldType"	text references Yields(Type),
	"YieldValue" int default 0 not null
);
CREATE TABLE "Building_YieldChangesPerEra" (
	"BuildingType"	text references Buildings(Type),
	"YieldType"	text references Yields(Type),
	"Yield" int default 0 not null
);
CREATE TABLE Building_RiverPlotYieldChangesGlobal (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);

CREATE TABLE "Building_LocalPlotAnds" (
	'BuildingType' text no null references Buildings(Type),
	'PlotType' text references Plots(Type)
);

CREATE TABLE "Building_DomainFreeExperiencesPerPop" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Modifier'		int default 0 not null
);

CREATE TABLE "Building_DomainFreeExperiencesPerPopGlobal" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Modifier'		int default 0 not null
);

CREATE TABLE "Building_DomainFreeExperiencesPerTurn" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Value'			int default 0 not null
);

CREATE TABLE "Building_DomainFreeExperiencesPerTurnGlobal" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Value'			int default 0 not null
);
CREATE TABLE "Building_YieldModifiersChangesPerEra" (
	"BuildingType"	text references Buildings(Type),
	"YieldType"		text references Yields(Type),
	"Yield"			int default 0 not null
);

CREATE TABLE Building_CityStateTradeRouteYieldModifiers (
	'BuildingType' text references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' integer default 0
);
CREATE TABLE Building_CityStateTradeRouteYieldModifiersGlobal (
	'BuildingType' text references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' integer default 0
);

CREATE TABLE "Building_DomainEnemyCombatModifier" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Modifier'		int default 0 not null
);

CREATE TABLE "Building_DomainEnemyCombatModifierGlobal" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Modifier'		int default 0 not null
);

CREATE TABLE "Building_DomainFriendsCombatModifierLocal" (
	'BuildingType'	text no null references Buildings(Type),
	'DomainType'	text no null references Domains(Type),
	'Modifier'		int default 0 not null
);