#include "..\includes.hpp"

_unit = _this select 0;

{_unit removeMagazine _x} forEach (magazines _unit);