alter table UnitPromotions add MaintenanceCost integer default 0;
-- SP-TODO: Column Name MultipleInitExperence -> MultipleInitExperience
alter table UnitPromotions add MultipleInitExperience integer default 0;
alter table UnitPromotions add RangeAttackCostModifier integer default 0;
-- Implemented by CP
alter table UnitPromotions add CaptureDefeatedEnemyChance integer default 0;
alter table UnitPromotions add MovePercentCaptureCity integer default 0;
alter table UnitPromotions add HealPercentCaptureCity integer default 0;
-- Is a Counter, it is valid when LostAllMovesAttackCity > 0
alter table UnitPromotions add LostAllMovesAttackCity integer default 0;
alter table UnitPromotions add CaptureEmenyPercent integer default 0;
alter table UnitPromotions add CaptureEmenyExtraMax integer default 0;
alter table UnitPromotions add CarrierEXPGivenModifier integer default 0;
-- SP-TODO: Column Name UnitAttackFaithBonus -> DamageUnitFaithBonus
alter table UnitPromotions add DamageUnitFaithBonus integer default 0;
-- SP-TODO: Column Name CityAttackFaithBonus -> DamageCityFaithBonus
alter table UnitPromotions add DamageCityFaithBonus integer default 0;
alter table UnitPromotions add OriginalCapitalDamageFix integer default 0;
alter table UnitPromotions add OriginalCapitalSpecialDamageFix integer default 0;
alter table UnitPromotions add InsightEnemyDamageModifier integer default 0;
alter table UnitPromotions add MilitaryMightMod integer default 0;
-- SP-TODO: Column Name GetGroundAttackRange -> GroundAttackRange
alter table UnitPromotions add GroundAttackRange integer default 0;
alter table UnitPromotions add NoResourcePunishment boolean default 0;
alter table UnitPromotions add ImmueMeleeAttack boolean default 0;
-- SP-TODO: Column Name CannotBeRangedAttacked -> ImmueRangedAttack
alter table UnitPromotions add ImmueRangedAttack boolean default 0;
-- SP-TODO: Column Name IsCanParadropUnLimit -> CanParadropMoved
alter table UnitPromotions add CanParadropMoved boolean default 0;
alter table UnitPromotions add CanParadropAnyWhere boolean default 0;
-- SP-TODO: Column Name CanPlunderWithoutWar -> CanPillageWithoutWar
alter table UnitPromotions add CanPillageWithoutWar boolean default 0;
alter table UnitPromotions add Immobile boolean default 0;
-- SP-TODO: Error Spell Name MoveLfetAttackMod -> MoveLeftAttackMod
alter table UnitPromotions add MoveLeftAttackMod integer default 0;
alter table UnitPromotions add MoveUsedAttackMod integer default 0;
alter table UnitPromotions add MoveLeftDefenseMod integer default 0;
alter table UnitPromotions add MoveUsedDefenseMod integer default 0;
alter table UnitPromotions add GoldenAgeMod integer default 0;
-- SP-TODO: Lua Interface Changed
alter table UnitPromotions add AntiHigherPopMod integer default 0;
alter table UnitPromotions add NumAttacksMadeThisTurnAttackMod integer default 0;
alter table UnitPromotions add NumSpyDefenseMod integer default 0;
alter table UnitPromotions add NumSpyAttackMod integer default 0;
alter table UnitPromotions add NumWonderDefenseMod integer default 0;
alter table UnitPromotions add NumWonderAttackMod integer default 0;
alter table UnitPromotions add NumWorkDefenseMod integer default 0;
alter table UnitPromotions add NumWorkAttackMod integer default 0;
alter table UnitPromotions add NumSpyStayDefenseMod integer default 0;
alter table UnitPromotions add NumSpyStayAttackMod integer default 0;
alter table UnitPromotions add RangedSupportFireMod integer default 0;
-- SP-TODO: Column Name MeleeAttackModifier -> MeleeAttackMod
alter table UnitPromotions add MeleeAttackMod integer default 0;
alter table UnitPromotions add MeleeDefenseMod integer default 0;
-- SP-TODO: Lua Interface Changed
alter table UnitPromotions add DoFallBackAttackMod integer default 0;
alter table UnitPromotions add BeFallBackDefenseMod integer default 0;
-- SP_TODO: Lua Interface Changed && Content Changed
alter table UnitPromotions add NumOriginalCapitalAttackMod integer default 0;
alter table UnitPromotions add NumOriginalCapitalDefenseMod integer default 0;
alter table UnitPromotions add OnCapitalLandAttackMod integer default 0;
alter table UnitPromotions add OutsideCapitalLandAttackMod integer default 0;
alter table UnitPromotions add OnCapitalLandDefenseMod integer default 0;
alter table UnitPromotions add OutsideCapitalLandDefenseMod integer default 0;
-- SP-TODO: Column Name CurrentHitPoint -> LostHitPoint
alter table UnitPromotions add LostHitPointAttackMod integer default 0;
alter table UnitPromotions add LostHitPointDefenseMod integer default 0;
alter table UnitPromotions add NearNumEnemyAttackMod integer default 0;
alter table UnitPromotions add NearNumEnemyDefenseMod integer default 0;
-- SP-TODO: HeightModPerX -> HeightAdvantageAttckMod
alter table UnitPromotions add HeightAdvantageAttckMod integer default 0;
insert into Defines(Name, Value) values('HIGHT_MOD_MAX_ADVANTAGE', 2);
alter table UnitPromotions add WoundedMod integer default 0;
-- Only for Lua
alter table UnitPromotions add InterceptionDamageMod integer default 0;
alter table UnitPromotions add AirSweepDamageMod integer default 0;
-- SP-TODO: Lua Interface Changed
alter table UnitPromotions add AllyCityStateCombatModifier integer default 0;
alter table UnitPromotions add AllyCityStateCombatModifierMax integer default -1;
alter table UnitPromotions add ExtraHappinessCombatModifier integer default 0;
alter table UnitPromotions add ExtraHappinessCombatModifierMax integer default -1;
alter table UnitPromotions add ExtraResourceType text references Resources(Type);
alter table UnitPromotions add ExtraResourceCombatModifier integer default 0;
alter table UnitPromotions add ExtraResourceCombatModifierMax integer default -1;
alter table UnitPromotions add NearbyUnitPromotionBonus integer default 0;
alter table UnitPromotions add NearbyUnitPromotionBonusRange integer default 0;
alter table UnitPromotions add NearbyUnitPromotionBonusMax integer default -1;
alter table UnitPromotions add CombatBonusFromNearbyUnitPromotion text references UnitPromotions(Type);
alter table UnitPromotions add RemovePromotionUpgrade text references UnitPromotions(Type);
alter table UnitPromotions add PromotionPrereqOr10 text references UnitPromotions(Type);
alter table UnitPromotions add PromotionPrereqOr11 text references UnitPromotions(Type);
alter table UnitPromotions add PromotionPrereqOr12 text references UnitPromotions(Type);
alter table UnitPromotions add PromotionPrereqOr13 text references UnitPromotions(Type);
-- Promotions effect that Unit can only have one
alter table UnitPromotions add AttackChanceFromAttackDamage text references LuaFormula(Type);
alter table UnitPromotions add MovementFromAttackDamage text references LuaFormula(Type);
alter table UnitPromotions add HealPercentFromAttackDamage text references LuaFormula(Type);

