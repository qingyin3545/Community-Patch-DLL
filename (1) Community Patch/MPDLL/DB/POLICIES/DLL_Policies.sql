alter table Policies add CapitalTradeRouteGoldChange integer default 0;
alter table Policies add CapitalTradeRouteRangeChange integer default 0;
alter table Policies add InstantFoodThresholdPercent integer default 0;
alter table Policies add NationalWonderCityCostModifier integer default 0;
alter table Policies add GlobalHappinessFromFaithPercent integer default 0;
alter table Policies add HappinessPerReligionInCity integer default 0;
alter table Policies add MinorBullyInfluenceLossModifier int default 0;
alter table Policies add MinorLocalBullyScoreModifier int default 0;
alter table Policies add MinorAllyBullyScoreModifier int default 0;
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


-- SP-TODO: Column Name GreatScientistBeakerPolicyModifier -> ScienceBeakerMod
alter table Policies add ScienceBeakerMod integer default 0;
alter table Policies add ProductionBeakerMod integer default 0;
alter table Policies add OriginalCapitalCaptureTech integer default 0;
alter table Policies add OriginalCapitalCapturePolicy integer default 0;
alter table Policies add OriginalCapitalCaptureGreatPerson integer default 0;
alter table Policies add ReligionProductionModifier integer default 0;
alter table Policies add UpgradeAllTerritory boolean default 0;

create table Policy_MinorsTradeRouteYieldRate (
    PolicyType text default '',
    YieldType text default '',
    Rate integer not null
);

create table Policy_InternalTradeRouteDestYieldRate (
    PolicyType text default '',
    YieldType text default '',
    Rate integer not null
);

CREATE TABLE Policy_CityWithWorldWonderYieldModifier (
	'PolicyType' text default '',
	'YieldType' text default '',
	'Yield' integer  not null ,
	foreign key (PolicyType) references Policies(Type),
	foreign key (YieldType) references Yields(Type)
);

CREATE TABLE Policy_TradeRouteCityYieldModifier (
	'PolicyType' text default '',
	'YieldType' text default '',
	'Yield' integer not null ,
	foreign key (PolicyType) references Policies(Type),
	foreign key (YieldType) references Yields(Type)
);

CREATE TABLE Policy_CityNumberCityYieldModifier (
	'PolicyType' text default '',
	'YieldType' text default '',
	'Yield' integer not null ,
	foreign key (PolicyType) references Policies(Type),
	foreign key (YieldType) references Yields(Type)
);

create table Policy_HappinessYieldModifier (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    YieldFormula text references LuaFormula(Type)
);

CREATE TABLE Policy_BuildSpeedModifier (
	PolicyType TEXT REFERENCES Policies(Type),
	BuildType text REFERENCES Builds(Type),
	Modifier integer not null
);

alter table Policies add SettlerPopConsume integer default 0;
ALTER TABLE Policies ADD 'SettlerProductionEraModifier' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD 'SettlerProductionStartEra' TEXT DEFAULT NULL REFERENCES Eras(Type);
ALTER TABLE Policies ADD 'TourismModifierPerGPCreation' BOOLEAN DEFAULT 0;
ALTER TABLE Policies ADD 'ScienceModifierFromRANum' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD 'CityExtraProductionCount' INTEGER DEFAULT 0;
ALTER TABLE Policies ADD 'FreeBuildingClass' text default null references BuildingClasses(Type);
alter table Policies add column CaptureCityResistanceTurnsChangeFormula text references LuaFormula(Type);
alter table Policies add column FreePromotionRemoved integer default -1;
alter table Policies add column RemoveCurrentPromotion boolean default 0;
alter table Policies add column RemoveOceanImpassableCombatUnit boolean default 0;
ALTER TABLE Policies ADD COLUMN 'AlwaysWeLoveKindDayInGoldenAge' BOOLEAN DEFAULT 0;
alter table Policies add column NoOccupiedUnhappinessGarrisonedCity boolean default 0;

CREATE TABLE Policy_YieldModifierPerArtifacts (
	'PolicyType' text default '',
	'YieldType' text default '',
	'Yield' integer  not null ,
	foreign key (PolicyType) references Policies(Type),
	foreign key (YieldType) references Yields(Type)
);

CREATE TABLE Policy_GreatPersonOutputModifierPerGWs (
	'PolicyType' text default '',
	'GreatPersonType' text default '',
	'Modifier' integer  not null ,
	foreign key (PolicyType) references Policies(Type),
	foreign key (GreatPersonType) references GreatPersons(Type)
);

create table Policy_YieldPerPopChanges (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Policy_CityLoveKingDayYieldMod (
    PolicyType text references Policies(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

-- Deprecated
alter table Policies add Dummy integer default 0; -- Use IsDummy
alter table Policies add InstantFoodKeptPercent integer default 0;
alter table Policies add HappinessPerPolicy integer default 0; -- Use HappinessPerXPolicies
alter table Policies add NumTradeRouteBonus integer default 0; -- Use FreeTradeRoute
alter table Policies add RiggingElectionInfluenceModifier integer default 0; -- use RigElectionInfluenceModifier
alter table Policies add ExtraSpies integer default 0; -- Use FreeSpy