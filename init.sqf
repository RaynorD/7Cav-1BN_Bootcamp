/*
USAGE POLICY:
This mission and all its included scripts and assets are prohibited from being used or distributed, in whole or in part, outside of the 7th Cavalry without explicit written permission from the author (7th Cavalry member Raynor.D, or if he is no longer a member of the 7th Cavalry, the 7th Cavalry 1st Battalion Battlestaff lead, who can be found on www.7Cav.us). The function noted in init.sqf as being written by Killzone Kid does not fall under this usage policy, but under Killzone Kid's usage policy (if one exists).

    Broken stuff
        Simple/Non locality issues
            -
            
        Locality issues
            -
            
    To investigate
        grad sequence action, missing after respawn?
        not able to see hit marks w/ JIP
        Hit UI for recruits?
        cleanup script after grad sequence
        Possibly not possible: grenade range damage EH to check grenade is within 5m of target
        
    DONE:

    Low priority
        Target number icons in camera
        Rangemaster for hit indicators says Game Logic, good in sp - no fix?
        5 grenade targets

Changelog:
7.8
    Removed sign loadouts and cScripts, went to eden loadouts and contextual adjustments for each range
    Grenade ranges
    Manuever course
7.7.1
    Changed recruit vest so they can carry more stuff
    Added ACE Arsenal (includes default loadouts)
7.7
    ACRE Compatibility
7.6:
    Added two additional rifle range lanes
    Added range cameras with shot tracing
    Added killhouse gun and room camera boards for spectators
    Rebuilt grenade range with 3 lanes and larger area to allow for overthrow
    Built loadout area for recruits to kit up, removed earplugs/radio from default loadout
    Reconfigured slots (8 DI, 6 Cadre, 12 Recruit)
    Added custom target popup control event handler, so ranges don't interfere with each other's targets staying up/down
    First DI slot named lead, has zeus access
    Client view distance is dropped to minimum when inside the killhouse to give maximum framerate
    Hit indicator objects do not go down when shot
    Hit indicators now use clientside 3d icons instead of sphere objects (huge performance boost when lots of hits recorded)
    Changed lane walls to improve visibility of targets and reduce chance of ricochet between lanes
    Hit text when hit indicators are active now shows weapon, ammo type, and attachments if present
    Various modifications/cleanup of base objects
    Reduced assets on base to boost performance for lower end systems
    Fixed physical training AI units moving into the rifle ranges over time
    Moved radio triggers in to pure code, was having issues with them unhiding for recruits
    Fixed infostand loadouts assigning wrong loadout
    Grenade range loadout now has 6 grenades
    Loads of small bug fixes and RTC-requested tweaks
7.5:
    Update for cavpack aircraft asset change (updated by Moraru during Raynor's ELOA)
7.4:
    Renamed student slots to recruits
    Tons of code cleanup under the hood
7.3:
    Fixed grad sequence (for real this time)
    Converted modules to ACE
    Added physical training squad by barracks (No AI, animations only)
7.2:
    Added incorrect stance warning
    Removed ambient animals
    Fixed C130J Error
*/

//enableSaving [false, false];

[] execVM "range_init.sqf";
[] execVM "scripts\range\init.sqf";
[] execVM "scripts\acreSetup.sqf";
[] execVM "scripts\tp\addTpActions.sqf";

player setVariable ["rr_bulletCamSubscription", -1];

Cav_setAllowDamage = {
    player allowDamage (_this select 0);
};

// Begin functions by Killzone Kid
MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

KK_fnc_trueZoom = {
    ([0.5,0.5] distance2D worldToScreen positionCameraToWorld [0,3,4]) * (getResolution select 5) / 2
};
// End Functions by Killzone Kid

//if((typeOf player) in ["B_Soldier_F", "B_recon_medic_F"]) then {
//    {
//        _x setRadioMsg "NULL";
//    } foreach [0,1,2,3,4,5,6,7,8,9];
//};

if((typeOf player) in ["B_Soldier_F"]) then {
    ([0,0,0] nearestObject 1633716) setVariable ['bis_disabled_Door_1',1,false];
};
if((typeOf player) in ["B_recon_F"]) then {
    grad_cam_laptop addAction ["Take Picture", {[true] remoteExec ["Cav_setAllowDamage"];signGrad setObjectTextureGlobal [0, "image\face.paa"];sleep 1;_thing1 = "Sh_155mm_AMOS" createVehicle [((getMarkerPos "mkrGrad") select 0), ((getMarkerPos "mkrGrad") select 1), 30];_thing1 setVelocity [0,0,-1000];sleep 0.5;_thing2 = "Sh_155mm_AMOS" createVehicle [((getMarkerPos "mkrGrad") select 0), ((getMarkerPos "mkrGrad") select 1), 30];_thing2 setVelocity [0,0,-1000];sleep 0.5;_thing3 = "Sh_155mm_AMOS" createVehicle [((getMarkerPos "mkrGrad") select 0), ((getMarkerPos "mkrGrad") select 1), 30];_thing3 setVelocity [0,0,-1000];sleep 1;signGrad setObjectTextureGlobal [0, "image\bootCampgrounds.paa"];[false] remoteExec ["Cav_setAllowDamage"];}];
};

