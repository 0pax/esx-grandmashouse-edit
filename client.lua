ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Create Blips here if you want
if Config.EnableBlip then
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(2433.91, 4965.50, 42.00)
        SetBlipSprite (blip, 357)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 31)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Grandmas House")
        EndTextCommandSetBlipName(blip)
    end)
end

if Config.EnableGrandmaPed then
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        spawnGrandma()
    end)
end

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 68)
end

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(Config.Locations) do
            Citizen.Wait(1)
            local plyCoords = GetEntityCoords(PlayerPedId(), 0)
            local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
            if distance < 10 then
                    if not IsPedInAnyVehicle(PlayerPedId(), true) then
                        if distance < 3 then
                            if Config.EnablePayment then
                                Draw3DText(v.x, v.y, v.z + 0.5, '[~r~E~w~] Check in for ~g~' .. Config.Price .. '$')
                                if IsControlJustReleased(0, 54) then
                                    DisableControlAction(0, 54, true)
                                    if (GetEntityHealth(PlayerPedId()) <= 200) then
                                        exports['mythic_progbar']:Progress({
                                            name = "grandmas_house",
                                            duration = 5000,
                                            label = "Checking In and Getting Treated",
                                            useWhileDead = true,
                                            canCancel = true,
                                            controlDisables = {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            },
                                            animation = {
                                                animDict = "missheistdockssetup1clipboard@base",
                                                anim = "base",
                                                flags = 49,
                                            },
                                            prop = {
                                                model = "p_amb_clipboard_01",
                                                bone = 18905,
                                                coords = { x = 0.10, y = 0.02, z = 0.08 },
                                                rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                            },
                                            propTwo = {
                                                model = "prop_pencil_01",
                                                bone = 58866,
                                                coords = { x = 0.12, y = 0.0, z = 0.001 },
                                                rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                            },
                                        }, function(status)
                                            if not status then
                                                --your revive script code goes here
                                                TriggerEvent('esx_ambulancejob:revive')
                                                --end revive code
                                                TriggerServerEvent('grandmashouse-edited:payBill')
                                                EnableControlAction(0, 54, true)
                                            end
                                        end)
                                    else
                                        exports['mythic_notify']:DoHudText('error', 'You do not need medical attention')
                                    end
                                end
                            end
                        end
                    else
                        Citizen.Wait(1000)
                    end
                end
            end
            end
        end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(Config.Locations) do
            Citizen.Wait(1)
            local plyCoords = GetEntityCoords(PlayerPedId(), 0)
            local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
            if distance < 10 then
                    if not IsPedInAnyVehicle(PlayerPedId(), true) then
                        if distance < 3 then
                            if not Config.EnablePayment then
                                Draw3DText(v.x, v.y, v.z + 0.5, '[~r~E~w~] to check in')
                                if IsControlJustReleased(0, 54) then
                                    DisableControlAction(0, 54, true)
                                    if (GetEntityHealth(PlayerPedId()) <= 200) then
                                        exports['mythic_progbar']:Progress({
                                            name = "grandmas_house",
                                            duration = 5000,
                                            label = "Checking In and Getting Treated",
                                            useWhileDead = true,
                                            canCancel = true,
                                            controlDisables = {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            },
                                            animation = {
                                                animDict = "missheistdockssetup1clipboard@base",
                                                anim = "base",
                                                flags = 49,
                                            },
                                            prop = {
                                                model = "p_amb_clipboard_01",
                                                bone = 18905,
                                                coords = { x = 0.10, y = 0.02, z = 0.08 },
                                                rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                            },
                                            propTwo = {
                                                model = "prop_pencil_01",
                                                bone = 58866,
                                                coords = { x = 0.12, y = 0.0, z = 0.001 },
                                                rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                            },
                                        }, function(status)
                                            if not status then
                                                TriggerEvent('esx_ambulancejob:revive')
                                                exports['mythic_notify']:DoHudText('inform', 'You were treated')
                                                EnableControlAction(0, 54, true)
                                            end
                                        end)
                                    else
                                        exports['mythic_notify']:DoHudText('error', 'You do not need medical attention')
                                    end
                                end
                            end
                        end
                    else
                        Citizen.Wait(1000)
                    end
                end
                end
            end
        end)

function spawnGrandma()
    for k,v in pairs(Config.GrandmasLocation) do
      local ped = GetHashKey(Config.Ped)
      RequestModel(ped)
      while not HasModelLoaded(ped) do 
          Citizen.Wait(1)
      end
      grandma = CreatePed(4, ped, v.x, v.y, v.z, 20.17, false, true)
      SetEntityInvincible(grandma, true)
      FreezeEntityPosition(grandma, true)
      TaskSetBlockingOfNonTemporaryEvents(grandma, true)
    end
  end
