resetClock = true;

sleep 0.3;

_posX = 0.85;
_posY = 0.5;
_posW = 0.15;
_posH = 0.35;

_padding = 0.005;

_idc = 8000;

disableSerialization;

ui_controls = [];

_idc = _idc + 1;
_ctrl_background = (findDisplay 46) ctrlCreate ["RscPicture", _idc];
ui_controls pushBack _idc;
_ctrl_background ctrlSetPosition [
	_posX * safezoneW + safezoneX, // X
	_posY * safezoneH + safezoneY, // Y
	_posW * safezoneW, // W
	_posH * safezoneH  // H
];
_ctrl_background ctrlSetText "#(rgb,8,8,3)color(0,0,0,0.85)";
_ctrl_background ctrlCommit 0;

_idc = _idc + 1;
_ctrl_text_title = (findDisplay 46) ctrlCreate ["RscStructuredText", _idc];
ui_controls pushBack _idc;
_ctrl_text_title ctrlSetPosition [
	(_posX + _padding) * safezoneW + safezoneX, // X
	(_posY + _padding) * safezoneH + safezoneY, // Y
	(_posW - (_padding * 2)) * safezoneW, // W
	(_posH - (_padding * 2)) * safezoneH  // H
];
_ctrl_text_title ctrlSetStructuredText parseText "<t size='1.2'>Killhouse</t>";
_ctrl_text_title ctrlCommit 0;	

_idc = _idc + 1;
_ctrl_text_status = (findDisplay 46) ctrlCreate ["RscStructuredText", _idc];
ui_controls pushBack _idc;
_ctrl_text_status ctrlSetPosition [
	(_posX + _padding) * safezoneW + safezoneX, // X
	(_posY + _padding + 0.03) * safezoneH + safezoneY, // Y
	(_posW - (_padding * 2)) * safezoneW, // W
	(_posH - (_padding * 2)) * safezoneH  // H
];
_ctrl_text_status ctrlSetStructuredText parseText "<t size='0.9'>Status: No Data</t>";
_ctrl_text_status ctrlCommit 0;


_listY = 0.065;

_listCtrlLabels = [];
_listCtrlTimes = [];

_iconCurrent = "A3\Modules_F_Beta\data\FiringDrills\timer_ca";

for "_i" from 0 to 7 do {
	
	_idc = _idc + 1;
	//systemChat str (_posY + _padding + _listY + (_i + 0.025));
	_ctrlLabel = (findDisplay 46) ctrlCreate ["RscStructuredText", _idc];
	_ctrlLabel ctrlSetPosition [
		(_posX + _padding) * safezoneW + safezoneX, // X
		(_posY + _padding + _listY + (_i * 0.025)) * safezoneH + safezoneY, // Y
		((_posW / 2) - (_padding * 2)) * safezoneW, // W
		(_posH - (_padding * 2)) * safezoneH  // H
	];
	_ctrlLabel ctrlSetStructuredText parseText format ["<t size='0.8'>Room %1</t>",_i + 1];
	_ctrlLabel ctrlCommit 0;
	_listCtrlLabels pushBack _idc;
	ui_controls pushBack _idc;
	
	_idc = _idc + 1;
	//systemChat str _idc;
	systemChat str (_i * 0.025);
	_ctrlTime = (findDisplay 46) ctrlCreate ["RscStructuredText", _idc];
	_ctrlTime ctrlSetPosition [
		(_posX + _padding + 0.03) * safezoneW + safezoneX, // X
		(_posY + _padding + _listY + (_i * 0.025)) * safezoneH + safezoneY, // Y
		((_posW / 2) - (_padding * 2)) * safezoneW, // W
		(_posH - (_padding * 2)) * safezoneH  // H
	];
	_ctrlTime ctrlSetStructuredText parseText format ["<t size='0.8'>00:00:00</t>",0];
	_ctrlTime ctrlCommit 0;
	_listCtrlTimes pushBack _idc;
	ui_controls pushBack _idc;
};

_idc = _idc + 1;
_ctrlTimeTotalLabel = (findDisplay 46) ctrlCreate ["RscStructuredText", _idc];
_ctrlTimeTotalLabel ctrlSetPosition [
	(_posX + _padding) * safezoneW + safezoneX, // X
	(_posY + _padding + 0.3) * safezoneH + safezoneY, // Y
	(_posW - (_padding * 2)) * safezoneW, // W
	(_posH - (_padding * 2)) * safezoneH  // H
];
_ctrlTimeTotalLabel ctrlSetStructuredText parseText format ["<t size='1.4'>Time: 00:00:00</t>",0];
_ctrlTimeTotalLabel ctrlCommit 0;
ui_controls pushBack _idc;



resetClock = false;

waitUntil {sleep 0.01; resetClock};

{
	ctrlDelete ((findDisplay 46) displayCtrl _x); 
} foreach ui_controls;

/*
if(!isNil "test_timer") then {
	terminate test_timer;
};

test_timer = _thisScript;

_startTime = time;

_colorText = ["IGUI", "TEXT_RGB"] call BIS_fnc_displayColorGet;
_colorTextHTML = _colorText call BIS_fnc_colorRGBtoHTML;

_textAlign = format ["<t align='left' color='%1'>",_colorTextHTML];

systemChat _textAlign;

_iconCurrent = "A3\Modules_F_Beta\data\FiringDrills\timer_ca";
_textIconCurrent = format ["<img image='%1' /> ", _iconCurrent];

systemChat _textIconCurrent;

_textTemplateCurrent = _textAlign + _textIconCurrent;

systemChat _textTemplateCurrent;

runClock = true; 

1 cutRsc ["RscFiringDrillTime", "plain"];

while {runClock} do {
	_timeNow = time - _startTime;
	_timeNowFormat = [_timeNow, "MM:SS.MS", TRUE] call BIS_fnc_secondsToString;
	
	//systemChat str _timeNowFormat;
	
	_text = format ["%1%2:%3<t size='0.8'>.%4</t>", _textTemplateCurrent, _timeNowFormat select 0, _timeNowFormat select 1, _timeNowFormat select 2];

	RscFiringDrillTime_current = parseText _text;
	
	sleep 0.01;
};

_winner = "Expert";

_colorWarning = ["IGUI", "WARNING_RGB"] call BIS_fnc_displayColorGet;
_colorWarningHTML = _colorWarning call BIS_fnc_colorRGBtoHTML;

_text = "<t align='center' size='0.8' color='" + _colorWarningHTML + "'>" + _winner + "</t>";
//hintSilent (parseText _text);
RscFiringDrillTime_best = parseText _text;

BIS_curatorRace_winner = nil;
sleep 5;

RscFiringDrillTime_done = TRUE;

sleep 2;

RscFiringDrillTime_done = nil;
RscFiringDrillTime_best = nil;
RscFiringDrillTime_current = nil;
*/