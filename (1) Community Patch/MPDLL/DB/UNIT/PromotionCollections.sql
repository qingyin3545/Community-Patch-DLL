create table PromotionCollections (
    ID integer primary key autoincrement not null,
    Type text unique
);

create table PromotionCollections_Entries (
    CollectionType text references PromotionCollections(Type),
    PromotionType text references UnitPromotions(Type),
    PromotionIndex int default 0,
    
    TriggerMeleeAttack  boolean default 0,
    TriggerRangedAttack  boolean default 0,
    TriggerMeleeDefense boolean default 0,
    TriggerRangedDefense boolean default 0,
    TriggerHPFixed integer default 0,
    TriggerHPPercent integer default 0,
    TriggerLuaCheck boolean default 0,
    TriggerLuaHook boolean default 0
);
