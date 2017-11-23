#include "..\includes.hpp"

params ["_unit"];

_riflemag = CLASS_MAGAZINE;
_grenade = CLASS_GRENADE;
_uniform = CLASS_UNIFORM;
_weapon = CLASS_WEAPON;

_unit unassignitem "NVGoggles"; 
_unit removeitem "NVGoggles"; 

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform _uniform;

//if(!(_unit getVariable ["ace_hasearplugsin",false])) then {
//	_unit addItemToUniform CLASS_EARPLUGS;
//};

_unit addVest CLASS_VEST_TROOPER;
_unit addHeadgear CLASS_HEAD_TROOPER;

//_unit addWeapon _weapon;

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
//_unit linkItem "tf_anprc152";