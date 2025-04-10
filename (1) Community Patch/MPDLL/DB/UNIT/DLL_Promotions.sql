ALTER TABLE UnitPromotions ADD COLUMN 'MaintenanceCost' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'NoResourcePunishment' BOOLEAN DEFAULT 0;
-- SP-TODO: Error Spell Name MoveLfetAttackMod -> MoveLeftAttackMod
ALTER TABLE UnitPromotions ADD COLUMN 'MoveLeftAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MoveUsedAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MoveLeftDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MoveUsedDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'GoldenAgeMod' INTEGER DEFAULT 0;
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
ALTER TABLE UnitPromotions ADD 'MeleeDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'DoFallBackAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'BeFallBackDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumOriginalCapitalAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NumOriginalCapitalDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OnCapitalLandAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OutsideCapitalLandAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OnCapitalLandDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OutsideCapitalLandDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CurrentHitPointAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CurrentHitPointDefenseMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearNumEnemyAttackMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'NearNumEnemyDefenseMod' INTEGER DEFAULT 0;
CREATE TABLE IF NOT EXISTS UnitPromotions_PromotionModifiers (
    `PromotionType` TEXT DEFAULT '',
    `OtherPromotionType` TEXT DEFAULT '',
    `Modifier` INTEGER DEFAULT 0 NOT NULL,
    `Attack` INTEGER DEFAULT 0 NOT NULL,
    `Defense` INTEGER DEFAULT 0 NOT NULL
);

ALTER TABLE UnitPromotions ADD COLUMN 'PromotionPrereqOr10' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD COLUMN 'PromotionPrereqOr11' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD COLUMN 'PromotionPrereqOr12' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD COLUMN 'PromotionPrereqOr13' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'ImmueMeleeAttack' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'CannotBeRangedAttacked' BOOLEAN DEFAULT 0 NOT NULL; 
ALTER TABLE UnitPromotions ADD COLUMN 'IgnoreDamageChance' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'IsCanParadropUnLimit' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AllyCityStateCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AllyCityStateCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD COLUMN 'CanDoNukeDamage' BOOLEAN DEFAULT 0; 
ALTER TABLE UnitPromotions ADD 'CanPlunderWithoutWar' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'ExtraResourceType' TEXT DEFAULT NULL;;
ALTER TABLE UnitPromotions ADD COLUMN 'ExtraResourceCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'ExtraResourceCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD COLUMN 'ExtraHappinessCombatModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'ExtraHappinessCombatModifierMax' INTEGER DEFAULT -1;
ALTER TABLE UnitPromotions ADD COLUMN 'GetGroundAttackRange' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'NearbyUnitPromotionBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'NearbyUnitPromotionBonusRange' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'CombatBonusFromNearbyUnitPromotion' TEXT NOT NULL REFERENCES UnitPromotions(Type);
ALTER TABLE UnitPromotions ADD 'HPHealedIfDestroyEnemyGlobal' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CanParadropAnyWhere' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangedFlankAttackModifierPercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'FeatureInvisible' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'FeatureInvisible2' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'MultipleInitExperence' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'LostAllMovesAttackCity'  INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CarrierEXPGivenModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'UnitAttackFaithBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'CityAttackFaithBonus' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'RemovePromotionUpgrade' TEXT DEFAULT NULL;
ALTER TABLE UnitPromotions ADD 'ExtraMoveTimesXX' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'RangeAttackCostModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'AttackChanceFromAttackDamage' TEXT REFERENCES LuaFormula(Type);
ALTER TABLE UnitPromotions ADD 'MovementFromAttackDamage' TEXT REFERENCES LuaFormula(Type);
ALTER TABLE UnitPromotions ADD 'HealPercentFromAttackDamage' TEXT REFERENCES LuaFormula(Type);
ALTER TABLE UnitPromotions ADD 'CaptureDefeatedEnemyChance' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OriginalCapitalDamageFix' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD 'OriginalCapitalSpecialDamageFix' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'TurnDamagePercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'TurnDamage' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AdjacentFriendlySapMovement' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AdjacentSapExperience' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangedFlankAttackModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'ShowInTooltip' INTEGER DEFAULT 1;
ALTER TABLE UnitPromotions ADD COLUMN 'ShowInPedia' INTEGER DEFAULT 1;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishMoves' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishAttck'  BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PillageReplenishHealth' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'PlagueImmune' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'HeightModPerX' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'HeightModLimited' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'InsightEnemyDamageModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MovePercentCaptureCity' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'HealPercentCaptureCity' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'CaptureEmenyPercent' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'CaptureEmenyExtraMax' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MeleeAttackModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'WoundedMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'RangeSuppressModifier' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'Immobile' BOOLEAN DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'MilitaryMightMod' INTEGER DEFAULT 0;

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

create table UnitPromotions_Promotions (
    FreePromotionType text references UnitPromotions(Type),
    PrePromotionType text references UnitPromotions(Type)
);
--Must have all needed promotions to unlock Promotion
CREATE TABLE Promotion_PromotionPrereqAnds (
	PromotionType text REFERENCES UnitPromotions(Type),
	PrereqPromotionType text REFERENCES UnitPromotions(Type)
);
--Must any Exclusion promotions will lock Promotion，not two-way
CREATE TABLE Promotion_PromotionExclusionAny (
	PromotionType text REFERENCES UnitPromotions(Type),
	ExclusionPromotionType text REFERENCES UnitPromotions(Type)
);

CREATE TABLE IF NOT EXISTS UnitPromotions_PromotionUpgrade (
    `PromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `JudgePromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `NewPromotionType` TEXT DEFAULT '' references UnitPromotions(Type)
);
CREATE TABLE IF NOT EXISTS UnitPromotions_UnitType (
    `PromotionType` TEXT DEFAULT '' references UnitPromotions(Type),
    `UnitType` TEXT DEFAULT '' references Units(Type)
);

--InterceptionDamageMod/AirSweepDamageMod
ALTER TABLE UnitPromotions ADD COLUMN 'InterceptionDamageMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD COLUMN 'AirSweepDamageMod' INTEGER DEFAULT 0;
ALTER TABLE UnitPromotions ADD MutuallyExclusiveGroup INTEGER DEFAULT -1;

CREATE TABLE "Promotion_RouteMovementChanges" (
	'PromotionType'	text no null references UnitPromotions(Type),
	'RouteType'	text no null references Routes(Type),
	'MovementChange' int default 0 not null
);