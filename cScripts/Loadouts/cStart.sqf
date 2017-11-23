#include "..\..\includes.hpp"

/* 7th Cavalry Standard Loadouts
id = ["all", this] call compile preprocessFileLineNumbers "cScripts\Loadouts\cStart.sqf"; 
If Ranger put this in INIT
id = ["Ranger", this] call compile preprocessFileLineNumbers "cScripts\Loadouts\cStart.sqf"; 
*/

	private ["_type", "_unit","_riflemag","_grenade","_smokegrenade"];

	_type = _this select 0;
	_unit = _this select 1;
	//_unit switchMove "";
	
// ====================================================================================
// Wep Defines	
	
	_riflemag = CLASS_MAGAZINE;
	_grenade = CLASS_GRENADE;
	_uniform = CLASS_UNIFORM;
	_weapon = CLASS_WEAPON;
	
	removeallweapons _unit; 
	removeGoggles _unit;  
	_unit unassignitem "NVGoggles"; 
	_unit removeitem "NVGoggles"; 
	removeVest _unit;				
	
	switch (_type) do
	{		
// ====================================================================================
	case "all": 
	{	
		
	};
// ====================================================================================
	case "CAD":
	{	
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform _uniform;
		for "_i" from 1 to 3 do {_unit addItemToUniform CLASS_BANDAGE};
		for "_i" from 1 to 2 do {_unit addItemToUniform CLASS_MORPHINE};
		if(!(_unit getVariable ["ace_hasearplugsin",false])) then {
			_unit addItemToUniform CLASS_EARPLUGS;
		};
		_unit addVest CLASS_VEST_CADRE;
		for "_i" from 1 to 2 do {_unit addItemToVest _riflemag;};
		_unit addHeadgear CLASS_HEAD_CADRE;

		_unit addWeapon _weapon;
		_unit addWeapon "Rangefinder";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "tf_microdagr";
		_unit linkItem "tf_anprc152";
		
		_pweap = primaryweapon _unit;
		_unit selectweapon _pweap;
	};
	
// ====================================================================================
	case "DI":
	{	
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform CLASS_UNIFORM_DI;
		for "_i" from 1 to 3 do {_unit addItemToUniform CLASS_BANDAGE;};
		for "_i" from 1 to 2 do {_unit addItemToUniform CLASS_MORPHINE;};
		if(!(_unit getVariable ["ace_hasearplugsin",false])) then {
			_unit addItemToUniform CLASS_EARPLUGS;
		};
		_unit addVest CLASS_VEST_DI;
		for "_i" from 1 to 4 do {_unit addItemToVest _riflemag;};
		for "_i" from 1 to 4 do {_unit addItemToVest _grenade;};
		_unit addHeadgear CLASS_HEAD_DI;

		_unit addWeapon _weapon;
		_unit addWeapon "Rangefinder";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "tf_anprc152";
		_unit linkItem "ItemcTab";
		
		_pweap = primaryweapon _unit;
		_unit selectweapon _pweap;

	};
	
// ====================================================================================
	case "TRP":
	{	
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform _uniform;
		if(!(_unit getVariable ["ace_hasearplugsin",false])) then {
			_unit addItemToUniform CLASS_EARPLUGS;
		};
		_unit addVest CLASS_VEST_TROOPER;
		_unit addHeadgear CLASS_HEAD_TROOPER;
		
		_unit addWeapon _weapon;

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "tf_anprc152";

	};
// ====================================================================================
	case "CLR":
	{	
		removeAllWeapons _unit;
		removeGoggles _unit; 
		removeHeadGear _unit;
		removeBackPack _unit;
	};
};


