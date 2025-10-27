create table Improvement_UnitXPPerTurn (
  ImprovementType text references Improvements(Type),
  Value integer default 0,

  -- conditional
  UnitType text references Units(Type),
  PromotionType text references UnitPromotions(Type)
);

create table Improvement_YieldChangesPerUnit (
  ImprovementType text references Improvements(Type),
  YieldType text references Yields(Type),
  Yield integer default 0,

  -- conditional
  UnitType text references Units(Type),
  PromotionType text references UnitPromotions(Type)
);

create table Improvement_AdjacentImprovementYieldChanges (
  ImprovementType text references Improvements(Type),
  OtherImprovementType text references Improvements(Type),
  YieldType text references Yields(Type),
  Yield integer default 0
);
create table Improvement_TerrainYieldChanges (
  ImprovementType text references Improvements(Type),
  TerrainType text references Terrains(Type),
  YieldType text references Yields(Type),
  Yield integer default 0
);

-- Additional units allowed by improvements
alter table Improvements add AdditionalUnits integer default 0;
alter table Improvements add NoLake boolean default 0;
alter table Improvements add NoFeature boolean default 0;
alter table Improvements add NoRemove boolean default 0;

alter table Improvements add NegatesTerrainDamage integer default 0;
alter table Improvements add NegatesFeatureDamage integer default 0;

alter table Improvements add ExtraScore integer default 0;

create table Improvement_FeaturesNeeded (
    ImprovementType text references Improvements(Type),
    FeatureType text references Features(Type)
);

alter table Improvements add NearbyFriendHeal integer default 0;
alter table Improvements add IsFreshWater boolean default 0;
alter table Improvements add RequiredAdjacentImprovement text references Improvements(Type);
alter table Improvements add RequiredAdjacentCity boolean default 0;
alter table Improvements add RemoveWhenSetNoFuture boolean default 0;
alter table Improvements add NumWaterPlotMakesValid integer default 0;

-- Deprecated
alter table Improvements add ForbidSameBuildUnitClasses text references UnitClasses(Type);