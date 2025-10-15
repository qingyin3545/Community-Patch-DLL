INSERT INTO Defines(Name, Value) VALUES('PLOT_BUILD_MAX_WORKER', 1);

create table Plot_CityYields (
    PlotType text references Plots(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
create table Era_MountainCityYieldChanges (
	EraType text references Eras(Type),
	YieldType text references Yields(Type),
	Yield integer not null
);
create table Era_CoastCityYieldChanges (
	EraType text references Eras(Type),
	YieldType text references Yields(Type),
	Yield integer not null
);
alter table Yields add column GreakWorkYieldMod integer default 0 not null;

ALTER TABLE Features ADD 'Volcano' boolean default 0;

ALTER TABLE GameSpeeds ADD FreePromotion TEXT DEFAULT NULL REFERENCES UnitPromotions(Type);
ALTER TABLE GameSpeeds ADD COLUMN 'SetterExtraPercent' INTEGER DEFAULT 0;

ALTER TABLE HandicapInfos ADD AIStrategicResourceMod INTEGER DEFAULT 100;
ALTER TABLE HandicapInfos ADD AIStrategicResourceModPerEra INTEGER DEFAULT 0;
ALTER TABLE HandicapInfos ADD AIMinExpansionFlavor INTEGER DEFAULT 0;
-- If AIFirstProphetPercent is positive, it overrides AITrainPercent on AI's First Prophet Cost;
ALTER TABLE HandicapInfos ADD AIFirstProphetPercent INTEGER DEFAULT 0;

ALTER TABLE Civilizations ADD COLUMN `SpecialGAText` TEXT DEFAULT 'TXT_KEY_GOLDEN_AGE_ANNOUNCE';
ALTER TABLE Civilizations ADD COLUMN `SpecialGAHelpText` TEXT DEFAULT 'TXT_KEY_TP_GOLDEN_AGE_EFFECT';