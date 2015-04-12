/*------------------------------------------------------------------------------------------\
|  
|  Custom definition file created for spring usage. 
|  Created to supplant the exptype.h used in ta scripting.
|    -Smoth, 8/26/08
|
|  Header Released under Public Domain
|
\------------------------------------------------------------------------------------------*/

#ifndef DEFINITIONS_H
#define DEFINITIONS_H

/*------------------------------------------------------------------------------------------\
|  
|  Special Effect Particles referenced in the scripting language
|  origonaly stored within "emit-sfx.h".  These are not guaranteed to work.
|
\------------------------------------------------------------------------------------------*/
// Vector-based special effects
#define SFXTYPE_VTOL					0
#define SFXTYPE_THRUST					1
#define	SFXTYPE_WAKE1					2
#define	SFXTYPE_WAKE2					3
#define	SFXTYPE_REVERSEWAKE1			4
#define	SFXTYPE_REVERSEWAKE2			5
// Point-based (piece origin) special effects
#define SFXTYPE_POINTBASED				256
#define SFXTYPE_WHITESMOKE				(SFXTYPE_POINTBASED | 1)
#define SFXTYPE_BLACKSMOKE				(SFXTYPE_POINTBASED | 2)
#define SFXTYPE_SUBBUBBLES	
// New in TA:K
#define SFXTYPE_SMALLDAMAGEFLAME		(SFXTYPE_POINTBASED | 4)
#define SFXTYPE_MEDIUMDAMAGEFLAME		(SFXTYPE_POINTBASED | 5)
#define SFXTYPE_LARGEDAMAGEFLAME		(SFXTYPE_POINTBASED | 6)
// Sound priorities in TA:K
#define PLAYSOUND_PRIORITY_BATTLE		4
// SFX Occupy States
#define SFXOCCUPY_AIR					5

/*------------------------------------------------------------------------------------------\
|  
|  explosion effects.
|  Created to supplant the exptype.h used in ta scripting.
|
\------------------------------------------------------------------------------------------*/
#define SHATTER			1		// The geomitry will shatter at all edges
#define EXPLODE_ON_HIT	2		// The named object will emit a generic explosion
#define FALL			4		// The named object fall to the ground
#define SMOKE			8		// The named object will be thrown with a smoke effect attached
#define FIRE			16		// The named object will be on fire as it falls to the ground
#define BITMAPONLY		32 		// Explodes a piece with a short wiffle
/*------------------------------------------------------------------------------------------\
|  
|  Constants
|  Created to supplant the exptype.h used in ta scripting.
|
|  21-34 were used for TA:K specific scripting and as such most are not supported.
|
\------------------------------------------------------------------------------------------*/
#define ACTIVATION			1	// set or get
#define STANDINGMOVEORDERS	2	// set or get
#define STANDINGFIREORDERS	3	// set or get
#define HEALTH				4	// get (0-100%)
#define INBUILDSTANCE		5	// set or get
#define BUSY				6	// set or get (used by misc. special case missions like transport ships)
#define PIECE_XZ			7	// get
#define PIECE_Y				8	// get
#define UNIT_XZ				9	// get
#define	UNIT_Y				10	// get
#define UNIT_HEIGHT			11	// get
#define XZ_ATAN				12	// get atan of packed x,z coords
#define XZ_HYPOT			13	// get hypot of packed x,z coords
#define ATAN				14	// get ordinary two-parameter atan
#define HYPOT				15	// get ordinary two-parameter hypot
#define GROUND_HEIGHT		16	// get
#define BUILD_PERCENT_LEFT	17	// get 0 = unit is built and ready, 1-100 = How much is left to build
#define YARD_OPEN			18	// set or get (change which plots we occupy when building opens and closes)
#define BUGGER_OFF			19	// set or get (ask other units to clear the area)
#define ARMORED				20	// set or get
/*
#define WEAPON_AIM_ABORTED  21
#define WEAPON_READY        22
#define WEAPON_LAUNCH_NOW   23
#define FINISHED_DYING      26
#define ORIENTATION         27
*/
#define IN_WATER            28
#define CURRENT_SPEED       29
/*
#define MAGIC_DEATH         31
*/
#define VETERAN_LEVEL       32
#define ON_ROAD             34

