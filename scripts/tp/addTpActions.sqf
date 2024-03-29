_tpObjects = [
    [tp_main, "Main"],
    [tp_grenade, "Grenade Range"],
    [tp_maneuver, "Maneuver Course"],
    [tp_kh, "Killhouse"],
    [tp_rifle, "Rifle Range"]
];

{
    _activeObject = _x select 0;
    {
        _dest = _x select 0;
        if(_activeObject != _dest) then {
            _destName = _x select 1;
            _activeObject addAction [_destName, "scripts\tp\teleport.sqf", [getPos _dest]];
        };
    } foreach _tpObjects;
} foreach _tpObjects;
