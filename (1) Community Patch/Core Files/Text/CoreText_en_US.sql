--Texts for New Wonder and Building Production Modifiers, either by Trait, Improvement or UnitPromotion, among others
INSERT INTO Language_en_US
			(Tag,															Text)
VALUES		('TXT_KEY_PRODMOD_WONDER_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]Unit Garrison Modifier for Wonders: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_UNIT_TRAIT',			'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Unit Garrison: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_IMPROVEMENT_TRAIT',	'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Improvements: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_POLICY_TRAIT',		'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Policies: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RELIGION_TRAIT',		'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Beliefs: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RESOURCE_TRAIT',		'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Resources: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_PLAYER_TRAIT',		'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from Player Traits: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_CITY_TRAIT',			'[NEWLINE][ICON_BULLET]Trait Wonder Production Modifier for Buildings from City: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_IMPROVEMENT',							'[NEWLINE][ICON_BULLET]Improvement Modifier for Wonders: {1_Num}%'),
			('TXT_KEY_RELIGION_TOOLTIP_EXTENDED',							'{1_ReligionIcon} {2_NumFollowers} Followers ({3_TotalPressure} + {4_PressurePerTurn} Pressure from {5_Num} Source Cities)'),
			('TXT_KEY_EUPANEL_EMBARKATION_DEFENSE',							'Embarkation Defense'),
			('TXT_KEY_EUPANEL_UNITCLASS_NEAR',								'Near Unit'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_COMBAT_BONUS',				'Bonus from Nearby Unit'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_CITY_COMBAT_BONUS',			'Near City'),
			('TXT_KEY_PRODMOD_MILITARY_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]Unit Garrison Modifier for Military Units: {1_Num}%'),
			('TXT_KEY_PRODMOD_YIELD_UNITPROMOTION',							'[NEWLINE][ICON_BULLET]City Modifier from Unit Garrison: {1_Num}%'),
			('TXT_KEY_NOTIFICATION_CULTURE_UNIT',							'The birth of a {1_Resource:textkey} causes a Culture Boost in your Empire!'),
			('TXT_KEY_NOTIFICATION_SUMMARY_CULTURE_UNIT',					'A {1_Resource:textkey} has brought inspiration!');

-- Game Options

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS',		'Barbarian GG/GA Points'),
		('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS_HELP',	'Allows all players to accumulate Great General and Great Admiral points from fighting Barbarians.');

UPDATE Language_en_US
SET Text = 'Each time the game is loaded, the random number seed is regenerated. This means that if you reload the game, some randomized results and AI decisions might be different from the first time you played.'
WHERE Tag = 'TXT_KEY_GAME_OPTION_NEW_RANDOM_SEED_HELP';

-- Advisors
UPDATE Language_en_US
SET Text = 'I''m not sure if the {1_LongCivName:textkey} has an army at all. Any hostilities with them would be laughably one-sided.'
WHERE Tag = 'TXT_KEY_DIPLOSTRATEGY_MILITARY_STRENGTH_COMPARED_TO_US_PATHETIC';

-- Leaders

-- Assyria UA
INSERT INTO Language_en_US
		(Tag,										Text)
SELECT	'TXT_KEY_SCIENCE_BOOST_CONQUEST_ASSYRIA',	'Your soldiers found [ICON_RESEARCH] Science during the conquest of {1_Name}!'
WHERE EXISTS (SELECT * FROM CustomModOptions WHERE Name='ALTERNATE_ASSYRIA_TRAIT' AND Value= 1 );


-- Cities

-- Razing
UPDATE Language_en_US	
SET Text = '[COLOR_POSITIVE_TEXT]Razing[ENDCOLOR] The City will burn [ICON_RAZING] down each turn until it reaches 0 population, and is removed from the game. This produces a lot of [ICON_HAPPINESS_4] Unhappiness, but also increases your [COLOR_POSITIVE_TEXT]War Score[ENDCOLOR] versus this player.'
WHERE Tag = 'TXT_KEY_POPUP_CITY_CAPTURE_INFO_RAZE';

-- Production Queue
UPDATE Language_en_US
SET Text = 'LEFT CLICK adds an additional item to the end of the production queue.[NEWLINE]CTRL + LEFT CLICK adds an additional item in front of the production queue.[NEWLINE]ALT + LEFT CLICK adds the chosen item to the end of the production queue on repeat.[NEWLINE]SHIFT + LEFT CLICK replaces everything in the production queue with the chosen item.'
WHERE Tag = 'TXT_KEY_CITYVIEW_QUEUE_PROD_TT';

-- Avoid Growth
UPDATE Language_en_US
SET Text = 'Click here to stop this city from growing in [ICON_CITIZEN] Population.'
WHERE Tag = 'TXT_KEY_CITYVIEW_FOCUS_AVOID_GROWTH_TT';

