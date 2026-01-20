create table Policy_CityResources (
    PolicyType text references Policies(Type),
    ResourceType text references Resources(Type),
    Quantity integer default 0,
    
    -- optional conditions
    CityScaleType text references CityScales(Type),
    LargerScaleValid boolean default 0,
    MustCoastal boolean default 0
);
