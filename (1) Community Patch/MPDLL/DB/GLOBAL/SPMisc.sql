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
ALTER TABLE HandicapInfos ADD StrategicResourceMod INTEGER DEFAULT 100;
ALTER TABLE HandicapInfos ADD StrategicResourceModPerEra INTEGER DEFAULT 0;

ALTER TABLE Civilizations ADD COLUMN `SpecialGAText` TEXT DEFAULT 'TXT_KEY_GOLDEN_AGE_ANNOUNCE';
ALTER TABLE Civilizations ADD COLUMN `SpecialGAHelpText` TEXT DEFAULT 'TXT_KEY_TP_GOLDEN_AGE_EFFECT';