-- All Growth Modifier Tooltips with Icons
UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET][ICON_CONNECTED] Empire Modifier: {1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_PLAYER';

UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET][ICON_RELIGION_PANTHEON] Religious Beliefs Modifier: {1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_RELIGION';

UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET][ICON_HAPPINESS_1] "We Love the King Day" Modifier: {1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_WLTKD';


-- Units

-- Movement
UPDATE Language_en_US
SET Text = 'MOVE UNIT'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT';

UPDATE Language_en_US
SET Text = 'Move a unit to a tile where it can end the turn.'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT_TT';

UPDATE Language_en_US
SET Text = 'Allows land units to embark and cross water Tiles.'
WHERE Tag = 'TXT_KEY_ALLOWS_EMBARKING';

-- Capture Chance
UPDATE Language_en_US
SET Text = '[COLOR_CYAN]Capture chance if defeated[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_EUPANEL_CAPTURE_CHANCE';

-- Interception
UPDATE Language_en_US
SET Text = '[COLOR_WARNING_TEXT]{1_Number} Interceptors![ENDCOLOR]'
WHERE Tag = 'TXT_KEY_EUPANEL_VISIBLE_AA_UNITS';

-- Great Generals I/II Promotions
UPDATE Language_en_US
SET Text = 'Generates 50% [COLOR_POSITIVE_TEXT]more[ENDCOLOR] [ICON_GREAT_GENERAL] Great General Points from combat.'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_I_HELP';

UPDATE Language_en_US
SET Text = 'Generates 100% [COLOR_POSITIVE_TEXT]more[ENDCOLOR] [ICON_GREAT_GENERAL] Great General Points from combat.'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_II_HELP';

-- Naval Melee Units
UPDATE Language_en_US
SET Text = 'The Trireme is the first naval unit available to civilizations in the game. It is a melee attack unit, engaging units at sea or cities (but it has no ranged attack). The Trireme is useful for clearing barbarian ships out of home waters and for limited exploration (it cannot end its turn on Deep Ocean hexes outside of the city borders unless it is from Polynesia).'
WHERE Tag = 'TXT_KEY_UNIT_TRIREME_STRATEGY';

-- Naval Ranged Units
UPDATE Language_en_US
SET Text = 'The Galleass is the first naval unit with a ranged attack generally available to the civilizations in the game. It is much stronger than earlier naval units but a bit slower. It cannot initiate melee combat. The Galleass is useful for clearing enemy ships out of shallow waters. It cannot end its turn on Deep Ocean hexes unless it is from Polynesia.'
WHERE Tag = 'TXT_KEY_UNIT_GALLEASS_STRATEGY';

-- Ocean travel change
UPDATE Language_en_US
SET Text = 'Cannot End Turn on Ocean Tile'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE';

INSERT INTO Language_en_US
		(Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP', 'Can never end turn on an Ocean Tile. May move through visible Ocean Tiles if ending on a visible Coast Tile.');

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP'
WHERE Type = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Language_en_US
SET Text = 'Cannot End Turn on Ocean Tile until Astronomy'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO';

UPDATE Language_en_US
SET Text = 'Cannot end turn on an Ocean Tile until you have researched [COLOR_POSITIVE_TEXT]Astronomy[ENDCOLOR]. May move through visible Ocean Tiles if ending on a visible Coast Tile.'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO_HELP';

-- Siege Units
UPDATE Language_en_US
SET Text = 'Moves at half-speed in enemy territory'
WHERE Tag = 'TXT_KEY_PROMOTION_MUST_SET_UP';

UPDATE Language_en_US
SET Text = 'Moves at half-speed in enemy territory'
WHERE Tag = 'TXT_KEY_PEDIA_PROMOTION_MUST_SET_UP';

UPDATE Language_en_US
SET Text = 'First siege Unit of the game. Does major damage to Units and Cities from a distance. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CATAPULT';

UPDATE Language_en_US
SET Text = 'The Catapult is a siege weapon, extremely useful when assaulting early enemy cities. It is slow and extremely vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field. It moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_CATAPULT_STRATEGY';

UPDATE Language_en_US
SET Text = 'Siege Unit that does major damage from a distance. Moves at half-speed in enemy territory. Only the Romans may build it. This Unit has a higher [ICON_RANGE_STRENGTH] Ranged Combat Strength than the Catapult, which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';

UPDATE Language_en_US
SET Text = 'The Ballista is a Roman unique unit that is more powerful than the Catapult it replaces. It is an excellent siege weapon and extremely useful against cities, but it is quite vulnerable to attack. Be sure to protect the Ballista with other military units. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_BALLISTA_STRATEGY';

UPDATE Language_en_US
SET Text = 'Powerful Medieval Siege Unit, good at reducing the defenses of enemy Cities. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_TREBUCHET';

UPDATE Language_en_US
SET Text = 'A Trebuchet is a medieval siege weapon, significantly more powerful than the earlier Catapult units. The Trebuchet moves at half-speed in enemy territory, but once it is in position it can do serious damage to a fortified enemy city. Defend your trebuchets with melee and ranged units to keep enemy units from getting too close.'
WHERE Tag = 'TXT_KEY_UNIT_TREBUCHET_STRATEGY';

UPDATE Language_en_US
SET Text = 'Anti-personnel rocket unit of the Medieval Era. Strong against land units, but weak against cities. Only Korea may build it. Replaces the Trebuchet. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP';

UPDATE Language_en_US
SET Text = 'The Hwach''a is extremely effective against enemy land units. It is slow and vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field. The Hwach''a moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_en_US
SET Text = 'Powerful Renaissance Era Siege Unit. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CANNON';

UPDATE Language_en_US
SET Text = 'The Cannon is an important mid-game siege unit, devastating against civilizations which have not yet acquired them. Like other siege units, the Cannon moves at half-speed in enemy territory. The Cannon remains potent into the Industrial Era. It cannot see as far as other units, and should be protected with melee units.'
WHERE Tag = 'TXT_KEY_UNIT_CANNON_STRATEGY';

UPDATE Language_en_US
SET Text = 'The first Siege Unit in the game capable of firing 3 tiles away. Moves at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ARTILLERY';

UPDATE Language_en_US
SET Text = 'Artillery is a deadly siege weapon, more powerful than a Cannon and with a longer range. Like the Cannon, it has limited visibility and moves at half-speed in enemy territory, but its Ranged Combat strength is tremendous. Artillery also has the "indirect fire" ability, allowing it to shoot over obstructions at targets it cannot see (as long as other friendly units can see them). Like other siege weapons, Artillery is vulnerable to melee attack.'
WHERE Tag = 'TXT_KEY_UNIT_ARTILLERY_STRATEGY';

UPDATE Language_en_US
SET Text = 'Fast Siege Unit of the late-game. Unlike other Siege Units, it does not move at half-speed in enemy territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ROCKET_ARTILLERY';

UPDATE Language_en_US
SET Text = 'Rocket Artillery is an extremely powerful siege weapon, far superior to the standard artillery. Rocket Artillery does not lose speed in enemy territory, making it much quicker than earlier guns. Although the Rocket Artillery''s sight range is limited, it can use indirect fire to attack targets it cannot see (as long as other friendly units can see them). Like all artillery, it is vulnerable to infantry or armor attack, and should be defended by appropriate units.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';

-- Giant Death Robot
UPDATE Language_en_US
SET Text = 'Doesn''t benefit from defensive terrain bonuses, but is otherwise stronger than any other military unit in the game.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MECH';


-- Buildings

-- "Votes from World Wonders" -> "Votes from Wonders"
UPDATE Language_en_US
SET Text = '[NEWLINE][ICON_BULLET]{1_NumVotes} from Wonders'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_MEMBER_DETAILS_WONDER_VOTES';

-- National Wonders
UPDATE Language_en_US
SET Text = 'Provides additional spies based on a fraction of the number of City-States, and levels up all your existing spies. Also provides a 15% reduction in enemy spy effectiveness. Must have a Police Station in all cities.'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';

UPDATE Language_en_US
SET Text = 'An important defensive National Wonder for a technology-driven civilization. The National Intelligence Agency provides additional spies, levels up all your existing spies, and provides a 15% reduction in enemy spy effectiveness. A civilization must have a Police Station in all cities before it can construct the National Intelligence Agency.'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_STRATEGY';


-- Tile Yields

UPDATE Language_en_US	
SET Text = 'Base Yield:'
WHERE Tag = 'TXT_KEY_PEDIA_YIELD_LABEL';

UPDATE Language_en_US	
SET Text = 'Connected By:'
WHERE Tag = 'TXT_KEY_PEDIA_IMPROVEMENTS_LABEL';

UPDATE Language_en_US
SET Text = '{@1_ImprovementDescription}: +{3_Yield} {4_Icon} {@2_YieldDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_YIELDCHANGES';

UPDATE Language_en_US
SET Text = '{1_ImprovementName:textkey}: +{3_Num} {2_YieldType:textkey} (Not Fresh Water).'
WHERE Tag = 'TXT_KEY_NO_FRESH_WATER';

UPDATE Language_en_US
SET Text = '(Not Fresh Water)'
WHERE Tag = 'TXT_KEY_ABLTY_NO_FRESH_WATER_STRING';

UPDATE Language_en_US
SET Text = '{@1_ImprovementDescription}: +{3_Yield} {4_Icon} {@2_YieldDescription} {TXT_KEY_ABLTY_NO_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_NOFRESHWATERYIELDCHANGES';

UPDATE Language_en_US
SET Text = '{1_ImprovementName:textkey}: +{3_Num} {2_YieldType:textkey} (Fresh Water).'
WHERE Tag = 'TXT_KEY_FRESH_WATER';

UPDATE Language_en_US
SET Text = '(Fresh Water)'
WHERE Tag = 'TXT_KEY_ABLTY_FRESH_WATER_STRING';

UPDATE Language_en_US
SET Text = '{@1_ImprovementDescription}: +{3_Yield} {4_Icon} {@2_YieldDescription} {TXT_KEY_ABLTY_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_FRESHWATERYIELDCHANGES';

UPDATE Language_en_US
SET Text = '{TXT_KEY_ABLTY_FASTER_MOVEMENT_STRING} {@1_RouteDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_MOVEMENT';


-- Improvements

UPDATE Language_en_US
SET Text = 'A Citadel is a mighty fortification that can only be constructed by a Great General. You can construct a Citadel anywhere within your territory.[NEWLINE][NEWLINE]Upon constructing the Citadel, your Culture borders will also expand to surround the Citadel on all sides by one hex. If the new Culture border claims hexes already owned by another civilization, you will incur a diplomatic penalty as a result. Any unit stationed within a Citadel receives a 100% defensive strength bonus. Additionally, any enemy unit which ends its turn next to a Citadel takes 30 damage (damage does not stack with other Citadels).[NEWLINE][NEWLINE] The Acropolis in Athens, Greece, is an example of an early powerful Citadel. Such structures were almost impossible to take by direct attack, and they were capable of withstanding protracted sieges before they fell.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_CITADEL_TEXT';

UPDATE Language_en_US
SET Text = 'Adds a Moai (+1 [ICON_CULTURE] Culture) to the tile. Generates +1 [ICON_CULTURE] Culture for each adjacent Moai. Also provides +1 [ICON_GOLD] Gold after Flight is researched. Can only be built adjacent to water.'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_en_US
SET Text = 'Moai can only be built adjacent to water. If built next to another Moai, it provides additional [ICON_CULTURE] Culture. After the Flight technology is researched it also provides extra [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';


-- CS Stuff

-- Merchant of Venice
UPDATE Language_en_US
SET Text = 'The Merchant of Venice will use his considerable wealth to purchase a City-State and place it under your control as a [ICON_PUPPET] Puppet City. You will also gain control over all of the City-State''s existing units.'
WHERE Tag = 'TXT_KEY_MISSION_BUY_CITY_STATE_HELP';

UPDATE Language_en_US
SET Text = 'Your Merchant of Venice bought a City-State!'
WHERE Tag = 'TXT_KEY_VENETIAN_MERCHANT_BOUGHT_CITY_STATE';

-- Militaristic UU Tooltip
UPDATE Language_en_US
SET Text = 'A befriended [COLOR_POSITIVE_TEXT]Militaristic[ENDCOLOR] City-State will provide you occasional gifts of advanced military units.[NEWLINE][NEWLINE]They know the secrets of the [COLOR_POSITIVE_TEXT]{@1_UniqueUnitName}[ENDCOLOR].  If you are their Ally and have researched [COLOR_CYAN]{@2_PrereqTech}[ENDCOLOR], they will provide that unit as their gift.'
WHERE Tag = 'TXT_KEY_CITY_STATE_MILITARISTIC_TT';

-- Bullying/Tribute
UPDATE Language_en_US
SET Text = 'Enslave {@1_Unit} - lose {2_NumInfluence} [ICON_INFLUENCE] Influence'
WHERE Tag = 'TXT_KEY_POPUP_MINOR_BULLY_UNIT_AMOUNT';

UPDATE Language_en_US
SET Text = 'If this City-State is more [COLOR_POSITIVE_TEXT]afraid[ENDCOLOR] of you than they are [COLOR_WARNING_TEXT]resilient[ENDCOLOR], you can demand one {@3_Unit} as tribute of at the cost of [ICON_INFLUENCE] Influence.  {1_FearLevel}{2_FactorDetails}'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_UNIT_TT';

UPDATE Language_en_US
SET Text = 'Someone demanded tribute recently'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_RECENTLY';

UPDATE Language_en_US
SET Text = 'Someone demanded tribute very recently'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_VERY_RECENTLY';

INSERT INTO Language_en_US
		(Tag,										Text)
SELECT	'TXT_KEY_POP_CSTATE_BULLY_FACTOR_MONGOL_TERROR',	'You annexed a City-State recently';

-- Fixed quest text - transitioned to new 'quest rewards' panel
UPDATE Language_en_US
SET Text = 'You have successfully destroyed the Barbarian Encampment as requested by {1_MinorCivName:textkey}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CAMP';

UPDATE Language_en_US
SET Text = 'War breaks out between {2_CivName:textkey} and {1_TargetName:textkey}'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_KILL_CITY_STATE';

UPDATE Language_en_US
SET Text = '{3_TargetName:textkey} has declared war on {1_CivName:textkey}, citing diplomatic concerns. Receive the [COLOR_POSITIVE_TEXT]full[ENDCOLOR] Quest Reward from {1_TargetName:textkey} by [COLOR_NEGATIVE_TEXT]destroying[ENDCOLOR] {3_CivName:textkey}, or a [COLOR_POSITIVE_TEXT]partial[ENDCOLOR] Quest Reward through [COLOR_POSITIVE_TEXT]allying[ENDCOLOR] both City-States. International pressure will force peace in [COLOR_POSITIVE_TEXT]{2_Num}[ENDCOLOR] turns, so act fast if you intend to intervene!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_KILL_CITY_STATE';

UPDATE Language_en_US
SET Text = 'Conquer {1_CityStateName:textkey} (full reward), or Ally both {1_CityStateName:textkey} and this City-State (partial reward).'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CITY_STATE_FORMAL';

UPDATE Language_en_US
SET Text = '{1_TargetName:textkey} defeated by {2_CivName:textkey}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_en_US
SET Text = 'The war between {2_CivName:textkey} and {1_TargetName:textkey} has ended, with {2_CivName:textkey} emerging as the clear victor. Your advisors worry that this outcome may lead to future conflict.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_en_US
SET Text = 'As {2_MinorCivName:textkey} requested, you have successfully connected {1_ResourceName} to your trade network! Their merchants are quite pleased!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONNECT_RESOURCE';

UPDATE Language_en_US
SET Text = 'As {2_MinorCivName:textkey} requested, you have successfully constructed {1_WonderName}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONSTRUCT_WONDER';

UPDATE Language_en_US
SET Text = 'As {2_MinorCivName:textkey} requested, you have successfully created a {1_UnitName}! Their scholars are in awe.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GREAT_PERSON';

UPDATE Language_en_US
SET Text = 'Your discovery of a new Natural Wonder has inspired the citizens of {1_MinorCivName:textkey}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_NATURAL_WONDER';

UPDATE Language_en_US
SET Text = 'Your discovery of {1_TargetName:textkey} has greatly pleased the merchants of {2_MinorCivName:textkey}.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_PLAYER';

UPDATE Language_en_US
SET Text = 'Your gift of gold has helped {2_MinorCivName:textkey} recover from the tribute paid to {1_BullyName:textkey}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GIVE_GOLD';

UPDATE Language_en_US
SET Text = '{2_MinorCivName:textkey} enjoyed seeing its rival {1_TargetName:textkey} squirm and give up hard-earned resources.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_BULLY_CITY_STATE';

UPDATE Language_en_US
SET Text = 'Your promise to protect {2_MinorCivName:textkey} has helped them recover from the tribute paid to {1_BullyName:textkey}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_PLEDGE_TO_PROTECT';

UPDATE Language_en_US
SET Text = '{2_MinorCivName:textkey} is relieved that the injustice they suffered at the hands of {1_TargetName:textkey} is now known by major world powers.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_DENOUNCE_MAJOR';

UPDATE Language_en_US
SET Text = 'Citizens of {@2_MinorCivName} are glad to see {@1_ReligionName} come to their city and become the dominant religion.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_SPREAD_RELIGION';

UPDATE Language_en_US
SET Text = 'Citizens of {@1_MinorCivName} are glad to see a connected trade route.'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_TRADE_ROUTE';

UPDATE Language_en_US
SET Text = 'You have impressed {1_MinorCivName:textkey} with your culture! They turn a blind eye to the culture of other civilizations. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_CULTURE';

UPDATE Language_en_US
SET Text = 'Another civilization has impressed {1_MinorCivName:textkey} with its culture. Your cultural growth was not enough. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_CULTURE';

UPDATE Language_en_US
SET Text = 'The priesthood of {1_MinorCivName:textkey} are moved by your piety. They shun the inferior faith of other civilizations. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_FAITH';

UPDATE Language_en_US
SET Text = 'Another civilization has impressed {1_MinorCivName:textkey} with its faith. Your faith growth was not enough. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_FAITH';

UPDATE Language_en_US
SET Text = '{1_MinorCivName:textkey} is amazed by your swift technological advancements! Their scientists and intellectuals dismiss other civilizations as stagnant. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_TECHS';

UPDATE Language_en_US
SET Text = 'Another civilization has impressed {1_MinorCivName:textkey} with its technological advancement. Your scientific discoveries were not enough. Civilizations that succeeded (ties are allowed):[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_TECHS';


-- Happiness

-- City Revolt
UPDATE Language_en_US
SET Text = 'Because the Empire has at least 34% [ICON_HAPPINESS_4] Unhappiness (or because our Public Opinion is not Content), a City will revolt in [COLOR_NEGATIVE_TEXT]{1_Turns}[ENDCOLOR] turns. Based on current Unhappiness levels and Cultural/Ideological pressure, the City most likely to revolt is {2_CityName} and it will join {3_CivName}. Try to get your Empire''s Happiness level out of this range as soon as possible!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_POSSIBLE_CITY_REVOLT';

UPDATE Language_en_US
SET Text = 'Because the Empire has at least 34% [ICON_HAPPINESS_4] Unhappiness, the City of {1_CityName} has revolted and joined {2_CivName}!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_CITY_REVOLT';

UPDATE Language_en_US
SET Text = 'Because the empire has at least 34% [ICON_HAPPINESS_4] Unhappiness, an uprising has occurred in our territory!'
WHERE Tag = 'TXT_KEY_NOTIFICATION_REBELS';

-- Pantheons Founded

UPDATE Language_en_US
SET Text = 'Your people have started worshipping a pantheon of gods. They have chosen the belief: [COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR] ({@2_BeliefDesc})'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_ACTIVE_PLAYER';

UPDATE Language_en_US
SET Text = '{@1_CivName} {@1: plural 1?has; 2?have;} started worshipping a pantheon of gods. They have chosen the belief: [COLOR_POSITIVE_TEXT]{2_BeliefName}[ENDCOLOR] ({@3_BeliefDesc})'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED';

UPDATE Language_en_US
SET Text = 'An unknown civilization has started worshipping a pantheon of gods. They have chosen the belief: [COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR] ({@2_BeliefDesc})'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_UNKNOWN';

-- Religion

UPDATE Language_en_US
SET Text = 'Head of {1_ReligionName}'
WHERE Tag = 'TXT_KEY_RO_STATUS_FOUNDER';

UPDATE Language_en_US
SET Text = 'Can be purchased with [ICON_PEACE] Faith in any city with a majority Religion that has been enhanced. They can remove other religions from your cities (expending the Inquisitor) or be placed inside or adjacent to a city to protect it from Missionaries and Prophets trying to spread other religions into that city.'
WHERE Tag = 'TXT_KEY_UNIT_INQUISITOR_STRATEGY';

-- Fixed diacritics for spy names.
UPDATE Language_en_US
SET Text = 'Antônio'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_0';

UPDATE Language_en_US
SET Text = 'Estêvão'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_3';

UPDATE Language_en_US
SET Text = 'Fernão'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_4';

UPDATE Language_en_US
SET Text = 'Tomé'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_8';

-- Trade Deals
UPDATE Language_en_US
SET Text = 'Ends after: [NEWLINE]Turn {1_turn}'
WHERE Tag = 'TXT_KEY_DO_ENDS_ON';

UPDATE Language_en_US
SET Text = 'Unlocks advanced trade options with this Civilization and reveals the location of their Capital.'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_TT';

UPDATE Language_en_US
SET Text = 'Allows the other player''s military or civilian Units to pass through one''s territory (lasts {1_Num} turns).[NEWLINE][NEWLINE]Note: Military Units belonging to different players may never stack.'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_TT';

UPDATE Language_en_US
SET Text = 'If either player is attacked by another major civilization, the other player will immediately and automatically go to war with the aggressor. This agreement lasts {1_Num} turns.[NEWLINE][NEWLINE]You can make Defensive Pacts with a maximum of [COLOR_CYAN]{2_Num}[ENDCOLOR] civs. This is based on the number of living, non-vassal civs in the world.'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_TT';

UPDATE Language_en_US
SET Text = 'We already have an Embassy in their Capital!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_HAVE';

UPDATE Language_en_US
SET Text = 'They already have an Embassy in our Capital!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_THEY_HAVE';

UPDATE Language_en_US
SET Text = 'You do not have the Technology to establish an Embassy (Writing).'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_PLAYER';

UPDATE Language_en_US
SET Text = 'They do not have the Technology to establish an Embassy (Writing).'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_OTHER_PLAYER';

UPDATE Language_en_US
SET Text = 'We are already allowing Open Borders!'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_HAVE';

UPDATE Language_en_US
SET Text = 'They are already allowing Open Borders!'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_THEY_HAVE';

UPDATE Language_en_US
SET Text = 'Neither player yet has the Technology to trade this item (Civil Service).'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_NO_TECH';

UPDATE Language_en_US
SET Text = 'You need an Embassy with their Civilization to trade this item.'
WHERE Tag = 'TXT_KEY_DIPLO_YOU_NEED_EMBASSY_TT';

UPDATE Language_en_US
SET Text = 'They need an Embassy with your Civilization to trade this item.'
WHERE Tag = 'TXT_KEY_DIPLO_THEY_NEED_EMBASSY_TT';

UPDATE Language_en_US
SET Text = 'Both parties need an Embassy to trade this item.'
WHERE Tag = 'TXT_KEY_DIPLO_BOTH_NEED_EMBASSY_TT';

UPDATE Language_en_US
SET Text = 'We already have a Defensive Pact!'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_EXISTS';

UPDATE Language_en_US
SET Text = 'Neither player yet has the Technology to trade this item (Chivalry).'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_NO_TECH';

UPDATE Language_en_US
SET Text = 'We already have a Research Agreement!'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_EXISTS';

UPDATE Language_en_US
SET Text = 'One or both of us have already researched all Technologies.'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_ALL_TECHS_RESEARCHED';

UPDATE Language_en_US
SET Text = 'Neither player yet has the Technology to trade this item (Philosophy).'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_NO_TECH';

UPDATE Language_en_US
SET Text = 'A Declaration of Friendship is needed to trade this item.'
WHERE Tag = 'TXT_KEY_DIPLO_NEED_DOF_TT';

UPDATE Language_en_US
SET Text = 'A City-State Alliance prevents this action.'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_ALLY_AT_WAR';

UPDATE Language_en_US
SET Text = 'A City-State Alliance prevents this action.'
WHERE Tag = 'TXT_KEY_DIPLO_NO_WAR_ALLIES';

UPDATE Language_en_US
SET Text = 'A recent Peace Treaty prevents this action.'
WHERE Tag = 'TXT_KEY_DIPLO_FORCE_PEACE';

-- Trade Routes
UPDATE Language_en_US
SET Text = 'You must be at war with the trade route owner.'
WHERE Tag = 'TXT_KEY_MISSION_PLUNDER_TRADE_ROUTE_DISABLED_HELP';

UPDATE Language_en_US
SET Text = 'You have discovered {1_Num} technologies that {2_CivName} does not know.[NEWLINE]They are receiving +{3_Num} [ICON_RESEARCH] Science on this route due to their Cultural Influence over you.'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_THEIR_SCIENCE_EXPLAINED';

UPDATE Language_en_US
SET Text = '{1_CivName} has discovered {2_Num} technologies that you do not know.[NEWLINE]You are receiving +{3_Num} [ICON_RESEARCH] Science on this route due to your Cultural Influence over them.'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_YOUR_SCIENCE_EXPLAINED';

-- Lua for Cities
UPDATE Language_en_US
SET Text = 'We have no tradeable cities and/or we do not have an Embassy with them.'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_TT';

UPDATE Language_en_US
SET Text = 'They have no tradeable cities and/or they do not have an Embassy with us.'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_THEM';


-- Civilopedia Refresh

UPDATE Language_en_US
SET Text = 'Welcome to the Civilopedia! Here you will find detailed descriptions of all aspects of the game. Use the "Search" field to search for articles on any specific subject. Clicking on the tabs on the top edge of the screen will take you to the various major sections of the Civilopedia. The Navigation Bar on the left side of the screen will display the various entries within a section. Click on an entry to go directly there.[NEWLINE][NEWLINE]In the upper left-hand portion of the screen you will find the forward and back buttons which will help you navigate between pages. Click on the "X" on the upper right portion of the screen to return to the game.[NEWLINE][NEWLINE]Welcome to the Community Patch, a mod containing several bugfixes and AI improvements. [COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow in the Civilopedia.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_HOME_PAGE_HELP_TEXT';

UPDATE Language_en_US
SET Text = 'Civilization V examines all of human history - from the deep past to the day after tomorrow. The "Game Concepts" portion of the Civilopedia explains some of the more important parts of the game - how to build and manage cities, how to fight wars, how to research technology, and so forth. The left Navigation Bar displays the major concepts; click on an entry to see the subsections within the concepts.[NEWLINE][NEWLINE][COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_GAME_CONCEPT_HELP_TEXT';

UPDATE Language_en_US
SET Text = 'Forces defender to retreat if it inflicts more damage than it receives. A defender who cannot retreat takes 50% extra damage.'
WHERE Tag = 'TXT_KEY_PROMOTION_HEAVY_CHARGE_HELP';

UPDATE Language_en_US
SET Text = 'Only one land and one naval unit may occupy a city at a time. A military unit in a city is said to "Garrison" the city, and it adds a significant defensive bonus to the city [COLOR_YELLOW]if it''s a land unit. If a city is attacked while a Garrison is in the city, the Garrison will deflect some of the damage onto itself, thus offering the city even more protection. Be careful, however, as a Garrison can be destroyed this way.[ENDCOLOR][NEWLINE][NEWLINE]Additional combat units may move through the city, but they cannot end their turn there. (So if you build a combat unit in a city with a garrison, you have to move one of the two units out before you end your turn.)[NEWLINE][NEWLINE][COLOR_YELLOW]Note also that naval units cannot perform any attacks while they are stationed in a city.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Combat Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Garrison Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = 'A city''s owner may "garrison" a military unit inside the city to bolster its defenses. A portion of the garrisoned unit''s combat strength is added to the city''s strength. [COLOR_YELLOW]The garrisoned will divert part of the damage to a city when the city is attacked. This can destroy the garrison, so be careful![ENDCOLOR] If the city is captured, the garrisoned unit is destroyed.[NEWLINE][NEWLINE]'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Forts[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = 'Once a civ has acquired the Engineering technology, workers can construct "forts" in friendly or neutral territory. Forts provide a hefty defensive bonus to units occupying them. Forts cannot be constructed in enemy territory. They can be constructed atop resources. [COLOR_YELLOW]Melee Units attacking from a Fort don''t leave the Fort even if they destroy the attacked enemy unit.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Siege Weapons[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_TITLE';

UPDATE Language_en_US
SET Text = 'Certain ranged weapons are classified as "siege weapons" - catapults, ballistae, trebuchets, and so forth. These units get combat bonuses when attacking enemy cities. They are extremely vulnerable to melee combat, and should be accompanied by melee units to fend off enemy assault.[NEWLINE][NEWLINE][COLOR_YELLOW]In Vox Populi and the Community Patch, siege units don''t have to be "set up" anymore. Instead, they move at half-speed in enemy territory.[ENDCOLOR][NEWLINE][NEWLINE]Siege weapons are important. It''s really difficult to capture a well-defended city without them!'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Melee Combat Results[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = 'At the end of melee combat, one or both units may have sustained damage and lost "hit points." If a unit''s hit points are reduced to 0, that unit is destroyed. If after melee combat the defending unit has been destroyed and the attacker survives, the attacking unit moves into the defender''s hex [COLOR_YELLOW]unless defending a Citadel, Fort, or City, at which point the melee unit remains in place[ENDCOLOR]. If it moves, the winner will capture any non-military units in that hex. If the defending unit survives, it retains possession of its hex and any other units in the hex.[NEWLINE][NEWLINE]Most units use up all of their movement when attacking. Some however have the ability to move after combat - if they survive the battle and have movement points left to expend.[NEWLINE][NEWLINE]Any surviving units involved in the combat will receive "experience points" (XPs), which may be expended to give the unit promotions.'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_BODY';

UPDATE Language_en_US
SET Text = 'Great Generals are "Great People" skilled in the art of warfare. They provide combat bonuses - offensive and defensive bonuses both - to any friendly units within two tiles of their location. A Great General itself is a non-combat unit, so it may be stacked with a combat unit for protection. If an enemy unit ever enters the tile containing a Great General, the General is destroyed.[NEWLINE][NEWLINE]A Great General gives a combat bonus of 15% to units in the General''s tile and all friendly units within 2 tiles of the General.[NEWLINE][NEWLINE]Great Generals are created when your units have been in battle and also can be acquired from buildings, policies, beliefs, and tenets. See the section on "Great People" for more details.'
WHERE Tag = 'TXT_KEY_COMBAT_GREATGENERALS_HEADING2_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_GREEN]War Score[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = 'War Score is ever-shifting status of a war between players. War Score can fluctuate from 100 to -100, where 100 is a total victory for you, and -100 a total victory for your opponent. War Score will also gradually decay over time, to highlight the declining value of past actions in a long, drawn-out conflict.[NEWLINE][NEWLINE]When declared, War Score starts at zero for both players. As you (or your opponent) destroy units, pillage tiles/trade units, capture civilians and take cities, your warscore will go up. The value of these actions varies based on the overall size of your opponent.[NEWLINE][NEWLINE]When it comes time to make peace, the War Score value gives you a good idea of what you should expect to gain from your opponent, or what they will ask of you. In the trade screen, the War Score value will be translated into a ''Max Peace'' value, which shows you exactly what you can take from your opponent (or vice-versa). When peace is concluded, the War Score returns to zero.'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_BODY';

UPDATE Language_en_US
SET Text = 'Once you have acquired the Chivalry tech, you may engage in a Defensive Pact. Defensive Pacts are always mutual. If a signatory to a Defensive Pact is attacked, the other partner is automatically at war with the attacker.[NEWLINE][NEWLINE]A Defensive Pact lasts for 50 turns (on standard speed). When that time has elapsed, the pact lapses unless it is renegotiated.'
WHERE Tag = 'TXT_KEY_DIPLOMACY_DEFENSIVEPACT_HEADING3_BODY';

UPDATE Language_en_US
SET Text = 'The ruin provides a map of the nearest unrevealed City (lifting the fog of war from a number of tiles).'
WHERE Tag = 'TXT_KEY_BARBARIAN_MAP_HEADING4_BODY';

UPDATE Language_en_US
SET Text = 'When they fight barbarian units, your less well-trained units will gain experience points. However, any unit that has already acquired [COLOR_YELLOW]45 XPs[ENDCOLOR] (or has exchanged that many for promotions) no longer gains XPs from fighting barbarians.'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_BODY';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Experience Points Limitations[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_TITLE';

UPDATE Language_en_US
SET Text = 'Each civilization in Civilization V has one or more special "national units." These units are unique to that civilization, and they are in some way superior to the standard version of that unit. The American civilization, for example, has a Minuteman unit, which is superior to the standard Musketman available to other civs. The Greek civ has the Hoplite unit, which replaces the Spearman.[NEWLINE][NEWLINE]See each civilization''s Civilopedia entry to discover its special unit.'
WHERE Tag = 'TXT_KEY_UNITS_NATIONAL_HEADING2_BODY';

UPDATE Language_en_US
SET Text = 'If another civ has captured a City-State and you capture it from them, you have the option to "liberate" that city-state. If you do so, you will receive a large amount of [ICON_INFLUENCE] Influence from the City-State, usually enough to make you [COLOR_POSITIVE_TEXT]Allies[ENDCOLOR] with it.'
WHERE Tag = 'TXT_KEY_CITYSTATE_LIBERATING_HEADING2_BODY';


-- Miscellaneous


UPDATE Language_en_US
SET Text = 'They want you to defeat Barbarian units that are invading their territory. You are allowed to enter their territory until the Barbarians are defeated.'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_INVADING_BARBS_FORMAL';

UPDATE Language_en_US
SET Text = 'Allowed units receive [COLOR_POSITIVE_TEXT]{@1_PromotionName}[ENDCOLOR] Promotion: {@2_PromotionHelp}'
WHERE Tag = 'TXT_KEY_FREE_PROMOTION_FROM_TECH';

UPDATE Language_en_US
SET Text = '{1_Num} [ICON_CULTURE] from Great Works and Themes'
WHERE Tag = 'TXT_KEY_CULTURE_FROM_GREAT_WORKS';

-- Economic Advisor
UPDATE Language_en_US
SET Text = 'Our economy is being hamstrung by the number of units that we have. We should disband any unneeded units so that our civilization can operate at full capacity.'
WHERE Tag = 'TXT_KEY_ECONOMICAISTRATEGY_TOO_MANY_UNITS';

-- Reversed Tourism for Open Borders
UPDATE Language_en_US
SET Text = '+{1_Num}% Bonus for Open Borders from:[NEWLINE]   '
WHERE Tag = 'TXT_KEY_CO_CITY_TOURISM_OPEN_BORDERS_BONUS';

-- Barbarians
UPDATE Language_en_US
SET Text = 'Crom'
WHERE Tag = 'TXT_KEY_LEADER_BARBARIAN';

-- Notification
UPDATE Language_en_US
SET Text = '{1_CivName:textkey} lost {1_CivName: plural 1?its; other?their;} [ICON_CAPITAL] Capital'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_PLAYER_LOST_CAPITAL';

-- Demographics
UPDATE Language_en_US
SET Text = 'Deployable Troops.'
WHERE Tag = 'TXT_KEY_DEMOGRAPHICS_ARMY_MEASURE';

-- Fix for production ranking
UPDATE Language_en_US
SET Text = 'Ranks players by the average [ICON_PRODUCTION] Production generated by all of their cities.'
WHERE Tag = 'TXT_KEY_PROGRESS_SCREEN_PRODUCTION_TT';

-- World Congress Proposals, Which Civs benefit
UPDATE Language_en_US
SET Text = '[NEWLINE][NEWLINE]Civilizations positively affected by this:'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_POSITIVE';

UPDATE Language_en_US
SET Text = '[NEWLINE][NEWLINE]Civilizations negatively affected by this:'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_NEGATIVE';

-- Shorten the overview text to make room
UPDATE Language_en_US
SET Text = '[NEWLINE][NEWLINE]Our knowledge of other Civs'' desires:'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_VOTE_OPINIONS';


-- Diplo Opinion Table Modifiers

-- Neutral Indicators
UPDATE Language_en_US
SET Text = 'ELIMINATED'
WHERE Tag = 'TXT_KEY_EMOTIONLESS';

UPDATE Language_en_US
SET Text = 'You have gone to war in the past.'
WHERE Tag = 'TXT_KEY_DIPLO_PAST_WAR_BAD';

-- Dispute Modifiers
UPDATE Language_en_US
SET Text = 'Territorial disputes strain your relationship.'
WHERE Tag = 'TXT_KEY_DIPLO_LAND_DISPUTE';

UPDATE Language_en_US
SET Text = 'You are competing for World Wonders.'
WHERE Tag = 'TXT_KEY_DIPLO_WONDER_DISPUTE';

UPDATE Language_en_US
SET Text = 'You are competing for the favor of the same City-States!'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_CIV_DISPUTE';

-- War Stuff
UPDATE Language_en_US
SET Text = 'They have some early concerns about your warmongering.'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MINOR';

UPDATE Language_en_US
SET Text = 'They are wary of the potential threat posed by your warmongering.'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MAJOR';

UPDATE Language_en_US
SET Text = 'They believe your warmongering has become an existential threat.'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_SEVERE';

UPDATE Language_en_US
SET Text = 'They fear your warmongering will end this world in fire!'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_CRITICAL';

UPDATE Language_en_US
SET Text = ' (They strongly dislike warmongers.)'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_HIGH';

UPDATE Language_en_US
SET Text = ' (They dislike warmongers.)'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_MID';

UPDATE Language_en_US
SET Text = ' (They overlook modest warmongering.)'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_LOW';

UPDATE Language_en_US
SET Text = 'You plundered their trade routes!'
WHERE Tag = 'TXT_KEY_DIPLO_PLUNDERING_OUR_TRADE_ROUTES';

UPDATE Language_en_US
SET Text = 'You nuked them!'
WHERE Tag = 'TXT_KEY_DIPLO_NUKED';

UPDATE Language_en_US
SET Text = 'You captured their original capital.'
WHERE Tag = 'TXT_KEY_DIPLO_CAPTURED_CAPITAL';

-- Recent diplomatic actions
UPDATE Language_en_US
SET Text = 'Your recent diplomatic actions please them.'
WHERE Tag = 'TXT_KEY_DIPLO_ASSISTANCE_TO_THEM';

UPDATE Language_en_US
SET Text = 'Your recent diplomatic actions disappoint them.'
WHERE Tag = 'TXT_KEY_DIPLO_REFUSED_REQUESTS';

-- Player has done nice stuff
UPDATE Language_en_US
SET Text = 'We are trade partners.'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_PARTNER';

UPDATE Language_en_US
SET Text = 'We fought together against a common foe.'
WHERE Tag = 'TXT_KEY_DIPLO_COMMON_FOE';

UPDATE Language_en_US
SET Text = 'You freed their captured citizens!'
WHERE Tag = 'TXT_KEY_DIPLO_CIVILIANS_RETURNED';

UPDATE Language_en_US
SET Text = 'You built a Landmark in their territory.'
WHERE Tag = 'TXT_KEY_DIPLO_LANDMARKS_BUILT';

UPDATE Language_en_US
SET Text = 'You restored their civilization after they were annihilated!'
WHERE Tag = 'TXT_KEY_DIPLO_RESURRECTED';

UPDATE Language_en_US
SET Text = 'You liberated their original capital.'
WHERE Tag = 'TXT_KEY_DIPLO_LIBERATED_CAPITAL';

UPDATE Language_en_US
SET Text = 'You have liberated some of their people!'
WHERE Tag = 'TXT_KEY_DIPLO_CITIES_LIBERATED';

UPDATE Language_en_US
SET Text = 'They have an embassy in your capital.'
WHERE Tag = 'TXT_KEY_DIPLO_HAS_EMBASSY';

UPDATE Language_en_US
SET Text = 'You forgave them for spying.'
WHERE Tag = 'TXT_KEY_DIPLO_FORGAVE_FOR_SPYING';

UPDATE Language_en_US
SET Text = 'You have shared intrigue with them.'
WHERE Tag = 'TXT_KEY_DIPLO_SHARED_INTRIGUE';

-- Player has done mean stuff
UPDATE Language_en_US
SET Text = 'You stole their territory while at peace!'
WHERE Tag = 'TXT_KEY_DIPLO_CULTURE_BOMB';

UPDATE Language_en_US
SET Text = 'Your spies were caught stealing from them.'
WHERE Tag = 'TXT_KEY_DIPLO_CAUGHT_STEALING';

-- Player has asked us to do things we don't like
UPDATE Language_en_US
SET Text = 'You demanded they not settle near your lands!'
WHERE Tag = 'TXT_KEY_DIPLO_NO_SETTLE_ASKED';

UPDATE Language_en_US
SET Text = 'You asked them not to spy on you.'
WHERE Tag = 'TXT_KEY_DIPLO_STOP_SPYING_ASKED';

UPDATE Language_en_US
SET Text = 'You made a trade demand of them!'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_DEMAND';

UPDATE Language_en_US
SET Text = 'You forced them to pay tribute.'
WHERE Tag = 'TXT_KEY_DIPLO_PAID_TRIBUTE';

-- Denouncing
UPDATE Language_en_US
SET Text = 'We have denounced them!'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_US';

UPDATE Language_en_US
SET Text = 'They have denounced us!'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_THEM';

UPDATE Language_en_US
SET Text = 'You have denounced a leader they made a Declaration of Friendship with!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIEND';

UPDATE Language_en_US
SET Text = 'We have denounced the same leaders!'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_ENEMY';

UPDATE Language_en_US
SET Text = 'Their friends or allies have denounced you!'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_PEOPLE_WE_TRUST_MORE';

-- Promises
UPDATE Language_en_US
SET Text = 'You made a promise not to declare war on them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE';

UPDATE Language_en_US
SET Text = 'You made a promise not to declare war on another civilization, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_en_US
SET Text = 'You refused to move your troops away from their borders when they asked!'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop settling near them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE';

UPDATE Language_en_US
SET Text = 'They asked you to stop settling near them, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop buying land near them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE';

UPDATE Language_en_US
SET Text = 'They asked you to stop buying land near them, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise not to conquer a City-State protected by them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE';

UPDATE Language_en_US
SET Text = 'You made a promise not to conquer another civilization''s protected City-State, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_en_US
SET Text = 'They asked you to stop attacking a City-State protected by them, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop demanding tribute from a City-State protected by them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_BROKEN';

UPDATE Language_en_US
SET Text = 'They asked you to stop demanding tribute from a City-State protected by them, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop converting their cities, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_BROKEN';

UPDATE Language_en_US
SET Text = 'They asked you to stop converting their cities, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop excavating their artifacts, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_BROKEN';

UPDATE Language_en_US
SET Text = 'They asked you to stop excavating their artifacts, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to stop spying on them, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_BROKEN';

UPDATE Language_en_US
SET Text = 'They asked you to stop spying on them, and you ignored them!'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_IGNORED';

UPDATE Language_en_US
SET Text = 'You made a promise to start a cooperative war against another empire, and then broke it!'
WHERE Tag = 'TXT_KEY_DIPLO_COOP_WAR_PROMISE';

-- Religion / Ideology
UPDATE Language_en_US
SET Text = 'They have happily adopted your religion in the majority of their cities.' -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_HIS_RELIGION';

UPDATE Language_en_US
SET Text = 'You have adopted their religion in the majority of your cities.'  -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_MY_RELIGION';

UPDATE Language_en_US
SET Text = 'They are spreading their own religion, but you converted some of their cities to your religion.'
WHERE Tag = 'TXT_KEY_DIPLO_RELIGIOUS_CONVERSIONS';

UPDATE Language_en_US
SET Text = 'You have both chosen to adopt the {1_PolicyTree} Ideology.'
WHERE Tag = 'TXT_KEY_DIPLO_SAME_LATE_POLICY_TREES';

UPDATE Language_en_US
SET Text = 'You have chosen to adopt the {1_YourPolicyTree} Ideology, but they believe in {2_TheirPolicyTree}.'
WHERE Tag = 'TXT_KEY_DIPLO_DIFFERENT_LATE_POLICY_TREES';

-- Protected Minors
UPDATE Language_en_US
SET Text = 'You have conquered City-States under their protection!'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_KILLED';

UPDATE Language_en_US
SET Text = 'You have attacked City-States under their protection!'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_ATTACKED';

UPDATE Language_en_US
SET Text = 'You have demanded tribute from City-States under their protection!'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_BULLIED';

UPDATE Language_en_US
SET Text = 'They mistreated your protected City-States, and you didn''t look the other way!'
WHERE Tag = 'TXT_KEY_DIPLO_SIDED_WITH_MINOR';

-- Declaration of Friendship
UPDATE Language_en_US
SET Text = 'We have made a public Declaration of Friendship!'
WHERE Tag = 'TXT_KEY_DIPLO_DOF';

UPDATE Language_en_US
SET Text = 'We have made Declarations of Friendship with the same leaders!'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_DOF';

UPDATE Language_en_US
SET Text = 'You have made a Declaration of Friendship with one of their enemies!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DOF_WITH_ENEMY';

-- Traitor Opinion
UPDATE Language_en_US
SET Text = 'Your friends found reason to denounce you!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_BY_FRIENDS';

UPDATE Language_en_US
SET Text = 'You have denounced leaders you''ve made Declarations of Friendship with!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIENDS';

UPDATE Language_en_US
SET Text = 'We made a Declaration of Friendship and then denounced them!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DENOUNCED';

UPDATE Language_en_US
SET Text = 'You have declared war on leaders you''ve made Declarations of Friendship with!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DECLARED_WAR_ON_FRIENDS';

UPDATE Language_en_US
SET Text = 'We made a Declaration of Friendship and then declared war on them!'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DECLARED_WAR';

-- Reckless Expander
UPDATE Language_en_US
SET Text = 'They believe we are expanding our empire too aggressively!'
WHERE Tag = 'TXT_KEY_DIPLO_RECKLESS_EXPANDER';

-- World Congress
UPDATE Language_en_US
SET Text = 'They liked our proposal to the World Congress.'
WHERE Tag = 'TXT_KEY_DIPLO_LIKED_OUR_PROPOSAL';

UPDATE Language_en_US
SET Text = 'They disliked our proposal to the World Congress.'
WHERE Tag = 'TXT_KEY_DIPLO_DISLIKED_OUR_PROPOSAL';

UPDATE Language_en_US
SET Text = 'We passed their proposal in the World Congress.'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_PROPOSAL';

UPDATE Language_en_US
SET Text = 'We defeated their proposal in the World Congress.'
WHERE Tag = 'TXT_KEY_DIPLO_FOILED_THEIR_PROPOSAL';

UPDATE Language_en_US
SET Text = 'We helped relocate the World Congress to their lands.'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_HOSTING';


-- Civilization Leader Dialog

-- First Greeting
UPDATE Language_en_US
SET Text = 'I am Nebuchadnezzar of Babylon. Those fools outside say I''m a god, but that seems unlikely. Who are you?'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_1';

UPDATE Language_en_US
SET Text = 'I am Nebuchadnezzar. Are you real or just a phantom of my tortured senses?'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_3';

UPDATE Language_en_US
SET Text = 'Greetings, Stranger. I am Pachacuti, ruler of the peerless Incans. If there is any way that we can assist your inferior civilization, please do not hesitate to ask.'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_FIRSTGREETING_3';

-- Greeting (Friendly)
UPDATE Language_en_US
SET Text = 'Hello, friend. What brings you to my court this day?'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_1';

UPDATE Language_en_US
SET Text = 'Hello again, my friend.'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_3';

UPDATE Language_en_US
SET Text = 'Ah, hello again, friend! What can this mighty general do for you?'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_GREETING_POLITE_HELLO_1';

UPDATE Language_en_US
SET Text = 'God smiles upon you, my friend. What can I do for you?'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_GREETING_POLITE_HELLO_1';

-- Greeting (Neutral)
UPDATE Language_en_US
SET Text = 'I trust that God willed your visit to Songhai, great leader.'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_en_US
SET Text = 'Germany always looks forward to favorable relations with mighty empires such as yours.'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_en_US
SET Text = 'What brings you this far into the wilderness, leader?'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_en_US
SET Text = 'Here to admire the French Empire, or perhaps to do business?'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_en_US
SET Text = 'Well? Speak up. I can barely hear you over the blood pounding in my brain.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_GREETING_5';

-- Greeting (Hostile)
UPDATE Language_en_US
SET Text = 'You come to mighty Persia as you are? What do you want?'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_GREETING_HOSTILE_HELLO_1';

UPDATE Language_en_US
SET Text = 'I make it a habit to speak only to great leaders, but I shall make an exception for you. Hurry up now.'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_GREETING_HOSTILE_HELLO_1';

-- Greeting (Repeat)
UPDATE Language_en_US
SET Text = 'You sure do like talking to me, don''t you?'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_REPEAT_2';

-- Greeting (Aggressive Plot Buying)
UPDATE Language_en_US
SET Text = 'Your recent trend of buying land near us is concerning. For the sake of our future relationship, I advise that you be cautious in this matter. Now that that''s out of the way, what brings you here today?'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_AGGRESSIVE_PLOT_BUYING_1';

-- Greeting (Hostile, Aggressive Expansion)
UPDATE Language_en_US
SET Text = 'The spread of your cities and people is like a plague infecting the land. I look forward to the day I don''t have to see it anymore.'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_AGGRESSIVE_EXPANSION_1';

-- Greeting (Hostile, Small Army)
UPDATE Language_en_US
SET Text = 'Just between you and me, your military is kind of the laughing stock of the world. Don''t let that get you down though; I''m sure someone will put you out of your misery soon.'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_HUMAN_SMALL_ARMY';


-- Open Trade Screen
UPDATE Language_en_US
SET Text = 'Speak: anything to drown out the whispers.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_LETSHEARIT_1';


-- Can't Match Trade Offer
UPDATE Language_en_US
SET Text = 'We cannot offer you enough to make this a fair trade. We can, however, offer you this deal.'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_1';

UPDATE Language_en_US
SET Text = 'The deal we suggest may be an unfair exchange for you. Please inspect it closely.'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_2';


-- Offer Trade (Friendly)
UPDATE Language_en_US
SET Text = 'Does this trade interest you?'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_HAPPY';

UPDATE Language_en_US
SET Text = 'It appears that you do have a reason for existing: to make this deal with me.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_HAPPY';

-- Offer Trade (Neutral)
UPDATE Language_en_US
SET Text = 'This offer will not be open long; think about it.'
WHERE Tag = 'TXT_KEY_LEADER_ENRICO_DANDOLO_TRADEREQUEST_NEUTRAL';

-- Offer Trade (Hostile)
UPDATE Language_en_US
SET Text = 'Here is our offer - and it is far better than you deserve.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADEREQUEST_ANGRY';

UPDATE Language_en_US
SET Text = 'You would do well to agree to our very fair and reasonable terms.'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_ANGRY';

UPDATE Language_en_US
SET Text = 'You would allay my all-consuming misery by agreeing to the following.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_ANGRY';

-- Offer Trade (Luxury)
UPDATE Language_en_US
SET Text = 'It is God''s will that we seek out cooperation and trade with our fellow men when possible.'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_LUXURY_TRADE_1';

UPDATE Language_en_US
SET Text = 'Ah, hello, my friend. I noticed that we could make a mutually beneficial deal. What do you think?'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_LUXURY_TRADE_1';

UPDATE Language_en_US
SET Text = 'Trade is the fruit of a relationship between two great kingdoms. What do you think of this offer, my friend?'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_LUXURY_TRADE_1';

-- Offer Trade (Open Borders)
UPDATE Language_en_US
SET Text = 'Opening our borders seems like a convenient agreement at the present time. Do you agree?'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_OPEN_BORDERS_EXCHANGE_1';

UPDATE Language_en_US
SET Text = 'Opening our borders will greatly expedite the movement of troops. Should it be necessary, of course. What do you think?'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_OPEN_BORDERS_EXCHANGE_1';

-- Offer Trade (Research Agreement)
UPDATE Language_en_US
SET Text = 'I feel that a Research Agreement is a mutually beneficial arrangement that would help serve to cement our friendship.'
WHERE Tag = 'TXT_KEY_GENERIC_RESEARCH_AGREEMENT_OFFER_1';


-- Accept Trade (Friendly)
UPDATE Language_en_US
SET Text = 'Very well. Not that it will help either of us in the long run...we will all die soon enough.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_YES_HAPPY';

UPDATE Language_en_US
SET Text = 'Your offer pleases me. Well done.'
WHERE Tag ='TXT_KEY_LEADER_RAMESSES_TRADE_YES_HAPPY';

UPDATE Language_en_US
SET Text = 'Happily agreed.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_TRADE_YES_HAPPY';

-- Accept Trade (Neutral)
UPDATE Language_en_US
SET Text = 'Your offer is agreeable to us. We accept.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_NEUTRAL';

-- Accept Trade (Hostile)
UPDATE Language_en_US
SET Text = 'Oh, very well; I suppose I must. We are agreed.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_ANGRY';

UPDATE Language_en_US
SET Text = 'Smart move.'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_TRADE_YES_ANGRY';


-- Need More from Trade (Friendly)
UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_en_US
SET Text = 'You''re almost there...'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_HAPPY_3';

-- Need More from Trade (Neutral)
UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'I do not think that the trade, as it is currently configured, would be in the United States'' best interests. Would you care to improve your offer?'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_1';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_NEUTRAL_4';

-- Need More from Trade (Hostile)
UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_en_US
SET Text = 'Almost...'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_ANGRY_4';


-- Refuse Trade (Friendly)
UPDATE Language_en_US
SET Text = 'Do you seek to take advantage of our intimacy? Behave, or I shall be very cross with you.'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_HAPPY';

UPDATE Language_en_US
SET Text = 'My dear friend, whilst I would personally give you everything we possess, unto our very last farthing, my advisors are somewhat less generous. I therefore must regretfully decline your offer.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_HAPPY';

UPDATE Language_en_US
SET Text = 'I am sorry, but the voices tell me that I must decline your offer.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_HAPPY';

-- Refuse Trade (Neutral)
UPDATE Language_en_US
SET Text = 'We implore you not to waste our time with such foolishness.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_NEUTRAL';

UPDATE Language_en_US
SET Text = 'You must be insane to insult me with such an offer. We refuse.'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADE_NO_NEUTRAL';

UPDATE Language_en_US
SET Text = 'Your offer is declined. I would be insulted; that is, if I cared anything about you.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_NEUTRAL';

-- Refuse Trade (Hostile)
UPDATE Language_en_US
SET Text = 'My husband is deceased, you know: Russia is no longer ruled by an idiot. We decline.'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_ANGRY';

UPDATE Language_en_US
SET Text = 'I have conceived of a blind, almost overpowering dislike for you. The answer is "no."'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_ANGRY';

-- Refuse Trade (Insulting)
UPDATE Language_en_US
SET Text = 'This is not at all acceptable. If you wish for us to get anywhere, you must offer a fair deal.'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_REJECT_INSULTING_1';


-- Make Request for Help
UPDATE Language_en_US
SET Text = 'Unfortunately, things aren''t going terribly well over here. Can you spare something for a friend? I''ll try to return the favor when things are going better for me.'
WHERE Tag = 'TXT_KEY_GENERIC_REQUEST_ITEM_1';

UPDATE Language_en_US
SET Text = 'Circumstances have not been kind to the Songhai lately, friend. I believe God wishes to teach us that we cannot triumph alone.'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_RESPONSE_REQUEST_1';

UPDATE Language_en_US
SET Text = 'The United States would be indebted to you if you were to provide us assistance.'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_RESPONSE_REQUEST_1';


-- Make Demand (Friendly)
UPDATE Language_en_US
SET Text = 'My beloved friend, can you assist us in our hour of need?'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DEMANDTRIBUTE_HAPPY';

-- Make Demand (Neutral)
UPDATE Language_en_US
SET Text = 'You have something I want. If you don''t hand it over quietly, I''ll have no choice but to take it by force.'
WHERE Tag = 'TXT_KEY_GENERIC_DEMAND_1';

UPDATE Language_en_US
SET Text = 'Give me what I want, and I may spare you...for now.'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_DEMANDTRIBUTE_NEUTRAL';

UPDATE Language_en_US
SET Text = 'The following tribute would improve my black humor, greatly increasing the odds that you would survive another day.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEMANDTRIBUTE_NEUTRAL';


-- Accept Demand (Friendly)
UPDATE Language_en_US
SET Text = 'It is our pleasure to assist our friend and ally in their hour of need.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_HAPPY';

UPDATE Language_en_US
SET Text = 'Here. I am nothing but the nightmare of a mad god; what good are such things to me?'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_HAPPY';


-- Accept Demand (Neutral)
UPDATE Language_en_US
SET Text = 'You may have this bit of material wealth, yes. But such indiscretions are not easily forgotten.'
WHERE Tag = 'TXT_KEY_LEADER_BOUDICCA_TRIBUTE_YES_NEUTRAL';

UPDATE Language_en_US
SET Text = 'Oh, very well; I suppose we have no choice.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_NEUTRAL';

UPDATE Language_en_US
SET Text = 'I agree; if only to confound my advisors, who urge me to refuse.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_NEUTRAL';

UPDATE Language_en_US
SET Text = 'It honors my people to help those in need.'
WHERE Tag = 'TXT_KEY_LEADER_POCATELLO_TRIBUTE_YES_NEUTRAL';

UPDATE Language_en_US
SET Text = 'Very well. It appears that I have no choice but to accede to your demand. But I warn you not to press us too hard.'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRIBUTE_YES_NEUTRAL';


-- Accept Demand (Hostile)
UPDATE Language_en_US
SET Text = 'Very well. It appears as if I have no choice. But someday, you will pay for this.'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRIBUTE_YES_ANGRY';

UPDATE Language_en_US
SET Text = 'You have us at a disadvantage now, but it may not always be so. We shall remember this.'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_ANGRY';

UPDATE Language_en_US
SET Text = 'I will agree to your reprehensible demands.'
WHERE Tag = 'TXT_KEY_LEADER_MARIA_I_TRIBUTE_YES_ANGRY';

UPDATE Language_en_US
SET Text = 'Your fetid breath chokes the life from me! Take what you would and be gone.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_ANGRY';

UPDATE Language_en_US
SET Text = 'Very well. I hope you may choke on it!'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_TRIBUTE_YES_ANGRY';


-- Refuse Demand (Neutral)
UPDATE Language_en_US
SET Text = 'Foolish Jackal! You would do well to go to Egypt, where such as you are worshipped. Here, you get nothing.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_NO_NEUTRAL';

-- Refuse Demand (Hostile)
UPDATE Language_en_US
SET Text = 'You dare insult me in such a manner? If you want something so badly, then do your best to come and take it.'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_1';

UPDATE Language_en_US
SET Text = 'If you want that, you''ll have to come and get it.'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_3';

UPDATE Language_en_US
SET Text = 'You presume to demand tribute from us? Go away, you hateful villain!'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_NO_ANGRY';


-- Aggressive Military Warning (Hostile)
UPDATE Language_en_US
SET Text = 'I see your armies amassed near my empire. If you wish to attack, then come. Don''t hide in the shadows like a child.'
WHERE Tag = 'TXT_KEY_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_en_US
SET Text = 'Should your massed armies cross my border, they shall have the wrath of all of China unleashed upon them.'
WHERE Tag = 'TXT_KEY_WUZETIAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_en_US
SET Text = 'Ha! What are your forces doing near my territory? If you wish to fight, know that you cannot beat me.'
WHERE Tag = 'TXT_KEY_NAPOLEON_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';


-- Human attacked protected City-State
UPDATE Language_en_US
SET Text = 'Your wanton aggression against {@1_MinorCivName} does not go unnoticed. You will face serious consequences should you continue your assault.'
WHERE Tag = 'TXT_KEY_ATTACKED_PROTECTED_CITY_STATE_1';


-- AI attacked protected City-State
UPDATE Language_en_US
SET Text = 'It''s come to my attention that I may have attacked a City-State with which you have had past relations. While it was not my goal to be at odds with your empire, this was deemed a necessary course of action.'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_1';

UPDATE Language_en_US
SET Text = 'I''ve been informed that my empire has commenced an attack on a City-State friendly to you. I assure you, this was not on purpose, and I hope that this does not serve to drive us apart.'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_2';


-- Human denounces AI
UPDATE Language_en_US
SET Text = 'So, is that how it is, then? Very well. I shall not forget this.'
WHERE Tag = 'TXT_KEY_RESPONSE_TO_BEING_DENOUNCED_1';


-- AI denounces human
UPDATE Language_en_US
SET Text = 'It''s time I told the world of your sins.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_1';

UPDATE Language_en_US
SET Text = 'I''ve spoken to the other leaders about you. They need to know you are not to be trusted.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_2';

UPDATE Language_en_US
SET Text = 'Just so you''re aware, the other leaders have now heard the grim truth about you.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_3';

UPDATE Language_en_US
SET Text = 'I''ve had enough of you. I''ve told the other leaders of the world that working with you is a mistake.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_1';

UPDATE Language_en_US
SET Text = 'Alright, enough is enough. Informing everyone else of your ill deeds is long overdue.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_2';


-- Human Refuses Request to Denounce Third Party (Not Forgiven)
UPDATE Language_en_US
SET Text = 'Pathetic. So you now show your true colors. The world will know of your dishonor.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_1';

UPDATE Language_en_US
SET Text = 'So that is the kind of ally you are, then? The rest of the world''s leaders will hear of your betrayal.[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]They have publicly denounced us![ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_2';


-- Human declares war on AI
UPDATE Language_en_US
SET Text = 'Declaring war was a serious error in judgement on your part. That having been said, I will not hesitate to make you regret it.'
WHERE Tag = 'TXT_KEY_GENERIC_ATTACKED_STRONG_HOSTILE_4';

UPDATE Language_en_US
SET Text = 'Why, you... you... worthless barren mule! I will crush you!'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_ATTACKED_1';

UPDATE Language_en_US
SET Text = 'Unfortunately, not everybody in my country is as committed to non-violence as I am, so please let me apologize in advance if your forces are destroyed to the last man.'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_ATTACKED_2';

UPDATE Language_en_US
SET Text = 'We shall destroy you, you know. Do you care for some cheese?'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_2';

UPDATE Language_en_US
SET Text = 'Oh well. I presume you know what you''re doing.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_3';

UPDATE Language_en_US
SET Text = 'What cursed treachery is this? Have you no honor, no shame?'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_1';

UPDATE Language_en_US
SET Text = 'You sad little person. Soon you shall feel the full weight of our mighty science bearing down upon you.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_2';

UPDATE Language_en_US
SET Text = 'Excellent, excellent! I have been looking for a reason to try out my newly outfitted army, and you have provided me with just the occasion.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_3';


-- AI War Bluff
UPDATE Language_en_US
SET Text = 'Foolish, foolish...'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_WARBLUFF_1';

UPDATE Language_en_US
SET Text = 'The drums - the drums! They pound in my brain, drowning out thoughts of vengeance.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_1';

UPDATE Language_en_US
SET Text = 'The next time, I shall not be so polite.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_4';

UPDATE Language_en_US
SET Text = 'Very well. The next time, I shall not be so polite!'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_WARBLUFF_2';


-- AI declares war on human
UPDATE Language_en_US
SET Text = 'I had a feeling that the two of us would someday meet in the field of battle. We will now see which of us is meant to be victorious.'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_2';

UPDATE Language_en_US
SET Text = 'It is time to fight. May the best of us win.'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_3';

UPDATE Language_en_US
SET Text = 'Destruction might be the fate which awaits me, but should I back down, only eventual defeat awaits anyway.'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_DESPERATE_8';

UPDATE Language_en_US
SET Text = 'I believe that in another life, the two of us could have been friends. Unfortunately, that is not how it is now. I wish your armies luck.'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_REGRET_1';

UPDATE Language_en_US
SET Text = 'So be it. My armies will extract it from your lands, then.'
WHERE Tag = 'TXT_KEY_WAR_DEMAND_REFUSED_1';

UPDATE Language_en_US
SET Text = 'Your many insults to us and to our loyal subjects will not go unpunished - prepare for war!'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DECLAREWAR_1';

UPDATE Language_en_US
SET Text = 'I am sending a contingent of Indian soldiers on a goodwill tour of your major cities. I trust that they will be received with open arms.'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_DECLAREWAR_2';

UPDATE Language_en_US
SET Text = 'It was inevitable that we would come to blows, and now is as good a time as another.'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_DECLAREWAR_1';

UPDATE Language_en_US
SET Text = 'Your people remain backwards and primitive. Clearly a change of regime is in order. Prepare for war!'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_DECLAREWAR_1';

UPDATE Language_en_US
SET Text = 'The Hall grows weary of your tiresome antics. We shall forcefully liberate your downtrodden, and lead them to enlightenment.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_1';

UPDATE Language_en_US
SET Text = 'Time waits for no man, and I feel its changeless march growing ever more urgent. You stand in our way, and I have not the resources left for more diplomatic means.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_2';

UPDATE Language_en_US
SET Text = 'I''ve experiments to run, research to be done, and here you stand like an aging wall to block my path. I shall remove you.'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_3';


-- Responses to human saying "No"
UPDATE Language_en_US
SET Text = 'I have no more business with the likes of you, then.'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_RESPONSE_BAD_2';


-- AI Insults
UPDATE Language_en_US
SET Text = 'I couldn''t help but notice how pathetic you are. And when I realized it, I couldn''t help but share.'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_GENERIC_1';

UPDATE Language_en_US
SET Text = 'With an army as weak as yours, it''s a surprise your empire hasn''t succumb to a barbarian invasion.'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_MILITARY_2';

UPDATE Language_en_US
SET Text = 'I can hear your people wailing in sorrow all the way over in my empire. If you don''t do something soon, they might just pack up and find a real civilization to live in.'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_1';

UPDATE Language_en_US
SET Text = 'With your people so unhappy, it''s a shock to me that they''d keep you around as their leader.'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_2';

UPDATE Language_en_US
SET Text = 'Travelers have told us that your empire''s economy is in pretty sad shape. If you beg a little, I might give you a hand. Okay, actually, I won''t.'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_POPULATION_1';


-- AI wins war
UPDATE Language_en_US
SET Text = 'I hope you have learned your lesson. I am invincible!'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_WINWAR_1';

UPDATE Language_en_US
SET Text = 'That was refreshing. If the demons are sated, perhaps they will give us a little respite now.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WINWAR_1';


-- AI defeated
UPDATE Language_en_US
SET Text = 'You have done well. I shall put in a good word for you to the demons.'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEFEATED_1';

UPDATE Language_en_US
SET Text = 'This is why I prefer diplomacy to violence!'
WHERE Tag = 'TXT_KEY_LEADER_PEDRO_DEFEATED_1';

UPDATE Language_en_US
SET Text = 'My kingdom will always remember its true king...regardless of your petty victory.'
WHERE Tag = 'TXT_KEY_LEADER_CASIMIR_DEFEATED_3';


-- Report Coop War Plans to Target AI
UPDATE Language_en_US
SET Text = 'Impossible. You go too far.'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU';


-- End Declaration of Friendship
UPDATE Language_en_US
SET Text = 'Our Declaration of Friendship must end.'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_MESSAGE_END_WORK_WITH_US';

UPDATE Language_en_US
SET Text = 'Your actions are unforgivable. There can never be reconciliation between our two nations.[NEWLINE][NEWLINE](You are no longer friends with them. If you denounce this player or declare war on them within the next [COLOR_WARNING_TEXT]10[ENDCOLOR] turns, you will receive a diplomatic penalty for backstabbing them.)'
WHERE Tag = 'TXT_KEY_NOW_UNFORGIVABLE_1';

UPDATE Language_en_US
SET Text = 'I did not want things to end up like this, but I cannot overlook your warmongering. Consider our Declaration of Friendship ended.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WARMONGER_1';

UPDATE Language_en_US
SET Text = 'Your dealings with City-States in my sphere of influence are unacceptable. Consider our Declaration of Friendship ended.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_MINORS_1';

UPDATE Language_en_US
SET Text = 'I fear that our close proximity was destined to poison our relationship. Consider our Declaration of Friendship ended.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_LAND_1';

UPDATE Language_en_US
SET Text = 'Your continued greed in collecting wonders of the world has become a major issue. Consider our Declaration of Friendship ended.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WONDERS_1';

UPDATE Language_en_US
SET Text = 'It is clear to me now that the paths we are traveling must ultimately drive us apart. Consider our Declaration of Friendship ended.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_VICTORY_1';

UPDATE Language_en_US
SET Text = 'Circumstances have changed, and I believe there is no longer a need for our Declaration of Friendship to continue. I hope you can understand.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_1';

UPDATE Language_en_US
SET Text = 'I am sorry, but it is time for our Declaration of Friendship to end.'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_2';


-- Kiev -> Kyiv
UPDATE Language_en_US
SET Text = 'Kyiv'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV';

UPDATE Language_en_US
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV_ADJ';

UPDATE Language_en_US
SET Text = 'According to legend, Kyiv was founded by three Slavic brothers - Kyi, Schek, and Khoryv -around the beginning of the 6th Century AD. Since then, Kyiv, one of the oldest cities in Eastern Europe, has passed through times of great prominence and periods of relative obscurity. Throughout the centuries, however, it has remained the most important Slavic cultural center, playing a pivotal role in the development of the medieval East Slavic civilization.[NEWLINE][NEWLINE]Located on the Dnieper trade route between Constantinople and Scandinavia, Kyiv came under the control of local Varangian (Viking) nobility and became the nucleus of the state of Rus. During the 1000s, it reached its ascendancy, a cultural hub with over 400 churches, eight markets, docks and a caravansary, and magnificent homes. With the founding of the Kyiv-Mogilyanskaya Academy in 1632, the city became the center of Ukrainian learning and scholarship. But as the capital of Kyivan Rus, the city was repeatedly sacked and occupied.[NEWLINE][NEWLINE]In 1667 the city became part of the Russian Empire; Kyiv remained an ecclesiastical and cultural center, but its political and economic influence was marginalized. Kyiv experienced growing "Russification" in the 1800s, as a result of Russian migration, educational policies, and industrialization. However, enthusiasts among ethnic Ukrainian nobles, military officers and merchants kept the native culture alive in Kyiv, often through clandestine activities such as book-printing, amateur theater, private soirees, folk festivals and the like.[NEWLINE][NEWLINE]Forcefully incorporated into the Soviet Union, the city weathered all manner of troubles: the famine of 1932-1933 devastated the lower classes, Stalin''s 1937-1938 purges almost obliterated the city''s intelligensia, and the 1941-1943 Nazi invasion brought death and destruction. But Kyiv survived, and in the wake of the collapse of the Soviet Union an independent Ukraine was proclaimed in 1991, with resurgent Kyiv as its capital and cultural heart.'
WHERE Tag = 'TXT_KEY_CIV5_KIEV_TEXT';

UPDATE Language_en_US
SET Text = 'The Eastern Orthodox Church is currently the second-largest Christian denomination, with an estimated 300 million adherents. The goal of Orthodox Christians is to draw nearer to God throughout their lives through theosis, a spiritual pilgrimage to become more "Christ-like."[NEWLINE][NEWLINE]The church traces its roots to the Great Schism. During the 9th and 10th centuries AD the Christian church under the Patriarch of Constantinople made significant conversions among the peoples of eastern Europe, including Kyivan Russia and the Balkans. Doctrinal issues such as the filioque split and the authority of the Pope over the Patriarch in matters religious, exacerbated by the political and economic rivalry of Rome and Constantinople, led to a schism. The final breach between these two branches of Christianity is acknowledged as the sacking of Constantinople by the Catholic crusaders in 1204 AD. Moreover, after the fall of Constantinople to the Ottomans in 1453, the Eastern Church became even more isolated from Rome under the relatively tolerant rule of the Turks. The Orthodox Church, which saw itself as the true heir to the teachings and practices of the early Christians, flourished under the Russian Tsars. Although somewhat diminished by Communist rule and Balkan secularism, Eastern Orthodoxy has experienced a resurgence in recent decades and remains a vital aspect of Christianity.'
WHERE Tag = 'TXT_KEY_RELIGION_ORTHODOXY_PEDIA';

UPDATE Language_en_US
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_HEADING_4';

UPDATE Language_en_US
SET Text = 'The eighth century saw the first written record of "Kyivan Rus." The Rus are believed to have been Scandinavian Vikings who migrated south from the Baltic coast (although this is disputed by some Russian scholars, who believe that the original founders of Kyivan Rus were Slavs). By 860 the Rus were sending raiding parties as far south as Constantinople, and by 1000 AD Kyivan Rus controlled a trade route from the Baltic to the Black Sea; this would form the economic backbone of the growing regional power.[NEWLINE][NEWLINE]By the 12th century, the Kyiv Empire covered much of what would become eastern Russia, extending from Poland in the west to the Volga in the east, and from Finland in the north to the Ukraine in the south. It was a vast territory to manage from one centralized location, especially as component parts of the Empire began developing individual identities and national aspirations. Economically, the Empire also became divided, with northern provinces aligning themselves with the Baltic powers while the western areas were drawn to Poland and Hungary, and the southern regions to Asia Minor and the Mediterranean. By the closing of the 12th century Rus Kyiv was dissolved in all but name, replaced by a number of smaller quasi-feudal states.'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_4';

UPDATE Language_en_US
SET Text = 'The first Mongol incursion into Kyivan territory occurred in 1223, when a Mongol reconnaissance unit met the combined warriors of several Rus states under the command of the wonderfully-named "Mstislav the Bold" and "Mstislav Romanovich the Old" at the Battle of the Kalka River. The Rus forces enjoyed early success, but they became disorganized in the pursuit of the retreating foe. The Mongol horsemen rallied and defeated the pursuers in detail before they could reorganize. A large portion of the Rus forces surrendered to the Mongols on the condition that they would be spared; the Mongols accepted the conditions then slaughtered them anyway. The Mongols then left Rus for several years before returning in much greater force.[NEWLINE][NEWLINE]In 1237 a vast Mongol army of some 30,000 or more horse archers once again crossed the Volga River. In a few short years the Mongols captured, looted and destroyed dozens of Russian cities and towns, including Ryazan, Kolomna, Moscow, Rostov, Kashin, Dmitrov, Kozelsk, Halych and Kyiv. They soundly thrashed every force raised to oppose them. By 1240 most of Rus was a smoking ruin, firmly under the control of the Mongols, who then turned their sight further west, towards Hungary and Poland.[NEWLINE]'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_5';

--Texts for New Wonder and Building Production Modifiers, either by Trait, Improvement or UnitPromotion, among others
INSERT INTO Language_zh_CN
			(Tag,															Text)
VALUES		('TXT_KEY_PRODMOD_WONDER_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]来自奇观的驻守加成: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_UNIT_TRAIT',			'[NEWLINE][ICON_BULLET]来自驻守单位的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_IMPROVEMENT_TRAIT',	'[NEWLINE][ICON_BULLET]来自设施的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_POLICY_TRAIT',		'[NEWLINE][ICON_BULLET]来自政策的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RELIGION_TRAIT',		'[NEWLINE][ICON_BULLET]来自信条的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RESOURCE_TRAIT',		'[NEWLINE][ICON_BULLET]来自资源的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_PLAYER_TRAIT',		'[NEWLINE][ICON_BULLET]来自领袖特性的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_CITY_TRAIT',			'[NEWLINE][ICON_BULLET]来自城市的奇观产能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_IMPROVEMENT',							'[NEWLINE][ICON_BULLET]奇观带来的设施建造速率: {1_Num}%'),
			('TXT_KEY_RELIGION_TOOLTIP_EXTENDED',							'{1_ReligionIcon}{2_NumFollowers} 信徒（{3_TotalPressure}+{4_PressurePerTurn}（每回合）宗教压力，总共来自{5_Num}座城市）'),
			('TXT_KEY_EUPANEL_EMBARKATION_DEFENSE',							'海运防御'),
			('TXT_KEY_EUPANEL_UNITCLASS_NEAR',								'邻近具有战斗加成的单位'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_COMBAT_BONUS',				'邻近晋升单位修正'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_CITY_COMBAT_BONUS',			'邻近晋升城市修正'),
			('TXT_KEY_PRODMOD_MILITARY_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]来自军事单位的驻守修正：{1_Num}%'),
			('TXT_KEY_PRODMOD_YIELD_UNITPROMOTION',							'[NEWLINE][ICON_BULLET]来自单位驻守的城市修正：{1_Num}%'),
			('TXT_KEY_NOTIFICATION_CULTURE_UNIT',							'{1_Resource:textkey}的诞生为你的文明带来一次文化增长'),
			('TXT_KEY_NOTIFICATION_SUMMARY_CULTURE_UNIT',					'一处{1_Resource:textkey}带来了灵感！');

-- Game Options

INSERT INTO Language_zh_CN
			(Tag,											Text)
VALUES		('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS',		'VP-野蛮人GG/GA点数'),
			('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS_HELP',	'允许所有玩家在和野蛮人战斗中获取陆军统帅/海军统帅点数。');
			
UPDATE Language_zh_CN
SET Text = '每次加载游戏时，都会重新生成随机种子。这意味着如果你重新加载游戏，一些随机结果和AI决策可能与你第一次玩游戏时有所不同。'
WHERE Tag = 'TXT_KEY_GAME_OPTION_NEW_RANDOM_SEED_HELP';

UPDATE Language_zh_CN
SET Text = '{1_Num}%惩罚 由于意识形态不同：[NEWLINE]   '
WHERE Tag = 'TXT_KEY_CO_CITY_TOURISM_DIFFERENT_IDEOLOGY_PENALTY';

UPDATE Language_zh_CN
SET Text = '{1_Num}%惩罚 由于意识形态不同[NEWLINE]'
WHERE Tag = 'TXT_KEY_CO_PLAYER_TOURISM_DIFFERENT_IDEOLOGIES';

-- Advisors
UPDATE Language_zh_CN
SET Text = '我不确定{1_LongCivName:textkey}是否有一支军队，任何针对他们的敌对行动都是可笑的。'
WHERE Tag = 'TXT_KEY_DIPLOSTRATEGY_MILITARY_STRENGTH_COMPARED_TO_US_PATHETIC';

UPDATE Language_zh_CN
SET Text = '{1_name}增长进度'
WHERE Tag = 'TXT_KEY_PROGRESS_TOWARDS';
-- Leaders

-- Assyria UA
INSERT INTO Language_zh_CN
			(Tag,										Text)
SELECT		'TXT_KEY_SCIENCE_BOOST_CONQUEST_ASSYRIA',	'你的士兵在征服{1_Name}时，从城市中获得了一些科研资料，+[ICON_RESEARCH]科研！'
WHERE EXISTS (SELECT * FROM CustomModOptions WHERE Name='ALTERNATE_ASSYRIA_TRAIT' AND Value= 1 );


-- Cities

-- Razing
UPDATE Language_zh_CN	
SET Text = '选择[COLOR_POSITIVE_TEXT]夷平[ENDCOLOR]将使城市会以每回合减1人口的速度被[ICON_RAZING]夷平，至人口为0时将被完全摧毁。这会产生大量的[ICON_HAPPINESS_4]不满，但会增加你对该文明的[COLOR_POSITIVE_TEXT]战争分数[ENDCOLOR]。'
WHERE Tag = 'TXT_KEY_POPUP_CITY_CAPTURE_INFO_RAZE';

-- Production Queue
UPDATE Language_zh_CN
SET Text = '左击将此项目添加至生产队列末尾。[NEWLINE]Ctrl+左击将此项目添加至生产队列最前端。[NEWLINE]Alt+左击将此项目添加至生产队列的末尾（使其重复）。[NEWLINE]Shift+左击将生产队列全部内容变更为此项目。'
WHERE Tag = 'TXT_KEY_CITYVIEW_QUEUE_PROD_TT';

-- Avoid Growth
UPDATE Language_zh_CN
SET Text = '选中以阻止城市[ICON_CITIZEN]人口增长。'
WHERE Tag = 'TXT_KEY_CITYVIEW_FOCUS_AVOID_GROWTH_TT';

-- All Growth Modifier Tooltips with Icons
UPDATE Language_zh_CN
SET Text = '[NEWLINE][ICON_BULLET][ICON_CONNECTED]全文明修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_PLAYER';

UPDATE Language_zh_CN
SET Text = '[NEWLINE][ICON_BULLET][ICON_RELIGION_PANTHEON]宗教信条修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_RELIGION';

UPDATE Language_zh_CN
SET Text = '[NEWLINE][ICON_BULLET][ICON_HAPPINESS_1]“我们爱国王日”修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_WLTKD';


-- Units

-- Movement
UPDATE Language_zh_CN
SET Text = '移动单位'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT';

UPDATE Language_zh_CN
SET Text = '将单位移动至可以结束回合的地格上。'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT_TT';

UPDATE Language_zh_CN
SET Text = '允许陆地单位海运并穿越水域。'
WHERE Tag = 'TXT_KEY_ALLOWS_EMBARKING';

-- Capture Chance
UPDATE Language_zh_CN
SET Text = '[COLOR_CYAN]战胜时俘获敌军的几率[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_EUPANEL_CAPTURE_CHANCE';

-- Interception
UPDATE Language_zh_CN
SET Text = '[COLOR_WARNING_TEXT]已知敌方防空单位数: {1_Number}[ENDCOLOR]！'
WHERE Tag = 'TXT_KEY_EUPANEL_VISIBLE_AA_UNITS';

-- Great Generals I/II Promotions
UPDATE Language_zh_CN
SET Text = '战斗中额外产生[COLOR_POSITIVE_TEXT]50%[ENDCOLOR][ICON_GREAT_GENERAL]陆军统帅点数。'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_I_HELP';

UPDATE Language_zh_CN
SET Text = '战斗中额外产生[COLOR_POSITIVE_TEXT]100%[ENDCOLOR][ICON_GREAT_GENERAL]陆军统帅点数。'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_II_HELP';

-- Naval Melee Units
UPDATE Language_zh_CN
SET Text = '三列桨战船是每个文明都可以建造的最早的海军单位。作为一种近程单位，它可以攻击海上和城中的单位（但不能远程攻击）。三列桨战船在清扫己方城市附近水域的蛮族船只和有限地探索时可以派上用场。'
WHERE Tag = 'TXT_KEY_UNIT_TRIREME_STRATEGY';

-- Naval Ranged Units
UPDATE Language_zh_CN
SET Text = '桨帆战舰是游戏中第一种具有远程攻击能力的海军单位。它与较早的海军单位相比攻击能力更强，但速度较慢，也无法进行近战。桨帆战船在将敌军船只驱逐出近海区域时作用明显（无法在大洋地块结束回合，除非属于波利尼西亚文明）。'
WHERE Tag = 'TXT_KEY_UNIT_GALLEASS_STRATEGY';

-- Ocean travel change
UPDATE Language_zh_CN
SET Text = '无法在大洋结束回合'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE';

INSERT INTO Language_zh_CN
		(Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP', '无法在大洋结束回合，但当终点为海岸时可以穿越大洋。');

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP'
WHERE Type = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Language_zh_CN
SET Text = '研究天文学前无法在大洋结束回合'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO';

UPDATE Language_zh_CN
SET Text = '研究[COLOR_POSITIVE_TEXT]天文学[ENDCOLOR]前无法在大洋结束回合，但当终点为海岸时可以穿越大洋。'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO_HELP';

-- Siege Units
UPDATE Language_zh_CN
SET Text = '在敌方境内消耗双倍移动力'
WHERE Tag = 'TXT_KEY_PROMOTION_MUST_SET_UP';

UPDATE Language_zh_CN
SET Text = '在敌方境内消耗双倍移动力'
WHERE Tag = 'TXT_KEY_PEDIA_PROMOTION_MUST_SET_UP';

UPDATE Language_zh_CN
SET Text = '最早的攻城单位。能够从远处对城市造成大量伤害，但在敌方境内消耗双倍移动力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CATAPULT';

UPDATE Language_zh_CN
SET Text = 'The Catapult is a siege weapon, extremely useful when assaulting early enemy cities。It is slow and extremely vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field。It moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_UNIT_CATAPULT_STRATEGY';

UPDATE Language_zh_CN
SET Text = 'Siege Unit that does major damage from a distance。Moves at half-speed in enemy territory。Only the Romans may build it。This Unit has a higher [ICON_RANGE_STRENGTH] Ranged Combat Strength than the Catapult, which it replaces。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';

UPDATE Language_zh_CN
SET Text = 'The Ballista is a Roman unique unit that is more powerful than the Catapult it replaces。It is an excellent siege weapon and extremely useful against cities, but it is quite vulnerable to attack。Be sure to protect the Ballista with other military units。Moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_BALLISTA_STRATEGY';

UPDATE Language_zh_CN
SET Text = '中古时代的攻城单位，能够从远处对城市造成大量伤害，但在敌方境内消耗双倍移动力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_TREBUCHET';

UPDATE Language_zh_CN
SET Text = 'A Trebuchet is a medieval siege weapon, significantly more powerful than the earlier Catapult units。The Trebuchet moves at half-speed in enemy territory, but once it is in position it can do serious damage to a fortified enemy city。Defend your trebuchets with melee and ranged units to keep enemy units from getting too close。'
WHERE Tag = 'TXT_KEY_UNIT_TREBUCHET_STRATEGY';

UPDATE Language_zh_CN
SET Text = '中古时代的强力压制单位，取代抛石机，仅朝鲜能够组建。每回合能额外攻击一次。'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP';

UPDATE Language_zh_CN
SET Text = 'The Hwach''a is extremely effective against enemy land units。It is slow and vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field。The Hwach''a moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_zh_CN
SET Text = '启蒙时代的压制单位，能够从远处对城市造成大量伤害，但在敌方境内消耗双倍移动力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CANNON';

UPDATE Language_zh_CN
SET Text = 'The Cannon is an important mid-game siege unit, devastating against civilizations which have not yet acquired them。Like other siege units, the Cannon moves at half-speed in enemy territory。The Cannon remains potent into the Industrial Era。It cannot see as far as other units, and should be protected with melee units。'
WHERE Tag = 'TXT_KEY_UNIT_CANNON_STRATEGY';

UPDATE Language_zh_CN
SET Text = '拥有3格射程的强大压制单位，能够从远处对城市造成大量伤害，但在敌方境内消耗双倍移动力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ARTILLERY';

UPDATE Language_zh_CN
SET Text = 'Artillery is a deadly siege weapon, more powerful than a Cannon and with a longer range。Like the Cannon, it has limited visibility and moves at half-speed in enemy territory, but its Ranged Combat strength is tremendous。Artillery also has the "indirect fire" ability, allowing it to shoot over obstructions at targets it cannot see (as long as other friendly units can see them)。Like other siege weapons, Artillery is vulnerable to melee attack。'
WHERE Tag = 'TXT_KEY_UNIT_ARTILLERY_STRATEGY';

UPDATE Language_zh_CN
SET Text = '游戏后期的快速压制单位。与其他压制单位不同，该单位在敌方境内不会消耗双倍移动力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ROCKET_ARTILLERY';

UPDATE Language_zh_CN
SET Text = 'Rocket Artillery is an extremely powerful siege weapon, far superior to the standard artillery。Rocket Artillery does not lose speed in enemy territory, making it much quicker than earlier guns。Although the Rocket Artillery''s sight range is limited, it can use indirect fire to attack targets it cannot see (as long as other friendly units can see them)。Like all artillery, it is vulnerable to infantry or armor attack, and should be defended by appropriate units。'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';

-- Giant Death Robot
UPDATE Language_zh_CN
SET Text = '无法受益于地形防御修正，即便如此它依然比游戏中所有其他军事单位强大得多。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MECH';


-- Buildings

-- "Votes from World Wonders" -> "Votes from Wonders"
UPDATE Language_zh_CN
SET Text = '[NEWLINE][ICON_BULLET]{1_NumVotes} 来自奇观'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_MEMBER_DETAILS_WONDER_VOTES';

-- National Wonders
UPDATE Language_zh_CN
SET Text = '基于城邦数量提供额外的间谍，使当前拥有的间谍晋升1级，并能够使敌方间谍效率降低15%。需要所有城市已建造警察局。'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';

UPDATE Language_zh_CN
SET Text = 'An important defensive National Wonder for a technology-driven civilization。The National Intelligence Agency provides additional spies, levels up all your existing spies, and provides a 15% reduction in enemy spy effectiveness。A civilization must have a Police Station in all cities before it can construct the National Intelligence Agency。'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_STRATEGY';


-- Tile Yields

UPDATE Language_zh_CN	
SET Text = '基础产出：'
WHERE Tag = 'TXT_KEY_PEDIA_YIELD_LABEL';

UPDATE Language_zh_CN	
SET Text = '开发设施：'
WHERE Tag = 'TXT_KEY_PEDIA_IMPROVEMENTS_LABEL';

UPDATE Language_zh_CN
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_YIELDCHANGES';

UPDATE Language_zh_CN
SET Text = '{1_ImprovementName:textkey}：+{3_Num}{2_YieldType:textkey}(非淡水)。'
WHERE Tag = 'TXT_KEY_NO_FRESH_WATER';

UPDATE Language_zh_CN
SET Text = '(非淡水)'
WHERE Tag = 'TXT_KEY_ABLTY_NO_FRESH_WATER_STRING';

UPDATE Language_zh_CN
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}{TXT_KEY_ABLTY_NO_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_NOFRESHWATERYIELDCHANGES';

UPDATE Language_zh_CN
SET Text = '{1_ImprovementName:textkey}：+{3_Num}{2_YieldType:textkey}(淡水)。'
WHERE Tag = 'TXT_KEY_FRESH_WATER';

UPDATE Language_zh_CN
SET Text = '(淡水)'
WHERE Tag = 'TXT_KEY_ABLTY_FRESH_WATER_STRING';

UPDATE Language_zh_CN
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}{TXT_KEY_ABLTY_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_FRESHWATERYIELDCHANGES';

UPDATE Language_zh_CN
SET Text = '{TXT_KEY_ABLTY_FASTER_MOVEMENT_STRING}{@1_RouteDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_MOVEMENT';


-- Improvements

UPDATE Language_zh_CN
SET Text = '军事要塞是陆军统帅建造的强大改良设施，通常位于城市中易于防御的地形之上。你可以在你的领土上建立军事要塞。军事要塞建成后，你的文化边界会扩张到覆盖军事要塞周围一圈所有的格子。如果扩张的格子原本属于其他文明，则这一举动会造成负面的外交影响。在军事要塞中的单位可获得100%的防御战斗力加成。而任何在军事要塞旁结束回合的敌方单位则将遭受30点损伤（多个军事要塞不叠加伤害）。[NEWLINE][NEWLINE]希腊的雅典卫城就是军事要塞的典型例子。这种设施几乎不可能被外来者攻陷，即使最终被攻破，也是在承受了长时间的围攻之后。'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_CITADEL_TEXT';

UPDATE Language_zh_CN
SET Text = '修建一座摩艾石像群(+1[ICON_CULTURE]文化)。每邻近一处摩艾石像群额外+1[ICON_CULTURE]文化，研究航空科技后+1[ICON_GOLD]金钱。只能毗邻海洋建造。'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_zh_CN
SET Text = '摩艾石像群只能毗邻海洋建造。每邻近一处摩艾石像群提供额外[ICON_CULTURE]文化，研究航空科技后产出额外[ICON_GOLD]金钱。'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';


-- CS Stuff

-- Merchant of Venice
UPDATE Language_zh_CN
SET Text = '这名威尼斯商人将使用他富可敌国的财富来买下这座城邦作为一个[ICON_PUPPET]傀儡城市。你将获得这座城邦的全部单位。'
WHERE Tag = 'TXT_KEY_MISSION_BUY_CITY_STATE_HELP';

UPDATE Language_zh_CN
SET Text = '你的威尼斯商人购买了一座城邦。'
WHERE Tag = 'TXT_KEY_VENETIAN_MERCHANT_BOUGHT_CITY_STATE';

-- Militaristic UU Tooltip
UPDATE Language_zh_CN
SET Text = '友好的[COLOR_POSITIVE_TEXT]军事型[ENDCOLOR]城邦将向你提供高级军事单位。[NEWLINE][NEWLINE]他们掌握[COLOR_POSITIVE_TEXT]{@1_UniqueUnitName}[ENDCOLOR]的秘密。如果你是他们的盟友，并已研究[COLOR_CYAN]{@2_PrereqTech}[ENDCOLOR]，他们会赠送你此单位。'
WHERE Tag = 'TXT_KEY_CITY_STATE_MILITARISTIC_TT';

-- Bullying/Tribute
UPDATE Language_zh_CN
SET Text = '役使{@1_Unit} - 消耗{2_NumInfluence}[ICON_INFLUENCE]影响力'
WHERE Tag = 'TXT_KEY_POPUP_MINOR_BULLY_UNIT_AMOUNT';

UPDATE Language_zh_CN
SET Text = '如果城邦对你的[COLOR_POSITIVE_TEXT]恐惧[ENDCOLOR]胜过他们的[COLOR_WARNING_TEXT]抵抗[ENDCOLOR]。你可以勒索这个城邦{@3_Unit}，你会损失[ICON_INFLUENCE]影响力。{1_FearLevel}{2_FactorDetails}'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_UNIT_TT';

UPDATE Language_zh_CN
SET Text = '不久前被勒索过'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_RECENTLY';

UPDATE Language_zh_CN
SET Text = '刚被勒索过'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_VERY_RECENTLY';

INSERT INTO Language_zh_CN
			(Tag,										Text)
SELECT		'TXT_KEY_POP_CSTATE_BULLY_FACTOR_MONGOL_TERROR',	'你不久前吞并了一个城邦';

-- Fixed quest text - transitioned to new 'quest rewards' panel
UPDATE Language_zh_CN
SET Text = '你成功摧毁了{1_MinorCivName:textkey}所指定的蛮族营地！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CAMP';

UPDATE Language_zh_CN
SET Text = '{2_CivName:textkey}与{1_TargetName:textkey}的战争爆发了！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_KILL_CITY_STATE';

UPDATE Language_zh_CN
SET Text = '{3_TargetName:textkey}向{1_CivName:textkey}的战争行为引发了国际关注。[COLOR_NEGATIVE_TEXT]征服[ENDCOLOR]{3_CivName:textkey}将获得来自{1_TargetName:textkey}的[COLOR_POSITIVE_TEXT]全部[ENDCOLOR]任务奖励，或是同时与两个城邦[COLOR_POSITIVE_TEXT]结盟[ENDCOLOR]进行调停以获得[COLOR_POSITIVE_TEXT]部分[ENDCOLOR]任务奖励。来自国际社会的舆论压力将迫使战争在[COLOR_POSITIVE_TEXT]{2_Num}[ENDCOLOR]回合内结束，如果你有意干预，请尽快行动！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_KILL_CITY_STATE';

UPDATE Language_zh_CN
SET Text = '征服{1_CityStateName:textkey}（完整奖励），或是同时与{1_CityStateName:textkey}以及该城邦结盟（部分奖励）。'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CITY_STATE_FORMAL';

UPDATE Language_zh_CN
SET Text = '{1_TargetName:textkey}被{2_CivName:textkey}击败！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_zh_CN
SET Text = '{2_CivName:textkey}与{1_TargetName:textkey}的战争已经结束，{2_CivName:textkey}成为无可争议的胜利者。你的顾问担心这一结果会为未来的潜在冲突埋下种子。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_zh_CN
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功将{1_ResourceName}连入了你的贸易网络，他们的商人非常高兴！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONNECT_RESOURCE';

UPDATE Language_zh_CN
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功建造了{1_WonderName}！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONSTRUCT_WONDER';

UPDATE Language_zh_CN
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功培养出一位{1_UnitName}，他们的学者深感敬畏！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GREAT_PERSON';

UPDATE Language_zh_CN
SET Text = '你发现了一处自然奇观，让{1_MinorCivName:textkey}中的市民感到惊奇不已！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_NATURAL_WONDER';

UPDATE Language_zh_CN
SET Text = '你发现了{1_TargetName:textkey}，这让{2_MinorCivName:textkey}的商人大为喜悦！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_PLAYER';

UPDATE Language_zh_CN
SET Text = '你慷慨的经济援助帮助{2_MinorCivName:textkey}从被{1_BullyName:textkey}勒索后的困境中拯救出来！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GIVE_GOLD';

UPDATE Language_zh_CN
SET Text = '{2_MinorCivName:textkey}高兴地看到它的竞争对手{1_TargetName:textkey}跪地求饶并放弃了来之不易的资源。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_BULLY_CITY_STATE';

UPDATE Language_zh_CN
SET Text = '你承诺保护的{2_MinorCivName:textkey}已从被{1_BullyName:textkey}勒索后的困境中拯救出来！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_PLEDGE_TO_PROTECT';

UPDATE Language_zh_CN
SET Text = '{2_MinorCivName:textkey}感到欣慰，因其在与{1_TargetName:textkey}的外交中遭到的野蛮对待引起了国际社会的普遍关注。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_DENOUNCE_MAJOR';

UPDATE Language_zh_CN
SET Text = '{@2_MinorCivName}的市民乐于见到{@1_ReligionName}能传入他们的城市并成为主要宗教。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_SPREAD_RELIGION';

UPDATE Language_zh_CN
SET Text = '{@1_MinorCivName}的市民很高兴见到与我们的商贸来往。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_TRADE_ROUTE';

UPDATE Language_zh_CN
SET Text = '你的文化繁荣给{1_MinorCivName:textkey}留下深刻印象！相比之下，其他文明黯然失色。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_CULTURE';

UPDATE Language_zh_CN
SET Text = '另一个文明的文化繁荣给{1_MinorCivName:textkey}留下深刻影响。你的文化增长相形见绌。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_CULTURE';

UPDATE Language_zh_CN
SET Text = '{1_MinorCivName:textkey}的僧侣为你的虔诚所打动。他们鄙弃其它文明野蛮的信仰。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_FAITH';

UPDATE Language_zh_CN
SET Text = '另一个文明用他们的信仰感动了{1_MinorCivName:textkey}。你的信仰增长相形见绌。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_FAITH';

UPDATE Language_zh_CN
SET Text = '{1_MinorCivName:textkey}惊讶于你高速的科技进步！他们的科学家对其他文明不屑一顾。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_TECHS';

UPDATE Language_zh_CN
SET Text = '另一个文明的科技进步深深震撼了{1_MinorCivName:textkey}。你的科研进度相形见绌。完成任务的文明（允许并列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_TECHS';


-- Happiness

-- City Revolt
UPDATE Language_zh_CN
SET Text = '由于国家的[ICON_HAPPINESS_4]支持率已跌到34%以下（或是公共舆论已达到革命浪潮），[COLOR_NEGATIVE_TEXT]{1_Turns}[ENDCOLOR]回合内将会有城市发动叛乱。基于当前的不满程度和意识形态的压力，最有可能叛乱的城市是{2_CityName}，他们会选择投靠{3_CivName}。请尽一切可能迅速提升国民的快乐度！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_POSSIBLE_CITY_REVOLT';

UPDATE Language_zh_CN
SET Text = '由于国家的[ICON_HAPPINESS_4]支持率已跌到34%以下，{1_CityName}已经发动叛乱并加入了{2_CivName}！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_CITY_REVOLT';

UPDATE Language_zh_CN
SET Text = '由于国家的[ICON_HAPPINESS_4]支持率已跌到34%以下，境内发生了一场叛乱！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_REBELS';

-- Pantheons Founded

UPDATE Language_zh_CN
SET Text = '你的人民已经开始崇拜一种神系，他们选择的信条是：[COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR]（{@2_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_ACTIVE_PLAYER';

UPDATE Language_zh_CN
SET Text = '{@1_CivName}已经开始崇拜一种神系。他们选择的信条是：[COLOR_POSITIVE_TEXT]{2_BeliefName}[ENDCOLOR]（{@3_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED';

UPDATE Language_zh_CN
SET Text = '未知文明已经开始崇拜一种神系，他们选择的信条是：[COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR]（{@2_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_UNKNOWN';

-- Religion

UPDATE Language_zh_CN
SET Text = '{1_ReligionName}的领袖'
WHERE Tag = 'TXT_KEY_RO_STATUS_FOUNDER';

UPDATE Language_zh_CN
SET Text = 'Can be purchased with [ICON_PEACE] Faith in any city with a majority Religion that has been enhanced。They can remove other religions from your cities (expending the Inquisitor) or be placed inside or adjacent to a city to protect it from Missionaries and Prophets trying to spread other religions into that city。'
WHERE Tag = 'TXT_KEY_UNIT_INQUISITOR_STRATEGY';


-- Espionage

UPDATE Language_zh_CN
SET Text = '间谍活动'
WHERE Tag = 'TXT_KEY_SPY_STATE_ESTABLISHED_SURVEILLANCE';

UPDATE Language_zh_CN
SET Text = '扰乱计划'
WHERE Tag = 'TXT_KEY_SPY_STATE_ESTABLISHED_SURVEILLANCE_PROGRESS_BAR';

UPDATE Language_zh_CN
SET Text = '安全系数'
WHERE Tag = 'TXT_KEY_EO_POTENTIAL';

UPDATE Language_zh_CN
SET Text = '安全系数反映了城市间谍活动的难度。数值越高，完成间谍行动所需的时间就越多。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取决于城市的整体经济价值（相对于其他所有城市）。城市中的间谍行动修正、反间谍行动和建筑物（如治安署和警察局）也会影响安全系数。[NEWLINE][NEWLINE]单击以按安全系数对城市进行排序。'
WHERE Tag = 'TXT_KEY_EO_POTENTIAL_SORT_TT';

UPDATE Language_zh_CN
SET Text = '如果你的城市安全系数较低，你可以选择以下2种方法提高安全系数：1.将己方间谍派遣至城市进行反间谍行动，在敌方间谍行动完成之前抓住并杀死他们。2.建造治安署、警察局和网络防火长城等减缓敌方间谍行动速度。'
WHERE Tag = 'TXT_KEY_EO_OWN_CITY_POTENTIAL_TT';

UPDATE Language_zh_CN
SET Text = '{1_SpyRank}{2_SpyName}正在{3_CityName}进行间谍行动。[NEWLINE]{3_CityName}当前的安全系数为{4_Num}。[NEWLINE][NEWLINE]安全系数反映了城市抵御间谍活动的能力。数值越高，城市抵御能力越强。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取决于城市的整体繁荣和快乐（相对于其他所有城市）。治安署和警察局可以提高城市安全系数。'
WHERE Tag = 'TXT_KEY_EO_CITY_POTENTIAL_TT';

UPDATE Language_zh_CN
SET Text = '{1_SpyRank}{2_SpyName}无法窃取{3_CityName}的科技。[NEWLINE][NEWLINE]{4_CityName}的安全系数为{5_Num}。[NEWLINE][NEWLINE]安全系数反映了城市抵御间谍活动的能力。数值越高，城市抵御能力越强。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取决于城市的整体繁荣和快乐（相对于其他所有城市）。治安署和警察局可以提高城市安全系数。'
WHERE Tag = 'TXT_KEY_EO_CITY_POTENTIAL_CANNOT_STEAL_TT';

UPDATE Language_zh_CN
SET Text = '{1_CityName}的安全系数为{2_Num}。向该城市派遣一个[ICON_SPY]间谍以了解更多信息。[NEWLINE][NEWLINE]安全系数反映了城市抵御间谍活动的能力。数值越高，城市抵御能力越强。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取决于城市的整体繁荣和快乐（相对于其他所有城市）。治安署和警察局可以提高城市安全系数。'
WHERE Tag = 'TXT_KEY_EO_CITY_ONCE_KNOWN_POTENTIAL_TT';

UPDATE Language_zh_CN
SET Text = '{1_SpyRank}{2_SpyName}：[NEWLINE][NEWLINE][ICON_BULLET] 移动到城邦并尝试[COLOR_POSITIVE_TEXT]操纵选举[ENDCOLOR]或[COLOR_POSITIVE_TEXT]发动政变[ENDCOLOR]。[NEWLINE][ICON_BULLET]移动到其他文明的非首都城市并尝试[COLOR_POSITIVE_TEXT]窃取科技[ENDCOLOR]和[COLOR_POSITIVE_TEXT]揭露阴谋[ENDCOLOR]。[NEWLINE][ICON_BULLET]移动到其他文明的首都并尝试[COLOR_POSITIVE_TEXT]窃取科技[ENDCOLOR]、[COLOR_POSITIVE_TEXT]揭露阴谋[ENDCOLOR]或[COLOR_POSITIVE_TEXT]作为外交官[ENDCOLOR]。'
WHERE Tag = 'TXT_KEY_EO_SPY_MOVE_TT';

-- Fixed diacritics for spy names.
UPDATE Language_zh_CN
SET Text = '安东尼奥'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_0';

UPDATE Language_zh_CN
SET Text = '埃斯泰瓦'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_3';

UPDATE Language_zh_CN
SET Text = '费尔南'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_4';

UPDATE Language_zh_CN
SET Text = '托梅'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_8';


-- Trade

-- Trade Deals
UPDATE Language_zh_CN
SET Text = '结束时间：[NEWLINE]{1_turn}回合'
WHERE Tag = 'TXT_KEY_DO_ENDS_ON';

UPDATE Language_zh_CN
SET Text = '解锁与该文明的高级贸易选项并会显示对方首都的位置。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_TT';

UPDATE Language_zh_CN
SET Text = '允许其他文明的军事和民事单位进入某个文明的领土（持续{1_Num}回合）[NEWLINE][NEWLINE]注：不同文明的单位也不能堆叠。'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_TT';

UPDATE Language_zh_CN
SET Text = '如果一方遭受攻击，另一方会自动对其敌人宣战（持续{1_Num}回合）。[NEWLINE][NEWLINE]你最多可以与[COLOR_CYAN]{2_Num}[ENDCOLOR]个文明签订防御条约（基于游戏中存在的非附庸文明的数量）。'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_TT';

UPDATE Language_zh_CN
SET Text = '我们已经在他们的首都建立使馆了!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_HAVE';

UPDATE Language_zh_CN
SET Text = '他们已经在我们的首都建立使馆了!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_THEY_HAVE';

UPDATE Language_zh_CN
SET Text = '我方没有建立使馆所需的前提科技（文字）。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_PLAYER';

UPDATE Language_zh_CN
SET Text = '对方没有建立使馆所需的前提科技（文字）。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_OTHER_PLAYER';

UPDATE Language_zh_CN
SET Text = '我们已经允许开放边境了！'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_HAVE';

UPDATE Language_zh_CN
SET Text = '他们已经允许开放边境了！'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_THEY_HAVE';

UPDATE Language_zh_CN
SET Text = '双方都没有所需的前提科技（文官制度）。'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_NO_TECH';

UPDATE Language_zh_CN
SET Text = '你需要在对方首都建立使馆后才能交易此项。'
WHERE Tag = 'TXT_KEY_DIPLO_YOU_NEED_EMBASSY_TT';

UPDATE Language_zh_CN
SET Text = '对方需要我方首都建立使馆后才能交易此项。'
WHERE Tag = 'TXT_KEY_DIPLO_THEY_NEED_EMBASSY_TT';

UPDATE Language_zh_CN
SET Text = '双方需要互建使馆后才能交易此项。'
WHERE Tag = 'TXT_KEY_DIPLO_BOTH_NEED_EMBASSY_TT';

UPDATE Language_zh_CN
SET Text = '防御条约已经达成！'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_EXISTS';

UPDATE Language_zh_CN
SET Text = '双方均未获得达成这项交易所需科技(骑士制度)。'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_NO_TECH';

UPDATE Language_zh_CN
SET Text = '合作研究协议已经生效！'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_EXISTS';

UPDATE Language_zh_CN
SET Text = '至少有一方已经获得了所有科技。'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_ALL_TECHS_RESEARCHED';

UPDATE Language_zh_CN
SET Text = '双方均未获得达成这项交易所需的科技(哲学)。'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_NO_TECH';

UPDATE Language_zh_CN
SET Text = '友谊声明是交易此项的前提条件。'
WHERE Tag = 'TXT_KEY_DIPLO_NEED_DOF_TT';

UPDATE Language_zh_CN
SET Text = '城邦结盟阻止了这一行为。'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_ALLY_AT_WAR';

UPDATE Language_zh_CN
SET Text = '城邦结盟阻止了这一行为。'
WHERE Tag = 'TXT_KEY_DIPLO_NO_WAR_ALLIES';

UPDATE Language_zh_CN
SET Text = '和平条约能够在一段时间内防止这些文明进入战争。'
WHERE Tag = 'TXT_KEY_DIPLO_FORCE_PEACE';

-- Trade Routes
UPDATE Language_zh_CN
SET Text = '要劫掠这条商路，你需要能够对该文明宣战。'
WHERE Tag = 'TXT_KEY_MISSION_PLUNDER_TRADE_ROUTE_DISABLED_HELP';

UPDATE Language_zh_CN
SET Text = '你发现了{1_Num}项{2_CivName}不知道的科技。[NEWLINE]对方凭借文化影响力从这条商路获得+{3_Num}[ICON_RESEARCH]科研。'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_THEIR_SCIENCE_EXPLAINED';

UPDATE Language_zh_CN
SET Text = '{1_CivName}发现了{2_Num}项你不知道的科技。你凭借文化影响力从这条商路获得+{3_Num}[ICON_RESEARCH]科研。'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_YOUR_SCIENCE_EXPLAINED';

-- Lua for Cities
UPDATE Language_zh_CN
SET Text = '我们没有可交易的城市/在其首都建立大使馆。'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_TT';

UPDATE Language_zh_CN
SET Text = '他们没有可交易的城市/在我们首都建立大使馆。'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_THEM';


-- Civilopedia Refresh

UPDATE Language_zh_CN
SET Text = 'Welcome to the Civilopedia! Here you will find detailed descriptions of all aspects of the game. Use the "Search" field to search for articles on any specific subject. Clicking on the tabs on the top edge of the screen will take you to the various major sections of the Civilopedia. The Navigation Bar on the left side of the screen will display the various entries within a section. Click on an entry to go directly there.[NEWLINE][NEWLINE]In the upper left-hand portion of the screen you will find the forward and back buttons which will help you navigate between pages. Click on the "X" on the upper right portion of the screen to return to the game.[NEWLINE][NEWLINE]Welcome to the Community Patch, a mod containing several bugfixes and AI improvements. [COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow in the Civilopedia.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_HOME_PAGE_HELP_TEXT';

UPDATE Language_zh_CN
SET Text = 'Civilization V examines all of human history - from the deep past to the day after tomorrow. The "Game Concepts" portion of the Civilopedia explains some of the more important parts of the game - how to build and manage cities, how to fight wars, how to research technology, and so forth. The left Navigation Bar displays the major concepts; click on an entry to see the subsections within the concepts.[NEWLINE][NEWLINE][COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_GAME_CONCEPT_HELP_TEXT';

UPDATE Language_zh_CN
SET Text = '如果该单位造成的伤害大于自己受到的伤害，则击退目标。若目标退无可退，则受到50%的额外伤害（即本次进攻获得50%战斗力加成）。'
WHERE Tag = 'TXT_KEY_PROMOTION_HEAVY_CHARGE_HELP';

UPDATE Language_zh_CN
SET Text = '城市里同一时间只能有一个战斗单位存在。这个单位就是所谓的卫戍部队，他可以极大地增强城市的防御能力。其他战斗单位可以通过城市，但是他们不能在回合结束的时候仍然留在城市中。（所以如果你在有单位镇守的城市中新建了一个战斗单位，你必须把这两个单位中的一个移出城市才能结束你的回合）'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Combat Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Garrison Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = '城市的所有者能够让一支军事部队在城市里镇守以增强防御。单位的一部分战斗力将附加到城市的攻击力上面。镇守单位在城市受攻击时不会受到伤害；但是，一旦城市被占领，镇守单位也会被消灭。[NEWLINE][NEWLINE]在城市里镇守的单位可以攻击周围的敌军单位，但城市会因此失去镇守单位的加成，同时，如果那是一支近战部队，它会像平常那样损失生命值。'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Forts[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = 'Once a civ has acquired the Engineering technology, workers can construct "forts" in friendly or neutral territory. Forts provide a hefty defensive bonus to units occupying them. Forts cannot be constructed in enemy territory. They can be constructed atop resources. [COLOR_YELLOW]Melee Units attacking from a Fort don''t leave the Fort even if they destroy the attacked enemy unit.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Siege Weapons[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_TITLE';

UPDATE Language_zh_CN
SET Text = 'Certain ranged weapons are classified as "siege weapons" - catapults, ballistae, trebuchets, and so forth. These units get combat bonuses when attacking enemy cities. They are extremely vulnerable to melee combat, and should be accompanied by melee units to fend off enemy assault.[NEWLINE][NEWLINE][COLOR_YELLOW]In Vox Populi and the Community Patch, siege units don''t have to be "set up" anymore. Instead, they move at half-speed in enemy territory.[ENDCOLOR][NEWLINE][NEWLINE]Siege weapons are important. It''s really difficult to capture a well-defended city without them!'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_BODY';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Melee Combat Results[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = '在一场近战之后，一方或双方的单位也许会受到一定的损伤，并且失去一些“生命值”，如果一个单位的生命减至0，那这个单位就被消灭了。如果在近战后防守方单位被消灭而进攻方幸存，进攻方单位便会移动到守方原来的区块，并且俘虏在这区块中的任何非军事单位。而如果守方存活，他依然会拥有其区块及之上其他单位控制权。[NEWLINE][NEWLINE]大部分单位在进攻时会消耗所有的行动力。但有些却能够在战斗后继续移动——前提是他们幸存于战斗且还有移动力。[NEWLINE][NEWLINE]任何在战斗中幸存的单位将会得到“经验点”（XP），这可以用来给予单位晋升。'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '陆军统帅是熟悉战略和战术的伟人。他们能为2格内的友军提供攻击和防御的战斗加成。陆军统帅本身是一个非战斗单位，所以能与战斗单位堆叠以获得保护。一旦有敌军进入陆军统帅所在的地块，陆军统帅单位就会被消灭。[NEWLINE][NEWLINE]陆军统帅为自己所在地块和2格内的友军提供20%的战斗加成。[NEWLINE][NEWLINE]你能通过不断的战斗或者采用“尚武精神”社会政策来获得陆军统帅。在“伟人”部分可了解更多的细节。'
WHERE Tag = 'TXT_KEY_COMBAT_GREATGENERALS_HEADING2_BODY';

UPDATE Language_zh_CN
SET Text = '战争分数'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = '战争分数反映交战双方不断变化的战争状态。战争分数会在100到-100之间波动。当到达100，即你获得全面胜利；反之亦然。此外，战争分数也会随着时间推移而逐渐衰减，以表明过去旷日持久战争中获得的价值降低。[NEWLINE][NEWLINE]刚处于战争时，交战双方的战争分数都从零开始。当你（或你的敌人）击杀单位、劫掠地格/贸易单位、俘虏平民和占领城市时，战争分数就会增加。这些行动的价值因敌人的整体规模而异。[NEWLINE][NEWLINE]当需要签订和平条约时，战争分数可以准确显示你能从敌人那里获得什么，或者他们能从你这获得什么。当达成和平时，战争分数归零。'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '一旦你获得了“骑士制度”科技，就能够签订防御条约。防御条约总是双方的。如果协定的一方签订者受到攻击，另一方会自动和攻击者开战。[NEWLINE][NEWLINE]一份防御条约持续50回合（标准游戏速度）。当时间到后，协议失效除非重新谈判。'
WHERE Tag = 'TXT_KEY_DIPLOMACY_DEFENSIVEPACT_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '遗迹提供一幅周围地区地图（驱散周围一些区块的战争迷雾）。'
WHERE Tag = 'TXT_KEY_BARBARIAN_MAP_HEADING4_BODY';

UPDATE Language_zh_CN
SET Text = '通过和蛮族单位战斗，你的那些缺乏训练的单位可以获得经验值。但是，任何已经拥有45点经验值（或者已经将这45经验用于晋升）的单位将无法再从蛮族身上获得经验值。'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_BODY';

UPDATE Language_zh_CN
SET Text = '[COLOR_YELLOW]Experience Points Limitations[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_TITLE';

UPDATE Language_zh_CN
SET Text = 'Each civilization in Civilization V has one or more special "national units." These units are unique to that civilization, and they are in some way superior to the standard version of that unit. The American civilization, for example, has a Minuteman unit, which is superior to the standard Musketman available to other civs. The Greek civ has the Hoplite unit, which replaces the Spearman.[NEWLINE][NEWLINE]See each civilization''s Civilopedia entry to discover its special unit.'
WHERE Tag = 'TXT_KEY_UNITS_NATIONAL_HEADING2_BODY';

UPDATE Language_zh_CN
SET Text = '游戏中每个文明都会有“特色单位”。这些单位是独有的，他们会代替普通的该类单位。比如美国拥有快速民兵，这种单位将会替代火枪手。希腊则拥有希腊方阵，代替矛兵的位置。[NEWLINE][NEWLINE]每个文明的文明百科条目中都记录有该文明的特色单位。'
WHERE Tag = 'TXT_KEY_UNITS_NATIONAL_HEADING2_BODY';

UPDATE Language_zh_CN
SET Text = '如果另一个文明攻占了一个城邦，而你又从这个文明手中占领了这个城市，那么你就会获得一个“解放城邦”的选项。如果你这么做了，你会立刻获得大量对这个城邦的影响力（通常足以让你与其[COLOR_POSITIVE_TEXT]结盟[ENDCOLOR]）。'
WHERE Tag = 'TXT_KEY_CITYSTATE_LIBERATING_HEADING2_BODY';


-- Miscellaneous


UPDATE Language_zh_CN
SET Text = 'They want you to defeat Barbarian units that are invading their territory. You are allowed to enter their territory until the Barbarians are defeated.'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_INVADING_BARBS_FORMAL';

UPDATE Language_zh_CN
SET Text = '给予符合条件的单位[COLOR_POSITIVE_TEXT]{@1_PromotionName}[ENDCOLOR]晋升[NEWLINE][NEWLINE]({@2_PromotionHelp})'
WHERE Tag = 'TXT_KEY_FREE_PROMOTION_FROM_TECH';

UPDATE Language_zh_CN
SET Text = '{1_Num}[ICON_CULTURE] 来自杰作和主题奖励'
WHERE Tag = 'TXT_KEY_CULTURE_FROM_GREAT_WORKS';

-- Economic Advisor
UPDATE Language_zh_CN
SET Text = '我们拥有的单位数量正在阻碍我们的经济，我们应该解散一些不需要的单位以保证我们文明的全力发展。'
WHERE Tag = 'TXT_KEY_ECONOMICAISTRATEGY_TOO_MANY_UNITS';

-- Reversed Tourism for Open Borders
UPDATE Language_zh_CN
SET Text = '+{1_Num}%奖励 由于开放边界：[NEWLINE]   '
WHERE Tag = 'TXT_KEY_CO_CITY_TOURISM_OPEN_BORDERS_BONUS';

-- Barbarians
UPDATE Language_zh_CN
SET Text = '蛮族'
WHERE Tag = 'TXT_KEY_LEADER_BARBARIAN';

-- Notification
UPDATE Language_zh_CN
SET Text = '{1_CivName:textkey}失去了他们的[ICON_CAPITAL]首都'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_PLAYER_LOST_CAPITAL';

-- Demographics
UPDATE Language_zh_CN
SET Text = '军事实力。'
WHERE Tag = 'TXT_KEY_DEMOGRAPHICS_ARMY_MEASURE';

-- Fix for production ranking
UPDATE Language_zh_CN
SET Text = '根据玩家们所有城市的平均[ICON_PRODUCTION]产能来排名。'
WHERE Tag = 'TXT_KEY_PROGRESS_SCREEN_PRODUCTION_TT';

-- World Congress Proposals, Which Civs benefit
UPDATE Language_zh_CN
SET Text = '[NEWLINE][NEWLINE]会对此项提案表示愉快的文明：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_POSITIVE';

UPDATE Language_zh_CN
SET Text = '[NEWLINE][NEWLINE]会对此项提案表示愤怒的文明：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_NEGATIVE';

-- Shorten the overview text to make room
UPDATE Language_zh_CN
SET Text = '[NEWLINE][NEWLINE]根据我们对其他文明意图的了解，我们预计此项提案的表决结果如下：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_VOTE_OPINIONS';


-- Diplo Opinion Table Modifiers

-- Neutral Indicators
UPDATE Language_zh_CN
SET Text = '灭亡'
WHERE Tag = 'TXT_KEY_EMOTIONLESS';

UPDATE Language_zh_CN
SET Text = '你们曾经发生过战争。'
WHERE Tag = 'TXT_KEY_DIPLO_PAST_WAR_BAD';

-- Dispute Modifiers
UPDATE Language_zh_CN
SET Text = '领土争端使你们的关系紧张。'
WHERE Tag = 'TXT_KEY_DIPLO_LAND_DISPUTE';

UPDATE Language_zh_CN
SET Text = '你正在争夺世界奇观。'
WHERE Tag = 'TXT_KEY_DIPLO_WONDER_DISPUTE';

UPDATE Language_zh_CN
SET Text = '你们在争夺同一个城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_CIV_DISPUTE';

-- War Stuff
UPDATE Language_zh_CN
SET Text = '他们对你的好战主义有一些担忧。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MINOR';

UPDATE Language_zh_CN
SET Text = '他们对你的好战主义构成的潜在威胁保持警惕。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MAJOR';

UPDATE Language_zh_CN
SET Text = '他们认为你的好战主义已经威胁到生存。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_SEVERE';

UPDATE Language_zh_CN
SET Text = '他们担忧你的好战主义会毁灭这个世界！'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_CRITICAL';

UPDATE Language_zh_CN
SET Text = '（他们极其厌恶好战者。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_HIGH';

UPDATE Language_zh_CN
SET Text = '（他们厌恶好战者。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_MID';

UPDATE Language_zh_CN
SET Text = '（他们忽视轻微的好战行为。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_LOW';

UPDATE Language_zh_CN
SET Text = '你劫掠了他们的商路！'
WHERE Tag = 'TXT_KEY_DIPLO_PLUNDERING_OUR_TRADE_ROUTES';

UPDATE Language_zh_CN
SET Text = '你用核武器袭击了他们！'
WHERE Tag = 'TXT_KEY_DIPLO_NUKED';

UPDATE Language_zh_CN
SET Text = '你占领了他们的原始首都。'
WHERE Tag = 'TXT_KEY_DIPLO_CAPTURED_CAPITAL';

-- Recent diplomatic actions
UPDATE Language_zh_CN
SET Text = '你最近的外交行动让他们高兴。'
WHERE Tag = 'TXT_KEY_DIPLO_ASSISTANCE_TO_THEM';

UPDATE Language_zh_CN
SET Text = '你最近的外交行动令他们失望。'
WHERE Tag = 'TXT_KEY_DIPLO_REFUSED_REQUESTS';

-- Player has done nice stuff
UPDATE Language_zh_CN
SET Text = '我们是贸易伙伴。'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_PARTNER';

UPDATE Language_zh_CN
SET Text = '我们与共同的敌人作战。'
WHERE Tag = 'TXT_KEY_DIPLO_COMMON_FOE';

UPDATE Language_zh_CN
SET Text = '你解救了他们被俘的公民！'
WHERE Tag = 'TXT_KEY_DIPLO_CIVILIANS_RETURNED';

UPDATE Language_zh_CN
SET Text = '你在他们的境内建造了一个风景地标。'
WHERE Tag = 'TXT_KEY_DIPLO_LANDMARKS_BUILT';

UPDATE Language_zh_CN
SET Text = '他们亡国后，你恢复了他们的文明！'
WHERE Tag = 'TXT_KEY_DIPLO_RESURRECTED';

UPDATE Language_zh_CN
SET Text = '你解放了他们的原始首都。'
WHERE Tag = 'TXT_KEY_DIPLO_LIBERATED_CAPITAL';

UPDATE Language_zh_CN
SET Text = '你解救了他们的一些国民！'
WHERE Tag = 'TXT_KEY_DIPLO_CITIES_LIBERATED';

UPDATE Language_zh_CN
SET Text = '他们在你的首都设有大使馆。'
WHERE Tag = 'TXT_KEY_DIPLO_HAS_EMBASSY';

UPDATE Language_zh_CN
SET Text = '你原谅了他们的间谍活动。'
WHERE Tag = 'TXT_KEY_DIPLO_FORGAVE_FOR_SPYING';

UPDATE Language_zh_CN
SET Text = '你让他们提供了情报（阴谋）。'
WHERE Tag = 'TXT_KEY_DIPLO_SHARED_INTRIGUE';

-- Player has done mean stuff
UPDATE Language_zh_CN
SET Text = '你在和平时期抢夺了他们的一些领土！'
WHERE Tag = 'TXT_KEY_DIPLO_CULTURE_BOMB';

UPDATE Language_zh_CN
SET Text = '你的间谍活动时被他们抓捕了。'
WHERE Tag = 'TXT_KEY_DIPLO_CAUGHT_STEALING';

-- Player has asked us to do things we don't like
UPDATE Language_zh_CN
SET Text = '你要求他们不要在你的土地附近定居！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_SETTLE_ASKED';

UPDATE Language_zh_CN
SET Text = '你要求他们不要监视你。'
WHERE Tag = 'TXT_KEY_DIPLO_STOP_SPYING_ASKED';

UPDATE Language_zh_CN
SET Text = '你向他们索取！'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_DEMAND';

UPDATE Language_zh_CN
SET Text = '他们被迫进贡。'
WHERE Tag = 'TXT_KEY_DIPLO_PAID_TRIBUTE';

-- Denouncing
UPDATE Language_zh_CN
SET Text = '我们谴责了他们！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_US';

UPDATE Language_zh_CN
SET Text = '他们谴责我们！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_THEM';

UPDATE Language_zh_CN
SET Text = '你谴责了与他们友谊声明的领袖！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIEND';

UPDATE Language_zh_CN
SET Text = '我们谴责了同一领袖！'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_ENEMY';

UPDATE Language_zh_CN
SET Text = '他们的朋友或盟友谴责了你！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_PEOPLE_WE_TRUST_MORE';

-- Promises
UPDATE Language_zh_CN
SET Text = '你违背了不向他们宣战的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE';

UPDATE Language_zh_CN
SET Text = '你违背了不向其他文明宣战的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_zh_CN
SET Text = '你拒绝将你的军队从他们的边境离开！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不在他们附近定居的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE';

UPDATE Language_zh_CN
SET Text = '你无视了不在他们附近定居的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不再购买他们附近土地的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE';

UPDATE Language_zh_CN
SET Text = '你无视了停止购买他们附近土地的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不会征服他们所保护的城邦的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE';

UPDATE Language_zh_CN
SET Text = '你违背了不会征服其他文明所保护的城邦的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_zh_CN
SET Text = '你无视了停止攻击受他们保护的城邦的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不再向受他们保护的城邦勒索的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_BROKEN';

UPDATE Language_zh_CN
SET Text = '你无视了停止向受他们保护的城邦勒索的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不再改变他们城市信仰的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_BROKEN';

UPDATE Language_zh_CN
SET Text = '你无视了不再改变他们城市信仰的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了停止挖掘他们的文物的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_BROKEN';

UPDATE Language_zh_CN
SET Text = '你无视了停止挖掘他们的文物的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了不再监视他们的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_BROKEN';

UPDATE Language_zh_CN
SET Text = '你无视了不再监视他们的请求！'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_IGNORED';

UPDATE Language_zh_CN
SET Text = '你违背了共同对别国作战的承诺！'
WHERE Tag = 'TXT_KEY_DIPLO_COOP_WAR_PROMISE';

-- Religion / Ideology
UPDATE Language_zh_CN
SET Text = '他们很高兴他们的大多数城市接受了你的宗教。' -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_HIS_RELIGION';

UPDATE Language_zh_CN
SET Text = '你的大多数城市都接受了他们的宗教。'  -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_MY_RELIGION';

UPDATE Language_zh_CN
SET Text = '他们在传播自己的宗教，但你在他们的城市传播你的宗教。'
WHERE Tag = 'TXT_KEY_DIPLO_RELIGIOUS_CONVERSIONS';

UPDATE Language_zh_CN
SET Text = '你们都采用了{1_PolicyTree}。'
WHERE Tag = 'TXT_KEY_DIPLO_SAME_LATE_POLICY_TREES';

UPDATE Language_zh_CN
SET Text = '你采用了{1_YourPolicyTree}，但他们追随{2_TheirPolicyTree}。'
WHERE Tag = 'TXT_KEY_DIPLO_DIFFERENT_LATE_POLICY_TREES';

-- Protected Minors
UPDATE Language_zh_CN
SET Text = '你消灭了他们保护的城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_KILLED';

UPDATE Language_zh_CN
SET Text = '你攻击了他们保护的城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_ATTACKED';

UPDATE Language_zh_CN
SET Text = '你向他们保护下的城邦索取了贡品！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_BULLIED';

UPDATE Language_zh_CN
SET Text = '他们欺凌了你保护的城邦，你无法接受他们的作为！'
WHERE Tag = 'TXT_KEY_DIPLO_SIDED_WITH_MINOR';

-- Declaration of Friendship
UPDATE Language_zh_CN
SET Text = '我们公开发布了友谊声明！'
WHERE Tag = 'TXT_KEY_DIPLO_DOF';

UPDATE Language_zh_CN
SET Text = '我们都与同一领袖声明友谊！'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_DOF';

UPDATE Language_zh_CN
SET Text = '你与他们的敌人公开声明友谊！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DOF_WITH_ENEMY';

-- Traitor Opinion
UPDATE Language_zh_CN
SET Text = '你的朋友认为有理由对你进行谴责！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_BY_FRIENDS';

UPDATE Language_zh_CN
SET Text = '你对你公开声明友谊的领袖进行公开谴责！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIENDS';

UPDATE Language_zh_CN
SET Text = '我们对他们公开声明友谊，但又公开谴责他们！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DENOUNCED';

UPDATE Language_zh_CN
SET Text = '你对你公开声明友谊的领袖宣战！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DECLARED_WAR_ON_FRIENDS';

UPDATE Language_zh_CN
SET Text = '我们对他们公开声明友谊，但又对他们宣战！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DECLARED_WAR';

-- Reckless Expander
UPDATE Language_zh_CN
SET Text = '他们认为我们建立了太多的新城市！'
WHERE Tag = 'TXT_KEY_DIPLO_RECKLESS_EXPANDER';

-- World Congress
UPDATE Language_zh_CN
SET Text = '他们喜欢我们在世界议会上的提案。'
WHERE Tag = 'TXT_KEY_DIPLO_LIKED_OUR_PROPOSAL';

UPDATE Language_zh_CN
SET Text = '他们讨厌我们在世界议会上的提案。'
WHERE Tag = 'TXT_KEY_DIPLO_DISLIKED_OUR_PROPOSAL';

UPDATE Language_zh_CN
SET Text = '我们帮助他们的提案获得通过。'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_PROPOSAL';

UPDATE Language_zh_CN
SET Text = '我们阻挠他们的提案获得通过。'
WHERE Tag = 'TXT_KEY_DIPLO_FOILED_THEIR_PROPOSAL';

UPDATE Language_zh_CN
SET Text = '我们帮助他们获得世界议会的主办权。'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_HOSTING';


-- Civilization Leader Dialog

-- First Greeting
UPDATE Language_zh_CN
SET Text = '我是巴比伦的尼布甲尼撒。外面有些傻瓜说我是神，但那好象不太可能。你是谁？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_1';

UPDATE Language_zh_CN
SET Text = '我是尼布甲尼撒。你是真人还是我胡思乱想出来的幽灵？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_3';

UPDATE Language_zh_CN
SET Text = '向你致意，陌生人。我是帕查库提，无与伦比的印加的统治者。如果我能够帮助你们这个后进的文明，请随时提出来。'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_FIRSTGREETING_3';

-- Greeting (Friendly)
UPDATE Language_zh_CN
SET Text = '你好，朋友，今天什么风把你吹来了？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_1';

UPDATE Language_zh_CN
SET Text = '再次向你问好，我的朋友。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_3';

UPDATE Language_zh_CN
SET Text = '再次问候你，朋友！我这样的统帅能帮你做什么？'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_GREETING_POLITE_HELLO_1';

UPDATE Language_zh_CN
SET Text = '真主在对你微笑啊，我的朋友。我能为你做什么？'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_GREETING_POLITE_HELLO_1';

-- Greeting (Neutral)
UPDATE Language_zh_CN
SET Text = '我相信是真主指引你来到桑海的，伟大的领袖。'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_CN
SET Text = '德国始终期待同像你这样的强国建立友好关系。'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_CN
SET Text = '你为什么来到这里，可敬的领袖？'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_CN
SET Text = '你是来欣赏法兰西帝国的风光呢，还是有什么正事要办？'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_CN
SET Text = '嗯？大声点。因为血在我脑子里奔涌，我几乎听不见你说话。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_GREETING_5';

-- Greeting (Hostile)
UPDATE Language_zh_CN
SET Text = '你到波斯来了？你想要什么？'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_GREETING_HOSTILE_HELLO_1';

UPDATE Language_zh_CN
SET Text = '我通常只和伟大的领袖会谈，这次暂时为你破个例。快说吧。'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_GREETING_HOSTILE_HELLO_1';

-- Greeting (Repeat)
UPDATE Language_zh_CN
SET Text = '你一定是很喜欢和我说话是吗？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_REPEAT_2';

-- Greeting (Aggressive Plot Buying)
UPDATE Language_zh_CN
SET Text = '最近你在我们领土附近圈占土地的趋势令人担心。为了我们未来的友谊，我建议你关注下这个事情。现在不说其他的，你来这里干什么？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_AGGRESSIVE_PLOT_BUYING_1';

-- Greeting (Hostile, Aggressive Expansion)
UPDATE Language_zh_CN
SET Text = '你的城市和人民的扩张就像是瘟疫传染着大地。我不希望看到一个令人沮丧的未来。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_AGGRESSIVE_EXPANSION_1';

-- Greeting (Hostile, Small Army)
UPDATE Language_zh_CN
SET Text = '只是你我之间说说，你的军队可是世界级的笑柄。但是你也别太担心，我肯定会有人帮你脱离苦海的。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_HUMAN_SMALL_ARMY';


-- Open Trade Screen
UPDATE Language_zh_CN
SET Text = '说吧：随便说点什么。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_LETSHEARIT_1';


-- Can't Match Trade Offer
UPDATE Language_zh_CN
SET Text = '我们不愿向你们提供足够的交易项目'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_1';

UPDATE Language_zh_CN
SET Text = '我们提出的任何交易条件对你来说都会是不公平的。'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_2';


-- Offer Trade (Friendly)
UPDATE Language_zh_CN
SET Text = '这笔交易你感兴趣吗？'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_HAPPY';

UPDATE Language_zh_CN
SET Text = '看来你确实有存在的理由——和我进行交易。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_HAPPY';

-- Offer Trade (Neutral)
UPDATE Language_zh_CN
SET Text = '提议机不可失……待请熟虑。'
WHERE Tag = 'TXT_KEY_LEADER_ENRICO_DANDOLO_TRADEREQUEST_NEUTRAL';

-- Offer Trade (Hostile)
UPDATE Language_zh_CN
SET Text = '这是我们的提议——相比你应得的已经要好得多了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADEREQUEST_ANGRY';

UPDATE Language_zh_CN
SET Text = '你应该接受我们这个公平合理的条件。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_ANGRY';

UPDATE Language_zh_CN
SET Text = '你可以通过接受以下交易来减轻我的巨大痛苦。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_ANGRY';

-- Offer Trade (Luxury)
UPDATE Language_zh_CN
SET Text = '真主教导我们应该与他们合作共赢。'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_LUXURY_TRADE_1';

UPDATE Language_zh_CN
SET Text = '啊，我的朋友。我注意到我们可以开展一项互利的贸易，你觉得呢？'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_LUXURY_TRADE_1';

UPDATE Language_zh_CN
SET Text = '贸易是国家间友谊的果实。你觉得这个提议怎么样，我的朋友？'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_LUXURY_TRADE_1';

-- Offer Trade (Open Borders)
UPDATE Language_zh_CN
SET Text = '开放我们的边界看来是一个适宜的做法，你同意吗？'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_OPEN_BORDERS_EXCHANGE_1';

UPDATE Language_zh_CN
SET Text = '开放我们的边界能够方便部队通行。当然是在必要的情况下，你觉得呢？'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_OPEN_BORDERS_EXCHANGE_1';

-- Offer Trade (Research Agreement)
UPDATE Language_zh_CN
SET Text = '我觉得合作研究协议会是一个双赢的举措，能够进一步加强我们的友谊。'
WHERE Tag = 'TXT_KEY_GENERIC_RESEARCH_AGREEMENT_OFFER_1';


-- Accept Trade (Friendly)
UPDATE Language_zh_CN
SET Text = '很好。但从长期来说这对我们都没有帮助——你知道长期来说我们都将死去。很好，同意了。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_YES_HAPPY';

UPDATE Language_zh_CN
SET Text = '你的提议令我满意，干得好。'
WHERE Tag ='TXT_KEY_LEADER_RAMESSES_TRADE_YES_HAPPY';

UPDATE Language_zh_CN
SET Text = '乐意之至。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_TRADE_YES_HAPPY';

-- Accept Trade (Neutral)
UPDATE Language_zh_CN
SET Text = '你的提议对我们来说是可以接受的。我们同意。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_NEUTRAL';

-- Accept Trade (Hostile)
UPDATE Language_zh_CN
SET Text = '哦，好吧，我想我必须接受。我们同意了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_ANGRY';

UPDATE Language_zh_CN
SET Text = '明智之举。'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_TRADE_YES_ANGRY';


-- Need More from Trade (Friendly)
UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_CN
SET Text = '我们就快达成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_HAPPY_3';

-- Need More from Trade (Neutral)
UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '我认为当前的交易条款不符合美国的最大利益。你能提高你的报价吗？'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_1';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_NEUTRAL_4';

-- Need More from Trade (Hostile)
UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_CN
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_ANGRY_4';


-- Refuse Trade (Friendly)
UPDATE Language_zh_CN
SET Text = '你是打算利用我们之间的亲密关系吗？表现好点，否则我会生气的。'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_HAPPY';

UPDATE Language_zh_CN
SET Text = '我亲爱的朋友，虽然我个人愿意把所有财产都送给你，但我的顾问却没有这么慷慨。因此我不得不拒绝你的提议。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_HAPPY';

UPDATE Language_zh_CN
SET Text = '很抱歉，有个声音告诉我应该拒绝你的提议。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_HAPPY';

-- Refuse Trade (Neutral)
UPDATE Language_zh_CN
SET Text = '我希望你不要再拿这种愚蠢的建议来浪费我的时间了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '你一定疯了，竟拿这样的提议来侮辱我。我拒绝。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADE_NO_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '你的提议被拒绝了。如果我考虑你的提议，我会感觉受到冒犯。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_NEUTRAL';

-- Refuse Trade (Hostile)
UPDATE Language_zh_CN
SET Text = '你知道我的丈夫已经死了：俄国不再是由一个白痴来统治了。因此我们拒绝。'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_ANGRY';

UPDATE Language_zh_CN
SET Text = '我对你产生了几乎无法克制的讨厌情绪。我的回答是“不行”。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_ANGRY';

-- Refuse Trade (Insulting)
UPDATE Language_zh_CN
SET Text = '这是完全不可接受的。如果你希望我们达成交易，你必须提供一个公平的条款。'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_REJECT_INSULTING_1';


-- Make Request for Help
UPDATE Language_zh_CN
SET Text = '不幸的是，事情发展的不是那么好。你能给你的老朋友分点什么吗？当一切好起来以后，我当会涌泉相报的。'
WHERE Tag = 'TXT_KEY_GENERIC_REQUEST_ITEM_1';

UPDATE Language_zh_CN
SET Text = '桑海最近情况不太妙，朋友。真主教导我们应该互相帮助。'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_RESPONSE_REQUEST_1';

UPDATE Language_zh_CN
SET Text = '如果你能帮助我们，美利坚合众国将感激不尽。'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_RESPONSE_REQUEST_1';


-- Make Demand (Friendly)
UPDATE Language_zh_CN
SET Text = '亲爱的朋友，你能在我们需要时给予帮助吗？'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DEMANDTRIBUTE_HAPPY';

-- Make Demand (Neutral)
UPDATE Language_zh_CN
SET Text = '你有我想要的东西。如果你不肯把它交给我，我将不得不用暴力来夺取。'
WHERE Tag = 'TXT_KEY_GENERIC_DEMAND_1';

UPDATE Language_zh_CN
SET Text = '给我我想要的，我可以饶你一命……暂时。'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_DEMANDTRIBUTE_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '以下贡物可以提升我的黑色幽默感，并极大地增加你多活几天的几率。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEMANDTRIBUTE_NEUTRAL';


-- Accept Demand (Friendly)
UPDATE Language_zh_CN
SET Text = '我们很乐意在我们的盟友有需要时给予帮助。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_HAPPY';

UPDATE Language_zh_CN
SET Text = '拿着吧。我只不过是疯狂神灵所做的恶梦——这些东西对我有什么用？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_HAPPY';


-- Accept Demand (Neutral)
UPDATE Language_zh_CN
SET Text = '看在这些财宝的份上，好吧。但是如此轻率的行径是不会被轻易忘记的。'
WHERE Tag = 'TXT_KEY_LEADER_BOUDICCA_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '哦，好吧，我想我们别无选择。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '同意——但愿我的顾问不要生气，他们建议我拒绝你。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '我的子民，我的荣耀：帮助那些需要帮助的人。'
WHERE Tag = 'TXT_KEY_LEADER_POCATELLO_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_CN
SET Text = '好吧，看来我别无选择，只能同意你的要求。但是我警告你别太过分了。'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRIBUTE_YES_NEUTRAL';


-- Accept Demand (Hostile)
UPDATE Language_zh_CN
SET Text = '好吧。看来我是无可选择了。但将来你会为此付出代价的。'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_CN
SET Text = '你现在确实占据上风，但不会永远如此。我们会记住这件事的。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_CN
SET Text = '我接受你这令人唾弃的要求。'
WHERE Tag = 'TXT_KEY_LEADER_MARIA_I_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_CN
SET Text = '你的臭气快把我给呛死了——快点拿着东西滚蛋。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_CN
SET Text = '好吧。希望你别噎着！'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_TRIBUTE_YES_ANGRY';


-- Refuse Demand (Neutral)
UPDATE Language_zh_CN
SET Text = '愚蠢的豺狼——你最好去埃及试试，你的同类在那里受到崇拜。这里你什么都得不到。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_NO_NEUTRAL';

-- Refuse Demand (Hostile)
UPDATE Language_zh_CN
SET Text = '你竟然敢以如此的态度来羞辱我？如果你真的想要动手那就尽管来吧。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_1';

UPDATE Language_zh_CN
SET Text = '如果你真的想要动手那就尽管来好了。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_3';

UPDATE Language_zh_CN
SET Text = '你妄想要求我们进贡？滚开，你这无耻的恶棍！'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_NO_ANGRY';


-- Aggressive Military Warning (Hostile)
UPDATE Language_zh_CN
SET Text = '我看见你的军团大量聚集在我帝国附近。如果你想打尽管来，别像个孩子一样藏在阴影里。'
WHERE Tag = 'TXT_KEY_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_zh_CN
SET Text = '如果你的人马跨过我们的边境，他们将遭遇天朝大军的雷霆一击。'
WHERE Tag = 'TXT_KEY_WUZETIAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_zh_CN
SET Text = '哈！你的军队到我的边境来干什么。如果你是想开战，别以为能打败我。'
WHERE Tag = 'TXT_KEY_NAPOLEON_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';


-- Human attacked protected City-State
UPDATE Language_zh_CN
SET Text = '你对{@1_MinorCivName}的野蛮侵略不可能不被人知道。如果你继续进攻你将面对严重的后果。'
WHERE Tag = 'TXT_KEY_ATTACKED_PROTECTED_CITY_STATE_1';


-- AI attacked protected City-State
UPDATE Language_zh_CN
SET Text = '我已经注意到了我对和你曾有过关系的城邦发动了进攻。虽然和你的帝国过不去不是我的目的，但是我相信这个行动是必要的。'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_1';

UPDATE Language_zh_CN
SET Text = '我了解到了我的帝国对你们的一个友好城邦发动了进攻。我保证，这不是我的目的，希望这不会使我们有间隔。'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_2';


-- Human denounces AI
UPDATE Language_zh_CN
SET Text = '就这样？很好。我不会忘记这件事的。'
WHERE Tag = 'TXT_KEY_RESPONSE_TO_BEING_DENOUNCED_1';


-- AI denounces human
UPDATE Language_zh_CN
SET Text = '是时候向全世界宣布你的罪恶了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_1';

UPDATE Language_zh_CN
SET Text = '我已经对其他领袖谈过你的事了。他们应该了解你是不可信赖的。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_2';

UPDATE Language_zh_CN
SET Text = '告诉你，其他领袖已经知道你的恶行了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_3';

UPDATE Language_zh_CN
SET Text = '我受够你了。我听说其他领袖也都不愿同你合作。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_1';

UPDATE Language_zh_CN
SET Text = '好吧，我受够了。早该向所有人公布你的恶行了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_2';


-- Human Refuses Request to Denounce Third Party (Not Forgiven)
UPDATE Language_zh_CN
SET Text = '太可悲了。你终于显露出了本性。整个世界都会知晓你的背信弃义。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_1';

UPDATE Language_zh_CN
SET Text = '这就是你所理解的盟约？全世界的领袖们都将知晓你的背信弃义。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他们公开谴责我们！注意：这并不意味着开战。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_2';


-- Human declares war on AI
UPDATE Language_zh_CN
SET Text = '宣战对于你来说是一个严重的错误。有句话是这么说的，我将会立刻让你对于你的所作所为感到后悔。'
WHERE Tag = 'TXT_KEY_GENERIC_ATTACKED_STRONG_HOSTILE_4';

UPDATE Language_zh_CN
SET Text = '为什么？你……你……这个混蛋！我要消灭你！'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_ATTACKED_1';

UPDATE Language_zh_CN
SET Text = '不幸的是，我的国民并不全都像我这样坚持非暴力原则。所以我要先向你说一声抱歉，因为你的军队可能会被杀得片甲不留。'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_ATTACKED_2';

UPDATE Language_zh_CN
SET Text = '你知道我们将要消灭你。你想吃点奶酪吗？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_2';

UPDATE Language_zh_CN
SET Text = '哦嗯。我想你明白你正在做什么。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_3';

UPDATE Language_zh_CN
SET Text = '这是何等的背信弃义啊？难道没有荣誉感吗，没有耻辱心吗？'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_1';

UPDATE Language_zh_CN
SET Text = '你这可悲的人。很快你就将感受到我们强大科技实力的雷霆万钧之势了。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_2';

UPDATE Language_zh_CN
SET Text = '很好，很好！我正想找个借口来试验我的最新军事装备呢，你正好给我提供了机会。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_3';


-- AI War Bluff
UPDATE Language_zh_CN
SET Text = '蠢货，真是蠢货！'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_WARBLUFF_1';

UPDATE Language_zh_CN
SET Text = '战鼓——战鼓！在我的脑海中敲击，传播着复仇的思想。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_1';

UPDATE Language_zh_CN
SET Text = '下次我不会再这么客气了。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_4';

UPDATE Language_zh_CN
SET Text = '很好。下次我可不会这么有礼貌了！'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_WARBLUFF_2';


-- AI declares war on human
UPDATE Language_zh_CN
SET Text = '我有种感觉，咱俩迟早会在战场上见面的。我们会知道谁是胜者的。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_2';

UPDATE Language_zh_CN
SET Text = '战斗的时候到了。胜利将属于我们之间的强者。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_3';

UPDATE Language_zh_CN
SET Text = '毁灭也许会是我最终的命运，但是如果我选择退让，同样也不可能避免失败。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_DESPERATE_8';

UPDATE Language_zh_CN
SET Text = '我想信在前世或来生咱们可能成为朋友。不幸的是，现在就是现在。祝你的军队好运。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_REGRET_1';

UPDATE Language_zh_CN
SET Text = '就这样吧。我的军队会在你的国土上得到他们想要的。'
WHERE Tag = 'TXT_KEY_WAR_DEMAND_REFUSED_1';

UPDATE Language_zh_CN
SET Text = '你多次冒犯我和我忠诚的臣民的行为必将受到惩罚——准备打仗吧！'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DECLAREWAR_1';

UPDATE Language_zh_CN
SET Text = '我派出了一批印度士兵到你的各大城市去旅游观光。我相信他们会受到热情的欢迎。'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_DECLAREWAR_2';

UPDATE Language_zh_CN
SET Text = '我们之间的争斗是不可避免的，现在正是开战的好时候。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_DECLAREWAR_1';

UPDATE Language_zh_CN
SET Text = '你们太落后太原始了。应该更换统治者了。准备打仗吧！'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_DECLAREWAR_1';

UPDATE Language_zh_CN
SET Text = '我的集贤殿智囊们已经厌倦了你的表演。我们将以武力解放你的国民，引导他们走向光明。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_1';

UPDATE Language_zh_CN
SET Text = '时不我待，我的时间越来越紧迫。而你挡了我的道，我没工夫再进行外交努力了。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_2';

UPDATE Language_zh_CN
SET Text = '我还有许多实验要进行，许多研究要完成，而你就象一堵高墙挡在我面前。我必须把你清除掉。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_3';


-- Responses to human saying "No"
UPDATE Language_zh_CN
SET Text = '我跟你们这种人再也没有瓜葛了。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_RESPONSE_BAD_2';


-- AI Insults
UPDATE Language_zh_CN
SET Text = '我已经注意到你实在是个可怜虫。我能给予你的只有无限的同情。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_GENERIC_1';

UPDATE Language_zh_CN
SET Text = '凭借这么孱弱的兵力，你的帝国居然抵挡住了蛮族入侵，真是令人惊奇呀。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_MILITARY_2';

UPDATE Language_zh_CN
SET Text = '你的人民的痛苦哀号远远传到了我的耳朵里。如果你还不尽快采取行动，他们将会背起行囊移民到真正的文明国度去。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_1';

UPDATE Language_zh_CN
SET Text = '人民如此不快乐，他们居然还继续追随你这个所谓的领袖，实在是令我吃惊。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_2';

UPDATE Language_zh_CN
SET Text = '旅行者们已经告诉了我你的帝国那衰颓的经济。如果你求我，我可能会帮你一把。好吧，实际上，我是不会帮你的。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_POPULATION_1';


-- AI wins war
UPDATE Language_zh_CN
SET Text = '我希望你得到了教训……我是不可战胜的！'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_WINWAR_1';

UPDATE Language_zh_CN
SET Text = '真令人耳目一新，如果恶魔得到满足，也会给我们一点喘息的机会？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WINWAR_1';


-- AI defeated
UPDATE Language_zh_CN
SET Text = '你做得很好，我会在魔鬼面前为你美言几句。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEFEATED_1';

UPDATE Language_zh_CN
SET Text = '这就是为什么我喜欢使用外交方式多于使用战争手段。'
WHERE Tag = 'TXT_KEY_LEADER_PEDRO_DEFEATED_1';

UPDATE Language_zh_CN
SET Text = '你此刻获得的区区胜利，阻止不了我的王国永远铭记它真正的国王！'
WHERE Tag = 'TXT_KEY_LEADER_CASIMIR_DEFEATED_3';


-- Report Coop War Plans to Target AI
UPDATE Language_zh_CN
SET Text = '无法接受，如此过分的行径！'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU';


-- End Declaration of Friendship
UPDATE Language_zh_CN
SET Text = '我们的友谊声明到此结束。'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_MESSAGE_END_WORK_WITH_US';

UPDATE Language_zh_CN
SET Text = '你的行为无法原谅。我们两个国家永远无法和解。[NEWLINE][NEWLINE]（你不再是他们的朋友。如果在接下来的[COLOR_WARNING_TEXT]10[ENDCOLOR]回合内，你谴责该玩家或向其宣战，你将受到背叛他们的外交惩罚。）'
WHERE Tag = 'TXT_KEY_NOW_UNFORGIVABLE_1';

UPDATE Language_zh_CN
SET Text = '你的侵略行径危害世界和平，我们的友谊声明到此结束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WARMONGER_1';

UPDATE Language_zh_CN
SET Text = '我无法接受你对我国势力范围内的城邦的拉拢，我们的友谊声明到此结束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_MINORS_1';

UPDATE Language_zh_CN
SET Text = '我担心我们的亲密关系不符合我国的总体外交利益，因此我不得不选择结束我们的友谊声明。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_LAND_1';

UPDATE Language_zh_CN
SET Text = '你对建造世界奇观的狂热已经成为我们的重大分歧，我们的友谊声明到此结束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WONDERS_1';

UPDATE Language_zh_CN
SET Text = '我清楚地认识到我们所走的是不同的道路，因此我们的友谊声明也没有必要继续了。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_VICTORY_1';

UPDATE Language_zh_CN
SET Text = '现在的局势发生了变化，我认为我们的友谊声明不需要继续下去了，希望你能理解。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_1';

UPDATE Language_zh_CN
SET Text = '很抱歉，我们的友谊声明该结束了。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_2';


-- Kiev -> Kyiv
UPDATE Language_zh_CN
SET Text = 'Kyiv'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV';

UPDATE Language_zh_CN
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV_ADJ';

UPDATE Language_zh_CN
SET Text = 'According to legend, Kyiv was founded by three Slavic brothers - Kyi, Schek, and Khoryv -around the beginning of the 6th Century AD. Since then, Kyiv, one of the oldest cities in Eastern Europe, has passed through times of great prominence and periods of relative obscurity. Throughout the centuries, however, it has remained the most important Slavic cultural center, playing a pivotal role in the development of the medieval East Slavic civilization.[NEWLINE][NEWLINE]Located on the Dnieper trade route between Constantinople and Scandinavia, Kyiv came under the control of local Varangian (Viking) nobility and became the nucleus of the state of Rus. During the 1000s, it reached its ascendancy, a cultural hub with over 400 churches, eight markets, docks and a caravansary, and magnificent homes. With the founding of the Kyiv-Mogilyanskaya Academy in 1632, the city became the center of Ukrainian learning and scholarship. But as the capital of Kyivan Rus, the city was repeatedly sacked and occupied.[NEWLINE][NEWLINE]In 1667 the city became part of the Russian Empire; Kyiv remained an ecclesiastical and cultural center, but its political and economic influence was marginalized. Kyiv experienced growing "Russification" in the 1800s, as a result of Russian migration, educational policies, and industrialization. However, enthusiasts among ethnic Ukrainian nobles, military officers and merchants kept the native culture alive in Kyiv, often through clandestine activities such as book-printing, amateur theater, private soirees, folk festivals and the like.[NEWLINE][NEWLINE]Forcefully incorporated into the Soviet Union, the city weathered all manner of troubles: the famine of 1932-1933 devastated the lower classes, Stalin''s 1937-1938 purges almost obliterated the city''s intelligensia, and the 1941-1943 Nazi invasion brought death and destruction. But Kyiv survived, and in the wake of the collapse of the Soviet Union an independent Ukraine was proclaimed in 1991, with resurgent Kyiv as its capital and cultural heart.'
WHERE Tag = 'TXT_KEY_CIV5_KIEV_TEXT';

UPDATE Language_zh_CN
SET Text = 'The Eastern Orthodox Church is currently the second-largest Christian denomination, with an estimated 300 million adherents. The goal of Orthodox Christians is to draw nearer to God throughout their lives through theosis, a spiritual pilgrimage to become more "Christ-like."[NEWLINE][NEWLINE]The church traces its roots to the Great Schism. During the 9th and 10th centuries AD the Christian church under the Patriarch of Constantinople made significant conversions among the peoples of eastern Europe, including Kyivan Russia and the Balkans. Doctrinal issues such as the filioque split and the authority of the Pope over the Patriarch in matters religious, exacerbated by the political and economic rivalry of Rome and Constantinople, led to a schism. The final breach between these two branches of Christianity is acknowledged as the sacking of Constantinople by the Catholic crusaders in 1204 AD. Moreover, after the fall of Constantinople to the Ottomans in 1453, the Eastern Church became even more isolated from Rome under the relatively tolerant rule of the Turks. The Orthodox Church, which saw itself as the true heir to the teachings and practices of the early Christians, flourished under the Russian Tsars. Although somewhat diminished by Communist rule and Balkan secularism, Eastern Orthodoxy has experienced a resurgence in recent decades and remains a vital aspect of Christianity.'
WHERE Tag = 'TXT_KEY_RELIGION_ORTHODOXY_PEDIA';

UPDATE Language_zh_CN
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_HEADING_4';

UPDATE Language_zh_CN
SET Text = 'The eighth century saw the first written record of "Kyivan Rus." The Rus are believed to have been Scandinavian Vikings who migrated south from the Baltic coast (although this is disputed by some Russian scholars, who believe that the original founders of Kyivan Rus were Slavs). By 860 the Rus were sending raiding parties as far south as Constantinople, and by 1000 AD Kyivan Rus controlled a trade route from the Baltic to the Black Sea; this would form the economic backbone of the growing regional power.[NEWLINE][NEWLINE]By the 12th century, the Kyiv Empire covered much of what would become eastern Russia, extending from Poland in the west to the Volga in the east, and from Finland in the north to the Ukraine in the south. It was a vast territory to manage from one centralized location, especially as component parts of the Empire began developing individual identities and national aspirations. Economically, the Empire also became divided, with northern provinces aligning themselves with the Baltic powers while the western areas were drawn to Poland and Hungary, and the southern regions to Asia Minor and the Mediterranean. By the closing of the 12th century Rus Kyiv was dissolved in all but name, replaced by a number of smaller quasi-feudal states.'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_4';

UPDATE Language_zh_CN
SET Text = 'The first Mongol incursion into Kyivan territory occurred in 1223, when a Mongol reconnaissance unit met the combined warriors of several Rus states under the command of the wonderfully-named "Mstislav the Bold" and "Mstislav Romanovich the Old" at the Battle of the Kalka River. The Rus forces enjoyed early success, but they became disorganized in the pursuit of the retreating foe. The Mongol horsemen rallied and defeated the pursuers in detail before they could reorganize. A large portion of the Rus forces surrendered to the Mongols on the condition that they would be spared; the Mongols accepted the conditions then slaughtered them anyway. The Mongols then left Rus for several years before returning in much greater force.[NEWLINE][NEWLINE]In 1237 a vast Mongol army of some 30,000 or more horse archers once again crossed the Volga River. In a few short years the Mongols captured, looted and destroyed dozens of Russian cities and towns, including Ryazan, Kolomna, Moscow, Rostov, Kashin, Dmitrov, Kozelsk, Halych and Kyiv. They soundly thrashed every force raised to oppose them. By 1240 most of Rus was a smoking ruin, firmly under the control of the Mongols, who then turned their sight further west, towards Hungary and Poland.[NEWLINE]'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_5';

--Texts for New Wonder and Building Production Modifiers, either by Trait, Improvement or UnitPromotion, among others
INSERT INTO Language_zh_Hant_HK
			(Tag,															Text)
VALUES		('TXT_KEY_PRODMOD_WONDER_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]來自奇觀的駐守加成: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_UNIT_TRAIT',			'[NEWLINE][ICON_BULLET]來自駐守單位的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_IMPROVEMENT_TRAIT',	'[NEWLINE][ICON_BULLET]來自設施的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_POLICY_TRAIT',		'[NEWLINE][ICON_BULLET]來自政策的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RELIGION_TRAIT',		'[NEWLINE][ICON_BULLET]來自信條的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_RESOURCE_TRAIT',		'[NEWLINE][ICON_BULLET]來自資源的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_PLAYER_TRAIT',		'[NEWLINE][ICON_BULLET]來自領袖特性的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_TO_BUILDING_FROM_CITY_TRAIT',			'[NEWLINE][ICON_BULLET]來自城市的奇觀產能修正: {1_Num}%'),
			('TXT_KEY_PRODMOD_WONDER_IMPROVEMENT',							'[NEWLINE][ICON_BULLET]奇觀帶來的設施建造速率: {1_Num}%'),
			('TXT_KEY_RELIGION_TOOLTIP_EXTENDED',							'{1_ReligionIcon}{2_NumFollowers} 信徒（{3_TotalPressure}+{4_PressurePerTurn}（每回合）宗教壓力，總共來自{5_Num}座城市）'),
			('TXT_KEY_EUPANEL_EMBARKATION_DEFENSE',							'海運防禦'),
			('TXT_KEY_EUPANEL_UNITCLASS_NEAR',								'鄰近具有戰鬥加成的單位'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_COMBAT_BONUS',				'鄰近晉升單位修正'),
			('TXT_KEY_EUPANEL_NEARBYPROMOTION_CITY_COMBAT_BONUS',			'鄰近晉升城市修正'),
			('TXT_KEY_PRODMOD_MILITARY_UNITPROMOTION',						'[NEWLINE][ICON_BULLET]來自軍事單位的駐守修正：{1_Num}%'),
			('TXT_KEY_PRODMOD_YIELD_UNITPROMOTION',							'[NEWLINE][ICON_BULLET]來自單位駐守的城市修正：{1_Num}%'),
			('TXT_KEY_NOTIFICATION_CULTURE_UNIT',							'{1_Resource:textkey}的誕生為你的文明帶來一次文化增長'),
			('TXT_KEY_NOTIFICATION_SUMMARY_CULTURE_UNIT',					'一處{1_Resource:textkey}帶來了靈感！');

-- Game Options

INSERT INTO Language_zh_Hant_HK
			(Tag,											Text)
VALUES		('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS',		'VP-野蠻人GG/GA點數'),
			('TXT_KEY_GAME_OPTION_BARB_GG_GA_POINTS_HELP',	'允許所有玩家在和野蠻人戰鬥中獲取陸軍統帥/海軍統帥點數。');
			
UPDATE Language_zh_Hant_HK
SET Text = '每次加載遊戲時，都會重新生成隨機種子。這意味著如果你重新加載遊戲，一些隨機結果和AI決策可能與你第一次玩遊戲時有所不同。'
WHERE Tag = 'TXT_KEY_GAME_OPTION_NEW_RANDOM_SEED_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '{1_Num}%懲罰 由於意識形態不同：[NEWLINE]   '
WHERE Tag = 'TXT_KEY_CO_CITY_TOURISM_DIFFERENT_IDEOLOGY_PENALTY';

UPDATE Language_zh_Hant_HK
SET Text = '{1_Num}%懲罰 由於意識形態不同[NEWLINE]'
WHERE Tag = 'TXT_KEY_CO_PLAYER_TOURISM_DIFFERENT_IDEOLOGIES';

-- Advisors
UPDATE Language_zh_Hant_HK
SET Text = '我不確定{1_LongCivName:textkey}是否有一支軍隊，任何針對他們的敵對行動都是可笑的。'
WHERE Tag = 'TXT_KEY_DIPLOSTRATEGY_MILITARY_STRENGTH_COMPARED_TO_US_PATHETIC';

UPDATE Language_zh_Hant_HK
SET Text = '{1_name}增長進度'
WHERE Tag = 'TXT_KEY_PROGRESS_TOWARDS';
-- Leaders

-- Assyria UA
INSERT INTO Language_zh_Hant_HK
			(Tag,										Text)
SELECT		'TXT_KEY_SCIENCE_BOOST_CONQUEST_ASSYRIA',	'你的士兵在征服{1_Name}時，從城市中獲得了一些科研資料，+[ICON_RESEARCH]科研！'
WHERE EXISTS (SELECT * FROM CustomModOptions WHERE Name='ALTERNATE_ASSYRIA_TRAIT' AND Value= 1 );


-- Cities

-- Razing
UPDATE Language_zh_Hant_HK	
SET Text = '選擇[COLOR_POSITIVE_TEXT]夷平[ENDCOLOR]將使城市會以每回合減1人口的速度被[ICON_RAZING]夷平，至人口為0時將被完全摧毀。這會產生大量的[ICON_HAPPINESS_4]不滿，但會增加你對該文明的[COLOR_POSITIVE_TEXT]戰爭分數[ENDCOLOR]。'
WHERE Tag = 'TXT_KEY_POPUP_CITY_CAPTURE_INFO_RAZE';

-- Production Queue
UPDATE Language_zh_Hant_HK
SET Text = '左擊將此項目添加至生產隊列末尾。[NEWLINE]Ctrl+左擊將此項目添加至生產隊列最前端。[NEWLINE]Alt+左擊將此項目添加至生產隊列的末尾（使其重復）。[NEWLINE]Shift+左擊將生產隊列全部內容變更為此項目。'
WHERE Tag = 'TXT_KEY_CITYVIEW_QUEUE_PROD_TT';

-- Avoid Growth
UPDATE Language_zh_Hant_HK
SET Text = '選中以阻止城市[ICON_CITIZEN]人口增長。'
WHERE Tag = 'TXT_KEY_CITYVIEW_FOCUS_AVOID_GROWTH_TT';

-- All Growth Modifier Tooltips with Icons
UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][ICON_BULLET][ICON_CONNECTED]全文明修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_PLAYER';

UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][ICON_BULLET][ICON_RELIGION_PANTHEON]宗教信條修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_RELIGION';

UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][ICON_BULLET][ICON_HAPPINESS_1]「我們愛國王日」修正：{1_Num}%'
WHERE Tag = 'TXT_KEY_FOODMOD_WLTKD';


-- Units

-- Movement
UPDATE Language_zh_Hant_HK
SET Text = '移動單位'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT';

UPDATE Language_zh_Hant_HK
SET Text = '將單位移動至可以結束回合的地格上。'
WHERE Tag = 'TXT_KEY_MOVE_STACKED_UNIT_TT';

UPDATE Language_zh_Hant_HK
SET Text = '允許陸地單位海運並穿越水域。'
WHERE Tag = 'TXT_KEY_ALLOWS_EMBARKING';

-- Capture Chance
UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_CYAN]戰勝時俘獲敵軍的幾率[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_EUPANEL_CAPTURE_CHANCE';

-- Interception
UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_WARNING_TEXT]已知敵方防空單位數: {1_Number}[ENDCOLOR]！'
WHERE Tag = 'TXT_KEY_EUPANEL_VISIBLE_AA_UNITS';

-- Great Generals I/II Promotions
UPDATE Language_zh_Hant_HK
SET Text = '戰鬥中額外產生[COLOR_POSITIVE_TEXT]50%[ENDCOLOR][ICON_GREAT_GENERAL]陸軍統帥點數。'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_I_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '戰鬥中額外產生[COLOR_POSITIVE_TEXT]100%[ENDCOLOR][ICON_GREAT_GENERAL]陸軍統帥點數。'
WHERE Tag = 'TXT_KEY_PROMOTION_SPAWN_GENERALS_II_HELP';

-- Naval Melee Units
UPDATE Language_zh_Hant_HK
SET Text = '三列槳戰船是每個文明都可以建造的最早的海軍單位。作為一種近程單位，它可以攻擊海上和城中的單位（但不能遠程攻擊）。三列槳戰船在清掃己方城市附近水域的蠻族船只和有限地探索時可以派上用場。'
WHERE Tag = 'TXT_KEY_UNIT_TRIREME_STRATEGY';

-- Naval Ranged Units
UPDATE Language_zh_Hant_HK
SET Text = '槳帆戰艦是遊戲中第一種具有遠程攻擊能力的海軍單位。它與較早的海軍單位相比攻擊能力更強，但速度較慢，也無法進行近戰。槳帆戰船在將敵軍船只驅逐出近海區域時作用明顯（無法在大洋地塊結束回合，除非屬於波利尼西亞文明）。'
WHERE Tag = 'TXT_KEY_UNIT_GALLEASS_STRATEGY';

-- Ocean travel change
UPDATE Language_zh_Hant_HK
SET Text = '無法在大洋結束回合'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE';

INSERT INTO Language_zh_Hant_HK
		(Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP', '無法在大洋結束回合，但當終點為海岸時可以穿越大洋。');

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP'
WHERE Type = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Language_zh_Hant_HK
SET Text = '研究天文學前無法在大洋結束回合'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO';

UPDATE Language_zh_Hant_HK
SET Text = '研究[COLOR_POSITIVE_TEXT]天文學[ENDCOLOR]前無法在大洋結束回合，但當終點為海岸時可以穿越大洋。'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_ASTRO_HELP';

-- Siege Units
UPDATE Language_zh_Hant_HK
SET Text = '在敵方境內消耗雙倍移動力'
WHERE Tag = 'TXT_KEY_PROMOTION_MUST_SET_UP';

UPDATE Language_zh_Hant_HK
SET Text = '在敵方境內消耗雙倍移動力'
WHERE Tag = 'TXT_KEY_PEDIA_PROMOTION_MUST_SET_UP';

UPDATE Language_zh_Hant_HK
SET Text = '最早的攻城單位。能夠從遠處對城市造成大量傷害，但在敵方境內消耗雙倍移動力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CATAPULT';

UPDATE Language_zh_Hant_HK
SET Text = 'The Catapult is a siege weapon, extremely useful when assaulting early enemy cities。It is slow and extremely vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field。It moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_UNIT_CATAPULT_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = 'Siege Unit that does major damage from a distance。Moves at half-speed in enemy territory。Only the Romans may build it。This Unit has a higher [ICON_RANGE_STRENGTH] Ranged Combat Strength than the Catapult, which it replaces。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BALLISTA';

UPDATE Language_zh_Hant_HK
SET Text = 'The Ballista is a Roman unique unit that is more powerful than the Catapult it replaces。It is an excellent siege weapon and extremely useful against cities, but it is quite vulnerable to attack。Be sure to protect the Ballista with other military units。Moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_UNIT_ROMAN_BALLISTA_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = '中古時代的攻城單位，能夠從遠處對城市造成大量傷害，但在敵方境內消耗雙倍移動力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_TREBUCHET';

UPDATE Language_zh_Hant_HK
SET Text = 'A Trebuchet is a medieval siege weapon, significantly more powerful than the earlier Catapult units。The Trebuchet moves at half-speed in enemy territory, but once it is in position it can do serious damage to a fortified enemy city。Defend your trebuchets with melee and ranged units to keep enemy units from getting too close。'
WHERE Tag = 'TXT_KEY_UNIT_TREBUCHET_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = '中古時代的強力壓製單位，取代拋石機，僅朝鮮能夠組建。每回合能額外攻擊一次。'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP';

UPDATE Language_zh_Hant_HK
SET Text = 'The Hwach''a is extremely effective against enemy land units。It is slow and vulnerable to enemy melee attack; it always should be supported by other units when it''s in the field。The Hwach''a moves at half-speed in enemy territory。'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = '啟蒙時代的壓製單位，能夠從遠處對城市造成大量傷害，但在敵方境內消耗雙倍移動力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CANNON';

UPDATE Language_zh_Hant_HK
SET Text = 'The Cannon is an important mid-game siege unit, devastating against civilizations which have not yet acquired them。Like other siege units, the Cannon moves at half-speed in enemy territory。The Cannon remains potent into the Industrial Era。It cannot see as far as other units, and should be protected with melee units。'
WHERE Tag = 'TXT_KEY_UNIT_CANNON_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = '擁有3格射程的強大壓製單位，能夠從遠處對城市造成大量傷害，但在敵方境內消耗雙倍移動力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ARTILLERY';

UPDATE Language_zh_Hant_HK
SET Text = 'Artillery is a deadly siege weapon, more powerful than a Cannon and with a longer range。Like the Cannon, it has limited visibility and moves at half-speed in enemy territory, but its Ranged Combat strength is tremendous。Artillery also has the "indirect fire" ability, allowing it to shoot over obstructions at targets it cannot see (as long as other friendly units can see them)。Like other siege weapons, Artillery is vulnerable to melee attack。'
WHERE Tag = 'TXT_KEY_UNIT_ARTILLERY_STRATEGY';

UPDATE Language_zh_Hant_HK
SET Text = '遊戲後期的快速壓製單位。與其他壓製單位不同，該單位在敵方境內不會消耗雙倍移動力。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ROCKET_ARTILLERY';

UPDATE Language_zh_Hant_HK
SET Text = 'Rocket Artillery is an extremely powerful siege weapon, far superior to the standard artillery。Rocket Artillery does not lose speed in enemy territory, making it much quicker than earlier guns。Although the Rocket Artillery''s sight range is limited, it can use indirect fire to attack targets it cannot see (as long as other friendly units can see them)。Like all artillery, it is vulnerable to infantry or armor attack, and should be defended by appropriate units。'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';

-- Giant Death Robot
UPDATE Language_zh_Hant_HK
SET Text = '無法受益於地形防禦修正，即便如此它依然比遊戲中所有其他軍事單位強大得多。'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MECH';


-- Buildings

-- "Votes from World Wonders" -> "Votes from Wonders"
UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][ICON_BULLET]{1_NumVotes} 來自奇觀'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_MEMBER_DETAILS_WONDER_VOTES';

-- National Wonders
UPDATE Language_zh_Hant_HK
SET Text = '基於城邦數量提供額外的間諜，使當前擁有的間諜晉升1級，並能夠使敵方間諜效率降低15%。需要所有城市已建造警察局。'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';

UPDATE Language_zh_Hant_HK
SET Text = 'An important defensive National Wonder for a technology-driven civilization。The National Intelligence Agency provides additional spies, levels up all your existing spies, and provides a 15% reduction in enemy spy effectiveness。A civilization must have a Police Station in all cities before it can construct the National Intelligence Agency。'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_STRATEGY';


-- Tile Yields

UPDATE Language_zh_Hant_HK	
SET Text = '基礎產出：'
WHERE Tag = 'TXT_KEY_PEDIA_YIELD_LABEL';

UPDATE Language_zh_Hant_HK	
SET Text = '開發設施：'
WHERE Tag = 'TXT_KEY_PEDIA_IMPROVEMENTS_LABEL';

UPDATE Language_zh_Hant_HK
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_YIELDCHANGES';

UPDATE Language_zh_Hant_HK
SET Text = '{1_ImprovementName:textkey}：+{3_Num}{2_YieldType:textkey}(非淡水)。'
WHERE Tag = 'TXT_KEY_NO_FRESH_WATER';

UPDATE Language_zh_Hant_HK
SET Text = '(非淡水)'
WHERE Tag = 'TXT_KEY_ABLTY_NO_FRESH_WATER_STRING';

UPDATE Language_zh_Hant_HK
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}{TXT_KEY_ABLTY_NO_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_NOFRESHWATERYIELDCHANGES';

UPDATE Language_zh_Hant_HK
SET Text = '{1_ImprovementName:textkey}：+{3_Num}{2_YieldType:textkey}(淡水)。'
WHERE Tag = 'TXT_KEY_FRESH_WATER';

UPDATE Language_zh_Hant_HK
SET Text = '(淡水)'
WHERE Tag = 'TXT_KEY_ABLTY_FRESH_WATER_STRING';

UPDATE Language_zh_Hant_HK
SET Text = '{@1_ImprovementDescription}：+{3_Yield}{4_Icon}{@2_YieldDescription}{TXT_KEY_ABLTY_FRESH_WATER_STRING}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_FRESHWATERYIELDCHANGES';

UPDATE Language_zh_Hant_HK
SET Text = '{TXT_KEY_ABLTY_FASTER_MOVEMENT_STRING}{@1_RouteDescription}'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_SPECIALABILITIES_MOVEMENT';


-- Improvements

UPDATE Language_zh_Hant_HK
SET Text = '軍事要塞是陸軍統帥建造的強大改良設施，通常位於城市中易於防禦的地形之上。你可以在你的領土上建立軍事要塞。軍事要塞建成後，你的文化邊界會擴張到覆蓋軍事要塞周圍一圈所有的格子。如果擴張的格子原本屬於其他文明，則這一舉動會造成負面的外交影響。在軍事要塞中的單位可獲得100%的防禦戰鬥力加成。而任何在軍事要塞旁結束回合的敵方單位則將遭受30點損傷（多個軍事要塞不疊加傷害）。[NEWLINE][NEWLINE]希臘的雅典衛城就是軍事要塞的典型例子。這種設施幾乎不可能被外來者攻陷，即使最終被攻破，也是在承受了長時間的圍攻之後。'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_CITADEL_TEXT';

UPDATE Language_zh_Hant_HK
SET Text = '修建一座摩艾石像群(+1[ICON_CULTURE]文化)。每鄰近一處摩艾石像群額外+1[ICON_CULTURE]文化，研究航空科技後+1[ICON_GOLD]金錢。只能毗鄰海洋建造。'
WHERE Tag = 'TXT_KEY_BUILD_MOAI_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '摩艾石像群只能毗鄰海洋建造。每鄰近一處摩艾石像群提供額外[ICON_CULTURE]文化，研究航空科技後產出額外[ICON_GOLD]金錢。'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';


-- CS Stuff

-- Merchant of Venice
UPDATE Language_zh_Hant_HK
SET Text = '這名威尼斯商人將使用他富可敵國的財富來買下這座城邦作為一個[ICON_PUPPET]傀儡城市。你將獲得這座城邦的全部單位。'
WHERE Tag = 'TXT_KEY_MISSION_BUY_CITY_STATE_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '你的威尼斯商人購買了一座城邦。'
WHERE Tag = 'TXT_KEY_VENETIAN_MERCHANT_BOUGHT_CITY_STATE';

-- Militaristic UU Tooltip
UPDATE Language_zh_Hant_HK
SET Text = '友好的[COLOR_POSITIVE_TEXT]軍事型[ENDCOLOR]城邦將向你提供高級軍事單位。[NEWLINE][NEWLINE]他們掌握[COLOR_POSITIVE_TEXT]{@1_UniqueUnitName}[ENDCOLOR]的秘密。如果你是他們的盟友，並已研究[COLOR_CYAN]{@2_PrereqTech}[ENDCOLOR]，他們會贈送你此單位。'
WHERE Tag = 'TXT_KEY_CITY_STATE_MILITARISTIC_TT';

-- Bullying/Tribute
UPDATE Language_zh_Hant_HK
SET Text = '役使{@1_Unit} - 消耗{2_NumInfluence}[ICON_INFLUENCE]影響力'
WHERE Tag = 'TXT_KEY_POPUP_MINOR_BULLY_UNIT_AMOUNT';

UPDATE Language_zh_Hant_HK
SET Text = '如果城邦對你的[COLOR_POSITIVE_TEXT]恐懼[ENDCOLOR]勝過他們的[COLOR_WARNING_TEXT]抵抗[ENDCOLOR]。你可以勒索這個城邦{@3_Unit}，你會損失[ICON_INFLUENCE]影響力。{1_FearLevel}{2_FactorDetails}'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_UNIT_TT';

UPDATE Language_zh_Hant_HK
SET Text = '不久前被勒索過'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_RECENTLY';

UPDATE Language_zh_Hant_HK
SET Text = '剛被勒索過'
WHERE Tag = 'TXT_KEY_POP_CSTATE_BULLY_FACTOR_BULLIED_VERY_RECENTLY';

INSERT INTO Language_zh_Hant_HK
			(Tag,										Text)
SELECT		'TXT_KEY_POP_CSTATE_BULLY_FACTOR_MONGOL_TERROR',	'你不久前吞並了一個城邦';

-- Fixed quest text - transitioned to new 'quest rewards' panel
UPDATE Language_zh_Hant_HK
SET Text = '你成功摧毀了{1_MinorCivName:textkey}所指定的蠻族營地！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CAMP';

UPDATE Language_zh_Hant_HK
SET Text = '{2_CivName:textkey}與{1_TargetName:textkey}的戰爭爆發了！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_KILL_CITY_STATE';

UPDATE Language_zh_Hant_HK
SET Text = '{3_TargetName:textkey}向{1_CivName:textkey}的戰爭行為引發了國際關註。[COLOR_NEGATIVE_TEXT]征服[ENDCOLOR]{3_CivName:textkey}將獲得來自{1_TargetName:textkey}的[COLOR_POSITIVE_TEXT]全部[ENDCOLOR]任務獎勵，或是同時與兩個城邦[COLOR_POSITIVE_TEXT]結盟[ENDCOLOR]進行調停以獲得[COLOR_POSITIVE_TEXT]部分[ENDCOLOR]任務獎勵。來自國際社會的輿論壓力將迫使戰爭在[COLOR_POSITIVE_TEXT]{2_Num}[ENDCOLOR]回合內結束，如果你有意幹預，請盡快行動！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_KILL_CITY_STATE';

UPDATE Language_zh_Hant_HK
SET Text = '征服{1_CityStateName:textkey}（完整獎勵），或是同時與{1_CityStateName:textkey}以及該城邦結盟（部分獎勵）。'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_KILL_CITY_STATE_FORMAL';

UPDATE Language_zh_Hant_HK
SET Text = '{1_TargetName:textkey}被{2_CivName:textkey}擊敗！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_zh_Hant_HK
SET Text = '{2_CivName:textkey}與{1_TargetName:textkey}的戰爭已經結束，{2_CivName:textkey}成為無可爭議的勝利者。你的顧問擔心這一結果會為未來的潛在沖突埋下種子。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_KILL_CITY_STATE';

UPDATE Language_zh_Hant_HK
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功將{1_ResourceName}連入了你的貿易網絡，他們的商人非常高興！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONNECT_RESOURCE';

UPDATE Language_zh_Hant_HK
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功建造了{1_WonderName}！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONSTRUCT_WONDER';

UPDATE Language_zh_Hant_HK
SET Text = '如{2_MinorCivName:textkey}所希望的，你成功培養出一位{1_UnitName}，他們的學者深感敬畏！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GREAT_PERSON';

UPDATE Language_zh_Hant_HK
SET Text = '你發現了一處自然奇觀，讓{1_MinorCivName:textkey}中的市民感到驚奇不已！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_NATURAL_WONDER';

UPDATE Language_zh_Hant_HK
SET Text = '你發現了{1_TargetName:textkey}，這讓{2_MinorCivName:textkey}的商人大為喜悅！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_FIND_PLAYER';

UPDATE Language_zh_Hant_HK
SET Text = '你慷慨的經濟援助幫助{2_MinorCivName:textkey}從被{1_BullyName:textkey}勒索後的困境中拯救出來！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_GIVE_GOLD';

UPDATE Language_zh_Hant_HK
SET Text = '{2_MinorCivName:textkey}高興地看到它的競爭對手{1_TargetName:textkey}跪地求饒並放棄了來之不易的資源。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_BULLY_CITY_STATE';

UPDATE Language_zh_Hant_HK
SET Text = '你承諾保護的{2_MinorCivName:textkey}已從被{1_BullyName:textkey}勒索後的困境中拯救出來！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_PLEDGE_TO_PROTECT';

UPDATE Language_zh_Hant_HK
SET Text = '{2_MinorCivName:textkey}感到欣慰，因其在與{1_TargetName:textkey}的外交中遭到的野蠻對待引起了國際社會的普遍關註。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_DENOUNCE_MAJOR';

UPDATE Language_zh_Hant_HK
SET Text = '{@2_MinorCivName}的市民樂於見到{@1_ReligionName}能傳入他們的城市並成為主要宗教。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_SPREAD_RELIGION';

UPDATE Language_zh_Hant_HK
SET Text = '{@1_MinorCivName}的市民很高興見到與我們的商貿來往。'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_TRADE_ROUTE';

UPDATE Language_zh_Hant_HK
SET Text = '你的文化繁榮給{1_MinorCivName:textkey}留下深刻印象！相比之下，其他文明黯然失色。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_CULTURE';

UPDATE Language_zh_Hant_HK
SET Text = '另一個文明的文化繁榮給{1_MinorCivName:textkey}留下深刻影響。你的文化增長相形見絀。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_CULTURE';

UPDATE Language_zh_Hant_HK
SET Text = '{1_MinorCivName:textkey}的僧侶為你的虔誠所打動。他們鄙棄其它文明野蠻的信仰。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_FAITH';

UPDATE Language_zh_Hant_HK
SET Text = '另一個文明用他們的信仰感動了{1_MinorCivName:textkey}。你的信仰增長相形見絀。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_FAITH';

UPDATE Language_zh_Hant_HK
SET Text = '{1_MinorCivName:textkey}驚訝於你高速的科技進步！他們的科學家對其他文明不屑一顧。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_COMPLETE_CONTEST_TECHS';

UPDATE Language_zh_Hant_HK
SET Text = '另一個文明的科技進步深深震撼了{1_MinorCivName:textkey}。你的科研進度相形見絀。完成任務的文明（允許並列）:[NEWLINE]'
WHERE Tag = 'TXT_KEY_NOTIFICATION_QUEST_ENDED_CONTEST_TECHS';


-- Happiness

-- City Revolt
UPDATE Language_zh_Hant_HK
SET Text = '由於國家的[ICON_HAPPINESS_4]支持率已跌到34%以下（或是公共輿論已達到革命浪潮），[COLOR_NEGATIVE_TEXT]{1_Turns}[ENDCOLOR]回合內將會有城市發動叛亂。基於當前的不滿程度和意識形態的壓力，最有可能叛亂的城市是{2_CityName}，他們會選擇投靠{3_CivName}。請盡一切可能迅速提升國民的快樂度！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_POSSIBLE_CITY_REVOLT';

UPDATE Language_zh_Hant_HK
SET Text = '由於國家的[ICON_HAPPINESS_4]支持率已跌到34%以下，{1_CityName}已經發動叛亂並加入了{2_CivName}！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_CITY_REVOLT';

UPDATE Language_zh_Hant_HK
SET Text = '由於國家的[ICON_HAPPINESS_4]支持率已跌到34%以下，境內發生了一場叛亂！'
WHERE Tag = 'TXT_KEY_NOTIFICATION_REBELS';

-- Pantheons Founded

UPDATE Language_zh_Hant_HK
SET Text = '你的人民已經開始崇拜一種神系，他們選擇的信條是：[COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR]（{@2_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_ACTIVE_PLAYER';

UPDATE Language_zh_Hant_HK
SET Text = '{@1_CivName}已經開始崇拜一種神系。他們選擇的信條是：[COLOR_POSITIVE_TEXT]{2_BeliefName}[ENDCOLOR]（{@3_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED';

UPDATE Language_zh_Hant_HK
SET Text = '未知文明已經開始崇拜一種神系，他們選擇的信條是：[COLOR_POSITIVE_TEXT]{1_BeliefName}[ENDCOLOR]（{@2_BeliefDesc}）'
WHERE Tag = 'TXT_KEY_NOTIFICATION_PANTHEON_FOUNDED_UNKNOWN';

-- Religion

UPDATE Language_zh_Hant_HK
SET Text = '{1_ReligionName}的領袖'
WHERE Tag = 'TXT_KEY_RO_STATUS_FOUNDER';

UPDATE Language_zh_Hant_HK
SET Text = 'Can be purchased with [ICON_PEACE] Faith in any city with a majority Religion that has been enhanced。They can remove other religions from your cities (expending the Inquisitor) or be placed inside or adjacent to a city to protect it from Missionaries and Prophets trying to spread other religions into that city。'
WHERE Tag = 'TXT_KEY_UNIT_INQUISITOR_STRATEGY';


-- Espionage

UPDATE Language_zh_Hant_HK
SET Text = '間諜活動'
WHERE Tag = 'TXT_KEY_SPY_STATE_ESTABLISHED_SURVEILLANCE';

UPDATE Language_zh_Hant_HK
SET Text = '擾亂計劃'
WHERE Tag = 'TXT_KEY_SPY_STATE_ESTABLISHED_SURVEILLANCE_PROGRESS_BAR';

UPDATE Language_zh_Hant_HK
SET Text = '安全系數'
WHERE Tag = 'TXT_KEY_EO_POTENTIAL';

UPDATE Language_zh_Hant_HK
SET Text = '安全系數反映了城市間諜活動的難度。數值越高，完成間諜行動所需的時間就越多。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取決於城市的整體經濟價值（相對於其他所有城市）。城市中的間諜行動修正、反間諜行動和建築物（如治安署和警察局）也會影響安全系數。[NEWLINE][NEWLINE]單擊以按安全系數對城市進行排序。'
WHERE Tag = 'TXT_KEY_EO_POTENTIAL_SORT_TT';

UPDATE Language_zh_Hant_HK
SET Text = '如果你的城市安全系數較低，你可以選擇以下2種方法提高安全系數：1.將己方間諜派遣至城市進行反間諜行動，在敵方間諜行動完成之前抓住並殺死他們。2.建造治安署、警察局和網絡防火長城等減緩敵方間諜行動速度。'
WHERE Tag = 'TXT_KEY_EO_OWN_CITY_POTENTIAL_TT';

UPDATE Language_zh_Hant_HK
SET Text = '{1_SpyRank}{2_SpyName}正在{3_CityName}進行間諜行動。[NEWLINE]{3_CityName}當前的安全系數為{4_Num}。[NEWLINE][NEWLINE]安全系數反映了城市抵禦間諜活動的能力。數值越高，城市抵禦能力越強。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取決於城市的整體繁榮和快樂（相對於其他所有城市）。治安署和警察局可以提高城市安全系數。'
WHERE Tag = 'TXT_KEY_EO_CITY_POTENTIAL_TT';

UPDATE Language_zh_Hant_HK
SET Text = '{1_SpyRank}{2_SpyName}無法竊取{3_CityName}的科技。[NEWLINE][NEWLINE]{4_CityName}的安全系數為{5_Num}。[NEWLINE][NEWLINE]安全系數反映了城市抵禦間諜活動的能力。數值越高，城市抵禦能力越強。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取決於城市的整體繁榮和快樂（相對於其他所有城市）。治安署和警察局可以提高城市安全系數。'
WHERE Tag = 'TXT_KEY_EO_CITY_POTENTIAL_CANNOT_STEAL_TT';

UPDATE Language_zh_Hant_HK
SET Text = '{1_CityName}的安全系數為{2_Num}。向該城市派遣一個[ICON_SPY]間諜以了解更多信息。[NEWLINE][NEWLINE]安全系數反映了城市抵禦間諜活動的能力。數值越高，城市抵禦能力越強。基值[COLOR_POSITIVE_TEXT]（1-10）[ENDCOLOR]取決於城市的整體繁榮和快樂（相對於其他所有城市）。治安署和警察局可以提高城市安全系數。'
WHERE Tag = 'TXT_KEY_EO_CITY_ONCE_KNOWN_POTENTIAL_TT';

UPDATE Language_zh_Hant_HK
SET Text = '{1_SpyRank}{2_SpyName}：[NEWLINE][NEWLINE][ICON_BULLET] 移動到城邦並嘗試[COLOR_POSITIVE_TEXT]操縱選舉[ENDCOLOR]或[COLOR_POSITIVE_TEXT]發動政變[ENDCOLOR]。[NEWLINE][ICON_BULLET]移動到其他文明的非首都城市並嘗試[COLOR_POSITIVE_TEXT]竊取科技[ENDCOLOR]和[COLOR_POSITIVE_TEXT]揭露陰謀[ENDCOLOR]。[NEWLINE][ICON_BULLET]移動到其他文明的首都並嘗試[COLOR_POSITIVE_TEXT]竊取科技[ENDCOLOR]、[COLOR_POSITIVE_TEXT]揭露陰謀[ENDCOLOR]或[COLOR_POSITIVE_TEXT]作為外交官[ENDCOLOR]。'
WHERE Tag = 'TXT_KEY_EO_SPY_MOVE_TT';

-- Fixed diacritics for spy names.
UPDATE Language_zh_Hant_HK
SET Text = '安東尼奧'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_0';

UPDATE Language_zh_Hant_HK
SET Text = '埃斯泰瓦'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_3';

UPDATE Language_zh_Hant_HK
SET Text = '費爾南'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_4';

UPDATE Language_zh_Hant_HK
SET Text = '托梅'
WHERE Tag = 'TXT_KEY_SPY_NAME_BRAZIL_8';


-- Trade

-- Trade Deals
UPDATE Language_zh_Hant_HK
SET Text = '結束時間：[NEWLINE]{1_turn}回合'
WHERE Tag = 'TXT_KEY_DO_ENDS_ON';

UPDATE Language_zh_Hant_HK
SET Text = '解鎖與該文明的高級貿易選項並會顯示對方首都的位置。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_TT';

UPDATE Language_zh_Hant_HK
SET Text = '允許其他文明的軍事和民事單位進入某個文明的領土（持續{1_Num}回合）[NEWLINE][NEWLINE]註：不同文明的單位也不能堆疊。'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_TT';

UPDATE Language_zh_Hant_HK
SET Text = '如果一方遭受攻擊，另一方會自動對其敵人宣戰（持續{1_Num}回合）。[NEWLINE][NEWLINE]你最多可以與[COLOR_CYAN]{2_Num}[ENDCOLOR]個文明簽訂防禦條約（基於遊戲中存在的非附庸文明的數量）。'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_TT';

UPDATE Language_zh_Hant_HK
SET Text = '我們已經在他們的首都建立使館了!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_HAVE';

UPDATE Language_zh_Hant_HK
SET Text = '他們已經在我們的首都建立使館了!'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_THEY_HAVE';

UPDATE Language_zh_Hant_HK
SET Text = '我方沒有建立使館所需的前提科技（文字）。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_PLAYER';

UPDATE Language_zh_Hant_HK
SET Text = '對方沒有建立使館所需的前提科技（文字）。'
WHERE Tag = 'TXT_KEY_DIPLO_ALLOW_EMBASSY_NO_TECH_OTHER_PLAYER';

UPDATE Language_zh_Hant_HK
SET Text = '我們已經允許開放邊境了！'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_HAVE';

UPDATE Language_zh_Hant_HK
SET Text = '他們已經允許開放邊境了！'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_THEY_HAVE';

UPDATE Language_zh_Hant_HK
SET Text = '雙方都沒有所需的前提科技（文官製度）。'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_NO_TECH';

UPDATE Language_zh_Hant_HK
SET Text = '你需要在對方首都建立使館後才能交易此項。'
WHERE Tag = 'TXT_KEY_DIPLO_YOU_NEED_EMBASSY_TT';

UPDATE Language_zh_Hant_HK
SET Text = '對方需要我方首都建立使館後才能交易此項。'
WHERE Tag = 'TXT_KEY_DIPLO_THEY_NEED_EMBASSY_TT';

UPDATE Language_zh_Hant_HK
SET Text = '雙方需要互建使館後才能交易此項。'
WHERE Tag = 'TXT_KEY_DIPLO_BOTH_NEED_EMBASSY_TT';

UPDATE Language_zh_Hant_HK
SET Text = '防禦條約已經達成！'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_EXISTS';

UPDATE Language_zh_Hant_HK
SET Text = '雙方均未獲得達成這項交易所需科技(騎士製度)。'
WHERE Tag = 'TXT_KEY_DIPLO_DEF_PACT_NO_TECH';

UPDATE Language_zh_Hant_HK
SET Text = '合作研究協議已經生效！'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_EXISTS';

UPDATE Language_zh_Hant_HK
SET Text = '至少有一方已經獲得了所有科技。'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_ALL_TECHS_RESEARCHED';

UPDATE Language_zh_Hant_HK
SET Text = '雙方均未獲得達成這項交易所需的科技(哲學)。'
WHERE Tag = 'TXT_KEY_DIPLO_RESCH_AGREEMENT_NO_TECH';

UPDATE Language_zh_Hant_HK
SET Text = '友誼聲明是交易此項的前提條件。'
WHERE Tag = 'TXT_KEY_DIPLO_NEED_DOF_TT';

UPDATE Language_zh_Hant_HK
SET Text = '城邦結盟阻止了這一行為。'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_ALLY_AT_WAR';

UPDATE Language_zh_Hant_HK
SET Text = '城邦結盟阻止了這一行為。'
WHERE Tag = 'TXT_KEY_DIPLO_NO_WAR_ALLIES';

UPDATE Language_zh_Hant_HK
SET Text = '和平條約能夠在一段時間內防止這些文明進入戰爭。'
WHERE Tag = 'TXT_KEY_DIPLO_FORCE_PEACE';

-- Trade Routes
UPDATE Language_zh_Hant_HK
SET Text = '要劫掠這條商路，你需要能夠對該文明宣戰。'
WHERE Tag = 'TXT_KEY_MISSION_PLUNDER_TRADE_ROUTE_DISABLED_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '你發現了{1_Num}項{2_CivName}不知道的科技。[NEWLINE]對方憑借文化影響力從這條商路獲得+{3_Num}[ICON_RESEARCH]科研。'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_THEIR_SCIENCE_EXPLAINED';

UPDATE Language_zh_Hant_HK
SET Text = '{1_CivName}發現了{2_Num}項你不知道的科技。你憑借文化影響力從這條商路獲得+{3_Num}[ICON_RESEARCH]科研。'
WHERE Tag = 'TXT_KEY_CHOOSE_INTERNATIONAL_TRADE_ROUTE_ITEM_TT_YOUR_SCIENCE_EXPLAINED';

-- Lua for Cities
UPDATE Language_zh_Hant_HK
SET Text = '我們沒有可交易的城市/在其首都建立大使館。'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_TT';

UPDATE Language_zh_Hant_HK
SET Text = '他們沒有可交易的城市/在我們首都建立大使館。'
WHERE Tag = 'TXT_KEY_DIPLO_TO_TRADE_CITY_NO_THEM';


-- Civilopedia Refresh

UPDATE Language_zh_Hant_HK
SET Text = 'Welcome to the Civilopedia! Here you will find detailed descriptions of all aspects of the game. Use the "Search" field to search for articles on any specific subject. Clicking on the tabs on the top edge of the screen will take you to the various major sections of the Civilopedia. The Navigation Bar on the left side of the screen will display the various entries within a section. Click on an entry to go directly there.[NEWLINE][NEWLINE]In the upper left-hand portion of the screen you will find the forward and back buttons which will help you navigate between pages. Click on the "X" on the upper right portion of the screen to return to the game.[NEWLINE][NEWLINE]Welcome to the Community Patch, a mod containing several bugfixes and AI improvements. [COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow in the Civilopedia.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_HOME_PAGE_HELP_TEXT';

UPDATE Language_zh_Hant_HK
SET Text = 'Civilization V examines all of human history - from the deep past to the day after tomorrow. The "Game Concepts" portion of the Civilopedia explains some of the more important parts of the game - how to build and manage cities, how to fight wars, how to research technology, and so forth. The left Navigation Bar displays the major concepts; click on an entry to see the subsections within the concepts.[NEWLINE][NEWLINE][COLOR_YELLOW]Game Concepts that have been changed in the Community Patch are highlighted in yellow.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PEDIA_GAME_CONCEPT_HELP_TEXT';

UPDATE Language_zh_Hant_HK
SET Text = '如果該單位造成的傷害大於自己受到的傷害，則擊退目標。若目標退無可退，則受到50%的額外傷害（即本次進攻獲得50%戰鬥力加成）。'
WHERE Tag = 'TXT_KEY_PROMOTION_HEAVY_CHARGE_HELP';

UPDATE Language_zh_Hant_HK
SET Text = '城市裏同一時間只能有一個戰鬥單位存在。這個單位就是所謂的衛戍部隊，他可以極大地增強城市的防禦能力。其他戰鬥單位可以通過城市，但是他們不能在回合結束的時候仍然留在城市中。（所以如果你在有單位鎮守的城市中新建了一個戰鬥單位，你必須把這兩個單位中的一個移出城市才能結束你的回合）'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Combat Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_CITIES_COMBATUNITS_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Garrison Units in Cities[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = '城市的所有者能夠讓一支軍事部隊在城市裏鎮守以增強防禦。單位的一部分戰鬥力將附加到城市的攻擊力上面。鎮守單位在城市受攻擊時不會受到傷害；但是，一旦城市被占領，鎮守單位也會被消滅。[NEWLINE][NEWLINE]在城市裏鎮守的單位可以攻擊周圍的敵軍單位，但城市會因此失去鎮守單位的加成，同時，如果那是一支近戰部隊，它會像平常那樣損失生命值。'
WHERE Tag = 'TXT_KEY_COMBAT_GARRISONINCITIES_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Forts[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = 'Once a civ has acquired the Engineering technology, workers can construct "forts" in friendly or neutral territory. Forts provide a hefty defensive bonus to units occupying them. Forts cannot be constructed in enemy territory. They can be constructed atop resources. [COLOR_YELLOW]Melee Units attacking from a Fort don''t leave the Fort even if they destroy the attacked enemy unit.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_FORT_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Siege Weapons[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = 'Certain ranged weapons are classified as "siege weapons" - catapults, ballistae, trebuchets, and so forth. These units get combat bonuses when attacking enemy cities. They are extremely vulnerable to melee combat, and should be accompanied by melee units to fend off enemy assault.[NEWLINE][NEWLINE][COLOR_YELLOW]In Vox Populi and the Community Patch, siege units don''t have to be "set up" anymore. Instead, they move at half-speed in enemy territory.[ENDCOLOR][NEWLINE][NEWLINE]Siege weapons are important. It''s really difficult to capture a well-defended city without them!'
WHERE Tag = 'TXT_KEY_COMBAT_SEIGEWEAPONS_HEADING2_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Melee Combat Results[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = '在一場近戰之後，一方或雙方的單位也許會受到一定的損傷，並且失去一些「生命值」，如果一個單位的生命減至0，那這個單位就被消滅了。如果在近戰後防守方單位被消滅而進攻方幸存，進攻方單位便會移動到守方原來的區塊，並且俘虜在這區塊中的任何非軍事單位。而如果守方存活，他依然會擁有其區塊及之上其他單位控製權。[NEWLINE][NEWLINE]大部分單位在進攻時會消耗所有的行動力。但有些卻能夠在戰鬥後繼續移動——前提是他們幸存於戰鬥且還有移動力。[NEWLINE][NEWLINE]任何在戰鬥中幸存的單位將會得到「經驗點」（XP），這可以用來給予單位晉升。'
WHERE Tag = 'TXT_KEY_COMBAT_MELEERESULTS_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '陸軍統帥是熟悉戰略和戰術的偉人。他們能為2格內的友軍提供攻擊和防禦的戰鬥加成。陸軍統帥本身是一個非戰鬥單位，所以能與戰鬥單位堆疊以獲得保護。一旦有敵軍進入陸軍統帥所在的地塊，陸軍統帥單位就會被消滅。[NEWLINE][NEWLINE]陸軍統帥為自己所在地塊和2格內的友軍提供20%的戰鬥加成。[NEWLINE][NEWLINE]你能通過不斷的戰鬥或者采用「尚武精神」社會政策來獲得陸軍統帥。在「偉人」部分可了解更多的細節。'
WHERE Tag = 'TXT_KEY_COMBAT_GREATGENERALS_HEADING2_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '戰爭分數'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = '戰爭分數反映交戰雙方不斷變化的戰爭狀態。戰爭分數會在100到-100之間波動。當到達100，即你獲得全面勝利；反之亦然。此外，戰爭分數也會隨著時間推移而逐漸衰減，以表明過去曠日持久戰爭中獲得的價值降低。[NEWLINE][NEWLINE]剛處於戰爭時，交戰雙方的戰爭分數都從零開始。當你（或你的敵人）擊殺單位、劫掠地格/貿易單位、俘虜平民和占領城市時，戰爭分數就會增加。這些行動的價值因敵人的整體規模而異。[NEWLINE][NEWLINE]當需要簽訂和平條約時，戰爭分數可以準確顯示你能從敵人那裏獲得什麽，或者他們能從你這獲得什麽。當達成和平時，戰爭分數歸零。'
WHERE Tag = 'TXT_KEY_DIPLOMACY_PEACE_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '一旦你獲得了「騎士製度」科技，就能夠簽訂防禦條約。防禦條約總是雙方的。如果協定的一方簽訂者受到攻擊，另一方會自動和攻擊者開戰。[NEWLINE][NEWLINE]一份防禦條約持續50回合（標準遊戲速度）。當時間到後，協議失效除非重新談判。'
WHERE Tag = 'TXT_KEY_DIPLOMACY_DEFENSIVEPACT_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '遺跡提供一幅周圍地區地圖（驅散周圍一些區塊的戰爭迷霧）。'
WHERE Tag = 'TXT_KEY_BARBARIAN_MAP_HEADING4_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '通過和蠻族單位戰鬥，你的那些缺乏訓練的單位可以獲得經驗值。但是，任何已經擁有45點經驗值（或者已經將這45經驗用於晉升）的單位將無法再從蠻族身上獲得經驗值。'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '[COLOR_YELLOW]Experience Points Limitations[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_BARBARIAN_POINTLIMITS_HEADING3_TITLE';

UPDATE Language_zh_Hant_HK
SET Text = 'Each civilization in Civilization V has one or more special "national units." These units are unique to that civilization, and they are in some way superior to the standard version of that unit. The American civilization, for example, has a Minuteman unit, which is superior to the standard Musketman available to other civs. The Greek civ has the Hoplite unit, which replaces the Spearman.[NEWLINE][NEWLINE]See each civilization''s Civilopedia entry to discover its special unit.'
WHERE Tag = 'TXT_KEY_UNITS_NATIONAL_HEADING2_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '遊戲中每個文明都會有「特色單位」。這些單位是獨有的，他們會代替普通的該類單位。比如美國擁有快速民兵，這種單位將會替代火槍手。希臘則擁有希臘方陣，代替矛兵的位置。[NEWLINE][NEWLINE]每個文明的文明百科條目中都記錄有該文明的特色單位。'
WHERE Tag = 'TXT_KEY_UNITS_NATIONAL_HEADING2_BODY';

UPDATE Language_zh_Hant_HK
SET Text = '如果另一個文明攻占了一個城邦，而你又從這個文明手中占領了這個城市，那麽你就會獲得一個「解放城邦」的選項。如果你這麽做了，你會立刻獲得大量對這個城邦的影響力（通常足以讓你與其[COLOR_POSITIVE_TEXT]結盟[ENDCOLOR]）。'
WHERE Tag = 'TXT_KEY_CITYSTATE_LIBERATING_HEADING2_BODY';


-- Miscellaneous


UPDATE Language_zh_Hant_HK
SET Text = 'They want you to defeat Barbarian units that are invading their territory. You are allowed to enter their territory until the Barbarians are defeated.'
WHERE Tag = 'TXT_KEY_CITY_STATE_QUEST_INVADING_BARBS_FORMAL';

UPDATE Language_zh_Hant_HK
SET Text = '給予符合條件的單位[COLOR_POSITIVE_TEXT]{@1_PromotionName}[ENDCOLOR]晉升[NEWLINE][NEWLINE]({@2_PromotionHelp})'
WHERE Tag = 'TXT_KEY_FREE_PROMOTION_FROM_TECH';

UPDATE Language_zh_Hant_HK
SET Text = '{1_Num}[ICON_CULTURE] 來自傑作和主題獎勵'
WHERE Tag = 'TXT_KEY_CULTURE_FROM_GREAT_WORKS';

-- Economic Advisor
UPDATE Language_zh_Hant_HK
SET Text = '我們擁有的單位數量正在阻礙我們的經濟，我們應該解散一些不需要的單位以保證我們文明的全力發展。'
WHERE Tag = 'TXT_KEY_ECONOMICAISTRATEGY_TOO_MANY_UNITS';

-- Reversed Tourism for Open Borders
UPDATE Language_zh_Hant_HK
SET Text = '+{1_Num}%獎勵 由於開放邊界：[NEWLINE]   '
WHERE Tag = 'TXT_KEY_CO_CITY_TOURISM_OPEN_BORDERS_BONUS';

-- Barbarians
UPDATE Language_zh_Hant_HK
SET Text = '蠻族'
WHERE Tag = 'TXT_KEY_LEADER_BARBARIAN';

-- Notification
UPDATE Language_zh_Hant_HK
SET Text = '{1_CivName:textkey}失去了他們的[ICON_CAPITAL]首都'
WHERE Tag = 'TXT_KEY_NOTIFICATION_SUMMARY_PLAYER_LOST_CAPITAL';

-- Demographics
UPDATE Language_zh_Hant_HK
SET Text = '軍事實力。'
WHERE Tag = 'TXT_KEY_DEMOGRAPHICS_ARMY_MEASURE';

-- Fix for production ranking
UPDATE Language_zh_Hant_HK
SET Text = '根據玩家們所有城市的平均[ICON_PRODUCTION]產能來排名。'
WHERE Tag = 'TXT_KEY_PROGRESS_SCREEN_PRODUCTION_TT';

-- World Congress Proposals, Which Civs benefit
UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][NEWLINE]會對此項提案表示愉快的文明：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_POSITIVE';

UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][NEWLINE]會對此項提案表示憤怒的文明：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_PROPOSAL_OPINIONS_NEGATIVE';

-- Shorten the overview text to make room
UPDATE Language_zh_Hant_HK
SET Text = '[NEWLINE][NEWLINE]根據我們對其他文明意圖的了解，我們預計此項提案的表決結果如下：'
WHERE Tag = 'TXT_KEY_LEAGUE_OVERVIEW_VOTE_OPINIONS';


-- Diplo Opinion Table Modifiers

-- Neutral Indicators
UPDATE Language_zh_Hant_HK
SET Text = '滅亡'
WHERE Tag = 'TXT_KEY_EMOTIONLESS';

UPDATE Language_zh_Hant_HK
SET Text = '你們曾經發生過戰爭。'
WHERE Tag = 'TXT_KEY_DIPLO_PAST_WAR_BAD';

-- Dispute Modifiers
UPDATE Language_zh_Hant_HK
SET Text = '領土爭端使你們的關系緊張。'
WHERE Tag = 'TXT_KEY_DIPLO_LAND_DISPUTE';

UPDATE Language_zh_Hant_HK
SET Text = '你正在爭奪世界奇觀。'
WHERE Tag = 'TXT_KEY_DIPLO_WONDER_DISPUTE';

UPDATE Language_zh_Hant_HK
SET Text = '你們在爭奪同一個城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_MINOR_CIV_DISPUTE';

-- War Stuff
UPDATE Language_zh_Hant_HK
SET Text = '他們對你的好戰主義有一些擔憂。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MINOR';

UPDATE Language_zh_Hant_HK
SET Text = '他們對你的好戰主義構成的潛在威脅保持警惕。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_MAJOR';

UPDATE Language_zh_Hant_HK
SET Text = '他們認為你的好戰主義已經威脅到生存。'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_SEVERE';

UPDATE Language_zh_Hant_HK
SET Text = '他們擔憂你的好戰主義會毀滅這個世界！'
WHERE Tag = 'TXT_KEY_DIPLO_WARMONGER_THREAT_CRITICAL';

UPDATE Language_zh_Hant_HK
SET Text = '（他們極其厭惡好戰者。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_HIGH';

UPDATE Language_zh_Hant_HK
SET Text = '（他們厭惡好戰者。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_MID';

UPDATE Language_zh_Hant_HK
SET Text = '（他們忽視輕微的好戰行為。）'
WHERE Tag = 'TXT_KEY_WARMONGER_HATE_LOW';

UPDATE Language_zh_Hant_HK
SET Text = '你劫掠了他們的商路！'
WHERE Tag = 'TXT_KEY_DIPLO_PLUNDERING_OUR_TRADE_ROUTES';

UPDATE Language_zh_Hant_HK
SET Text = '你用核武器襲擊了他們！'
WHERE Tag = 'TXT_KEY_DIPLO_NUKED';

UPDATE Language_zh_Hant_HK
SET Text = '你占領了他們的原始首都。'
WHERE Tag = 'TXT_KEY_DIPLO_CAPTURED_CAPITAL';

-- Recent diplomatic actions
UPDATE Language_zh_Hant_HK
SET Text = '你最近的外交行動讓他們高興。'
WHERE Tag = 'TXT_KEY_DIPLO_ASSISTANCE_TO_THEM';

UPDATE Language_zh_Hant_HK
SET Text = '你最近的外交行動令他們失望。'
WHERE Tag = 'TXT_KEY_DIPLO_REFUSED_REQUESTS';

-- Player has done nice stuff
UPDATE Language_zh_Hant_HK
SET Text = '我們是貿易夥伴。'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_PARTNER';

UPDATE Language_zh_Hant_HK
SET Text = '我們與共同的敵人作戰。'
WHERE Tag = 'TXT_KEY_DIPLO_COMMON_FOE';

UPDATE Language_zh_Hant_HK
SET Text = '你解救了他們被俘的公民！'
WHERE Tag = 'TXT_KEY_DIPLO_CIVILIANS_RETURNED';

UPDATE Language_zh_Hant_HK
SET Text = '你在他們的境內建造了一個風景地標。'
WHERE Tag = 'TXT_KEY_DIPLO_LANDMARKS_BUILT';

UPDATE Language_zh_Hant_HK
SET Text = '他們亡國後，你恢復了他們的文明！'
WHERE Tag = 'TXT_KEY_DIPLO_RESURRECTED';

UPDATE Language_zh_Hant_HK
SET Text = '你解放了他們的原始首都。'
WHERE Tag = 'TXT_KEY_DIPLO_LIBERATED_CAPITAL';

UPDATE Language_zh_Hant_HK
SET Text = '你解救了他們的一些國民！'
WHERE Tag = 'TXT_KEY_DIPLO_CITIES_LIBERATED';

UPDATE Language_zh_Hant_HK
SET Text = '他們在你的首都設有大使館。'
WHERE Tag = 'TXT_KEY_DIPLO_HAS_EMBASSY';

UPDATE Language_zh_Hant_HK
SET Text = '你原諒了他們的間諜活動。'
WHERE Tag = 'TXT_KEY_DIPLO_FORGAVE_FOR_SPYING';

UPDATE Language_zh_Hant_HK
SET Text = '你讓他們提供了情報（陰謀）。'
WHERE Tag = 'TXT_KEY_DIPLO_SHARED_INTRIGUE';

-- Player has done mean stuff
UPDATE Language_zh_Hant_HK
SET Text = '你在和平時期搶奪了他們的一些領土！'
WHERE Tag = 'TXT_KEY_DIPLO_CULTURE_BOMB';

UPDATE Language_zh_Hant_HK
SET Text = '你的間諜活動時被他們抓捕了。'
WHERE Tag = 'TXT_KEY_DIPLO_CAUGHT_STEALING';

-- Player has asked us to do things we don't like
UPDATE Language_zh_Hant_HK
SET Text = '你要求他們不要在你的土地附近定居！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_SETTLE_ASKED';

UPDATE Language_zh_Hant_HK
SET Text = '你要求他們不要監視你。'
WHERE Tag = 'TXT_KEY_DIPLO_STOP_SPYING_ASKED';

UPDATE Language_zh_Hant_HK
SET Text = '你向他們索取！'
WHERE Tag = 'TXT_KEY_DIPLO_TRADE_DEMAND';

UPDATE Language_zh_Hant_HK
SET Text = '他們被迫進貢。'
WHERE Tag = 'TXT_KEY_DIPLO_PAID_TRIBUTE';

-- Denouncing
UPDATE Language_zh_Hant_HK
SET Text = '我們譴責了他們！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_US';

UPDATE Language_zh_Hant_HK
SET Text = '他們譴責我們！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_THEM';

UPDATE Language_zh_Hant_HK
SET Text = '你譴責了與他們友誼聲明的領袖！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIEND';

UPDATE Language_zh_Hant_HK
SET Text = '我們譴責了同一領袖！'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_ENEMY';

UPDATE Language_zh_Hant_HK
SET Text = '他們的朋友或盟友譴責了你！'
WHERE Tag = 'TXT_KEY_DIPLO_DENOUNCED_BY_PEOPLE_WE_TRUST_MORE';

-- Promises
UPDATE Language_zh_Hant_HK
SET Text = '你違背了不向他們宣戰的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不向其他文明宣戰的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_zh_Hant_HK
SET Text = '你拒絕將你的軍隊從他們的邊境離開！'
WHERE Tag = 'TXT_KEY_DIPLO_MILITARY_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不在他們附近定居的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了不在他們附近定居的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_EXPANSION_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不再購買他們附近土地的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了停止購買他們附近土地的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_BORDER_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不會征服他們所保護的城邦的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不會征服其他文明所保護的城邦的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_BROKEN_WITH_OTHERS';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了停止攻擊受他們保護的城邦的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不再向受他們保護的城邦勒索的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_BROKEN';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了停止向受他們保護的城邦勒索的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_BULLY_CITY_STATE_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不再改變他們城市信仰的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_BROKEN';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了不再改變他們城市信仰的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_CONVERT_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了停止挖掘他們的文物的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_BROKEN';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了停止挖掘他們的文物的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_NO_DIG_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了不再監視他們的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_BROKEN';

UPDATE Language_zh_Hant_HK
SET Text = '你無視了不再監視他們的請求！'
WHERE Tag = 'TXT_KEY_DIPLO_SPY_PROMISE_IGNORED';

UPDATE Language_zh_Hant_HK
SET Text = '你違背了共同對別國作戰的承諾！'
WHERE Tag = 'TXT_KEY_DIPLO_COOP_WAR_PROMISE';

-- Religion / Ideology
UPDATE Language_zh_Hant_HK
SET Text = '他們很高興他們的大多數城市接受了你的宗教。' -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_HIS_RELIGION';

UPDATE Language_zh_Hant_HK
SET Text = '你的大多數城市都接受了他們的宗教。'  -- note for translators: swapped HIS and MY text keys from vanilla
WHERE Tag = 'TXT_KEY_DIPLO_ADOPTING_MY_RELIGION';

UPDATE Language_zh_Hant_HK
SET Text = '他們在傳播自己的宗教，但你在他們的城市傳播你的宗教。'
WHERE Tag = 'TXT_KEY_DIPLO_RELIGIOUS_CONVERSIONS';

UPDATE Language_zh_Hant_HK
SET Text = '你們都采用了{1_PolicyTree}。'
WHERE Tag = 'TXT_KEY_DIPLO_SAME_LATE_POLICY_TREES';

UPDATE Language_zh_Hant_HK
SET Text = '你采用了{1_YourPolicyTree}，但他們追隨{2_TheirPolicyTree}。'
WHERE Tag = 'TXT_KEY_DIPLO_DIFFERENT_LATE_POLICY_TREES';

-- Protected Minors
UPDATE Language_zh_Hant_HK
SET Text = '你消滅了他們保護的城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_KILLED';

UPDATE Language_zh_Hant_HK
SET Text = '你攻擊了他們保護的城邦！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_ATTACKED';

UPDATE Language_zh_Hant_HK
SET Text = '你向他們保護下的城邦索取了貢品！'
WHERE Tag = 'TXT_KEY_DIPLO_PROTECTED_MINORS_BULLIED';

UPDATE Language_zh_Hant_HK
SET Text = '他們欺淩了你保護的城邦，你無法接受他們的作為！'
WHERE Tag = 'TXT_KEY_DIPLO_SIDED_WITH_MINOR';

-- Declaration of Friendship
UPDATE Language_zh_Hant_HK
SET Text = '我們公開發布了友誼聲明！'
WHERE Tag = 'TXT_KEY_DIPLO_DOF';

UPDATE Language_zh_Hant_HK
SET Text = '我們都與同一領袖聲明友誼！'
WHERE Tag = 'TXT_KEY_DIPLO_MUTUAL_DOF';

UPDATE Language_zh_Hant_HK
SET Text = '你與他們的敵人公開聲明友誼！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DOF_WITH_ENEMY';

-- Traitor Opinion
UPDATE Language_zh_Hant_HK
SET Text = '你的朋友認為有理由對你進行譴責！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_BY_FRIENDS';

UPDATE Language_zh_Hant_HK
SET Text = '你對你公開聲明友誼的領袖進行公開譴責！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DENOUNCED_FRIENDS';

UPDATE Language_zh_Hant_HK
SET Text = '我們對他們公開聲明友誼，但又公開譴責他們！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DENOUNCED';

UPDATE Language_zh_Hant_HK
SET Text = '你對你公開聲明友誼的領袖宣戰！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_DECLARED_WAR_ON_FRIENDS';

UPDATE Language_zh_Hant_HK
SET Text = '我們對他們公開聲明友誼，但又對他們宣戰！'
WHERE Tag = 'TXT_KEY_DIPLO_HUMAN_FRIEND_DECLARED_WAR';

-- Reckless Expander
UPDATE Language_zh_Hant_HK
SET Text = '他們認為我們建立了太多的新城市！'
WHERE Tag = 'TXT_KEY_DIPLO_RECKLESS_EXPANDER';

-- World Congress
UPDATE Language_zh_Hant_HK
SET Text = '他們喜歡我們在世界議會上的提案。'
WHERE Tag = 'TXT_KEY_DIPLO_LIKED_OUR_PROPOSAL';

UPDATE Language_zh_Hant_HK
SET Text = '他們討厭我們在世界議會上的提案。'
WHERE Tag = 'TXT_KEY_DIPLO_DISLIKED_OUR_PROPOSAL';

UPDATE Language_zh_Hant_HK
SET Text = '我們幫助他們的提案獲得通過。'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_PROPOSAL';

UPDATE Language_zh_Hant_HK
SET Text = '我們阻撓他們的提案獲得通過。'
WHERE Tag = 'TXT_KEY_DIPLO_FOILED_THEIR_PROPOSAL';

UPDATE Language_zh_Hant_HK
SET Text = '我們幫助他們獲得世界議會的主辦權。'
WHERE Tag = 'TXT_KEY_DIPLO_SUPPORTED_THEIR_HOSTING';


-- Civilization Leader Dialog

-- First Greeting
UPDATE Language_zh_Hant_HK
SET Text = '我是巴比倫的尼布甲尼撒。外面有些傻瓜說我是神，但那好象不太可能。你是誰？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_1';

UPDATE Language_zh_Hant_HK
SET Text = '我是尼布甲尼撒。你是真人還是我胡思亂想出來的幽靈？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_FIRSTGREETING_3';

UPDATE Language_zh_Hant_HK
SET Text = '向你致意，陌生人。我是帕查庫提，無與倫比的印加的統治者。如果我能夠幫助你們這個後進的文明，請隨時提出來。'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_FIRSTGREETING_3';

-- Greeting (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '你好，朋友，今天什麽風把你吹來了？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '再次向你問好，我的朋友。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_POLITE_HELLO_3';

UPDATE Language_zh_Hant_HK
SET Text = '再次問候你，朋友！我這樣的統帥能幫你做什麽？'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_GREETING_POLITE_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '真主在對你微笑啊，我的朋友。我能為你做什麽？'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_GREETING_POLITE_HELLO_1';

-- Greeting (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '我相信是真主指引你來到桑海的，偉大的領袖。'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '德國始終期待同像你這樣的強國建立友好關系。'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '你為什麽來到這裏，可敬的領袖？'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '你是來欣賞法蘭西帝國的風光呢，還是有什麽正事要辦？'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_GREETING_NEUTRAL_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '嗯？大聲點。因為血在我腦子裏奔湧，我幾乎聽不見你說話。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_GREETING_5';

-- Greeting (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '你到波斯來了？你想要什麽？'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_GREETING_HOSTILE_HELLO_1';

UPDATE Language_zh_Hant_HK
SET Text = '我通常只和偉大的領袖會談，這次暫時為你破個例。快說吧。'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_GREETING_HOSTILE_HELLO_1';

-- Greeting (Repeat)
UPDATE Language_zh_Hant_HK
SET Text = '你一定是很喜歡和我說話是嗎？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_REPEAT_2';

-- Greeting (Aggressive Plot Buying)
UPDATE Language_zh_Hant_HK
SET Text = '最近你在我們領土附近圈占土地的趨勢令人擔心。為了我們未來的友誼，我建議你關註下這個事情。現在不說其他的，你來這裏幹什麽？'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_AGGRESSIVE_PLOT_BUYING_1';

-- Greeting (Hostile, Aggressive Expansion)
UPDATE Language_zh_Hant_HK
SET Text = '你的城市和人民的擴張就像是瘟疫傳染著大地。我不希望看到一個令人沮喪的未來。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_AGGRESSIVE_EXPANSION_1';

-- Greeting (Hostile, Small Army)
UPDATE Language_zh_Hant_HK
SET Text = '只是你我之間說說，你的軍隊可是世界級的笑柄。但是你也別太擔心，我肯定會有人幫你脫離苦海的。'
WHERE Tag = 'TXT_KEY_GENERIC_GREETING_HOSTILE_HUMAN_SMALL_ARMY';


-- Open Trade Screen
UPDATE Language_zh_Hant_HK
SET Text = '說吧：隨便說點什麽。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_LETSHEARIT_1';


-- Can't Match Trade Offer
UPDATE Language_zh_Hant_HK
SET Text = '我們不願向你們提供足夠的交易項目'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_1';

UPDATE Language_zh_Hant_HK
SET Text = '我們提出的任何交易條件對你來說都會是不公平的。'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_CANT_MATCH_OFFER_2';


-- Offer Trade (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '這筆交易你感興趣嗎？'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '看來你確實有存在的理由——和我進行交易。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_HAPPY';

-- Offer Trade (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '提議機不可失……待請熟慮。'
WHERE Tag = 'TXT_KEY_LEADER_ENRICO_DANDOLO_TRADEREQUEST_NEUTRAL';

-- Offer Trade (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '這是我們的提議——相比你應得的已經要好得多了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADEREQUEST_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '你應該接受我們這個公平合理的條件。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADEREQUEST_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '你可以通過接受以下交易來減輕我的巨大痛苦。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADEREQUEST_ANGRY';

-- Offer Trade (Luxury)
UPDATE Language_zh_Hant_HK
SET Text = '真主教導我們應該與他們合作共贏。'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_LUXURY_TRADE_1';

UPDATE Language_zh_Hant_HK
SET Text = '啊，我的朋友。我註意到我們可以開展一項互利的貿易，你覺得呢？'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_LUXURY_TRADE_1';

UPDATE Language_zh_Hant_HK
SET Text = '貿易是國家間友誼的果實。你覺得這個提議怎麽樣，我的朋友？'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_LUXURY_TRADE_1';

-- Offer Trade (Open Borders)
UPDATE Language_zh_Hant_HK
SET Text = '開放我們的邊界看來是一個適宜的做法，你同意嗎？'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_OPEN_BORDERS_EXCHANGE_1';

UPDATE Language_zh_Hant_HK
SET Text = '開放我們的邊界能夠方便部隊通行。當然是在必要的情況下，你覺得呢？'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_OPEN_BORDERS_EXCHANGE_1';

-- Offer Trade (Research Agreement)
UPDATE Language_zh_Hant_HK
SET Text = '我覺得合作研究協議會是一個雙贏的舉措，能夠進一步加強我們的友誼。'
WHERE Tag = 'TXT_KEY_GENERIC_RESEARCH_AGREEMENT_OFFER_1';


-- Accept Trade (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '很好。但從長期來說這對我們都沒有幫助——你知道長期來說我們都將死去。很好，同意了。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_YES_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '你的提議令我滿意，幹得好。'
WHERE Tag ='TXT_KEY_LEADER_RAMESSES_TRADE_YES_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '樂意之至。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_TRADE_YES_HAPPY';

-- Accept Trade (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '你的提議對我們來說是可以接受的。我們同意。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_NEUTRAL';

-- Accept Trade (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '哦，好吧，我想我必須接受。我們同意了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_YES_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '明智之舉。'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_TRADE_YES_ANGRY';


-- Need More from Trade (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_3';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_HAPPY_4';

UPDATE Language_zh_Hant_HK
SET Text = '我們就快達成一致了……'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_HAPPY_3';

-- Need More from Trade (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_AUGUSTUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_HARUN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_MONTEZUMA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_RAMKHAMHAENG_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_SULEIMAN_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '我認為當前的交易條款不符合美國的最大利益。你能提高你的報價嗎？'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_1';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_NEUTRAL_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WUZETIAN_TRADE_NEEDMORE_NEUTRAL_4';

-- Need More from Trade (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_BISMARCK_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_ODA_TRADE_NEEDMORE_ANGRY_4';

UPDATE Language_zh_Hant_HK
SET Text = '你就快成功了……'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRADE_NEEDMORE_ANGRY_4';


-- Refuse Trade (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '你是打算利用我們之間的親密關系嗎？表現好點，否則我會生氣的。'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '我親愛的朋友，雖然我個人願意把所有財產都送給你，但我的顧問卻沒有這麽慷慨。因此我不得不拒絕你的提議。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '很抱歉，有個聲音告訴我應該拒絕你的提議。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_HAPPY';

-- Refuse Trade (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '我希望你不要再拿這種愚蠢的建議來浪費我的時間了。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRADE_NO_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '你一定瘋了，竟拿這樣的提議來侮辱我。我拒絕。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_TRADE_NO_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '你的提議被拒絕了。如果我考慮你的提議，我會感覺受到冒犯。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_NEUTRAL';

-- Refuse Trade (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '你知道我的丈夫已經死了：俄國不再是由一個白癡來統治了。因此我們拒絕。'
WHERE Tag = 'TXT_KEY_LEADER_CATHERINE_TRADE_NO_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '我對你產生了幾乎無法克製的討厭情緒。我的回答是「不行」。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRADE_NO_ANGRY';

-- Refuse Trade (Insulting)
UPDATE Language_zh_Hant_HK
SET Text = '這是完全不可接受的。如果你希望我們達成交易，你必須提供一個公平的條款。'
WHERE Tag = 'TXT_KEY_GENERIC_TRADE_REJECT_INSULTING_1';


-- Make Request for Help
UPDATE Language_zh_Hant_HK
SET Text = '不幸的是，事情發展的不是那麽好。你能給你的老朋友分點什麽嗎？當一切好起來以後，我當會湧泉相報的。'
WHERE Tag = 'TXT_KEY_GENERIC_REQUEST_ITEM_1';

UPDATE Language_zh_Hant_HK
SET Text = '桑海最近情況不太妙，朋友。真主教導我們應該互相幫助。'
WHERE Tag = 'TXT_KEY_LEADER_ASKIA_RESPONSE_REQUEST_1';

UPDATE Language_zh_Hant_HK
SET Text = '如果你能幫助我們，美利堅合眾國將感激不盡。'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_RESPONSE_REQUEST_1';


-- Make Demand (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '親愛的朋友，你能在我們需要時給予幫助嗎？'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DEMANDTRIBUTE_HAPPY';

-- Make Demand (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '你有我想要的東西。如果你不肯把它交給我，我將不得不用暴力來奪取。'
WHERE Tag = 'TXT_KEY_GENERIC_DEMAND_1';

UPDATE Language_zh_Hant_HK
SET Text = '給我我想要的，我可以饒你一命……暫時。'
WHERE Tag = 'TXT_KEY_LEADER_GAJAH_MADA_DEMANDTRIBUTE_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '以下貢物可以提升我的黑色幽默感，並極大地增加你多活幾天的幾率。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEMANDTRIBUTE_NEUTRAL';


-- Accept Demand (Friendly)
UPDATE Language_zh_Hant_HK
SET Text = '我們很樂意在我們的盟友有需要時給予幫助。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_HAPPY';

UPDATE Language_zh_Hant_HK
SET Text = '拿著吧。我只不過是瘋狂神靈所做的惡夢——這些東西對我有什麽用？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_HAPPY';


-- Accept Demand (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '看在這些財寶的份上，好吧。但是如此輕率的行徑是不會被輕易忘記的。'
WHERE Tag = 'TXT_KEY_LEADER_BOUDICCA_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '哦，好吧，我想我們別無選擇。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '同意——但願我的顧問不要生氣，他們建議我拒絕你。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '我的子民，我的榮耀：幫助那些需要幫助的人。'
WHERE Tag = 'TXT_KEY_LEADER_POCATELLO_TRIBUTE_YES_NEUTRAL';

UPDATE Language_zh_Hant_HK
SET Text = '好吧，看來我別無選擇，只能同意你的要求。但是我警告你別太過分了。'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_TRIBUTE_YES_NEUTRAL';


-- Accept Demand (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '好吧。看來我是無可選擇了。但將來你會為此付出代價的。'
WHERE Tag = 'TXT_KEY_LEADER_ALEXANDER_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '你現在確實占據上風，但不會永遠如此。我們會記住這件事的。'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '我接受你這令人唾棄的要求。'
WHERE Tag = 'TXT_KEY_LEADER_MARIA_I_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '你的臭氣快把我給嗆死了——快點拿著東西滾蛋。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_YES_ANGRY';

UPDATE Language_zh_Hant_HK
SET Text = '好吧。希望你別噎著！'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_TRIBUTE_YES_ANGRY';


-- Refuse Demand (Neutral)
UPDATE Language_zh_Hant_HK
SET Text = '愚蠢的豺狼——你最好去埃及試試，你的同類在那裏受到崇拜。這裏你什麽都得不到。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_TRIBUTE_NO_NEUTRAL';

-- Refuse Demand (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '你竟然敢以如此的態度來羞辱我？如果你真的想要動手那就盡管來吧。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_1';

UPDATE Language_zh_Hant_HK
SET Text = '如果你真的想要動手那就盡管來好了。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_DEMAND_REFUSE_HOSTILE_3';

UPDATE Language_zh_Hant_HK
SET Text = '你妄想要求我們進貢？滾開，你這無恥的惡棍！'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_TRIBUTE_NO_ANGRY';


-- Aggressive Military Warning (Hostile)
UPDATE Language_zh_Hant_HK
SET Text = '我看見你的軍團大量聚集在我帝國附近。如果你想打盡管來，別像個孩子一樣藏在陰影裏。'
WHERE Tag = 'TXT_KEY_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_zh_Hant_HK
SET Text = '如果你的人馬跨過我們的邊境，他們將遭遇天朝大軍的雷霆一擊。'
WHERE Tag = 'TXT_KEY_WUZETIAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';

UPDATE Language_zh_Hant_HK
SET Text = '哈！你的軍隊到我的邊境來幹什麽。如果你是想開戰，別以為能打敗我。'
WHERE Tag = 'TXT_KEY_NAPOLEON_HOSTILE_AGGRESSIVE_MILITARY_WARNING_1';


-- Human attacked protected City-State
UPDATE Language_zh_Hant_HK
SET Text = '你對{@1_MinorCivName}的野蠻侵略不可能不被人知道。如果你繼續進攻你將面對嚴重的後果。'
WHERE Tag = 'TXT_KEY_ATTACKED_PROTECTED_CITY_STATE_1';


-- AI attacked protected City-State
UPDATE Language_zh_Hant_HK
SET Text = '我已經註意到了我對和你曾有過關系的城邦發動了進攻。雖然和你的帝國過不去不是我的目的，但是我相信這個行動是必要的。'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_1';

UPDATE Language_zh_Hant_HK
SET Text = '我了解到了我的帝國對你們的一個友好城邦發動了進攻。我保證，這不是我的目的，希望這不會使我們有間隔。'
WHERE Tag = 'TXT_KEY_WE_ATTACKED_YOUR_MINOR_2';


-- Human denounces AI
UPDATE Language_zh_Hant_HK
SET Text = '就這樣？很好。我不會忘記這件事的。'
WHERE Tag = 'TXT_KEY_RESPONSE_TO_BEING_DENOUNCED_1';


-- AI denounces human
UPDATE Language_zh_Hant_HK
SET Text = '是時候向全世界宣布你的罪惡了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_1';

UPDATE Language_zh_Hant_HK
SET Text = '我已經對其他領袖談過你的事了。他們應該了解你是不可信賴的。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_2';

UPDATE Language_zh_Hant_HK
SET Text = '告訴你，其他領袖已經知道你的惡行了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCE_3';

UPDATE Language_zh_Hant_HK
SET Text = '我受夠你了。我聽說其他領袖也都不願同你合作。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_1';

UPDATE Language_zh_Hant_HK
SET Text = '好吧，我受夠了。早該向所有人公布你的惡行了。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DENOUNCING_FRIEND_2';


-- Human Refuses Request to Denounce Third Party (Not Forgiven)
UPDATE Language_zh_Hant_HK
SET Text = '太可悲了。你終於顯露出了本性。整個世界都會知曉你的背信棄義。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_1';

UPDATE Language_zh_Hant_HK
SET Text = '這就是你所理解的盟約？全世界的領袖們都將知曉你的背信棄義。[NEWLINE][NEWLINE]([COLOR_WARNING_TEXT]他們公開譴責我們！註意：這並不意味著開戰。[ENDCOLOR])'
WHERE Tag = 'TXT_KEY_DOF_NOT_HONORED_2';


-- Human declares war on AI
UPDATE Language_zh_Hant_HK
SET Text = '宣戰對於你來說是一個嚴重的錯誤。有句話是這麽說的，我將會立刻讓你對於你的所作所為感到後悔。'
WHERE Tag = 'TXT_KEY_GENERIC_ATTACKED_STRONG_HOSTILE_4';

UPDATE Language_zh_Hant_HK
SET Text = '為什麽？你……你……這個混蛋！我要消滅你！'
WHERE Tag = 'TXT_KEY_LEADER_DARIUS_ATTACKED_1';

UPDATE Language_zh_Hant_HK
SET Text = '不幸的是，我的國民並不全都像我這樣堅持非暴力原則。所以我要先向你說一聲抱歉，因為你的軍隊可能會被殺得片甲不留。'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_ATTACKED_2';

UPDATE Language_zh_Hant_HK
SET Text = '你知道我們將要消滅你。你想吃點奶酪嗎？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_2';

UPDATE Language_zh_Hant_HK
SET Text = '哦嗯。我想你明白你正在做什麽。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_ATTACKED_3';

UPDATE Language_zh_Hant_HK
SET Text = '這是何等的背信棄義啊？難道沒有榮譽感嗎，沒有恥辱心嗎？'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_1';

UPDATE Language_zh_Hant_HK
SET Text = '你這可悲的人。很快你就將感受到我們強大科技實力的雷霆萬鈞之勢了。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_2';

UPDATE Language_zh_Hant_HK
SET Text = '很好，很好！我正想找個借口來試驗我的最新軍事裝備呢，你正好給我提供了機會。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_ATTACKED_3';


-- AI War Bluff
UPDATE Language_zh_Hant_HK
SET Text = '蠢貨，真是蠢貨！'
WHERE Tag = 'TXT_KEY_LEADER_HIAWATHA_WARBLUFF_1';

UPDATE Language_zh_Hant_HK
SET Text = '戰鼓——戰鼓！在我的腦海中敲擊，傳播著復仇的思想。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_1';

UPDATE Language_zh_Hant_HK
SET Text = '下次我不會再這麽客氣了。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WARBLUFF_4';

UPDATE Language_zh_Hant_HK
SET Text = '很好。下次我可不會這麽有禮貌了！'
WHERE Tag = 'TXT_KEY_LEADER_WASHINGTON_WARBLUFF_2';


-- AI declares war on human
UPDATE Language_zh_Hant_HK
SET Text = '我有種感覺，咱倆遲早會在戰場上見面的。我們會知道誰是勝者的。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_2';

UPDATE Language_zh_Hant_HK
SET Text = '戰鬥的時候到了。勝利將屬於我們之間的強者。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_GENERIC_3';

UPDATE Language_zh_Hant_HK
SET Text = '毀滅也許會是我最終的命運，但是如果我選擇退讓，同樣也不可能避免失敗。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_DESPERATE_8';

UPDATE Language_zh_Hant_HK
SET Text = '我想信在前世或來生咱們可能成為朋友。不幸的是，現在就是現在。祝你的軍隊好運。'
WHERE Tag = 'TXT_KEY_GENERIC_DOW_REGRET_1';

UPDATE Language_zh_Hant_HK
SET Text = '就這樣吧。我的軍隊會在你的國土上得到他們想要的。'
WHERE Tag = 'TXT_KEY_WAR_DEMAND_REFUSED_1';

UPDATE Language_zh_Hant_HK
SET Text = '你多次冒犯我和我忠誠的臣民的行為必將受到懲罰——準備打仗吧！'
WHERE Tag = 'TXT_KEY_LEADER_ELIZABETH_DECLAREWAR_1';

UPDATE Language_zh_Hant_HK
SET Text = '我派出了一批印度士兵到你的各大城市去旅遊觀光。我相信他們會受到熱情的歡迎。'
WHERE Tag = 'TXT_KEY_LEADER_GANDHI_DECLAREWAR_2';

UPDATE Language_zh_Hant_HK
SET Text = '我們之間的爭鬥是不可避免的，現在正是開戰的好時候。'
WHERE Tag = 'TXT_KEY_LEADER_GENGHIS_DECLAREWAR_1';

UPDATE Language_zh_Hant_HK
SET Text = '你們太落後太原始了。應該更換統治者了。準備打仗吧！'
WHERE Tag = 'TXT_KEY_LEADER_PACHACUTI_DECLAREWAR_1';

UPDATE Language_zh_Hant_HK
SET Text = '我的集賢殿智囊們已經厭倦了你的表演。我們將以武力解放你的國民，引導他們走向光明。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_1';

UPDATE Language_zh_Hant_HK
SET Text = '時不我待，我的時間越來越緊迫。而你擋了我的道，我沒工夫再進行外交努力了。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_2';

UPDATE Language_zh_Hant_HK
SET Text = '我還有許多實驗要進行，許多研究要完成，而你就象一堵高墻擋在我面前。我必須把你清除掉。'
WHERE Tag = 'TXT_KEY_LEADER_SEJONG_DECLAREWAR_3';


-- Responses to human saying "No"
UPDATE Language_zh_Hant_HK
SET Text = '我跟你們這種人再也沒有瓜葛了。'
WHERE Tag = 'TXT_KEY_GENERIC_HUMAN_RESPONSE_BAD_2';


-- AI Insults
UPDATE Language_zh_Hant_HK
SET Text = '我已經註意到你實在是個可憐蟲。我能給予你的只有無限的同情。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_GENERIC_1';

UPDATE Language_zh_Hant_HK
SET Text = '憑借這麽孱弱的兵力，你的帝國居然抵擋住了蠻族入侵，真是令人驚奇呀。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_MILITARY_2';

UPDATE Language_zh_Hant_HK
SET Text = '你的人民的痛苦哀號遠遠傳到了我的耳朵裏。如果你還不盡快采取行動，他們將會背起行囊移民到真正的文明國度去。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_1';

UPDATE Language_zh_Hant_HK
SET Text = '人民如此不快樂，他們居然還繼續追隨你這個所謂的領袖，實在是令我吃驚。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_UNHAPPINESS_2';

UPDATE Language_zh_Hant_HK
SET Text = '旅行者們已經告訴了我你的帝國那衰頹的經濟。如果你求我，我可能會幫你一把。好吧，實際上，我是不會幫你的。'
WHERE Tag = 'TXT_KEY_GENERIC_INSULT_POPULATION_1';


-- AI wins war
UPDATE Language_zh_Hant_HK
SET Text = '我希望你得到了教訓……我是不可戰勝的！'
WHERE Tag = 'TXT_KEY_LEADER_NAPOLEON_WINWAR_1';

UPDATE Language_zh_Hant_HK
SET Text = '真令人耳目一新，如果惡魔得到滿足，也會給我們一點喘息的機會？'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_WINWAR_1';


-- AI defeated
UPDATE Language_zh_Hant_HK
SET Text = '你做得很好，我會在魔鬼面前為你美言幾句。'
WHERE Tag = 'TXT_KEY_LEADER_NEBUCHADNEZZAR_DEFEATED_1';

UPDATE Language_zh_Hant_HK
SET Text = '這就是為什麽我喜歡使用外交方式多於使用戰爭手段。'
WHERE Tag = 'TXT_KEY_LEADER_PEDRO_DEFEATED_1';

UPDATE Language_zh_Hant_HK
SET Text = '你此刻獲得的區區勝利，阻止不了我的王國永遠銘記它真正的國王！'
WHERE Tag = 'TXT_KEY_LEADER_CASIMIR_DEFEATED_3';


-- Report Coop War Plans to Target AI
UPDATE Language_zh_Hant_HK
SET Text = '無法接受，如此過分的行徑！'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_HOW_DARE_YOU';


-- End Declaration of Friendship
UPDATE Language_zh_Hant_HK
SET Text = '我們的友誼聲明到此結束。'
WHERE Tag = 'TXT_KEY_DIPLO_DISCUSS_MESSAGE_END_WORK_WITH_US';

UPDATE Language_zh_Hant_HK
SET Text = '你的行為無法原諒。我們兩個國家永遠無法和解。[NEWLINE][NEWLINE]（你不再是他們的朋友。如果在接下來的[COLOR_WARNING_TEXT]10[ENDCOLOR]回合內，你譴責該玩家或向其宣戰，你將受到背叛他們的外交懲罰。）'
WHERE Tag = 'TXT_KEY_NOW_UNFORGIVABLE_1';

UPDATE Language_zh_Hant_HK
SET Text = '你的侵略行徑危害世界和平，我們的友誼聲明到此結束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WARMONGER_1';

UPDATE Language_zh_Hant_HK
SET Text = '我無法接受你對我國勢力範圍內的城邦的拉攏，我們的友誼聲明到此結束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_MINORS_1';

UPDATE Language_zh_Hant_HK
SET Text = '我擔心我們的親密關系不符合我國的總體外交利益，因此我不得不選擇結束我們的友誼聲明。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_LAND_1';

UPDATE Language_zh_Hant_HK
SET Text = '你對建造世界奇觀的狂熱已經成為我們的重大分歧，我們的友誼聲明到此結束。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_WONDERS_1';

UPDATE Language_zh_Hant_HK
SET Text = '我清楚地認識到我們所走的是不同的道路，因此我們的友誼聲明也沒有必要繼續了。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_VICTORY_1';

UPDATE Language_zh_Hant_HK
SET Text = '現在的局勢發生了變化，我認為我們的友誼聲明不需要繼續下去了，希望你能理解。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_1';

UPDATE Language_zh_Hant_HK
SET Text = '很抱歉，我們的友誼聲明該結束了。'
WHERE Tag = 'TXT_KEY_END_WORK_WITH_US_DEFAULT_2';


-- Kiev -> Kyiv
UPDATE Language_zh_Hant_HK
SET Text = 'Kyiv'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV';

UPDATE Language_zh_Hant_HK
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CITYSTATE_KIEV_ADJ';

UPDATE Language_zh_Hant_HK
SET Text = 'According to legend, Kyiv was founded by three Slavic brothers - Kyi, Schek, and Khoryv -around the beginning of the 6th Century AD. Since then, Kyiv, one of the oldest cities in Eastern Europe, has passed through times of great prominence and periods of relative obscurity. Throughout the centuries, however, it has remained the most important Slavic cultural center, playing a pivotal role in the development of the medieval East Slavic civilization.[NEWLINE][NEWLINE]Located on the Dnieper trade route between Constantinople and Scandinavia, Kyiv came under the control of local Varangian (Viking) nobility and became the nucleus of the state of Rus. During the 1000s, it reached its ascendancy, a cultural hub with over 400 churches, eight markets, docks and a caravansary, and magnificent homes. With the founding of the Kyiv-Mogilyanskaya Academy in 1632, the city became the center of Ukrainian learning and scholarship. But as the capital of Kyivan Rus, the city was repeatedly sacked and occupied.[NEWLINE][NEWLINE]In 1667 the city became part of the Russian Empire; Kyiv remained an ecclesiastical and cultural center, but its political and economic influence was marginalized. Kyiv experienced growing "Russification" in the 1800s, as a result of Russian migration, educational policies, and industrialization. However, enthusiasts among ethnic Ukrainian nobles, military officers and merchants kept the native culture alive in Kyiv, often through clandestine activities such as book-printing, amateur theater, private soirees, folk festivals and the like.[NEWLINE][NEWLINE]Forcefully incorporated into the Soviet Union, the city weathered all manner of troubles: the famine of 1932-1933 devastated the lower classes, Stalin''s 1937-1938 purges almost obliterated the city''s intelligensia, and the 1941-1943 Nazi invasion brought death and destruction. But Kyiv survived, and in the wake of the collapse of the Soviet Union an independent Ukraine was proclaimed in 1991, with resurgent Kyiv as its capital and cultural heart.'
WHERE Tag = 'TXT_KEY_CIV5_KIEV_TEXT';

UPDATE Language_zh_Hant_HK
SET Text = 'The Eastern Orthodox Church is currently the second-largest Christian denomination, with an estimated 300 million adherents. The goal of Orthodox Christians is to draw nearer to God throughout their lives through theosis, a spiritual pilgrimage to become more "Christ-like."[NEWLINE][NEWLINE]The church traces its roots to the Great Schism. During the 9th and 10th centuries AD the Christian church under the Patriarch of Constantinople made significant conversions among the peoples of eastern Europe, including Kyivan Russia and the Balkans. Doctrinal issues such as the filioque split and the authority of the Pope over the Patriarch in matters religious, exacerbated by the political and economic rivalry of Rome and Constantinople, led to a schism. The final breach between these two branches of Christianity is acknowledged as the sacking of Constantinople by the Catholic crusaders in 1204 AD. Moreover, after the fall of Constantinople to the Ottomans in 1453, the Eastern Church became even more isolated from Rome under the relatively tolerant rule of the Turks. The Orthodox Church, which saw itself as the true heir to the teachings and practices of the early Christians, flourished under the Russian Tsars. Although somewhat diminished by Communist rule and Balkan secularism, Eastern Orthodoxy has experienced a resurgence in recent decades and remains a vital aspect of Christianity.'
WHERE Tag = 'TXT_KEY_RELIGION_ORTHODOXY_PEDIA';

UPDATE Language_zh_Hant_HK
SET Text = 'Kyivan'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_HEADING_4';

UPDATE Language_zh_Hant_HK
SET Text = 'The eighth century saw the first written record of "Kyivan Rus." The Rus are believed to have been Scandinavian Vikings who migrated south from the Baltic coast (although this is disputed by some Russian scholars, who believe that the original founders of Kyivan Rus were Slavs). By 860 the Rus were sending raiding parties as far south as Constantinople, and by 1000 AD Kyivan Rus controlled a trade route from the Baltic to the Black Sea; this would form the economic backbone of the growing regional power.[NEWLINE][NEWLINE]By the 12th century, the Kyiv Empire covered much of what would become eastern Russia, extending from Poland in the west to the Volga in the east, and from Finland in the north to the Ukraine in the south. It was a vast territory to manage from one centralized location, especially as component parts of the Empire began developing individual identities and national aspirations. Economically, the Empire also became divided, with northern provinces aligning themselves with the Baltic powers while the western areas were drawn to Poland and Hungary, and the southern regions to Asia Minor and the Mediterranean. By the closing of the 12th century Rus Kyiv was dissolved in all but name, replaced by a number of smaller quasi-feudal states.'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_4';

UPDATE Language_zh_Hant_HK
SET Text = 'The first Mongol incursion into Kyivan territory occurred in 1223, when a Mongol reconnaissance unit met the combined warriors of several Rus states under the command of the wonderfully-named "Mstislav the Bold" and "Mstislav Romanovich the Old" at the Battle of the Kalka River. The Rus forces enjoyed early success, but they became disorganized in the pursuit of the retreating foe. The Mongol horsemen rallied and defeated the pursuers in detail before they could reorganize. A large portion of the Rus forces surrendered to the Mongols on the condition that they would be spared; the Mongols accepted the conditions then slaughtered them anyway. The Mongols then left Rus for several years before returning in much greater force.[NEWLINE][NEWLINE]In 1237 a vast Mongol army of some 30,000 or more horse archers once again crossed the Volga River. In a few short years the Mongols captured, looted and destroyed dozens of Russian cities and towns, including Ryazan, Kolomna, Moscow, Rostov, Kashin, Dmitrov, Kozelsk, Halych and Kyiv. They soundly thrashed every force raised to oppose them. By 1240 most of Rus was a smoking ruin, firmly under the control of the Mongols, who then turned their sight further west, towards Hungary and Poland.[NEWLINE]'
WHERE Tag = 'TXT_KEY_CIV5_RUSSIA_TEXT_5';