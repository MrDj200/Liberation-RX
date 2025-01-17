params ["_vehicle"];
if (isNil "_vehicle") exitWith {};

[_vehicle] remoteExec ["lock_vehicle_remote_call", 2];

private _uid = getPlayerUID player;
_vehicle setVariable ["GRLIB_vehicle_owner", _uid, true];
_vehicle setVariable ["R3F_LOG_disabled", true, true];
_vehicle setVariable ["GRLIB_counter_TTL", nil, true];

{
    if !(_x getVariable ["GRLIB_vehicle_owner", ""] in ["", "public", "server"]) then {
        _x setVariable ["GRLIB_vehicle_owner", _uid, true];
    };
} forEach (_vehicle getVariable ["R3F_LOG_objets_charges", []]) + (_vehicle getVariable ["GRLIB_ammo_truck_load", []]);

hintSilent format [localize "STR_DO_LOCK", [typeOf _vehicle] call F_getLRXName];
