player allowDamage false;

if(count (player getVariable ['defaultLoadout',[]]) == 0) then {
	waitUntil {alive player};
	player setVariable ["defaultLoadout", getUnitLoadout player];
} else {
	player setUnitLoadout (player getVariable ["defaultLoadout", []]);
};

sleep 1;

if((typeOf player) in ["B_recon_F"]) then {
	_helpText = "Welcome to<br/><t size='1.5' color='#ffaa00'>7th Cavalry Bootcamp</t><br/><br/>This help box can be viewed again from your scroll wheel menu.<br/><br/><t color='#aaff00'>As a Drill Instructor slot, you have access to range controls.</t><br/><br/>The ranges are controlled via scroll wheel menu.<br/><br/>Teleport is available to everyone on flagpoles.<br/><br/>There's an arsenal in the house to the left of spawn, or default loadouts available on signposts.";
	_showHelpText = compile format ["hint parseText ""%1""", _helpText];
	
	player addAction ["Help", _showHelpText];
	
	[] spawn _showHelpText;
};

