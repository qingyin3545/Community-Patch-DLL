create table Improvement_UnitXPPerTurn (
  ImprovementType text default '',
  Value integer not null default 0,

  -- conditional
  UnitType text default '',
  PromotionType text default ''
);

create table Improvement_YieldChangesPerUnit (
  ImprovementType text default '',
  YieldType text default '',
  Yield integer not null default 0,

  -- conditional
  UnitType text default '',
  PromotionType text default ''
);

create table Improvement_AdjacentImprovementYieldChanges (
  ImprovementType text references Improvements(Type),
  OtherImprovementType text references Improvements(Type),
  YieldType text references Yields(Type),
  Yield integer not null default 0
);
create table Improvement_TerrainYieldChanges (
  ImprovementType text references Improvements(Type),
  TerrainType text references Terrains(Type),
  YieldType text references Yields(Type),
  Yield integer not null default 0
);

-- Additional units allowed by improvements
ALTER TABLE Improvements ADD AdditionalUnits INTEGER DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'NoLake' BOOLEAN DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'NoFeature' BOOLEAN DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'NoRemove' BOOLEAN DEFAULT 0;

ALTER TABLE Improvements ADD NegatesTerrainDamage INTEGER DEFAULT 0;
ALTER TABLE Improvements ADD NegatesFeatureDamage INTEGER DEFAULT 0;

ALTER TABLE Improvements ADD ExtraScore INTEGER DEFAULT 0;

CREATE TABLE IF NOT EXISTS Improvement_FeaturesNeeded (
    `ImprovementType` TEXT DEFAULT '' references Improvements(Type),
    `FeatureType` TEXT DEFAULT '' references Features(Type)
);

ALTER TABLE Improvements ADD COLUMN 'NearbyFriendHeal' INTEGER DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'IsFreshWater' BOOLEAN DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'ForbidSameBuildUnitClasses' TEXT DEFAULT NULL;
ALTER TABLE Improvements ADD COLUMN 'RequiredAdjacentImprovement' TEXT DEFAULT NULL REFERENCES Improvements(Type);
ALTER TABLE Improvements ADD COLUMN 'RequiredAdjacentCity' BOOLEAN DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'RemoveWhenSetNoFuture' BOOLEAN DEFAULT 0;
ALTER TABLE Improvements ADD COLUMN 'NumWaterPlotMakesValid' INTEGER DEFAULT 0;