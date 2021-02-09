ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Blips = {}
local estado = nil
local propietario = 0
local nombrepropietario = nil
local soyelpropietario = 0
local enventa = 0				 
local puertaesta = 0
local mgarage = 1
local marmas = 0
local mdinero = 0
local mitems = 0
local mventa = 0
local garagemx = 0
local garagemy = 0
local garagemz = 0
local propriedadeblip = nil
local ownedhouse = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent("pk_casas:spawntodos")
	criarblips()
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() == resourceName) then
	criarblips()
  end
end)

---------------------------------------- CASAS ---------------------------------------------------
local TeleportFromTo = {
	----------------------------------------------- Barrio cheto --------------------------------------------
	["West Mirror Street"] = {
		positionFrom = { ['x'] = 1114.26, ['y'] = -391.25, ['z'] = 68.95, nom = "West Mirror Street", precio = 800000},
		positionTo = { ['x'] = 1106.48, ['y'] = -392.56, ['z'] = -5.06 , nom = "West Mirror Street", precio = 800000},
		GuardarVehiculo = { ['x'] = 1106.01, ['y'] = -399.15, ['z'] = 67.98 , nom = "West Mirror Street"},
		SpawnVehicle = { ['x'] = 1106.01, ['y'] = -399.15, ['z'] = 67.98 , nom = "West Mirror Street"},
		menu = { ['x'] = 1121.44, ['y'] = -391.49, ['z'] = -5.06 , nom = "West Mirror Street", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1113.11, ['y'] = -393.41, ['z'] = -5.06 , nom = "West Mirror Street"},
	},
	["Bridge Street 1"] = {
		positionFrom = { ['x'] = 1099.42, ['y'] = -438.67, ['z'] = 67.79, nom = "Bridge Street 1", precio = 900000},
		positionTo = { ['x'] = 1098.31, ['y'] = -441.73, ['z'] = -5.06 , nom = "Bridge Street 1", precio = 900000},
		GuardarVehiculo = { ['x'] = 1099.83, ['y'] = -429.47, ['z'] = 67.39 , nom = "Bridge Street 1"},
		SpawnVehicle = { ['x'] = 1099.83, ['y'] = -429.47, ['z'] = 67.39 , nom = "Bridge Street 1"},
		menu = { ['x'] = 1113.35, ['y'] = -440.44, ['z'] = -5.06 , nom = "Bridge Street 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1105.14, ['y'] = -442.36, ['z'] = -5.02 , nom = "Bridge Street 1"},
	},
	["Bridge Street 2"] = {
		positionFrom = { ['x'] = 1056.18, ['y'] = -448.99, ['z'] = 66.26, nom = "Bridge Street 2", precio = 1000000},
		positionTo = { ['x'] = 1045.53, ['y'] = -450.71, ['z'] = -5.06 , nom = "Bridge Street 2", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1060.7, ['y'] = -445.44, ['z'] = 65.93 , nom = "Bridge Street 2"},
		SpawnVehicle = { ['x'] = 1060.7, ['y'] = -445.44, ['z'] = 65.93 , nom = "Bridge Street 2"},
		menu = { ['x'] = 1060.38, ['y'] = -449.51, ['z'] = -5.06 , nom = "Bridge Street 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1052.14, ['y'] = -451.49, ['z'] = -5.02 , nom = "Bridge Street 2"},
	},
	["Bridge Street 3"] = {
		positionFrom = { ['x'] = 1046.28, ['y'] = -497.91, ['z'] = 64.08, nom = "Bridge Street 3", precio = 960000},
		positionTo = { ['x'] = 1032.49, ['y'] = -498.7, ['z'] = -4.06 , nom = "Bridge Street 3", precio = 960000},
		GuardarVehiculo = { ['x'] = 1047.64, ['y'] = -487.37, ['z'] = 63.92 , nom = "Bridge Street 3"},
		SpawnVehicle = { ['x'] = 1047.64, ['y'] = -487.37, ['z'] = 63.92 , nom = "Bridge Street 3"},
		menu = { ['x'] = 1047.4, ['y'] = -497.42, ['z'] = -4.06 , nom = "Bridge Street 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1039.14, ['y'] = -499.38, ['z'] = -4.02 , nom = "Bridge Street 3"},
	},
	["West Mirror Drive 1"] = {
		positionFrom = { ['x'] = 1014.61, ['y'] = -469.21, ['z'] = 64.5, nom = "West Mirror Drive 1", precio = 900000},
		positionTo = { ['x'] = 1010.5, ['y'] = -470.85, ['z'] = -5.06 , nom = "West Mirror Drive 1", precio = 900000},
		GuardarVehiculo = { ['x'] = 1020.16, ['y'] = -461.43, ['z'] = 63.9 , nom = "West Mirror Drive 1"},
		SpawnVehicle = { ['x'] = 1020.16, ['y'] = -461.43, ['z'] = 63.9 , nom = "West Mirror Drive 1"},
		menu = { ['x'] = 1025.4, ['y'] = -469.5, ['z'] = -5.06 , nom = "West Mirror Drive 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1017.12, ['y'] = -471.36, ['z'] = -5.02 , nom = "West Mirror Drive 1"},
	},
	["West Mirror Drive 2"] = {
		positionFrom = { ['x'] = 970.32, ['y'] = -502.26, ['z'] = 62.14, nom = "West Mirror Drive 2", precio = 960000},
		positionTo = { ['x'] = 965.58, ['y'] = -507.47, ['z'] = -5.06 , nom = "West Mirror Drive 2", precio = 960000},
		GuardarVehiculo = { ['x'] = 961.54, ['y'] = -503.3, ['z'] = 61.6 , nom = "West Mirror Drive 2"},
		SpawnVehicle = { ['x'] = 961.54, ['y'] = -503.3, ['z'] = 61.6 , nom = "West Mirror Drive 2"},
		menu = { ['x'] = 980.38, ['y'] = -506.58, ['z'] = -5.06 , nom = "West Mirror Drive 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 972.2, ['y'] = -508.23, ['z'] = -5.02 , nom = "West Mirror Drive 2"},
	},
	["West Mirror Drive 3"] = {
		positionFrom = { ['x'] = 924.31, ['y'] = -525.93, ['z'] = 59.79, nom = "West Mirror Drive 3", precio = 850000},
		positionTo = { ['x'] = 917.53, ['y'] = -528.45, ['z'] = -5.06 , nom = "West Mirror Drive 3", precio = 850000},
		GuardarVehiculo = { ['x'] = 916.65, ['y'] = -524.38, ['z'] = 58.97 , nom = "West Mirror Drive 3"},
		SpawnVehicle = { ['x'] = 916.65, ['y'] = -524.38, ['z'] = 58.97 , nom = "West Mirror Drive 3"},
		menu = { ['x'] = 932.39, ['y'] = -527.5, ['z'] = -5.06 , nom = "West Mirror Drive 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 924.26, ['y'] = -529.22, ['z'] = -5.02 , nom = "West Mirror Drive 3"},
	},
	["Nikola Avenue 1"] = {
		positionFrom = { ['x'] = 988.06, ['y'] = -525.97, ['z'] = 60.69, nom = "Nikola Avenue 1", precio = 900000},
		positionTo = { ['x'] = 977.7, ['y'] = -527.09, ['z'] = -5.06 , nom = "Nikola Avenue 1", precio = 900000},
		GuardarVehiculo = { ['x'] = 981.89, ['y'] = -533.63, ['z'] = 60.09 , nom = "Nikola Avenue 1"},
		SpawnVehicle = { ['x'] = 981.89, ['y'] = -533.63, ['z'] = 60.09 , nom = "Nikola Avenue 1"},
		menu = { ['x'] = 992.39, ['y'] = -526.5, ['z'] = -5.06 , nom = "Nikola Avenue 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 984.11, ['y'] = -528.56, ['z'] = -5.02 , nom = "Nikola Avenue 1"},
	},
	["Nikola Avenue 2"] = {
		positionFrom = { ['x'] = 919.94, ['y'] = -569.84, ['z'] = 58.37, nom = "Nikola Avenue 2", precio = 1000000},
		positionTo = { ['x'] = 907.62, ['y'] = -564.52, ['z'] = -5.06 , nom = "Nikola Avenue 2", precio = 1000000},
		GuardarVehiculo = { ['x'] = 927.46, ['y'] = -568.6, ['z'] = 57.97 , nom = "Nikola Avenue 2"},
		SpawnVehicle = { ['x'] = 927.46, ['y'] = -568.6, ['z'] = 57.97 , nom = "Nikola Avenue 2"},
		menu = { ['x'] = 922.39, ['y'] = -563.5, ['z'] = -5.06 , nom = "Nikola Avenue 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 914.07, ['y'] = -565.56, ['z'] = -5.02 , nom = "Nikola Avenue 2"},
	},
	["West Mirror Drive 9"] = {
		positionFrom = { ['x'] = 844.05, ['y'] = -562.97, ['z'] = 57.83, nom = "West Mirror Drive 9", precio = 960000},
		positionTo = { ['x'] = 834.83, ['y'] = -564.21, ['z'] = -5.06 , nom = "West Mirror Drive 9", precio = 960000},
		GuardarVehiculo = { ['x'] = 853.45, ['y'] = -565.73, ['z'] = 57.71 , nom = "West Mirror Drive 9"},
		SpawnVehicle = { ['x'] = 853.45, ['y'] = -565.73, ['z'] = 57.71 , nom = "West Mirror Drive 9"},
		menu = { ['x'] = 849.39, ['y'] = -563.5, ['z'] = -5.06 , nom = "West Mirror Drive 9", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 841.1, ['y'] = -565.47, ['z'] = -5.02 , nom = "West Mirror Drive 9"},
	},
	["Bridge Street 4"] = {
		positionFrom = { ['x'] = 1060.51, ['y'] = -378.2, ['z'] = 68.23, nom = "Bridge Street 4", precio = 960000},
		positionTo = { ['x'] = 1048.44, ['y'] = -375.38, ['z'] = -5.06 , nom = "Bridge Street 4", precio = 960000},
		GuardarVehiculo = { ['x'] = 1056.2, ['y'] = -386.48, ['z'] = 67.85 , nom = "Bridge Street 4"},
		SpawnVehicle = { ['x'] = 1056.2, ['y'] = -386.48, ['z'] = 67.85 , nom = "Bridge Street 4"},
		menu = { ['x'] = 1063.4, ['y'] = -374.5, ['z'] = -5.06 , nom = "Bridge Street 4", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1055.05, ['y'] = -376.36, ['z'] = -5.02 , nom = "Bridge Street 4"},
	},
	["West Mirror Drive 4"] = {
		positionFrom = { ['x'] = 1029.15, ['y'] = -408.85, ['z'] = 65.95, nom = "West Mirror Drive 4", precio = 900000},
		positionTo = { ['x'] = 1017.62, ['y'] = -405.56, ['z'] = -5.06 , nom = "West Mirror Drive 4", precio = 900000},
		GuardarVehiculo = { ['x'] = 1021.44, ['y'] = -417.31, ['z'] = 65.95 , nom = "West Mirror Drive 4"},
		SpawnVehicle = { ['x'] = 1021.44, ['y'] = -417.31, ['z'] = 65.95 , nom = "West Mirror Drive 4"},
		menu = { ['x'] = 1032.39, ['y'] = -404.5, ['z'] = -5.06 , nom = "West Mirror Drive 4", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1024.08, ['y'] = -406.4, ['z'] = -5.02 , nom = "West Mirror Drive 4"},
	},
	["West Mirror Drive 5"] = {
		positionFrom = { ['x'] = 987.47, ['y'] = -433.12, ['z'] = 64.05, nom = "West Mirror Drive 5", precio = 500000},
		positionTo = { ['x'] = 977.71, ['y'] = -435.25, ['z'] = -5.06 , nom = "West Mirror Drive 5", precio = 500000},
		GuardarVehiculo = { ['x'] = 989.98, ['y'] = -436.68, ['z'] = 63.74 , nom = "West Mirror Drive 5"},
		SpawnVehicle = { ['x'] = 989.98, ['y'] = -436.68, ['z'] = 63.74 , nom = "West Mirror Drive 5"},
		menu = { ['x'] = 992.39, ['y'] = -434.5, ['z'] = -5.06 , nom = "West Mirror Drive 5", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 984.07, ['y'] = -436.43, ['z'] = -5.02 , nom = "West Mirror Drive 5"},
	},
	["West Mirror Drive 6"] = {
		positionFrom = { ['x'] = 944.24, ['y'] = -463.47, ['z'] = 61.4, nom = "West Mirror Drive 6", precio = 1000000},
		positionTo = { ['x'] = 935.56, ['y'] = -462.43, ['z'] = -5.06 , nom = "West Mirror Drive 6", precio = 1000000},
		GuardarVehiculo = { ['x'] = 942.51, ['y'] = -468.57, ['z'] = 61.25 , nom = "West Mirror Drive 6"},
		SpawnVehicle = { ['x'] = 942.51, ['y'] = -468.57, ['z'] = 61.25 , nom = "West Mirror Drive 6"},
		menu = { ['x'] = 950.39, ['y'] = -461.5, ['z'] = -5.06 , nom = "West Mirror Drive 6", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 942.24, ['y'] = -463.32, ['z'] = -5.02 , nom = "West Mirror Drive 6"},
	},
	["West Mirror Drive 7"] = {
		positionFrom = { ['x'] = 906.36, ['y'] = -489.58, ['z'] = 59.44, nom = "West Mirror Drive 7", precio = 500000},
		positionTo = { ['x'] = 893.64, ['y'] = -482.32, ['z'] = -5.06 , nom = "West Mirror Drive 7", precio = 500000},
		GuardarVehiculo = { ['x'] = 913.81, ['y'] = -488.64, ['z'] = 59.04 , nom = "West Mirror Drive 7"},
		SpawnVehicle = { ['x'] = 913.81, ['y'] = -488.64, ['z'] = 59.04 , nom = "West Mirror Drive 7"},
		menu = { ['x'] = 908.39, ['y'] = -481.5, ['z'] = -5.06 , nom = "West Mirror Drive 7", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 900.27, ['y'] = -483.21, ['z'] = -5.02 , nom = "West Mirror Drive 7"},
	},
	["West Mirror Drive 8"] = {
		positionFrom = { ['x'] = 861.104, ['y'] = -509.16, ['z'] = 57.52, nom = "West Mirror Drive 8", precio = 960000},
		positionTo = { ['x'] = 849.73, ['y'] = -512.42, ['z'] = -5.06 , nom = "West Mirror Drive 8", precio = 960000},
		GuardarVehiculo = { ['x'] = 857.98, ['y'] = -521.08, ['z'] = 57.3 , nom = "West Mirror Drive 8"},
		SpawnVehicle = { ['x'] = 857.98, ['y'] = -521.08, ['z'] = 57.3 , nom = "West Mirror Drive 8"},
		menu = { ['x'] = 864.39, ['y'] = -511.5, ['z'] = -5.06 , nom = "West Mirror Drive 8", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 856.18, ['y'] = -513.18, ['z'] = -5.02 , nom = "West Mirror Drive 8"},
	},
	["Nikola Place 1"] = {
		positionFrom = { ['x'] = 1303.11, ['y'] = -527.42, ['z'] = 71.46, nom = "Nikola Place 1", precio = 1000000},
		positionTo = { ['x'] = 1300.66, ['y'] = -525.09, ['z'] = 0.94 , nom = "Nikola Place 1", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1308.87, ['y'] = -533.53, ['z'] = 71.31 , nom = "Nikola Place 1"},
		SpawnVehicle = { ['x'] = 1308.87, ['y'] = -533.53, ['z'] = 71.31 , nom = "Nikola Place 1"},
		menu = { ['x'] = 1315.47, ['y'] = -523.58, ['z'] = 0.93 , nom = "Nikola Place 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1307.64, ['y'] = -527.06, ['z'] = 0.93 , nom = "Nikola Place 1"},
	},
	["Nikola Place 2"] = {
		positionFrom = { ['x'] = 1328.49, ['y'] = -535.96, ['z'] = 72.44, nom = "Nikola Place 2", precio = 1000000},
		positionTo = { ['x'] = 1327.54, ['y'] = -534.08, ['z'] = 0.93 , nom = "Nikola Place 2", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1317.8, ['y'] = -535.15, ['z'] = 72.05 , nom = "Nikola Place 2"},
		SpawnVehicle = { ['x'] = 1317.8, ['y'] = -535.15, ['z'] = 72.05 , nom = "Nikola Place 2"},
		menu = { ['x'] = 1342.38, ['y'] = -532.51, ['z'] = 0.93 , nom = "Nikola Place 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1334.2, ['y'] = -535.87, ['z'] = 0.97 , nom = "Nikola Place 2"},
	},
	["Nikola Place 3"] = {
		positionFrom = { ['x'] = 1348.24, ['y'] = -546.95, ['z'] = 73.89, nom = "Nikola Place 3", precio = 1000000},
		positionTo = { ['x'] = 1350.58, ['y'] = -542.5, ['z'] = 0.13 , nom = "Nikola Place 3", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1353.92, ['y'] = -553.07, ['z'] = 74.0 , nom = "Nikola Place 3"},
		SpawnVehicle = { ['x'] = 1353.92, ['y'] = -553.07, ['z'] = 74.0 , nom = "Nikola Place 3"},
		menu = { ['x'] = 1365.54, ['y'] = -541.0, ['z'] = 0.13 , nom = "Nikola Place 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1357.48, ['y'] = -544.34, ['z'] = 0.17 , nom = "Nikola Place 3"},
	},
	["Nikola Place 4"] = {
		positionFrom = { ['x'] = 1373.28, ['y'] = -555.66, ['z'] = 74.69, nom = "Nikola Place 4", precio = 1000000},
		positionTo = { ['x'] = 1374.21, ['y'] = -550.28, ['z'] = -0.97 , nom = "Nikola Place 4", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1362.99, ['y'] = -553.09, ['z'] = 74.34 , nom = "Nikola Place 4"},
		SpawnVehicle = { ['x'] = 1362.99, ['y'] = -553.09, ['z'] = 74.34 , nom = "Nikola Place 4"},
		menu = { ['x'] = 1389.08, ['y'] = -548.61, ['z'] = -0.97 , nom = "Nikola Place 4", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1380.87, ['y'] = -551.95, ['z'] = -0.93 , nom = "Nikola Place 4"},
	},
	["Nikola Place 5"] = {
		positionFrom = { ['x'] = 1388.4, ['y'] = -569.61, ['z'] = 74.5, nom = "Nikola Place 5", precio = 1000000},
		positionTo = { ['x'] = 1393.65, ['y'] = -569.14, ['z'] = 0.94 , nom = "Nikola Place 5", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1388.23, ['y'] = -577.86, ['z'] = 74.34 , nom = "Nikola Place 5"},
		SpawnVehicle = { ['x'] = 1388.23, ['y'] = -577.86, ['z'] = 74.34 , nom = "Nikola Place 5"},
		menu = { ['x'] = 1408.57, ['y'] = -567.58, ['z'] = 0.94 , nom = "Nikola Place 5", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1400.64, ['y'] = -570.95, ['z'] = 0.98 , nom = "Nikola Place 5"},
	},
	["Nikola Place 6"] = {
		positionFrom = { ['x'] = 1385.96, ['y'] = -593.24, ['z'] = 74.49, nom = "Nikola Place 6", precio = 1000000},
		positionTo = { ['x'] = 1385.59, ['y'] = -598.08, ['z'] = -1.06 , nom = "Nikola Place 6", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1378.58, ['y'] = -596.45, ['z'] = 74.34 , nom = "Nikola Place 6"},
		SpawnVehicle = { ['x'] = 1378.58, ['y'] = -596.45, ['z'] = 51.502 , nom = "Nikola Place 6"},
		menu = { ['x'] = 1400.56, ['y'] = -596.54, ['z'] = -1.06 , nom = "Nikola Place 6", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1392.61, ['y'] = -599.94, ['z'] = -1.02 , nom = "Nikola Place 6"},
	},
	["Nikola Place 7"] = {
		positionFrom = { ['x'] = 1341.33, ['y'] = -597.43, ['z'] = 74.7, nom = "Nikola Place 7", precio = 1000000},
		positionTo = { ['x'] = 1329.33, ['y'] = -615.07, ['z'] = 0.94 , nom = "Nikola Place 7", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1349.28, ['y'] = -603.18, ['z'] = 74.36 , nom = "Nikola Place 7"},
		SpawnVehicle = { ['x'] = 1349.28, ['y'] = -603.18, ['z'] = 74.36 , nom = "Nikola Place 7"},
		menu = { ['x'] = 1344.39, ['y'] = -613.51, ['z'] = 0.94 , nom = "Nikola Place 7", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1336.41, ['y'] = -616.94, ['z'] = 0.98 , nom = "Nikola Place 7"},
	},
	["Nikola Place 8"] = {
		positionFrom = { ['x'] = 1323.47, ['y'] = -582.9, ['z'] = 73.25, nom = "Nikola Place 8", precio = 1000000},
		positionTo = { ['x'] = 1311.41, ['y'] = -596.07, ['z'] = 0.94 , nom = "Nikola Place 8", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1318.44, ['y'] = -576.43, ['z'] = 73.01 , nom = "Nikola Place 8"},
		SpawnVehicle = { ['x'] = 1318.44, ['y'] = -576.43, ['z'] = 73.01 , nom = "Nikola Place 8"},
		menu = { ['x'] = 1326.39, ['y'] = -594.61, ['z'] = 0.94 , nom = "Nikola Place 8", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1318.22, ['y'] = -597.87, ['z'] = 0.98 , nom = "Nikola Place 8"},
	},
	["Nikola Place 9"] = {
		positionFrom = { ['x'] = 1301.1, ['y'] = -574.04, ['z'] = 71.73, nom = "Nikola Place 9", precio = 1000000},
		positionTo = { ['x'] = 1287.39, ['y'] = -586.07, ['z'] = 0.94 , nom = "Nikola Place 9", precio = 1000000},
		GuardarVehiculo = { ['x'] = 1294.77, ['y'] = -568.2, ['z'] = 71.23 , nom = "Nikola Place 9"},
		SpawnVehicle = { ['x'] = 1294.77, ['y'] = -568.2, ['z'] = 71.23 , nom = "Nikola Place 9"},
		menu = { ['x'] = 1302.4, ['y'] = -584.5, ['z'] = 0.94 , nom = "Nikola Place 9", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 5000},
		armario = { ['x'] = 1294.21, ['y'] = -587.86, ['z'] = 0.98 , nom = "Nikola Place 9"},
	},
	--------------------------------------------- Casas pobres -------------------------------------------------
	["GroveStreet1"] = {
		positionFrom = { ['x'] = 5.1, ['y'] = -1884.03, ['z'] = 23.7 , nom = "GroveStreet1", precio = 300000},
		positionTo = { ['x'] = 7.03, ['y'] = -1880.46, ['z'] = -24.65 , nom = "GroveStreet1", precio = 300000},
		GuardarVehiculo = { ['x'] = 16.17, ['y'] = -1884.11, ['z'] = 23.25 , nom = "GroveStreet1"},
		SpawnVehicle = { ['x'] = 16.17, ['y'] = -1884.11, ['z'] = 23.25 , nom = "GroveStreet1"},
		menu = { ['x'] = 6.13, ['y'] = -1883.13, ['z'] = -24.65 , nom = "GroveStreet1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 9.96, ['y'] = -1879.77, ['z'] = -24.65 , nom = "GroveStreet1"},
	},
	["GroveStreet2"] = {
		positionFrom = { ['x'] = 23.34, ['y'] = -1896.56, ['z'] = 22.97 , nom = "GroveStreet2", precio = 260000},
		positionTo = { ['x'] = 22.06, ['y'] = -1894.41, ['z'] = -24.65 , nom = "GroveStreet2", precio = 260000},
		GuardarVehiculo = { ['x'] = 34.42, ['y'] = -1893.47, ['z'] = 22.21 , nom = "GroveStreet2"},
		SpawnVehicle = { ['x'] = 34.42, ['y'] = -1893.47, ['z'] = 22.21 , nom = "GroveStreet2"},
		menu = { ['x'] = 21.14, ['y'] = -1897.11, ['z'] = -24.65 , nom = "GroveStreet2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 24.98, ['y'] = -1893.79, ['z'] = -24.65 , nom = "GroveStreet2"},
	},
	["GroveStreet3"] = {
		positionFrom = { ['x'] = 39.05, ['y'] = -1911.64, ['z'] = 21.95 , nom = "GroveStreet3", precio = 280000},
		positionTo = { ['x'] = 37.97, ['y'] = -1910.53, ['z'] = -24.65 , nom = "GroveStreet3", precio = 280000},
		GuardarVehiculo = { ['x'] = 47.72, ['y'] = -1914.04, ['z'] = 21.66 , nom = "GroveStreet3"},
		SpawnVehicle = { ['x'] = 47.72, ['y'] = -1914.04, ['z'] = 21.66 , nom = "GroveStreet3"},
		menu = { ['x'] = 37.15, ['y'] = -1913.11, ['z'] = -24.65 , nom = "GroveStreet3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 40.89, ['y'] = -1909.71, ['z'] = -24.65 , nom = "GroveStreet3"},
	},
	["GroveStreet4"] = {
		positionFrom = { ['x'] = 72.16, ['y'] = -1939.08, ['z'] = 21.37 , nom = "GroveStreet4", precio = 260000},
		positionTo = { ['x'] = 51.93, ['y'] = -1924.51, ['z'] = -24.65 , nom = "GroveStreet4", precio = 260000},
		GuardarVehiculo = { ['x'] = 81.53, ['y'] = -1932.26, ['z'] = 20.73 , nom = "GroveStreet4"},
		SpawnVehicle = { ['x'] = 81.53, ['y'] = -1932.26, ['z'] = 20.73 , nom = "GroveStreet4"},
		menu = { ['x'] = 51.15, ['y'] = -1927.11, ['z'] = -24.65 , nom = "GroveStreet4", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 54.92, ['y'] = -1923.74, ['z'] = -24.65 , nom = "GroveStreet4"},
	},
	["GroveStreet5"] = {
		positionFrom = { ['x'] = 56.61, ['y'] = -1922.58, ['z'] = 21.91 , nom = "GroveStreet5", precio = 300000},
		positionTo = { ['x'] = 63.1, ['y'] = -1936.37, ['z'] = -24.65 , nom = "GroveStreet5", precio = 300000},
		GuardarVehiculo = { ['x'] = 68.41, ['y'] = -1921.38, ['z'] = 21.33 , nom = "GroveStreet5"},
		SpawnVehicle = { ['x'] = 68.41, ['y'] = -1921.38, ['z'] = 21.33 , nom = "GroveStreet5"},
		menu = { ['x'] = 62.15, ['y'] = -1939.11, ['z'] = -24.65 , nom = "GroveStreet5", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 65.92, ['y'] = -1935.74, ['z'] = -24.65 , nom = "GroveStreet5"},
	},
	["GroveStreet6"] = {
		positionFrom = { ['x'] = 76.46, ['y'] = -1947.99, ['z'] = 21.17 , nom = "GroveStreet6", precio = 300000},
		positionTo = { ['x'] = 73.02, ['y'] = -1946.48, ['z'] = -24.65 , nom = "GroveStreet6", precio = 300000},
		GuardarVehiculo = { ['x'] = 89.28, ['y'] = -1941.74, ['z'] = 20.7 , nom = "GroveStreet6"},
		SpawnVehicle = { ['x'] = 89.28, ['y'] = -1941.74, ['z'] = 20.7 , nom = "GroveStreet6"},
		menu = { ['x'] = 72.15, ['y'] = -1949.11, ['z'] = -24.65 , nom = "GroveStreet6", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 75.9, ['y'] = -1945.72, ['z'] = -24.65 , nom = "GroveStreet6"},
	},
	["GroveStreet7"] = {
		positionFrom = { ['x'] = 85.86, ['y'] = -1959.7, ['z'] = 21.12 , nom = "GroveStreet7", precio = 280000},
		positionTo = { ['x'] = 85.04, ['y'] = -1957.55, ['z'] = -24.65 , nom = "GroveStreet7", precio = 280000},
		GuardarVehiculo = { ['x'] = 94.65, ['y'] = -1961.35, ['z'] = 20.75 , nom = "GroveStreet7"},
		SpawnVehicle = { ['x'] = 94.65, ['y'] = -1961.35, ['z'] = 20.75 , nom = "GroveStreet7"},
		menu = { ['x'] = 84.14, ['y'] = -1960.13, ['z'] = -24.65 , nom = "GroveStreet7", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 87.84, ['y'] = -1956.66, ['z'] = -24.65 , nom = "GroveStreet7"},
	},
	["GroveStreet8"] = {
		positionFrom = { ['x'] = 114.5, ['y'] = -1961.14, ['z'] = 21.33 , nom = "GroveStreet8", precio = 300000},
		positionTo = { ['x'] = 118.0, ['y'] = -1963.49, ['z'] = -24.65 , nom = "GroveStreet8", precio = 300000},
		GuardarVehiculo = { ['x'] = 116.35, ['y'] = -1949.67, ['z'] = 20.72 , nom = "GroveStreet8"},
		SpawnVehicle = { ['x'] = 116.35, ['y'] = -1949.67, ['z'] = 20.72 , nom = "GroveStreet8"},
		menu = { ['x'] = 117.22, ['y'] = -1966.13, ['z'] = -24.65 , nom = "GroveStreet8", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 120.91, ['y'] = -1962.62, ['z'] = -24.65 , nom = "GroveStreet8"},
	},
	["GroveStreet9"] = {
		positionFrom = { ['x'] = 126.74, ['y'] = -1929.99, ['z'] = 21.38 , nom = "GroveStreet9", precio = 260000},
		positionTo = { ['x'] = 128.05, ['y'] = -1918.51, ['z'] = -24.65 , nom = "GroveStreet9", precio = 260000},
		GuardarVehiculo = { ['x'] = 119.75, ['y'] = -1940.57, ['z'] = 20.72 , nom = "GroveStreet9"},
		SpawnVehicle = { ['x'] = 119.75, ['y'] = -1940.57, ['z'] = 20.72 , nom = "GroveStreet9"},
		menu = { ['x'] = 127.15, ['y'] = -1921.11, ['z'] = -24.65 , nom = "GroveStreet9", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 130.91, ['y'] = -1917.73, ['z'] = -24.65 , nom = "GroveStreet9"},
	},
	["GroveStreet10"] = {
		positionFrom = { ['x'] = 118.74, ['y'] = -1921.09, ['z'] = 21.32 , nom = "GroveStreet10", precio = 260000},
		positionTo = { ['x'] = 118.06, ['y'] = -1909.42, ['z'] = -24.65 , nom = "GroveStreet10", precio = 260000},
		GuardarVehiculo = { ['x'] = 109.5, ['y'] = -1925.27, ['z'] = 20.75 , nom = "GroveStreet10"},
		SpawnVehicle = { ['x'] = 109.5, ['y'] = -1925.27, ['z'] = 20.75 , nom = "GroveStreet10"},
		menu = { ['x'] = 117.15, ['y'] = -1912.11, ['z'] = -24.65 , nom = "GroveStreet10", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 120.91, ['y'] = -1908.77, ['z'] = -24.65 , nom = "GroveStreet10"},
	},
	["GroveStreet11"] = {
		positionFrom = { ['x'] = 100.93, ['y'] = -1912.51, ['z'] = 21.41 , nom = "GroveStreet11", precio = 300000},
		positionTo = { ['x'] = 106.03, ['y'] = -1899.46, ['z'] = -24.65 , nom = "GroveStreet11", precio = 300000},
		GuardarVehiculo = { ['x'] = 89.46, ['y'] = -1917.07, ['z'] = 20.73 , nom = "GroveStreet11"},
		SpawnVehicle = { ['x'] = 89.46, ['y'] = -1917.07, ['z'] = 20.73 , nom = "GroveStreet11"},
		menu = { ['x'] = 105.15, ['y'] = -1902.11, ['z'] = -24.65 , nom = "GroveStreet11", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 108.86, ['y'] = -1898.69, ['z'] = -24.65 , nom = "GroveStreet11"},
	},
	["GroveStreet12"] = {
		positionFrom = { ['x'] = 54.49, ['y'] = -1873.15, ['z'] = 22.81 , nom = "GroveStreet12", precio = 300000},
		positionTo = { ['x'] = 54.92, ['y'] = -1868.49, ['z'] = -24.65 , nom = "GroveStreet12", precio = 300000},
		GuardarVehiculo = { ['x'] = 52.2, ['y'] = -1878.8, ['z'] = 22.2 , nom = "GroveStreet12"},
		SpawnVehicle = { ['x'] = 52.2, ['y'] = -1878.8, ['z'] = 22.2 , nom = "GroveStreet12"},
		menu = { ['x'] = 54.15, ['y'] = -1871.11, ['z'] = -24.65 , nom = "GroveStreet12", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 57.84, ['y'] = -1867.67, ['z'] = -24.65 , nom = "GroveStreet12"},
	},
	["GroveStreet13"] = {
		positionFrom = { ['x'] = 46.05, ['y'] = -1864.28, ['z'] = 23.28 , nom = "GroveStreet13", precio = 280000},
		positionTo = { ['x'] = 43.97, ['y'] = -1858.53, ['z'] = -24.65 , nom = "GroveStreet13", precio = 280000},
		GuardarVehiculo = { ['x'] = 32.79, ['y'] = -1862, ['z'] = 23.03 , nom = "GroveStreet13"},
		SpawnVehicle = { ['x'] = 32.79, ['y'] = -1862, ['z'] = 23.03 , nom = "GroveStreet13"},
		menu = { ['x'] = 43.15, ['y'] = -1861.11, ['z'] = -24.65 , nom = "GroveStreet13", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 47, ['y'] = -1857.81, ['z'] = -24.65 , nom = "GroveStreet13"},
	},
	["Grove Street 541"] = {
		positionFrom = { ['x'] = 29.88, ['y'] = -1854.14, ['z'] = 24.07 , nom = "Grove Street 541", precio = 260000},
		positionTo = { ['x'] = 33.06, ['y'] = -1848.58, ['z'] = -24.65 , nom = "Grove Street 541", precio = 260000},
		GuardarVehiculo = { ['x'] = 21.13, ['y'] = -1855.43, ['z'] = 23.68 , nom = "Grove Street 541"},
		SpawnVehicle = { ['x'] = 21.13, ['y'] = -1855.43, ['z'] = 23.68 , nom = "Grove Street 541"},
		menu = { ['x'] = 32.15, ['y'] = -1851.13, ['z'] = -24.65 , nom = "Grove Street 541", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 35.85, ['y'] = -1847.67, ['z'] = -24.65 , nom = "Grove Street 541"},
	},
	
	["Covenant Avenue 1"] = {
		positionFrom = { ['x'] = 104.1, ['y'] = -1885.37, ['z'] = 24.32 , nom = "Covenant Avenue 1", precio = 300000},
		positionTo = { ['x'] = 98.07, ['y'] = -1880.42, ['z'] = -24.65 , nom = "Covenant Avenue 1", precio = 300000},
		GuardarVehiculo = { ['x'] = 109.14, ['y'] = -1878.11, ['z'] = 23.88 , nom = "Covenant Avenue 1"},
		SpawnVehicle = { ['x'] = 109.14, ['y'] = -1878.11, ['z'] = 23.88 , nom = "Covenant Avenue 1"},
		menu = { ['x'] = 97.15, ['y'] = -1883.11, ['z'] = -24.65 , nom = "Covenant Avenue 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 100.82, ['y'] = -1879.65, ['z'] = -24.65 , nom = "Covenant Avenue 1"},
	},
	["Covenant Avenue 2"] = {
		positionFrom = { ['x'] = 115.33, ['y'] = -1887.96, ['z'] = 23.93 , nom = "Covenant Avenue 2", precio = 260000},
		positionTo = { ['x'] = 119.09, ['y'] = -1883.55, ['z'] = -24.65 , nom = "Covenant Avenue 2", precio = 260000},
		GuardarVehiculo = { ['x'] = 126.8, ['y'] = -1882.61, ['z'] = 23.57 , nom = "Covenant Avenue 2"},
		SpawnVehicle = { ['x'] = 126.8, ['y'] = -1882.61, ['z'] = 23.57 , nom = "Covenant Avenue 2"},
		menu = { ['x'] = 118.15, ['y'] = -1886.11, ['z'] = -24.65 , nom = "Covenant Avenue 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 121.9, ['y'] = -1882.63, ['z'] = -24.65 , nom = "Covenant Avenue 2"},
	},
	
	["Covenant Avenue 3"] = {
		positionFrom = { ['x'] = 128.23, ['y'] = -1896.96, ['z'] = 23.67 , nom = "Covenant Avenue 3", precio = 300000},
		positionTo = { ['x'] = 129.98, ['y'] = -1893.52, ['z'] = -24.65 , nom = "Covenant Avenue 3", precio = 300000},
		GuardarVehiculo = { ['x'] = 138.99, ['y'] = -1893.87, ['z'] = 23.53 , nom = "Covenant Avenue 3"},
		SpawnVehicle = { ['x'] = 138.99, ['y'] = -1893.87, ['z'] = 23.53 , nom = "Covenant Avenue 3"},
		menu = { ['x'] = 129.15, ['y'] = -1896.11, ['z'] = -24.65 , nom = "Covenant Avenue 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 0,
		itemsprecio = 0},
		armario = { ['x'] = 132.78, ['y'] = -1892.61, ['z'] = -24.65 , nom = "Covenant Avenue 3"},
	},
	------------------------------------------ Casas centro ----------------------------------------------------
	["Strawberry1"] = {
		positionFrom = { ['x'] = 321.93, ['y'] = -1284.42, ['z'] = 30.57 , nom = "Strawberry1", precio = 300000},
		positionTo = { ['x'] = 310.84, ['y'] = -1283.04, ['z'] = -7.9 , nom = "Strawberry1", precio = 300000},
		GuardarVehiculo = { ['x'] = 335.39, ['y'] = -1281.8, ['z'] = 31.92 , nom = "Strawberry1"},
		SpawnVehicle = { ['x'] = 335.39, ['y'] = -1281.8, ['z'] = 31.92 , nom = "Strawberry1"},
		menu = { ['x'] = 311.83, ['y'] = -1276.16, ['z'] = -7.9 , nom = "Strawberry1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = 322.22, ['y'] = -1286.88, ['z'] = -7.9 , nom = "Strawberry1"},
	},
	["Strawberry2"] = {
		positionFrom = { ['x'] = 327.85, ['y'] = -1258.67, ['z'] = 31.95 , nom = "Strawberry2", precio = 300000},
		positionTo = { ['x'] = 320.76, ['y'] = -1262.16, ['z'] = -7.9 , nom = "Strawberry2", precio = 300000},
		GuardarVehiculo = { ['x'] = 335.08, ['y'] = -1259.45, ['z'] = 31.66 , nom = "Strawberry2"},
		SpawnVehicle = { ['x'] = 335.08, ['y'] = -1259.45, ['z'] = 31.66 , nom = "Strawberry2"},
		menu = { ['x'] = 321.92, ['y'] = -1255.14, ['z'] = -7.9 , nom = "Strawberry2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = 332.29, ['y'] = -1255.95, ['z'] = -7.9 , nom = "Strawberry2"},
	},
	["Vespucci Boulevard 1"] = {
		positionFrom = { ['x'] = -1022.48, ['y'] = -896.74, ['z'] = 5.42 , nom = "Vespucci Boulevard 1", precio = 300000},
		positionTo = { ['x'] = -1027.3, ['y'] = -901.06, ['z'] = -37.9 , nom = "Vespucci Boulevard 1", precio = 300000},
		GuardarVehiculo = { ['x'] = -1024.4, ['y'] = -888.56, ['z'] = 5.76 , nom = "Vespucci Boulevard 1"},
		SpawnVehicle = { ['x'] = -1024.4, ['y'] = -888.56, ['z'] = 5.76 , nom = "Vespucci Boulevard 1"},
		menu = { ['x'] = -1026.07, ['y'] = -894.14, ['z'] = -37.9 , nom = "Vespucci Boulevard 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1015.74, ['y'] = -894.81, ['z'] = -37.9 , nom = "Vespucci Boulevard 1"},
	},
	["Vespucci Boulevard 2"] = {
		positionFrom = { ['x'] = -1031.4, ['y'] = -903.07, ['z'] = 3.69 , nom = "Vespucci Boulevard 2", precio = 300000},
		positionTo = { ['x'] = -1037.2, ['y'] = -919.17, ['z'] = -37.9 , nom = "Vespucci Boulevard 2", precio = 300000},
		GuardarVehiculo = { ['x'] = -1035.37, ['y'] = -897.58, ['z'] = 4.55 , nom = "Vespucci Boulevard 2"},
		SpawnVehicle = { ['x'] = -1035.37, ['y'] = -897.58, ['z'] = 4.55 , nom = "Vespucci Boulevard 2"},
		menu = { ['x'] = -1036.07, ['y'] = -912.14, ['z'] = -37.9 , nom = "Vespucci Boulevard 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1025.82, ['y'] = -912.97, ['z'] = -37.9 , nom = "Vespucci Boulevard 2"},
	},
	["Vespucci Boulevard 3"] = {
		positionFrom = { ['x'] = -1043.48, ['y'] = -923.83, ['z'] = 3.15 , nom = "Vespucci Boulevard 3", precio = 300000},
		positionTo = { ['x'] = -1055.24, ['y'] = -938.11, ['z'] = -37.9 , nom = "Vespucci Boulevard 3", precio = 300000},
		GuardarVehiculo = { ['x'] = -1053.94, ['y'] = -905.35, ['z'] = 4.37 , nom = "Vespucci Boulevard 3"},
		SpawnVehicle = { ['x'] = -1053.94, ['y'] = -905.35, ['z'] = 4.37 , nom = "Vespucci Boulevard 3"},
		menu = { ['x'] = -1054.07, ['y'] = -931.14, ['z'] = -37.9 , nom = "Vespucci Boulevard 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1043.82, ['y'] = -931.8, ['z'] = -37.9 , nom = "Vespucci Boulevard 3"},
	},
	["Vespucci Boulevard 4"] = {
		positionFrom = { ['x'] = -1061.5, ['y'] = -942.89, ['z'] = 2.21 , nom = "Vespucci Boulevard 4", precio = 300000},
		positionTo = { ['x'] = -1078.28, ['y'] = -931.17, ['z'] = -37.9 , nom = "Vespucci Boulevard 4", precio = 300000},
		GuardarVehiculo = { ['x'] = -1082.03, ['y'] = -919.86, ['z'] = 3.51 , nom = "Vespucci Boulevard 4"},
		SpawnVehicle = { ['x'] = -1082.03, ['y'] = -919.86, ['z'] = 3.51 , nom = "Vespucci Boulevard 4"},
		menu = { ['x'] = -1077.08, ['y'] = -924.14, ['z'] = -37.9 , nom = "Vespucci Boulevard 4", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1066.94, ['y'] = -924.95, ['z'] = -37.9 , nom = "Vespucci Boulevard 4"},
	},
	["Vespucci Boulevard 5"] = {
		positionFrom = { ['x'] = -1111.67, ['y'] = -902.19, ['z'] = 3.79 , nom = "Vespucci Boulevard 5", precio = 300000},
		positionTo = { ['x'] = -1096.1, ['y'] = -900.86, ['z'] = -37.9 , nom = "Vespucci Boulevard 5", precio = 300000},
		GuardarVehiculo = { ['x'] = -1093.81, ['y'] = -889.12, ['z'] = 3.59 , nom = "Vespucci Boulevard 5"},
		SpawnVehicle = { ['x'] = -1093.81, ['y'] = -889.12, ['z'] = 3.59 , nom = "Vespucci Boulevard 5"},
		menu = { ['x'] = -1095.07, ['y'] = -894.14, ['z'] = -37.9 , nom = "Vespucci Boulevard 5", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1084.84, ['y'] = -894.99, ['z'] = -37.9 , nom = "Vespucci Boulevard 5"},
	},
	["Imagination Court 1"] = {
		positionFrom = { ['x'] = -1041.77, ['y'] = -1025.48, ['z'] = 2.55 , nom = "Imagination Court 1", precio = 300000},
		positionTo = { ['x'] = -1034.16, ['y'] = -1045.74, ['z'] = -37.9 , nom = "Imagination Court 1", precio = 300000},
		GuardarVehiculo = { ['x'] = -1041.12, ['y'] = -1020.44, ['z'] = 2.12 , nom = "Imagination Court 1"},
		SpawnVehicle = { ['x'] = -1041.12, ['y'] = -1020.44, ['z'] = 2.12 , nom = "Imagination Court 1"},
		menu = { ['x'] = -1033.04, ['y'] = -1039.14, ['z'] = -37.9 , nom = "Imagination Court 1", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1022.72, ['y'] = -1039.79, ['z'] = -37.9 , nom = "Imagination Court 1"},
	},
	["Imagination Court 2"] = {
		positionFrom = { ['x'] = -1019.2, ['y'] = -1018.71, ['z'] = 2.15 , nom = "Imagination Court 2", precio = 300000},
		positionTo = { ['x'] = -1023.09, ['y'] = -1026.87, ['z'] = -37.9 , nom = "Imagination Court 2", precio = 300000},
		GuardarVehiculo = { ['x'] = -1023.97, ['y'] = -1015.09, ['z'] = 2.15 , nom = "Imagination Court 2"},
		SpawnVehicle = { ['x'] = -1023.97, ['y'] = -1015.09, ['z'] = 2.15 , nom = "Imagination Court 2"},
		menu = { ['x'] = -1022.07, ['y'] = -1020.14, ['z'] = -37.9 , nom = "Imagination Court 2", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1011.79, ['y'] = -1020.98, ['z'] = -37.9 , nom = "Imagination Court 2"},
	},
	["Imagination Court 3"] = {
		positionFrom = { ['x'] = -1051.1, ['y'] = -1006.38, ['z'] = 6.41 , nom = "Imagination Court 3", precio = 300000},
		positionTo = { ['x'] = -1052.03, ['y'] = -1009.7, ['z'] = -37.9 , nom = "Imagination Court 3", precio = 300000},
		GuardarVehiculo = { ['x'] = -1044.34, ['y'] = -1008.37, ['z'] = 2.15 , nom = "Imagination Court 3"},
		SpawnVehicle = { ['x'] = -1044.34, ['y'] = -1008.37, ['z'] = 2.15 , nom = "Imagination Court 3"},
		menu = { ['x'] = -1051.07, ['y'] = -1003.14, ['z'] = -37.9 , nom = "Imagination Court 3", 
		garageprecio = 10000, 
		armasprecio = 15000,
		dineroprecio = 5000,
		itemsprecio = 0},
		armario = { ['x'] = -1040.88, ['y'] = -1004.02, ['z'] = -37.9 , nom = "Imagination Court 3"},
	},
}

----------------------------------- LLAMADOS DEL SERVER -----------------------------------------

-- Verifica se casa esta à venda
RegisterNetEvent('pk_casas:venda')
AddEventHandler('pk_casas:venda', function(venta)
	if venta > 0 then
		mventa = venta
	elseif venta == 0 then
		mventa = 0
	end
end)
RegisterNetEvent('pk_casas:atualiza')
AddEventHandler('pk_casas:atualiza', function(nomecasa)
	criarblips()
end)
function criarblips()
	-- funcao para criar blip da casa no minimapa
	garagemx = 0
	garagemy = 0
	garagemz = 0
	RemoveBlip(propriedadeblip)
	ESX.TriggerServerCallback("rl_propriedades:ownedhouse", function(nomecasa)
		TriggerServerEvent('pk_casas:checkcasa',nomecasa)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if nomecasa ~= nil then
			RemoveBlip(propriedadeblip)
			for k, j in pairs(TeleportFromTo) do
				if k == nomecasa then
					garagemx = j.GuardarVehiculo.x
					garagemy = j.GuardarVehiculo.y
					garagemz = j.GuardarVehiculo.z 
					propriedadeblip = AddBlipForCoord(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z)
					SetBlipSprite (propriedadeblip, 40)						
					SetBlipDisplay(propriedadeblip, 4)
					SetBlipScale  (propriedadeblip, 0.7)
					SetBlipColour (propriedadeblip, 12)
					SetBlipAsShortRange(propriedadeblip, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentSubstringPlayerName('Propriedade')
					EndTextCommandSetBlipName(propriedadeblip)
				end
			end
		end
	end)
end

RegisterNetEvent('pk_casas:estado')
AddEventHandler('pk_casas:estado', function(estadopuerta)
if estadopuerta == 1 or estadopuerta == nil then
estado = 1
puertaesta = '~g~Aberta'
elseif estadopuerta == 0 then
estado = 0
puertaesta = '~r~Fechada'
end
end)

RegisterNetEvent('pk_casas:estadopuerta')
AddEventHandler('pk_casas:estadopuerta', function(estadopuerta)
if estadopuerta == 1 or estadopuerta == nil then
estado = 1
puertaesta = '~g~Aberta'
elseif estadopuerta == 0 then
estado = 0
puertaesta = '~r~Fechada'
end
local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k, j in pairs(TeleportFromTo) do
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 10.0)then
				TriggerServerEvent('pk_casas:checkcasa',j.positionFrom.nom)
			end
		end
end)

RegisterNetEvent('pk_casas:propietario')
AddEventHandler('pk_casas:propietario', function(valor,nombre)
if valor == 1 then
propietario = 1
nombrepropietario = nombre
elseif valor == 0 then
propietario = 0
end
end)

RegisterNetEvent('pk_casas:soyelpropietario')
AddEventHandler('pk_casas:soyelpropietario', function(valor,venta)
if valor == 1 then
soyelpropietario = 1
elseif valor == 0 then
soyelpropietario = 0
end
end)


-------------------------------------- FUNCIONES --------------------------------------------------
local PlayerData              = {}

------------------------------------- MOSTRAR Garagem -------------------------------------------------
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
		Citizen.Wait(5)
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if(Vdist(pos.x, pos.y, pos.z, garagemx, garagemy, garagemz) < 6.0)then
			DrawMarker(1, garagemx, garagemy, garagemz - 1,0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.9, 1.0, 200, 0, 0, 222, false, false, false, true, false, false, false)
			if GetDistanceBetweenCoords(pos, garagemx, garagemy, garagemz) <= 1.5 then
				if not IsPedInAnyVehicle(playerPed) then
					Drawing.draw3DText(garagemx, garagemy, garagemz - 1.100, "E - Abrir Garage", 4, 0.2, 0.1, 255, 255, 255, 215)
                    if IsControlJustReleased(0, 38) then
						openGarageMenu('propriedade')
						--currentGarage = propriedade
                    end
                elseif IsPedInAnyVehicle(playerPed) then
					Drawing.draw3DText(garagemx, garagemy, garagemz - 1.100, "E - Guardar Veículo", 4, 0.2, 0.1, 255, 255, 255, 215)
					if IsControlJustReleased(0, 38) then
						storeVehicle('propriedade')
                    end
				end
            end
		end
	end
end)

storeVehicle = function(cgarage)
            local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(currentVehicle))
            local currentFuel = exports['LegacyFuel']:GetFuel(currentVehicle)
            local engineHealth = GetVehicleEngineHealth(currentVehicle)
			TaskLeaveVehicle(PlayerPedId(), currentVehicle, 0)
	
				while IsPedInVehicle(PlayerPedId(), currentVehicle, true) do
					Citizen.Wait(0)
				end
				Citizen.Wait(500)
				NetworkFadeOutEntity(currentVehicle, true, true)
				Citizen.Wait(100)
            ESX.Game.DeleteVehicle(currentVehicle)
            TriggerServerEvent('esx_simplegarages:server:updateCarStoredState', plate, 1)
            TriggerServerEvent('esx_simplegarages:server:updateCarGarageLocation', plate, cgarage)
            TriggerServerEvent('esx_simplegarages:server:updateCarState', plate, currentFuel, engineHealth)
			exports['mythic_notify']:SendAlert('success', ('Veículo estacionado.'))        
end

openGarageMenu = function(garage)
    local elements = {}

    ESX.TriggerServerCallback("esx_simplegarages:callback:GetUserVehicles", function(myCars)
        for k, v in pairs(myCars) do
            local aheadVehName = GetDisplayNameFromVehicleModel(v.vehicle.model)
            local vehicleName = GetLabelText(aheadVehName)
            local labelvehicle
            local labelvehicle2 = ('%s (%s) - '):format(vehicleName, v.plate)
            local labelvehicle3 = ('%s (%s) - '):format(vehicleName, v.plate)
			if v.stored == 1 then
                labelvehicle = labelvehicle2 .. ('<span style="color:#2ecc71;">%s</span>'):format('Na garagem')
            elseif v.stored == 2 then
                labelvehicle = labelvehicle2 .. ('<span style="color:#c0392b;">%s</span>'):format('Apreendidos PSP')
            else
                labelvehicle = labelvehicle2 .. ('<span style="color:#e67e22;">%s</span>'):format('Apreendidos da Cidade')
            end

            table.insert(elements, {label = labelvehicle, value = v})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title = garage,
			align = left,
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
				exports['mythic_notify']:SendAlert('error', ('Não tem veículos estacionados nesta garagem.'))
			else
				if data.current.value.stored == 1  then
                    menu.close()
					spawnVehicle(data.current.value.vehicle, data.current.value.fuel, data.current.value.engine, data.current.value.plate)
				else
					exports['mythic_notify']:SendAlert('error', ('Veículo não encontrado, verifique os apreendidos.'))
				end
			end
		end, function(data, menu)
			menu.close()
		end)
    end, garage)
end

spawnVehicle = function(vehicle, fuel, enginehealth, plate)
    if not ESX.Game.IsSpawnPointClear(vector3(garagemx, garagemy, garagemz),3.0) then 
		exports['mythic_notify']:SendAlert('error', 'Por favor espere até o lugar ficar disponível')
		return
	end
	local heading = GetEntityHeading(GetPlayerPed(-1))
	ESX.Game.SpawnVehicle(vehicle.model, vector3(garagemx, garagemy, garagemz), heading, function(veh)
		ESX.Game.SetVehicleProperties(veh, vehicle)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)

        SetVehicleEngineHealth(veh, enginehealth + 0.0)
        exports['LegacyFuel']:SetFuel(veh, fuel)
        SetVehicleEngineOn(veh, true, true)
    end)
    
    TriggerServerEvent('esx_simplegarages:server:updateCarStoredState', plate, 0)
end
------------------------------------------- ACTUALIZAR INFO Da CASA -----------------------------------
Citizen.CreateThread(function()
    local stop = 0
    local curPosFrom = nil
    while true do 
		local sleep = 500
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        if stop == 0 then
            for k, j in pairs(TeleportFromTo) do
                if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 8.0)then
					sleep = 5
                    TriggerServerEvent('pk_casas:checkcasa',j.positionFrom.nom)
					stop = 1
                    curPosFrom = j.positionFrom
                    break
                end
            end
        elseif(curPosFrom and Vdist(pos.x, pos.y, pos.z, curPosFrom.x, curPosFrom.y, curPosFrom.z) > 8.0) then
            stop = 0
            curPosFrom = nil
        end
		Citizen.Wait(sleep)
    end
end)

----------------------Menus accesso casa-------------------------------------------------------------
Citizen.CreateThread(function()				
	while true do
		local sleep = 5
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k, j in pairs(TeleportFromTo) do
		------------------ ENTRAR --------------------------
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 7.0)then
				sleep = 5
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 5.0)then
					DrawMarker(2, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z + 0.2,0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 200, 0, 0, 222, false, false, false, true, false, false, false)
					--[[if propietario == 0 then
						Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.100,"~b~" ..j.positionFrom.nom.. "~g~ Disponível", 4, 0.2, 0.1, 255, 255, 255, 215)
						Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.300,"Preço: ~y~" ..j.positionFrom.precio.." €", 4, 0.2, 0.1, 255, 255, 255, 215)
					elseif propietario == 1 then
						if mventa > 0 then
						Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 0.800, "Propiedade à venda por ~y~" ..mventa.." €", 4, 0.2, 0.1, 255, 255, 255, 215)
						end
						Drawing.draw3DText(j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1.700,"~b~" ..j.positionFrom.nom.. "~r~ Indisponível ", 4, 0.2, 0.1, 255, 255, 255, 215)
					end]]
					
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Pressionar ~r~E~w~ para interagir")--
						DrawSubtitleTimed(1000, 1)
						if IsControlJustPressed(1, 38) then
							TriggerServerEvent('pk_casas:checkcasa',j.positionFrom.nom)
							TriggerEvent('pk_casas:atualiza',j.positionFrom.nom)
							Citizen.Wait(150)
							if propietario == 0 then
								AbrirMenuNoPropietario(j.positionFrom.nom,j.positionFrom.precio,j.positionTo.x, j.positionTo.y, j.positionTo.z,  'Visitar')
							elseif propietario == 1 then
								if soyelpropietario == 1 then
									AbrirMenuSoyElPropietario(nombrepropietario,j.positionFrom.nom,j.positionFrom.precio,j.positionFrom.x, j.positionFrom.y, j.positionFrom.z, 'Entrar')
								elseif soyelpropietario == 0 then
									--actualizar preco de compra
									AbrirMenuConPropietario(nombrepropietario,j.positionFrom.nom,venta,j.positionFrom.x, j.positionFrom.y, j.positionFrom.z, 'Entrar')
								end
							end		
						end
						if IsControlJustPressed(1, 47) then
							TriggerServerEvent('pk_casas:checkcasa',j.positionFrom.nom)
							TriggerEvent('pk_casas:abrircerrarpuerta',j.positionFrom.nom)
							Citizen.Wait(1000)
						end
					end
				end
			end
	
			------------------------- SALIR ------------------
			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 7.0)then
				sleep = 5

				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 5.0)then
					DrawMarker(2, j.positionTo.x, j.positionTo.y, j.positionTo.z + 0.2,0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 200, 0, 0, 222, false, false, false, true, false, false, false)
					--[[if propietario == 0 then
						Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.100,"~b~" ..j.positionTo.nom.. "~s~ Não tem dono", 4, 0.2, 0.1, 255, 255, 255, 215)
						Drawing.draw3DText(j.positionTo.x, j.positionTo.y, j.positionTo.z - 1.300,"Preço: ~y~" ..j.positionFrom.precio.." €", 4, 0.2, 0.1, 255, 255, 255, 215)
					end]]
					if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Presionar ~r~E~w~ para interagir")
						DrawSubtitleTimed(1000, 1)
						if IsControlJustPressed(1, 38) then
							TriggerServerEvent('pk_casas:checkcasa',j.positionTo.nom)
							Citizen.Wait(150) 
							if propietario == 0 then
								AbrirMenuNoPropietario(j.positionTo.nom,j.positionTo.precio,j.positionFrom.x, j.positionFrom.y, j.positionFrom.z, 'Sair')
							elseif propietario == 1 then
								if soyelpropietario == 1 then
									AbrirMenuSoyElPropietario(nombrepropietario,j.positionTo.nom,j.positionTo.precio,j.positionTo.x, j.positionTo.y, j.positionTo.z, 'Sair')
								elseif soyelpropietario == 0 then
									AbrirMenuConPropietario(nombrepropietario,j.positionTo.nom,j.positionTo.precio,j.positionTo.x, j.positionTo.y, j.positionTo.z, 'Sair')
								end
							end	
						end
						if IsControlJustPressed(1, 47) then
							TriggerServerEvent('pk_casas:checkcasa',j.positionTo.nom)
							TriggerEvent('pk_casas:abrircerrarpuerta',j.positionTo.nom)
						end
					end
				end
			end
		 if propietario == 1 then	
			if(Vdist(pos.x, pos.y, pos.z, j.armario.x, j.armario.y, j.armario.z) < 7.0)then
				sleep = 5
				if soyelpropietario == 1 then
				if(Vdist(pos.x, pos.y, pos.z, j.armario.x, j.armario.y, j.armario.z) < 5.0)then
					
						Drawing.draw3DText(j.armario.x, j.armario.y, j.armario.z - 1.100,"Cofre", 4, 0.2, 0.1, 255, 255, 255, 215)
						Drawing.draw3DText(j.armario.x, j.armario.y, j.armario.z - 1.150,"^", 4, 0.4, 0.4, 255, 0, 255, 215)
					if(Vdist(pos.x, pos.y, pos.z, j.armario.x, j.armario.y, j.armario.z) < 1.0)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Presionar ~r~E~w~ para interagir")
						DrawSubtitleTimed(1000, 1)
						if IsControlJustPressed(1, 38) then
							TriggerServerEvent('pk_casas:checkcasa',j.armario.nom)
							AbrirMenuArmario(j.armario.nom)
						end
					end
				end
				end
			end
		  end
		end
	Citizen.Wait(sleep)
	end
end)

-- Dar Freeze ao player quando esta a correr a animação de abrir e fechar a porta
RegisterNetEvent('pk_casas:freezePlayer1')
AddEventHandler('pk_casas:freezePlayer1', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), 1, true, freeze)
	FreezeEntityPosition(GetPlayerPed(-1, false), freeze)
end)
--  animação de abrir e fechar a porta
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do 
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent('pk_casas:abrircerrarpuerta')
AddEventHandler('pk_casas:abrircerrarpuerta', function(casanombre)
	if soyelpropietario == 1 then
		if estado == 1 then
			loadAnimDict("switch@trevor@stripclub")
			TaskPlayAnim(GetPlayerPed(-1), "switch@trevor@stripclub" ,"trev_leave_stripclub_idle" ,8.0, -8.0, -1, 0, 0, false, false, false )
			TriggerEvent('pk_casas:freezePlayer1', true)
			Citizen.Wait(1500)
			TriggerEvent('pk_casas:freezePlayer1', false)
			ClearPedTasks(ped1)
			TriggerServerEvent('pk_casas:puerta',0,casanombre)
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
		elseif estado == 0 then
			loadAnimDict("switch@trevor@stripclub")
			TaskPlayAnim(GetPlayerPed(-1), "switch@trevor@stripclub" ,"trev_leave_stripclub_idle" ,8.0, -8.0, -1, 0, 0, false, false, false )
			TriggerEvent('pk_casas:freezePlayer1', true)
			Citizen.Wait(1500)
			TriggerEvent('pk_casas:freezePlayer1', false)
			ClearPedTasks(ped1)
			TriggerServerEvent('pk_casas:puerta',1,casanombre)
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
		end
	end	
end)

-- Novo menu para aceder ao cofre e gerir o guarda roupa
function AbrirMenuArmario(propiedad)
	local propiedad = propiedad
	local owner = ESX.GetPlayerData().identifier
    local elements = {}
	
	table.insert(elements, {label = '👘 Trocar de Roupa', value = 'player_dressing'})
	table.insert(elements, {label = '❌ Remover Roupa', value = 'remove_cloth'})
	table.insert(elements, {label = '💰 Cofre', value = "property_inventory"})
	
ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
		title    = 'Cofre - ' ..propiedad,
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		
		if data.current.value == 'player_dressing' then

			ESX.TriggerServerCallback('rl_propriedades:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = propiedad .. ' - ' .. 'Roupeiro',
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('rl_propriedades:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('rl_propriedades:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = propiedad .. ' - ' .. 'Remover Roupa',
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('rl_propriedades:removeOutfit', data2.current.value)
					exports['mythic_notify']:SendAlert('success', 'Roupa removida')
				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		elseif data.current.value == "property_inventory" then
			menu.close()
			OpenPropertyInventoryMenu(propiedad, owner)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'room_menu'
		CurrentActionMsg  = 'Pressionar ~INPUT_CONTEXT~ para abrir o menu'
		CurrentActionData = {property = property, owner = owner}
	end)
end


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Menu Propriedade sem Dono
function AbrirMenuNoPropietario(casanombre,precio, cordx, cordy, cordz, entrarosalir)
	local x = cordx
	local y = cordy
	local z = cordz
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
	local elements = {
		{label = "💲 Comprar propiedade - €" ..precio ,value = "comprar"},
		{label = '👓' ..entrarosalir ,value = "visitar"},
		{label = "❌ Cancelar" ,value = "no"}
		}

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'menu_empresa',
			{
			title  = "🏠 Propiedade: "..casanombre ,
			elements = elements,
			align = "top-left"
			},
	function(data, menu)
		if data.current.value == "comprar" then	
			TriggerServerEvent('pk_casas:comprarpropiedad', casanombre, precio)
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "visitar" then 
			for k, j in pairs(TeleportFromTo) do
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.0)then
				DoScreenFadeOut(1000)
				Citizen.Wait(2000)
				SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
				DoScreenFadeIn(1000)
			elseif(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.0)then
				DoScreenFadeOut(1000)
				Citizen.Wait(2000)
				SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
				DoScreenFadeIn(1000)
			end
			end
			menu.close()
		else
			menu.close()
		end
	end,
		function(data, menu)
			menu.close()
		end
		)

end

-- Menu Propriedade onde es o dono
function AbrirMenuSoyElPropietario(nombrepropietario,casanombre,precio, x, y, z,entrarosalir)
local pos = GetEntityCoords(GetPlayerPed(-1), true)
	local elements = {}
		if entrarosalir == 'Entrar' then
			table.insert(elements, { label = '🚪 '..entrarosalir.." em casa" ,value = "entrar"})
		else
			table.insert(elements, { label = '🚪 '..entrarosalir.." de casa" ,value = "entrar"})
		end
		if estado == 0 then
			table.insert(elements, { label = '🔑 Destrancar porta' , value = 'destrancar'})
		elseif estado == 1 then
			table.insert(elements, { label = '🔑 Trancar porta' , value = 'trancar'})
		end
		if mventa == 0 then 
			table.insert(elements, { label = "💸 Vender" ,value = "ponerenventa" })
		elseif mventa > 0 then
			table.insert(elements, { label = "💸 Retirar de venda" ,value = "sacarventa" })
			table.insert(elements, { label = "🔖 Trocar preço de venda" ,value = "cambiarvalor" })
		end
		table.insert(elements, { label = "❌ Cancelar" ,value = "no" })

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'menu_empresa',
			{
			title  = "🏠 Propriedade: "..casanombre,
			elements = elements,
			align = "top-left"
			},
	function(data, menu)
		if data.current.value == 'trancar' then
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			TriggerEvent('pk_casas:abrircerrarpuerta',casanombre)
		elseif data.current.value == 'destrancar' then
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			TriggerEvent('pk_casas:abrircerrarpuerta',casanombre)
		elseif data.current.value == "entrar" then 
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			Citizen.Wait(10)
			if estado == 1 then
				for k, j in pairs(TeleportFromTo) do
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.0)then
						DoScreenFadeOut(1000)
						Citizen.Wait(2000)
						SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
						DoScreenFadeIn(1000)
					elseif(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.0)then
						DoScreenFadeOut(1000)
						Citizen.Wait(2000)
						SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
						DoScreenFadeIn(1000)
					end
				end
			elseif estado == 0 then
				--TriggerEvent('chatMessage', 'PROPIEDADE', {255, 0, 0},"La casa esta Fechada.")
				exports['mythic_notify']:SendAlert('error', 'Porta trancada!')
			end
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "abrir" then 
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			Citizen.Wait(10)
			if estado == 1 then
				--TriggerEvent('chatMessage', 'PROPIEDAD', {255, 0, 0},"La casa ya se encuentra Aberta.")
				exports['mythic_notify']:SendAlert('error', 'A propriedade já se encontra aberta!')
			elseif estado == 0 then
				TriggerServerEvent('pk_casas:puerta',1,casanombre)
				Citizen.Wait(500)
				TriggerServerEvent('pk_casas:checkcasa',casanombre)
			end
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "cerrar" then 
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			Citizen.Wait(10)
			if estado == 1 then
				TriggerServerEvent('pk_casas:puerta',0,casanombre)
				Citizen.Wait(500)
				TriggerServerEvent('pk_casas:checkcasa',casanombre)
			elseif estado == 0 then
				exports['mythic_notify']:SendAlert('error', 'A propriedade já se encontra fechada!')
			end
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "ponerenventa" then 
			ESX.UI.Menu.Open(
                                    'dialog', GetCurrentResourceName(), 'steal_inventory_item',
                                    {
                                      title ='Preço de venda? €'
                                    },
			function(data2, menu2)
               local amount = tonumber(data2.value)
			  TriggerServerEvent('pk_casas:ponerenventa',casanombre, amount)                     
              menu2.close()
              menu.close()      
			end,
			function(data2, menu2)
               menu2.close()
			end
			)
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "sacarventa" then 
			TriggerServerEvent('pk_casas:sacarenventa',casanombre, 0)
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "cambiarvalor" then 
			ESX.UI.Menu.Open(
                                    'dialog', GetCurrentResourceName(), 'steal_inventory_item',
                                    {
                                      title ='Actualizar o preço de venda? €'
                                    },
			function(data2, menu2)
               local amount = tonumber(data2.value)
			  TriggerServerEvent('pk_casas:ponerenventa',casanombre, amount)
                                    
              menu2.close()
              menu.close()
                                    
			end,
			function(data2, menu2)
               menu2.close()
			end
			)
			menu.close()
		else
			menu.close()
		end
	end,
		function(data, menu)
			menu.close()
		end
		)

end

-- Menu Propriedade com dono onde n es o dono (visitar 1 amigo)
function AbrirMenuConPropietario(nombrepropietario,casanombre,precio, x, y, z,entrarosalir)
local pos = GetEntityCoords(GetPlayerPed(-1), true)
	local elements = {}
	if mventa > 0 then 
		if entrarosalir == 'Entrar' then
			table.insert(elements, { label = '🚪 '..entrarosalir.." em casa" ,value = "entrar"})
		else
			table.insert(elements, { label = '🚪 '..entrarosalir.." de casa" ,value = "entrar"})
		end
		table.insert(elements, { label = "💵 Comprar propriedade: €" ..mventa ,value = "comprarcasa" })
		table.insert(elements, { label = "❌ Cancelar" ,value = "no" })
	elseif mventa == 0 then
		if entrarosalir == 'Entrar' then
			table.insert(elements, { label = '🚪 '..entrarosalir.." em casa" ,value = "entrar"})
		else
			table.insert(elements, { label = '🚪 '..entrarosalir.." de casa" ,value = "entrar"})
		end
		table.insert(elements, { label = "❌ Cancelar" ,value = "no" })
	end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'menu_empresa',
			{
			title  = "🏠 Propriedade - "..casanombre,
			elements = elements,
			align = "top-left"
			},
	function(data, menu)
		if data.current.value == "entrar" then 
			TriggerServerEvent('pk_casas:checkcasa',casanombre)
			Citizen.Wait(10)
			if estado == 1 then
				for k, j in pairs(TeleportFromTo) do
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.0)then
						DoScreenFadeOut(1000)
						Citizen.Wait(2000)
						SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
						DoScreenFadeIn(1000)
					elseif(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.0)then
						DoScreenFadeOut(1000)
						Citizen.Wait(2000)
						SetEntityCoords(GetPlayerPed(-1), j.positionFrom.x, j.positionFrom.y, j.positionFrom.z - 1)
						DoScreenFadeIn(1000)
					end
				end
			elseif estado == 0 then
				--TriggerEvent('chatMessage', 'PROPIEDAD', {255, 0, 0},"La casa esta Fechada.")
				exports['mythic_notify']:SendAlert('error', 'A propriedade já se encontra fechada!')
			end
			menu.close()
		else
			menu.close()
		end
		if data.current.value == "comprarcasa" then 
			TriggerServerEvent('pk_casas:comprarpropiedad',casanombre,mventa)
			menu.close()
		else
			menu.close()
		end
	end,
		function(data, menu)
			menu.close()
		end
		)

end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*10
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end


--funcao para aceder ao cofre usando o inventoryhud
function OpenPropertyInventoryMenu(propiedad, owner)
	ESX.TriggerServerCallback("rl_propriedades:getPropertyInventory", function(inventory)
		TriggerEvent("esx_inventoryhud:openPropertyInventory", inventory)
	end, owner)
end