//
// Spring specific constants
//

#define MAX_ID						70	// get returns maximum number of units - 1
#define MY_ID						71	// get returns ID of current unit
#define UNIT_TEAM					72	// get returns team of unit given with parameter
#define UNIT_BUILD_PERCENT_LEFT		73	// get basically BUILD_PERCENT_LEFT, but comes with a unit parameter
#define UNIT_ALLIED					74  // get is unit given with parameter allied to the unit of the current COB script. 1=allied, 0=not allied
#define MAX_SPEED 					75  // set or get
#define CLOAKED						76
#define WANT_CLOAK					77
#define GROUND_WATER_HEIGHT			78  // get land height, negative if below water
#define UPRIGHT						79	// set or get
#define POW							80	// get with 2 arguments x and y: it returns x^y.
#define PRINT						81	// get which prints it's 4 arguments to infolog.
#define HEADING						82	// get
#define TARGET_ID					83	// get
#define LAST_ATTACKER_ID			84	// set or get
#define LOS_RADIUS					85	// set or get
#define AIR_LOS_RADIUS				86	// set or get
#define RADAR_RADIUS				87	// set or get
#define JAMMER_RADIUS				88	// set or get
#define SONAR_RADIUS				89	// set or get
#define SONAR_JAM_RADIUS			90	// set or get
#define SEISMIC_RADIUS				91	// set or get
#define DO_SEISMIC_PING				92	// get
#define CURRENT_FUEL				93	// set or get
#define TRANSPORT_ID				94	// set or get
#define SHIELD_POWER				95	// set or get
#define STEALTH						96	// set or get
#define CRASHING					97  // set or get whether an aircraft is crashing. Is ignored for non-CAirMoveType units.

//CEG_DAMAGE: defines the damage value for all CEGs triggered by emit-sfx 1024 + x to allow for some variability in the
//emitted effects (to e.g. make a charging energy ball grow larger or have smoke get progressively darker as the unit's HP decreases
#define CEG_DAMAGE					99  // set
#define COB_ID						100 // get
#define PLAY_SOUND					101 // get, so multiple args can be passed
#define KILL_UNIT					102 // get KILL_UNIT(unitId, SelfDestruct=true, Reclaimed=false)
#define ALPHA_THRESHOLD				103 // set or get
#define SET_WEAPON_UNIT_TARGET		106 // get (fake set)
#define SET_WEAPON_GROUND_TARGET	107 // get (fake set)
#define SONAR_STEALTH				108 // set or get

#define LUA0						110	// set or get
#define LUA1						111	// set or get
#define LUA2						112	// set or get
#define LUA3						113	// set or get
#define LUA4						114	// set or get
#define LUA5						115	// set or get
#define LUA6						116	// set or get
#define LUA7						117	// set or get
#define LUA8						118	// set or get
#define LUA9						119	// set or get
#define FLANK_B_MODE				120 // set or get
#define FLANK_B_DIR					121 // set or get, set is through get for multiple args
#define FLANK_B_MOBILITY_ADD		122 // set or get
#define FLANK_B_MAX_DAMAGE			123 // set or get
#define FLANK_B_MIN_DAMAGE			124 // set or get
#define WEAPON_RELOADSTATE			125	// get (with fake set) (frame number of the next shot/burst)
#define WEAPON_RELOADTIME			126	// get (with fake set) (in frames)
#define WEAPON_ACCURACY				127 // get (with fake set)
#define WEAPON_SPRAY				128 // get (with fake set)
#define WEAPON_RANGE				129 // get (with fake set)
#define WEAPON_PROJECTILE_SPEED		130 // get (with fake set)
#define MIN							131 // get
#define MAX							132 // get
#define ABS							133 // get
#define GAME_FRAME					134 // get


#endif // DEFINITIONS_H