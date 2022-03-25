JobData = {}

RegisterServerEvent('sfw_carthief:startHeist')
AddEventHandler('sfw_carthief:startHeist', function(data)
    local Source = source
    local entity = GetPlayerPed(Source)
    local coords = GetEntityCoords(entity)

    local dist = #(coords - Config.Locations.Starting)

    if not JobData[Source] and dist < 5 then
        StartJob(Source)
        TriggerClientEvent("sfw_carthief:ShowNotification", Source, "Job started, your car is next to this building.")
    else
        TriggerClientEvent("sfw_carthief:ShowNotification", Source, "Can not start the job.")
        return
    end
end)

function StartJob(TargetId)
    local car = CreateAutomobile(GetRandomVehicle(), Config.Vehicles.Spawn, Config.Vehicles.Heading)
    JobData[TargetId] = {
        car = NetworkGetNetworkIdFromEntity(car),
        destination = GetRandomDestinationIndex()
    }

    TriggerClientEvent('sfw_carthief:setPlayerOnJob', TargetId, JobData[TargetId])
end

function GetRandomDestinationIndex()
    local destination = Config.Destinations[math.random(1, #Config.Destinations)]
    return destination
end

function GetRandomVehicle()
    local vehicle = Config.Vehicles.Models[math.random(1, #Config.Vehicles.Models)]
    return vehicle
end