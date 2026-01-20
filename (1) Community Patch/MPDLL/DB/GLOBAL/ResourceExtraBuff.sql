alter table Resources add CreateResouceWightModifier integer default 0;

alter table Resources add UnHappinessModifierFormula text references LuaFormula(Type);
alter table Resources add CityConnectionTradeRouteGoldModifierFormula text references LuaFormula(Type);
alter table Resources add GoldHurryCostModifierFormula text references LuaFormula(Type);

alter table Policies add ResourceCityConnectionTradeRouteGoldModifier integer default 0;
alter table Policies add ResourceUnhappinessModifier integer default 0;

create table Resource_GlobalYieldModifiers (
    ResourceType text references Resources(Type),
    YieldType text references Yields(Type),
    YieldFormula text references LuaFormula(Type),
    StartEra text references Eras(Type),
    EndEra text references Eras(Type)
);

alter table Resources add NotificationTurn integer default 0;
alter table Resources add NoDefaultNotification boolean default 0;