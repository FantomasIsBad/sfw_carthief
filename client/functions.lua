function IsSpawnOccupied()
    local ray = StartShapeTestCapsule(
		Config.Vehicles.Spawn.x, Config.Vehicles.Spawn.y, Config.Vehicles.Spawn.z, 
        Config.Vehicles.Spawn.x, Config.Vehicles.Spawn.y, Config.Vehicles.Spawn.z, 
		2.5, 10, nil, 7
	)

    local _, hit = GetShapeTestResult(ray)
    return hit == 0
end

function ShowNotification(message)
    BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(message)
	EndTextCommandThefeedPostTicker(0,1)
end

RegisterNetEvent('sfw_carthief:ShowNotification')
AddEventHandler('sfw_carthief:ShowNotification', function(message)
    ShowNotification(message)
end)