insert into Defines(Name, Value) values('WAR_CASUALTIES_THRESHOLD', 200);
insert into Defines(Name, Value) values('WAR_CASUALTIES_DELTA_BASE', 100);
insert into Defines(Name, Value) values('WAR_CASUALTIES_POPULATION_LOSS', 1);

alter table UnitPromotions add WarCasualtiesModifier integer default 0;
alter table Policies add WarCasualtiesModifier integer default 0;