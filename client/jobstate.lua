JobData = {}

RegisterNetEvent('sfw_carthief:setPlayerOnJob')
AddEventHandler('sfw_carthief:setPlayerOnJob', function(serverData)
    JobData[MyServerId] = serverData
end)

function IsOnJob()
    return JobData[MyServerId]
end

function GetJobVehiclePlayerIsIn()
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if playerVeh == 0 then
        return false
    end
    local playerVeh = VehToNet(playerVeh)
    if playerVeh == JobData[MyServerId].car then
        return true
    end
end