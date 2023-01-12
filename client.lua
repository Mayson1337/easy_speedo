local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = exports["es_extended"]:getSharedObject()

local zones = { ['AIRP'] = "Airport LS", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "Klub Golfowy", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port LS", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', }
local tekstLokalizacji = ''
local tekstDzien = ''
local pogodaHash = ''

-- CONFIG


hasKM = 0
showKM = 0

-- START

Citizen.CreateThread(function()
    while true do 
      Citizen.Wait(500)
    end
  end)

-- HUD

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(150)
      local playerPed = GetPlayerPed(-1)
      if IsPedInAnyVehicle(playerPed, true) then
        SendNUIMessage({action = "toggleCar", show = true})
        oczekiwanie = 150
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        fuel = math.floor(GetVehicleFuelLevel(playerVeh)+0.0)		
        SendNUIMessage({action = "updateGas", key = "gas", value = fuel})
        lokalizacja = false
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle then
          carSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
          gear = GetVehicleCurrentGear(vehicle)
          SendNUIMessage({action = "setkmh", kmh = carSpeed})
        end
      else
        SendNUIMessage({action = "toggleCar", show = false})
      end
    end
  end)


-- VEHICLE HUD

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(500)
      local playerPed = PlayerPedId()
      if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local lockStatus = GetVehicleDoorLockStatus(vehicle)

        if GetIsVehicleEngineRunning(vehicle) == false then
          SendNUIMessage({action = "engineSwitch", status = false})
        else
          SendNUIMessage({action = "engineSwitch", status = true})
        end
        if (lockStatus == 0 or lockStatus == 1) then
          SendNUIMessage({action = "lockSwitch", status = true})
        elseif lockstatus ~= 0 and lockstatus ~= 1 then
          SendNUIMessage({action = "lockSwitch", status = false})
        end
      end
    end
  end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
      local Ped = GetPlayerPed(-1)
      if(IsPedInAnyVehicle(Ped, false)) then
        local PedCar = GetVehiclePedIsIn(Ped, false)
        carSpeed = math.ceil(GetEntitySpeed(PedCar) * 2.0)
        SendNUIMessage({
            showhud = true,
            speed = carSpeed
          })
      end
    end
  end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(500)
      local pos = GetEntityCoords(GetPlayerPed(-1))
      local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
      local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]

      if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z)) then
        if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1))) then
          SendNUIMessage({action = "setstreet", street = tostring(GetStreetNameFromHashKey(var1))})
        end
      end

    end
  end)


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(250)
      if IsPedInAnyVehicle(PlayerPedId(), false) and not inVeh then
        -- print('player is now in a vehicle')
        Citizen.Wait(50)
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        local driver = GetPedInVehicleSeat(veh, -1)
        if driver == PlayerPedId() and GetVehicleClass(veh) ~= 13 and GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 17 and GetVehicleClass(veh) ~= 21 then
          inVeh = true
          Citizen.Wait(50)
          vehPlate = GetVehicleNumberPlateText(veh)
          Citizen.Wait(1)
          -- print(vehPlate)
          ESX.TriggerServerCallback('esx_carmileage:getMileage', function(hasKM)
              showKM = math.floor(hasKM*1.33)/1000
              local oldPos = GetEntityCoords(PlayerPedId())
              Citizen.Wait(1000)
              local curPos = GetEntityCoords(PlayerPedId())
              if IsVehicleOnAllWheels(veh) then
                dist = GetDistanceBetweenCoords(oldPos.x, oldPos.y, oldPos.z, curPos.x, curPos.y, curPos.z, true)
              else
                dist = 0
              end
              hasKM = hasKM + dist
              TriggerServerEvent('esx_carmileage:addMileage', vehPlate, hasKM)
              inVeh = false
            end, GetVehicleNumberPlateText(veh))
        else
          -- print("salimos del bucle xq somos pasajero")
        end
      end
    end
  end)

displayHud = true

Citizen.CreateThread(function()
    while true do
      if IsPedInAnyVehicle(PlayerPedId(), false) then
        HideHudComponentThisFrame(9)
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        local driver = GetPedInVehicleSeat(veh, -1)
        if driver == PlayerPedId() and GetVehicleClass(veh) ~= 13 and GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 17 and GetVehicleClass(veh) ~= 21 then
          SendNUIMessage({action = "updateKM", key = "km", value = round(showKM, 2)})
        end
      else
        Citizen.Wait(750)
      end

      Citizen.Wait(0)
    end
  end)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end