player allowDamage false;

if(count (player getVariable ['defaultLoadout',[]]) == 0) then {
	waitUntil {alive player};
	player setVariable ["defaultLoadout", getUnitLoadout player];
} else {
	player setUnitLoadout (player getVariable ["defaultLoadout", []]);
};

sleep 1;

_fncInstructorHint = {
	_helpText = [];
	_helpText pushBack "Welcome to<br/><t size='1.5' color='#ffaa00'>7th Cavalry Bootcamp</t>";
	_helpText pushBack "This help box can be viewed again from your scroll wheel menu.";
	
	if((typeOf player) in ["B_recon_F"]) then {
		_helpText pushBack "<t color='#aaff00'>As a Drill Instructor slot, you have access to range controls.</t>";
		_helpText pushBack "The ranges are controlled via scroll wheel menu.";
	};
	
	_helpText pushBack "Teleport is available to everyone on flagpoles.";
	_helpText pushBack "There's an arsenal for DI and cadre in the house to the left of spawn.";
	
	if(count (profileNamespace getVariable ['Cav_bootcamp_loadout',[]]) == 0) then {
		_helpText pushBack "You have not yet set a bootcamp loadout, you can do so at the arsenal in the house."
	} else {
		_helpText pushBack "You have set a profile bootcamp loadout.<br/>You can load it via scroll wheel before leaving the start area camo net.";
	};
	
	hint parseText (_helpText joinString "<br/><br/>");
};


if((typeOf player) in ["B_recon_F","B_recon_medic_F"]) then {
	[] spawn _fncInstructorHint;
	player addAction ["Help", _fncInstructorHint];
	
	//load profile loadout
	_loadout = profileNamespace getVariable ['Cav_bootcamp_loadout',nil];
	if(!isNil "_loadout") then {
		if(typeName _loadout == "ARRAY") then {
			if(count _loadout > 0) then {
				[_loadout] spawn {
					params ["_loadout"];
					_actionId = player addAction ["<t color='#aa0000'>Load saved bootcamp loadout</t>", {player setUnitLoadout (_this select 3)}, _loadout];
					waitUntil {sleep 1; !(player in list trg_start)};
					player removeAction _actionId;
				};
			} else {
				diag_log "7Cav Bootcamp: _loadout was count 0";
			};
		} else {
			diag_log "7Cav Bootcamp: _loadout was not an array";
		};
	} else {
		diag_log "7Cav Bootcamp: _loadout was nil";
	};
};

