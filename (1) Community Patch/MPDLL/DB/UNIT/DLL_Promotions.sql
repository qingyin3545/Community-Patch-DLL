ALTER TABLE UnitPromotions ADD 'MaintenanceCost' INTEGER DEFAULT 0;
-- SP-TODO: Column Name MultipleInitExperence -> MultipleInitExperience
ALTER TABLE UnitPromotions ADD 'MultipleInitExperience' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'RangeAttackCostModifier' INTEGER DEFAULT 0;
-- Implemented by CP
ALTER TABLE UnitPromotions ADD 'CaptureDefeatedEnemyChance' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MovePercentCaptureCity' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'HealPercentCaptureCity' INTEGER DEFAULT 0;
-- Is a Counter, it is valid when LostAllMovesAttackCity > 0
ALTER TABLE UnitPromotions ADD 'LostAllMovesAttackCity' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CaptureEmenyPercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CaptureEmenyExtraMax' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CarrierEXPGivenModifier' INTEGER DEFAULT 0;
-- SP-TODO: Column Name UnitAttackFaithBonus -> DamageUnitFaithBonus
ALTER TABLE UnitPromotions ADD 'DamageUnitFaithBonus' INTEGER DEFAULT 0;
-- SP-TODO: Column Name CityAttackFaithBonus -> DamageCityFaithBonus
ALTER TABLE UnitPromotions ADD 'DamageCityFaithBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OriginalCapitalDamageFix' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OriginalCapitalSpecialDamageFix' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'InsightEnemyDamageModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MilitaryMightMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NoResourcePunishment' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'ImmueMeleeAttack' BOOLEAN DEFAULT 0;
-- SP-TODO: Column Name CannotBeRangedAttacked -> ImmueRangedAttack
ALTER TABLE UnitPromotions ADD 'ImmueRangedAttack' BOOLEAN DEFAULT 0 NOT NULL; 
-- SP-TODO: Column Name IsCanParadropUnLimit -> CanParadropMoved
ALTER TABLE UnitPromotions ADD 'CanParadropMoved' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CanParadropAnyWhere' BOOLEAN DEFAULT 0;
-- SP-TODO: Column Name CanPlunderWithoutWar -> CanPillageWithoutWar
ALTER TABLE UnitPromotions ADD 'CanPillageWithoutWar' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'Immobile' BOOLEAN DEFAULT 0;
-- SP-TODO: Error Spell Name MoveLfetAttackMod -> MoveLeftAttackMod
ALTER TABLE UnitPromotions ADD 'MoveLeftAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MoveUsedAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MoveLeftDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MoveUsedDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'GoldenAgeMod' INTEGER DEFAULT 0;
-- SP-TODO: Lua Interface Changed
ALTER TABLE UnitPromotions ADD 'AntiHigherPopMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumAttacksMadeThisTurnAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumSpyDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumSpyAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumWonderDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumWonderAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumWorkDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumWorkAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumSpyStayDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumSpyStayAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'RangedSupportFireMod' INTEGER DEFAULT 0;
-- SP-TODO: Column Name MeleeAttackModfier -> MeleeAttackMod
ALTER TABLE UnitPromotions ADD 'MeleeAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'MeleeDefenseMod' INTEGER DEFAULT 0;
-- SP-TODO: Lua Interface Changed
ALTER TABLE UnitPromotions ADD 'DoFallBackAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'BeFallBackDefenseMod' INTEGER DEFAULT 0;
-- SP_TODO: Lua Interface Changed && Content Changed
ALTER TABLE UnitPromotions ADD 'NumOriginalCapitalAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumOriginalCapitalDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OnCapitalLandAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OutsideCapitalLandAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OnCapitalLandDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OutsideCapitalLandDefenseMod' INTEGER DEFAULT 0;
-- SP-TODO: Column Name CurrentHitPoint -> LostHitPoint
ALTER TABLE UnitPromotions ADD 'LostHitPointAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'LostHitPointDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearNumEnemyAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearNumEnemyDefenseMod' INTEGER DEFAULT 0;
-- SP-TODO: HeightModPerX -> HeightAdvantageAttckMod
ALTER TABLE UnitPromotions ADD 'HeightAdvantageAttckMod' INTEGER DEFAULT 0;
INSERT INTO Defines(Name, Value) VALUES('HIGHT_MOD_MAX_ADVANTAGE', 2);
ALTER TABLE UnitPromotions ADD 'WoundedMod' INTEGER DEFAULT 0;
-- Only for Lua
ALTER TABLE UnitPromotions ADD 'InterceptionDamageMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'AirSweepDamageMod' INTEGER DEFAULT 0;
-- SP-TODO: Lua Interface Changed
ALTER TABLE UnitPromotions ADD 'AllyCityStateCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'AllyCityStateCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD 'ExtraHappinessCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'ExtraHappinessCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD 'ExtraResourceType' TEXT DEFAULT NULL;;
ALTER TABLE UnitPromotions ADD 'ExtraResourceCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'ExtraResourceCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD 'NearbyUnitPromotionBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearbyUnitPromotionBonusRange' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearbyUnitPromotionBonusMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD 'CombatBonusFromNearbyUnitPromotion' TEXT REFERENCES UnitPromotions(Type);
ALTER TABLE UnitPromotions ADD 'RemovePromotionUpgrade' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'PromotionPrereqOr10' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'PromotionPrereqOr11' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'PromotionPrereqOr12' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'PromotionPrereqOr13' TEXT DEFAULT NULL;
-- Promotions effect that Unit can only have one
ALTER TABLE UnitPromotions ADD 'AttackChanceFromAttackDamage' TEXT REFERENCES LuaFormula(Type);
ALTER TABLE UnitPromotions ADD 'MovementFromAttackDamage' TEXT REFERENCES LuaFormula(Type);
ALTER TABLE UnitPromotions ADD 'HealPercentFromAttackDamage' TEXT REFERENCES LuaFormula(Type);

