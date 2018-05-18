/*
	Expected range objects and required name formats (for range tag "r1"):
	
	Per Range:
		r1_ctrl				// control object - the interaction for the range, and the "brain" used to store variables
		r1_trg				// UI area trigger - players inside this trigger see the range UI
		
		aw_trg				// tag "aw"

	Per lane:
		r1_shootingPos_l1	// shooting positions - used to check who is shooter
		r1_shootingPos_l2	// lane 2
		etc.
		
		aw_shootingPos_l1
	
	Targets:
		r1_target_l1_t1		// targets
		r1_target_l1_t2		
		r1_target_l2_t1		// lane 2
		r1_target_l2_t2
		etc.
		
		aw_target_l5_t3		// "aw" range, lane 5, target 3
*/

// rifle range "rr" - TargetP_Inf_Acc2_F

// grenade range "gr" - TargetP_Inf_F 


// grenade launcher range setup
{
	_x addEventHandler ["Explosion", {_this spawn cav_ranges_fnc_eh_explosion}];
	_x addEventHandler ["HandleDamage", {0}];
	_x setVariable ["cav_ranges_expDmgThreshold",0.001];
} foreach allMissionObjects "TargetP_Inf3_F";

// grenade range
{
	_x addEventHandler ["Explosion", {_this spawn cav_ranges_fnc_eh_explosion}];
	_x addEventHandler ["HandleDamage", {0}];
	_x setVariable ["cav_ranges_expDmgThreshold",0.04];
} foreach allMissionObjects "TargetP_Inf2_F";

[
	"targets", 		//range type
					//	"targets" : pop up targets, terc animation is used
					//	"spawn"   : spawned units, targets being alive/dead is used
	"Pistol Range",	// title text
	"r1",			// range tag
	1,				// lane count
	10,				// targets per lane
	[				
		// Range sequence
			// First element defines the type of event:
			//		ARRAY: target(s)/group(s) to raise. Multiple elements for multiple targets/groups
			//		STRING: Message to show on the lane UI. Third element is not used in this case
			// Second element: seconds length/delay for that event
			// Third element (optional): delay between end of this event and start of the next, default 2 if not present
		["Load a magazine.",5], //show message for 5 seconds
		["Range is hot!",3],
		[[1],5], // raise first target for 5 seconds
		[[3],5],
		[[7],2],
		[[4],2],
		[[9],5],
		["Reload.",5],
		["Range is hot!",3],
		[[2,7],8], // raise targets 2 and 7 for 5 seconds
		[[1,10],8],
		[[7,4],5],
		[[6,2],5],
		[[7,10],5],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,	// target grouping, nil to disable grouping, otherwise group as define nested arrays: [[0,1],[2,3]] etc
				//   a particular target can be in multiple groups
	[13,11,9]	// qualification tiers, [expert, sharpshooter, marksman], nil to disable qualifications altogether
				//   values below the last element will show no go
				//   Not all three are required, [35] would simply return expert above 35, and no go below that
] spawn cav_ranges_fnc_createRange;


[
	"targets",
	"Rifle Range",
	"r2",
	1,
	11,
	[
		["Load your magazine",5],
		["Assume a prone position and standby",3],
		["Range is hot!",1],
		[[1],5],
		[[2],5],
		[[6],5],
		[[3],5],
		[[8],5],
		[[4],5],
		[[7],5],
		[[2],5],
		[[1],5],
		[[5],5],
		[[2,4],8],
		[[1,5],8],
		[[7,3],8],
		[[3,6],8],
		[[2,5],8],
		["Reload your weapon",5],
		["Assume a prone position and standby",3],
		["Range is hot!",1],
		[[5],5],
		[[2],5],
		[[7],5],
		[[11],5],
		[[8],5],
		[[3],5],
		[[10],5],
		[[6],5],
		[[3],5],
		[[2],5],
		["Assume a kneeling position and standby",3],
		["Range is hot!",1],
		[[1],5],
		[[3],5],
		[[4],5],
		[[2],5],
		[[3],5],
		[[2],5],
		[[4],5],
		[[1],5],
		[[3],5],
		[[2],5],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,
	[38,30,23]
] spawn cav_ranges_fnc_createRange;

[
	"targets",
	"AR Range",
	"r3",
	1,
	10,
	[
		["Load your magazine",5],
		["Range is hot!",5],
		[[1],5],
		[[2],5],
		[[3],5],
		[[4],5],
		[[5],5],
		["Reload",5],
		["Range is hot!",3],
		[[2,3],8],
		[[4,5],8],
		[[7,8],8],
		[[10,3],8],
		[[7,9],8],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,
	[10,8,6]
] spawn cav_ranges_fnc_createRange;

[
	"targets",
	"Grenade Range",
	"r4",
	1,
	4,
	[
		["Ready your grenades",5],
		["Range is hot!",5],
		[[1],30],
		[[2],30],
		[[3],30],
		[[4],30],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,
	[4,3,2]
] spawn cav_ranges_fnc_createRange;


[
	"targets",
	"Grenade Launcher Range",
	"r5",
	1,
	9,
	[
		["Ready your grenades",5],
		["Range is hot!",5],
		[[1,2],15],
		[[3],15],
		[[4,5],15],
		[[6,7,8,9],15],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,
	[8,6,4]
] spawn cav_ranges_fnc_createRange;

[
	"spawn",
	"AT Range",
	"r6",
	1,
	4,
	nil,
	nil,
	[3,2,1]
] spawn cav_ranges_fnc_createRange;

_marksmanDelay = 20;
[
	"targets",
	"Marksman Range",
	"r7",
	1,
	11,
	[
		["Load your magazine",5],
		["Range is hot!",5],
		[[1],_marksmanDelay],
		[[2],_marksmanDelay],
		[[3],_marksmanDelay],
		[[4],_marksmanDelay],
		[[5],_marksmanDelay],
		[[6],_marksmanDelay],
		[[7],_marksmanDelay],
		[[8],_marksmanDelay],
		[[9],_marksmanDelay],
		[[10],_marksmanDelay],
		[[11],_marksmanDelay],
		["Safe your weapon.",3],
		["Range complete.",0]
	],
	nil,
	[12,10,8]
] spawn cav_ranges_fnc_createRange;
