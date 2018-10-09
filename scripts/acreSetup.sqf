
//["ACRE_PRC152", "default", "cav_bootcamp_preset"] call acre_api_fnc_copyPreset;

for "_i" from 1 to 99 do {
    ["ACRE_PRC152", "default", _i, "description", format ["BOOTCAMP %1",_i]] call acre_api_fnc_setPresetChannelField;
    ["ACRE_PRC148", "default", _i, "label", format ["BOOTCAMP %1",_i]] call acre_api_fnc_setPresetChannelField;
    ["ACRE_PRC117F", "default", _i, "name", format ["BOOTCAMP %1",_i]] call acre_api_fnc_setPresetChannelField;
};
//["ACRE_PRC152", "default"] call acre_api_fnc_setPreset;
