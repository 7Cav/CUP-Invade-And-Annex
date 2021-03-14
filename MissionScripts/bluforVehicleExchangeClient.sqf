_oldVehicle = _this select 0;
_chosenVehicleClass = (_this select 3) select 0;
_deploymentData = (_this select 3) select 1;
_spawnMarker = (_this select 3) select 2;
_indexInBluforVehicleList = (_this select 3) select 3;

VehicleExchangeRequested = true;
publicVariableServer "VehicleExchangeRequested";

VehicleExchangeData = [_oldVehicle, getDir _oldVehicle, damage _oldVehicle, fuel _oldVehicle, _chosenVehicleClass, _deploymentData, _spawnMarker, _indexInBluforVehicleList];
publicVariableServer "VehicleExchangeData";