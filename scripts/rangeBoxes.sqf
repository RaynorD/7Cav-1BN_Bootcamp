/*

_s = [this, "rifle"] execVM "scripts\rangeBoxes.sqf";

CargoRamp_Open
ramp_anim

statement = "this animateSource ['ramp_anim', 1];{if(not(_x isKindOf 'Man'))then{detach _x}}foreach attachedObjects this;";
*/


params [["_box", nil],["_type", ""]]; 

if(isNil "_box") exitWith {systemChat "Error rangeBox: Box doesn't exist"};

_box allowDamage false; 
_box enableSimulation false;

clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;

switch (_type) do {
	case "rifle" : {
		_box addAction ["Rifle Range Loadout", {[_this select 1] execVM "loadouts\rifle_range.sqf"},nil,1.5,true,true,"","true",3]; 
	};
	case "grenade" : {
		_box addAction ["Grenade Range Loadout", {[_this select 1] execVM "loadouts\grenade_range.sqf"},nil,1.5,true,true,"","true",3];
	};
	case "killhouse" : {
		_box addAction ["Killhouse Loadout", {[_this select 1] execVM "loadouts\killhouse.sqf"},nil,1.5,true,true,"","true",3];
	};
	case "maneuver" : {
		_box addAction ["Maneuver Course Loadout", {[_this select 1] execVM "loadouts\maneuver_course.sqf"},nil,1.5,true,true,"","true",3];
	};
	case "" : {
	
	};
};

waitUntil {alive player};

/*
if((typeOf player) in ["B_recon_F", "B_recon_medic_F", "B_soldier_M_F"]) then {
	_box addAction ["<t color='#ffff11'>Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal}];
};
*/

