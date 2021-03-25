if (isServer) exitWith {};

parmas [[]"_oldVehicle", objNull, [objNull]], "", "", ["_arg", [],[[]]]];

_arg params ["_chosenVehicleClass", "_deploymentData", "_spawnMarker", "_indexInBluforVehicleList"];

VehicleExchangeRequested = true;
publicVariableServer "VehicleExchangeRequested";

VehicleExchangeData = [_oldVehicle, getDir _oldVehicle, damage _oldVehicle, fuel _oldVehicle, _chosenVehicleClass, _deploymentData, _spawnMarker, _indexInBluforVehicleList];
publicVariableServer "VehicleExchangeData";