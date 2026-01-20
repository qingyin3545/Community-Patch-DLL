insert into Defines(Name, Value) values('PLOT_BUILD_MAX_WORKER', 1);

create table Plot_CityYields (
    PlotType text references Plots(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
alter table Yields add GreakWorkYieldMod integer default 0;

alter table Features add Volcano boolean default 0;

alter table GameSpeeds add FreePromotion text references UnitPromotions(Type);
alter table GameSpeeds add SetterExtraPercent integer default 0;

alter table HandicapInfos add AIStrategicResourceMod integer default 100;
alter table HandicapInfos add AIStrategicResourceModPerEra integer default 0;
alter table HandicapInfos add AIMinExpansionFlavor integer default 0;
-- If AIFirstProphetPercent is positive, it overrides AITrainPercent on AI's First Prophet Cost;
alter table HandicapInfos add AIFirstProphetPercent integer default 0;

alter table Civilizations add SpecialGAText text default 'TXT_KEY_GOLDEN_AGE_ANNOUNCE';
alter table Civilizations add SpecialGAHelpText text default 'TXT_KEY_TP_GOLDEN_AGE_EFFECT';