alter table Projects add Maintenance integer default 0;
alter table Projects add CityMaxNum integer default 0;
alter table Projects add FreePromotion text references UnitPromotions(Type);
alter table Projects add NoBroadcast boolean default 0;
alter table Projects add PolicyBranchPrereq text references PolicyBranchTypes(Type);

create table Project_PolicyNeeded (
    ProjectType text references Projects(Type),
    PolicyType text references Policies(Type)
);

create table Project_YieldChanges (
    ProjectType text references Projects(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table Project_YieldModifiers (
    ProjectType text references Projects(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);