alter table UnitPromotions add FeatureInvisible text references Features(Type);
alter table UnitPromotions add FeatureInvisible2 text references Features(Type);
create table UnitPromotions_FeatureInvisible (
    PromotionType text references UnitPromotions(Type),
    FeatureType text references Features(Type)
);

create table UnitPromotions_PromotionModifiers (
    PromotionType text references UnitPromotions(Type),
    OtherPromotionType text references UnitPromotions(Type),
    Modifier integer default 0,
    Attack integer default 0,
    Defense integer default 0
);

create table UnitPromotions_InstantYieldPerReligionFollowerConverted (
    PromotionType text references UnitPromotions(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

create table UnitPromotions_PromotionUpgrade (
    PromotionType text references UnitPromotions(Type),
    JudgePromotionType text references UnitPromotions(Type),
    NewPromotionType text references UnitPromotions(Type)
);
create table UnitPromotions_Promotions (
    FreePromotionType text references UnitPromotions(Type),
    PrePromotionType text references UnitPromotions(Type)
);
create table UnitPromotions_UnitType (
    PromotionType text references UnitPromotions(Type),
    UnitType text references Units(Type)
);
--Must have all needed promotions to unlock Promotion
create table Promotion_PromotionPrereqAnds (
	PromotionType text references UnitPromotions(Type),
	PrereqPromotionType text references UnitPromotions(Type)
);
alter table UnitPromotions add MutuallyExclusiveGroup integer default -1;
--Must any Exclusion promotions will lock Promotion, not two-way
create table Promotion_PromotionExclusionAny (
	PromotionType text references UnitPromotions(Type),
	ExclusionPromotionType text references UnitPromotions(Type)
);
-- Only for check promotion valid
create table Promotion_UnitCombatsPromotionValid (
	PromotionType text references UnitPromotions(Type),
	UnitCombatType text references UnitCombatInfos(Type)
);

alter table UnitPromotions add IgnoreDamageChance integer default 0;
alter table UnitPromotions add CanDoNukeDamage boolean default 0;
alter table UnitPromotions add HPHealedIfDestroyEnemyGlobal integer default 0;
alter table UnitPromotions add RangedFlankAttackModifierPercent integer default 0;
alter table UnitPromotions add TurnDamagePercent integer default 0;
alter table UnitPromotions add TurnDamage integer default 0;
alter table UnitPromotions add AdjacentFriendlySapMovement integer default 0;
alter table UnitPromotions add AdjacentSapExperience integer default 0;
alter table UnitPromotions add RangedFlankAttackModifier integer default 0;
alter table UnitPromotions add PillageReplenishMoves integer default 0;
alter table UnitPromotions add PillageReplenishAttck boolean default 0;
alter table UnitPromotions add PillageReplenishHealth integer default 0;
alter table UnitPromotions add PlagueImmune boolean default 0;
alter table UnitPromotions add RangeSuppressModifier integer default 0;
alter table UnitPromotions add FreeExpPerTurn integer default 0;
alter table UnitPromotions add StayCSInfluencePerTurn integer default 0;
alter table UnitPromotions add StayCSExpPerTurn integer default 0;

-- Add Promotion to other Units in Range, need CustomModOptions PROMOTION_AURA_PROMOTION to make it valid
alter table UnitPromotions add AuraPromotionType text references UnitPromotions(Type);
alter table UnitPromotions add AuraPromotionRange integer default 0;
alter table UnitPromotions add AuraPromotionRangeAIBonus integer default 0;
alter table UnitPromotions add AuraPromotionNoSelf boolean default 0;
-- Only Valid Domain Units can get Promotions
create table Promotion_AuraPromotionDomains (
    -- UnitPromotions.Type
    PromotionType text references UnitPromotions(Type),
    DomainType text references Domains(Type)
);
-- Can be Empty
create table Promotion_AuraPromotionPrePromotionOr (
    -- UnitPromotions.Type
    PromotionType text references UnitPromotions(Type),
    PrePromotionType text references UnitPromotions(Type)
);
-- Add Promotions when providers that have a complex number, at least 1
create table Promotion_AuraPromotionProviderNum (
    PromotionType text references UnitPromotions(Type),
    AuraPromotionType text references UnitPromotions(Type),
    ProviderNum integer default 0
);

-- Allow build from promotion
create table Promotion_Builds (
	PromotionType text references UnitPromotions(Type),
	BuildType text references Builds(Type)
);

create table Promotion_RouteMovementChanges (
	PromotionType text references UnitPromotions(Type),
	RouteType text references Routes(Type),
	MovementChange int default 0
);

-- Only UI
alter table UnitPromotions add ShowInTooltip integer default 1;
alter table UnitPromotions add ShowInPedia integer default 1;
-- Deprecated
alter table UnitPromotions add ExtraMoveTimesXX integer default 0;
alter table UnitPromotions add HeightModLimited integer default 0;