if(typeOf player in ["B_recon_F","B_recon_medic_F"]) then {
    di_box addAction [
    "Save bootcamp loadout to profile",
    {
        _loadout = getUnitLoadout player;
        systemChat format ["Saved bootcamp loadout: %1", _loadout];
        profileNamespace setVariable ["Cav_bootcamp_loadout", _loadout];
        saveProfileNamespace;
    }];
    di_box addAction [
    "Load profile bootcamp loadout",
    {
        if(count (profileNamespace getVariable ["Cav_bootcamp_loadout", []]) == 0) then {
            hint "You have not set a bootcamp loadout.";
        } else {
            player setUnitLoadout (profileNamespace getVariable ["Cav_bootcamp_loadout", nil]);
        }
    }];
};

enableEnvironment false;
rr_targetCenterOffset = [-0.001,0.21,.3684];
rr_targetCenterOffsetFront = [-0.001,0.15,.3684];

if(isServer) then {
    [player, [
        "<t color='#00ff00'>    Killhouse - Start</t>",
        {[["killhouse"],"scripts\range\rangeMaster.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        247,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && killhouse == 0"
    ]] remoteExec ["addAction", 0, true];
    [player, [
        "<t color='#ff0000'>    Killhouse - Stop</t>",
        {[["killhouse"],"scripts\range\rangeMaster.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        247,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && killhouse == 1"
    ]] remoteExec ["addAction", 0, true];
    [player, [
        "<t color='#00ff00'>        Hit Indicators On</t>",
        {[[kh_rangeData],"scripts\range\hitIndicators.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        246,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && (rangemaster getVariable ['killhouseHitIndicators',0] == 0)"
    ]] remoteExec ["addAction", 0, true];
    [player, [
        "<t color='#ff0000'>        Hit Indicators Off</t>",
        {[[kh_rangeData],"scripts\range\hitIndicators.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        246,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && (rangemaster getVariable ['killhouseHitIndicators',0] == 1)"
    ]] remoteExec ["addAction", 0, true];
    
    [player, [
        "<t color='#00ff00'>    Bounding P.R. On</t>",{[[],"scripts\pr.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        245,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && !range_PR"
    ]] remoteExec ["addAction", 0, true];
    [player, [
        "<t color='#ff0000'>    Bounding P.R. Off</t>",
        {[[],"scripts\pr.sqf"] remoteExec ["BIS_fnc_execVM"]},
        nil,
        245,
        false,
        true,
        "",
        "(typeOf player == 'B_recon_F') && (player getVariable ['Cav_showRangeActions',false]) && range_PR"
    ]] remoteExec ["addAction", 0, true];
    
    //([0,0,0] nearestObject 1633716) allowDamage false;
    //([0,0,0] nearestObject 1633717) allowDamage false;
    
    //{
    //    if(!(typeOf _x in ["TargetP_Inf3_Acc2_NoPop_F"])) then {
    //        _x allowDamage false;
    //    };
    //} foreach allMissionObjects "All";
    
    {
    	_x addEventHandler ["Explosion", {_this spawn cav_ranges_fnc_eh_explosion}];
    	_x addEventHandler ["HandleDamage", {0}];
    	_x setVariable ["cav_ranges_expDmgThreshold",0.01];
    } foreach allMissionObjects "TargetP_Inf_F";
    
    {
        if(!(isPlayer _x) && (typeOf _x in ["B_Soldier_F", "B_recon_medic_F", "B_recon_F", "B_soldier_M_F"])) then {
            deleteVehicle _x;
            /*
            _x disableAI "MOVE";
            _x disableAI "ANIM";
            _x disableAI "TARGET";
            */
        } else {
            _x allowDamage false;
        };
    } foreach allUnits;
    
    //{
    //    _x setObjectTextureGlobal    [0, "image\range_target.paa"];
    //    if(typeOf _x in ["TargetP_Inf3_Acc2_NoPop_F"]) then {
    //        _x addEventHandler ["Explosion", {[_this] execVM "scripts\tgt_eh_explosion.sqf"}];
    //    };
    //} foreach allMissionObjects "TargetP_Inf_F";
    
    [] execVM "scripts\makeWalls.sqf";
    [] execVM "scripts\baseai.sqf";
};
