create table LuaFormula (
    ID integer primary key autoincrement not null,
    Type text unique,
    Formula text default ''
);

alter table Yields add column ExcessHappinessModifierFormula text references LuaFormula(Type);