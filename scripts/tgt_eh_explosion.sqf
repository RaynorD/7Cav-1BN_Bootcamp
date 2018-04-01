(_this select 0) params ["_target","_damage"];

#define POP_DELAY 5
#define POP_DELAY_MIN 0.5

//if(_damage < 0.04) exitWith {true};
if(_damage < (_target getVariable ["tgtExpDamage", missionNamespace getVariable ["tgtExpDamage",0.04]])) exitWith {true};

systemChat str _this;

_target animate ["terc", 1]; 

if ((_target getVariable ["nopop", !isNil "nopop" && {nopop isEqualTo true}]) isEqualTo true) exitWith {true};

sleep ((parseNumber str (_target getVariable ["popdelay", POP_DELAY])) max POP_DELAY_MIN);

_target animate ["terc", 0];

_target setDamage 0;

true