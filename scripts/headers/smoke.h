/*------------------------------------------------------------------------------------------\
|  
|  Damage effect smoke scripts
|    -Smoth, 8/27/08
|
|  Header Released under Public Domain
|
\------------------------------------------------------------------------------------------*/

#include "\headers\definitions.h"

#ifndef SMOKE_H
#define SMOKE_H

//	get a count of how many pieces we have. I am keeping the old TA naming 
//	conviention for backwards compatibility.
#ifdef SMOKEPIECE4
	#define NUM_SMOKE_PIECES 4
#else
	#ifdef SMOKEPIECE3
		#define NUM_SMOKE_PIECES 3
	#else
		#ifdef SMOKEPIECE2
			#define NUM_SMOKE_PIECES 2
		#else
			#define NUM_SMOKE_PIECES 1
			#ifndef SMOKEPIECE1
				#define SMOKEPIECE1 SMOKEPIECE
			#endif
		#endif
	#endif
#endif

/*------------------------------------------------------------------------------------------\
|  
|  Smoke effect script
|  Created to replace the old smoke puff script, uses the spring emit-fx calls.
|
\------------------------------------------------------------------------------------------*/
smokeunit()
{
	//note: sleep is (40 sleep) = (1 second)

	var MaxEmitSpeed;
	var SleepTimeMtplyr;
	var EmiterID;
	var HealthLevel; 
	var CurEmitSpeed;
	var RandPart;

	MaxEmitSpeed	= 160;	// 4 times per second
	SleepTimeMtplyr	= 40;
	
	// Am I done building?  
	while (get BUILD_PERCENT_LEFT)
	{
		sleep 400;
	}

	//Puff cycle
	while (TRUE)
	{
	HealthLevel = get HEALTH;

		if (HealthLevel < 60)
		{
		EmiterID = SFXTYPE_BLACKSMOKE;

			if (rand( 1, 60 ) < HealthLevel)
			EmiterID = SFXTYPE_WHITESMOKE;		

		emit-sfx EmiterID from SMOKEPIECE1;
		
		#if NUM_SMOKE_PIECES == 1
			emit-sfx EmiterID from SMOKEPIECE1;
		#else
			RandPart = rand( 1, NUM_SMOKE_PIECES );

			if (RandPart == 1)
					emit-sfx EmiterID from SMOKEPIECE1; 
					
			if (RandPart == 2)
					emit-sfx EmiterID from SMOKEPIECE2;
					
			 #if NUM_SMOKE_PIECES >= 3		
			if (RandPart == 3)
					emit-sfx EmiterID from SMOKEPIECE3; 
			
				#if NUM_SMOKE_PIECES >= 4		
				if (RandPart == 4)
						emit-sfx EmiterID from SMOKEPIECE4; 
				#endif
			#endif
		#endif
		}

		CurEmitSpeed = HealthLevel * SleepTimeMtplyr;

		if (CurEmitSpeed < MaxEmitSpeed)
		CurEmitSpeed = MaxEmitSpeed;	

		sleep CurEmitSpeed;
	}

}

/*------------------------------------------------------------------------------------------\
|  
|	ceg effect script
|
|  			~~~~~~~~WARNING ~~~~~~~~~~~
|	THE EFFECTS USED MUST BE DEFINED IN THE UNIT DEFINITION FILE!
|			~~~~~~~~~~~~~~~~~~~~~~~~~~~
|
|  	Ok, here is the way this works, this script takes in two variables:
|
|	HIGHDAMAGECEG
|	LOWDAMAGECEG
|	
|	If the user does not define the ceg for these two it will default to 
|	the old emit-fx code.  This is a scrip for advanced users and I will 
|	not off coding support for it!
|
\------------------------------------------------------------------------------------------*/
#ifdef LOWDAMAGECEG
	#define NUM_CEG 1
#else
	#define NUM_CEG 0
#endif	



cegsmokeunit()
{
		//note: sleep is (40 sleep) = (1 second)

		var MaxEmitSpeed;
		var SleepTimeMtplyr;
		var EmiterID;
		var HealthLevel; 
		var CurEmitSpeed;
		var RandPart;

		MaxEmitSpeed	= 160;	// 4 times per second
		SleepTimeMtplyr	= 40;
		
		#if NUM_CEG >= 1
			EmiterID = LOWDAMAGECEG;
		#else
			EmiterID = SFXTYPE_WHITESMOKE;			
		#endif
		
		// Am I done building?  
		while (get BUILD_PERCENT_LEFT)
		sleep 400;

		//Puff cycle
		while (TRUE)
		{
		HealthLevel = get HEALTH;

			if (HealthLevel < 60)
			{
			emit-sfx EmiterID from SMOKEPIECE1;
			
			#if NUM_SMOKE_PIECES == 1
				emit-sfx EmiterID from SMOKEPIECE1;
			#else
				RandPart = rand( 1, NUM_SMOKE_PIECES );

				if (RandPart == 1)
						emit-sfx EmiterID from SMOKEPIECE1; 
						
				if (RandPart == 2)
						emit-sfx EmiterID from SMOKEPIECE2;
						
				 #if NUM_SMOKE_PIECES >= 3		
				if (RandPart == 3)
						emit-sfx EmiterID from SMOKEPIECE3; 
				
					#if NUM_SMOKE_PIECES >= 4		
					if (RandPart == 4)
							emit-sfx EmiterID from SMOKEPIECE4; 
					#endif
				#endif
			#endif
			}

			CurEmitSpeed = HealthLevel * SleepTimeMtplyr;

			if (CurEmitSpeed < MaxEmitSpeed)
			CurEmitSpeed = MaxEmitSpeed;	

			sleep CurEmitSpeed;
		}
}

#endif // SMOKE_H