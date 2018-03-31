#include "..\includes.hpp"

_unit = _this select 0;
_unit switchMove "";

removeAllWeapons _unit;
{_unit removeMagazine _x} forEach (magazines _unit);

_unit addWeapon CLASS_WEAPON;
for "_i" from 1 to 2 do {_unit addMagazine [CLASS_MAGAZINE, 20];};