insert into Defines(Name, Value) values('IMMIGRATION_BASE_RATE', 30);

alter table Policies add ImmigrationInModifier integer default 0;
alter table Policies add ImmigrationOutModifier integer default 0;
alter table Buildings add EnableAlwaysImmigrantIn boolean default 0;
alter table Traits add ExceedingHappinessImmigrationModifier integer default 0;