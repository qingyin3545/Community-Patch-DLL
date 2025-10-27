create table CorruptionLevels (
    ID integer primary key autoincrement not null,
    Type text unique,

    IconString text default '',

    ScoreLowerBoundBase integer default 0,
    MapWidthModifier integer default 0,
    MapHeightModifier integer default 0,

    IsCapital boolean default 0,
    IsPuppet boolean default 0,

    CityHallBuildingClass text null,
    PublicSecurityBuildingClass text null
);

alter table Policies add CorruptionScoreModifier integer default 0;
alter table Resources add CorruptionScoreChange integer default 0;
alter table Buildings add CorruptionScoreChange integer default 0;

alter table Buildings add MinCorruptionLevelNeeded integer default -1;
alter table Buildings add MaxCorruptionLevelNeeded integer default -1;

alter table Policies add CorruptionLevelReduceByOne boolean default 0;
alter table Traits add CorruptionLevelReduceByOne boolean default 0;
alter table Traits add MaxCorruptionLevel integer default -1;
alter table Buildings add CorruptionLevelChange integer default 0;

create table Policy_CorruptionLevelPolicyCostModifier (
    PolicyType text default '',
    CorruptionLevelType text default '',
    Modifier integer default 0
);

insert into Defines(Name, Value) values('CORRUPTION_SCORE_PER_DISTANCE', 100);
insert into Defines(Name, Value) values('CORRUPTION_SCORE_COASTAL_BONUS', -200);

alter table Buildings add CorruptionPolicyCostModifier integer default 0;