ALTER TABLE UnitPromotions ADD 'FeatureInvisible' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'FeatureInvisible2' TEXT DEFAULT NULL;
CREATE TABLE IF NOT EXISTS UnitPromotions_FeatureInvisible (
    `PromotionType` TEXT DEFAULT '',
    `FeatureType` TEXT DEFAULT ''
);

CREATE TABLE IF NOT EXISTS UnitPromotions_PromotionModifiers (
    `PromotionType` TEXT DEFAULT '',
    `OtherPromotionType` TEXT DEFAULT '',
    `Modifier` INTEGER DEFAULT 0 NOT NULL,
    `Attack` INTEGER DEFAULT 0 NOT NULL,
    `Defense` INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE IF NOT EXISTS UnitPromotions_PromotionUpgrade (
    `PromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `JudgePromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `NewPromotionType` TEXT DEFAULT '' references UnitPromotions(Type)
);
create table UnitPromotions_Promotions (
    FreePromotionType text references UnitPromotions(Type),
    PrePromotionType text references UnitPromotions(Type)
);
CREATE TABLE IF NOT EXISTS UnitPromotions_UnitType (
    `PromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `UnitType` TEXT DEFAULT '' references Units(Type)
);
--Must have all needed promotions to unlock Promotion
CREATE TABLE Promotion_PromotionPrereqAnds (
	PromotionType text REFERENCES UnitPromotions(Type),
	PrereqPromotionType text REFERENCES UnitPromotions(Type)
);
ALTER TABLE UnitPromotions ADD MutuallyExclusiveGroup INTEGER DEFAULT -1;
--Must any Exclusion promotions will lock Promotion, not two-way
CREATE TABLE Promotion_PromotionExclusionAny (
	PromotionType text REFERENCES UnitPromotions(Type),
	ExclusionPromotionType text REFERENCES UnitPromotions(Type)
);
-- Only for check promotion valid
CREATE TABLE Promotion_UnitCombatsPromotionValid (
	PromotionType text REFERENCES UnitPromotions(Type),
	UnitCombatType text REFERENCES UnitCombatInfos(Type)
);

ALTER TABLE UnitPromotions ADD COLUMN 'IgnoreDamageChance' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'CanDoNukeDamage' BOOLEAN DEFAULT 0; 
ALTER TABLE UnitPromotions ADD COLUMN 'GetGroundAttackRange' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'HPHealedIfDestroyEnemyGlobal' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangedFlankAttackModifierPercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'TurnDamagePercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'TurnDamage' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AdjacentFriendlySapMovement' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AdjacentSapExperience' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangedFlankAttackModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishMoves' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishAttck'  BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishHealth' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PlagueImmune' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangeSuppressModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'FreeExpPerTurn' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'StayCSInfluencePerTurn' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'StayCSExpPerTurn' INTEGER DEFAULT 0;

CREATE TABLE IF NOT EXISTS UnitPromotions_InstantYieldPerReligionFollowerConverted (
    `PromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `YieldType` TEXT DEFAULT '' references Yields(Type),
    `Yield` INTEGER DEFAULT 0
);

-- Add Promotion to other Units in Range, need CustomModOptions PROMOTION_AURA_PROMOTION to make it valid
ALTER TABLE UnitPromotions ADD COLUMN 'AuraPromotionType' TEXT DEFAULT NULL REFERENCES UnitPromotions(Type);
ALTER TABLE UnitPromotions ADD COLUMN 'AuraPromotionRange' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AuraPromotionRangeAIBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AuraPromotionNoSelf' BOOLEAN DEFAULT 0;
-- Only Valid Domain Units can get Promotions
CREATE TABLE Promotion_AuraPromotionDomains (
    -- UnitPromotions.Type
    `PromotionType` TEXT DEFAULT '' REFERENCES UnitPromotions(Type),
    'DomainType' TEXT REFERENCES Domains(Type)
);
-- Can be Empty
CREATE TABLE Promotion_AuraPromotionPrePromotionOr (
    -- UnitPromotions.Type
    `PromotionType` TEXT DEFAULT '' REFERENCES UnitPromotions(Type),
    `PrePromotionType` TEXT DEFAULT '' REFERENCES UnitPromotions(Type)
);
-- Add Promotions when providers that have a complex number, at least 1
CREATE TABLE Promotion_AuraPromotionProviderNum (
    `PromotionType` TEXT DEFAULT '' REFERENCES UnitPromotions(Type),
    `AuraPromotionType` TEXT DEFAULT '' REFERENCES UnitPromotions(Type),
    'ProviderNum' INTEGER DEFAULT 0
);

-- Allow build from promotion
CREATE TABLE Promotion_Builds (
	PromotionType text REFERENCES UnitPromotions(Type),
	BuildType text REFERENCES Builds(Type)
);

CREATE TABLE Promotion_RouteMovementChanges (
	'PromotionType'	text no null references UnitPromotions(Type),
	'RouteType'	text no null references Routes(Type),
	'MovementChange' int default 0 not null
);

-- Only UI
ALTER TABLE UnitPromotions ADD 'ShowInTooltip' INTEGER DEFAULT 1;
ALTER TABLE UnitPromotions ADD 'ShowInPedia' INTEGER DEFAULT 1;
-- Deprecated
ALTER TABLE UnitPromotions ADD 'ExtraMoveTimesXX' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'HeightModLimited' INTEGER DEFAULT 0;