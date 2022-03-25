--[[ 
    1) Marker / DONE
        2) Dojdu, dostanu random auto / DONE
            3) Nastavi se blip route a dojedu do destinace / DONE?
                4) Cestou tam dostanou pd oznameni
                    5) Az dojedu s autem, dostanu penize
                        6) Pro auto si dojde npc
                            7) NPC utece, pokud na nej nekdo zamiri
                                8) NPC musi prijit az ke mne, aby mi dal penize
 ]]

CreateThread(function()
    AddTextEntry('sfw_carthief:SpawnCarText', '~INPUT_CONTEXT~ Spawn car')
    while true do
        if not IsOnJob() then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Config.Locations.Starting)

            if distance < Config.DrawDistance then
                DrawMarker(20, Config.Locations.Starting, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 0, 150, 100, true, true, 2, true, nil, nil, false)
                Wait(0)
            else
                Wait(1500)
            end

            if distance < 1.5 then
                DisplayHelpTextThisFrame('sfw_carthief:SpawnCarText')
                if IsControlJustPressed(0, 38) then 
                    if IsSpawnOccupied() then
                        TriggerServerEvent('sfw_carthief:startHeist')
                    else
                        ShowNotification("Auto se nemuze spawnout. Neco prekazi!")
                    end
                end
            end
        else
            Wait(1500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1500)
        if IsOnJob() then
            local playerInJobVehicle = GetJobVehiclePlayerIsIn()
            if playerInJobVehicle then
                if not DoesBlipExist(blip) then
                    local blip = AddBlipForCoord(JobData[MyServerId].destination)
                    SetBlipRoute(blip, true)
                end
            else
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
            end
        end
    end
end)
 
CreateThread(function()
    local model = `csb_car3guy2`
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end
	spawnedPed = CreatePed(4, model, -762.3788, -1314.2200, 4.1503, 230.0257, false, true)
	SetModelAsNoLongerNeeded(model)
	FreezeEntityPosition(spawnedPed, true)
	SetEntityInvincible(spawnedPed, true)
	SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    TaskStartScenarioInPlace(spawnedPed, "WORLD_HUMAN_SMOKING", -1, true)
end)