create table CityScales (
    ID integer primary key autoincrement not null,
    Type text unique,
    MinPopulation integer not null,

    NeedGrowthBuilding boolean default 0,
    CanImmigrantIn boolean default 1,
    CanImmigrantOut boolean default 1
);

create table CityScale_FreeBuildingClass (
    CityScaleType text references CityScales(Type),
    BuildingClassType text references BuildingClasses(Type),
    NumBuildings integer default 1,

    RequiredTraitType text null,
    RequiredPolicyType text null
);

alter table Buildings add EnableCityScaleGrowth text references CityScales(Type);
alter table Buildings add EnableAllCityScaleGrowth boolean default 0;