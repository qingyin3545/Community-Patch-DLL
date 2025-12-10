create table Building_DomainTroops (
    BuildingType text references Buildings(Type),
    DomainType text references Domains(Type),
    NumTroop integer default 0
);

alter table Units add NoTroopConsume boolean default 0;
alter table Units add CannotBeEstablishedCorps boolean default 0;

--24 for base amount, 4 per city scale
insert into Defines(Name, Value) values('TROOP_RATE_TIMES100_LOW', 50);
insert into Defines(Name, Value) values('TROOP_RATE_TIMES100_DEFAULT', 100);
insert into Defines(Name, Value) values('TROOP_RATE_TIMES100_HIGH', 150);
insert into Defines(Name, Value) values('TROOP_NUM_BASE', 24);

alter table Buildings add NumCrops integer default 0;
alter table Buildings add NumArmee integer default 0;

alter table UnitPromotions add IsCrops boolean default 0;
alter table UnitPromotions add IsArmee boolean default 0;

alter table UnitPromotions add NumEstablishCorps integer default 0;
alter table UnitPromotions add CannotBeEstablishedCorps boolean default 0;

alter table Buildings add EnableCrops boolean default 0;
alter table Buildings add EnableArmee boolean default 0;