create table NuclearWinterLevels (
    ID integer primary key autoincrement not null,
    Type text unique,
    Description text default '',
    Help text default '',
    TriggerThreshold integer default 0
);

create table NuclearWinterLevel_GlobalYieldModifier (
    NuclearWinterLevelType text references NuclearWinterLevels(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
create table NuclearWinterLevel_GlobalYield (
    NuclearWinterLevelType text references NuclearWinterLevels(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

alter table Units add NuclearWinterProcess integer default 0;
alter table Buildings add NoNuclearWinterLocal boolean default 0;

insert into NuclearWinterLevels(Type, Description, Help, TriggerThreshold)
select 'NO_NUCLEAR_WINTER', 'TXT_KEY_NUCLEAR_LEVEL_NONE', 'TXT_KEY_NUCLEAR_LEVEL_NONE_HELP', 0;