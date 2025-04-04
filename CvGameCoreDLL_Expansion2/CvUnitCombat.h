/*	-------------------------------------------------------------------------------------------------------
	© 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#ifndef CVUNITCOMBAT_H
#define CVUNITCOMBAT_H

#pragma once

#include "CvUnit.h"
#include "CvPlot.h"

// Super Power Fix Damage Struct
struct InflictDamageContext
{
	InflictDamageContext(CvUnit *pAttackerUnit, CvUnit *pDefenderUnit, CvCombatInfo *pCombatInfo, int *piAttackInflictDamage, int *piDefenseInflictDamage)
		: pAttackerUnit(pAttackerUnit), pDefenderUnit(pDefenderUnit), pCombatInfo(pCombatInfo), piAttackInflictDamage(piAttackInflictDamage), piDefenseInflictDamage(piDefenseInflictDamage){}
	InflictDamageContext(CvUnit *pAttackerUnit, CvCity *pDefenderCity, CvCombatInfo *pCombatInfo, int *piAttackInflictDamage, int *piDefenseInflictDamage)
		: pAttackerUnit(pAttackerUnit), pDefenderCity(pDefenderCity), pCombatInfo(pCombatInfo), piAttackInflictDamage(piAttackInflictDamage), piDefenseInflictDamage(piDefenseInflictDamage){}
	InflictDamageContext(CvCity *pAttackerCity, CvUnit *pDefenderUnit, CvCombatInfo *pCombatInfo, int *piAttackInflictDamage, int *piDefenseInflictDamage)
		: pAttackerCity(pAttackerCity), pDefenderUnit(pDefenderUnit), pCombatInfo(pCombatInfo), piAttackInflictDamage(piAttackInflictDamage), piDefenseInflictDamage(piDefenseInflictDamage){}
	
	CvUnit *pAttackerUnit = nullptr;
	CvCity *pAttackerCity = nullptr;
	CvUnit *pDefenderUnit = nullptr;
	CvCity *pDefenderCity = nullptr;

	CvCombatInfo *pCombatInfo = nullptr;

	// output
	int *piAttackInflictDamage = nullptr;
	int *piDefenseInflictDamage = nullptr;
};

// Combat controller for CvUnits
class CvUnitCombat
{
public:
	// Results from requesting an attack
	enum ATTACK_RESULT
	{
	    ATTACK_ABORTED		= 0,			// It was determined that the unit cannot make the attack, no attack was issued.
	    ATTACK_COMPLETED	= 1,			// The unit attacked and resolved the combat immediately
	    ATTACK_QUEUED		= 2				// The unit has queued the attack.  This may have occurred because the defender is busy or the attack is going to be visualized
	};

	enum ATTACK_OPTION
	{
	    ATTACK_OPTION_NONE	= 0,
	    ATTACK_OPTION_NO_DEFENSIVE_SUPPORT = 1
	};

	static void GenerateMeleeCombatInfo(CvUnit& kAttacker, CvUnit* pkDefender, CvPlot& kPlot, CvCombatInfo* pkCombatInfo);
	static void GenerateRangedCombatInfo(CvUnit& kAttacker, CvUnit* pkDefender, CvPlot& kPlot, CvCombatInfo* pkCombatInfo);
	static void GenerateRangedCombatInfo(CvCity& kAttacker, CvUnit* pkDefender, CvPlot& plot, CvCombatInfo* pkCombatInfo);
	static void GenerateAirCombatInfo(CvUnit& kAttacker, CvUnit* pkDefender, CvPlot& kPlot, CvCombatInfo* pkCombatInfo);
	static void GenerateAirSweepCombatInfo(CvUnit& kAttacker, CvUnit* pkDefender, CvPlot& kPlot, CvCombatInfo* pkCombatInfo);
	static void GenerateNuclearCombatInfo(CvUnit& kAttacker, CvPlot& plot, CvCombatInfo* pkCombatInfo);
	
#if defined(MOD_GLOBAL_PARATROOPS_AA_DAMAGE)
	static bool ParadropIntercept(CvUnit& paraUnit, CvPlot& dropPlot);
#endif

	//returns damage times 100
	static int DoDamageMath(int iAttackerStrength100, int iDefenderStrength100, int iDefaultDamage100, int iMaxRandomDamage100, bool bIncludeRand, const CvSeeder& randomSeed, int iModifierPercent);
	static void ResolveCombat(const CvCombatInfo& kInfo, uint uiParentEventID = 0);

	static ATTACK_RESULT Attack(CvUnit& kAttacker, CvPlot& targetPlot, ATTACK_OPTION eOption);
	static ATTACK_RESULT AttackRanged(CvUnit& kAttacker, int iX, int iY, ATTACK_OPTION eOption);
	static ATTACK_RESULT AttackAir(CvUnit& kAttacker, CvPlot& targetPlot, ATTACK_OPTION eOption);
	static ATTACK_RESULT AttackAirSweep(CvUnit& kAttacker, CvPlot& targetPlot, ATTACK_OPTION eOption);
	static ATTACK_RESULT AttackCity(CvUnit& kAttacker, CvPlot& plot, ATTACK_OPTION eOption);
	static ATTACK_RESULT AttackNuclear(CvUnit& kAttacker, int iX, int iY, ATTACK_OPTION eOption);

	//	Return a ranged unit that will defend the supplied location against the attacker at the specified location.
	static CvUnit*		GetFireSupportUnit(PlayerTypes eDefender, int iDefendX, int iDefendY, int iAttackX, int iAttackY);
	static uint			ApplyNuclearExplosionDamage(CvPlot* pkTargetPlot, int iDamageLevel, CvUnit* pkAttacker = NULL);

protected:
	static void ResolveRangedUnitVsCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveRangedCityVsUnitCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveMeleeCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveCityMeleeCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveAirUnitVsCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveAirSweep(const CvCombatInfo& kCombatInfo, uint uiParentEventID);
	static void ResolveNuclearCombat(const CvCombatInfo& kCombatInfo, uint uiParentEventID);

	static int GenerateNuclearExplosionDamage(CvPlot* pkTargetPlot, int iDamageLevel, CvUnit* pkAttacker, CvCombatMemberEntry* pkDamageArray, const int iMaxDamageMembers);
	static uint ApplyNuclearExplosionDamage(const CvCombatMemberEntry* pkDamageArray, int iDamageMembers, CvUnit* pkAttacker, CvPlot* pkTargetPlot, int iDamageLevel);

#ifdef MOD_NEW_BATTLE_EFFECTS
	static void DoNewBattleEffects(const CvCombatInfo& kInfo, int iAttackDamage = 0);
	static bool ShouldDoNewBattleEffects(const CvCombatInfo& kInfo);
	//static void DoNukeDamage(const CvCombatInfo& kInfo);
	static void DoSplashDamage(const CvCombatInfo& kInfo);
	static void DoCollateralDamage(const CvCombatInfo& kInfo);
	static void DoAddEnemyPromotions(const CvCombatInfo& kInfo);
	static void DoDestroyBuildings(const CvCombatInfo& kInfo);
	static void DoKillCitizens(const CvCombatInfo& kInfo);
	static void DoStackingFightBack(const CvCombatInfo& kInfo);
	static void DoStopAttacker(const CvCombatInfo& kInfo);
	static void DoHeavyChargeEffects(CvUnit* attacker, CvUnit* defender, CvPlot* battlePlot);
#endif
	static void InterveneInflictDamage(InflictDamageContext* ctx);

public:
	static void ApplyPostKillTraitEffects(CvUnit* pkWinner, CvUnit* pkLoser);
	static void ApplyPostCityCombatEffects(CvUnit* pkAttacker, CvCity* pkDefender, int iAttackerDamageInflicted);
	static void ApplyExtraUnitDamage(CvUnit* pkAttacker, const CvCombatInfo& kCombatInfo, uint uiParentEventID);
};

#endif // CVUNITCOMBAT_H