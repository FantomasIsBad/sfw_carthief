MyServerId = nil

Citizen.CreateThread(function()
    while not MyServerId do
        local player = PlayerId()

        if player < 5000 then
            local serverId = GetPlayerServerId(player)

            if serverId > 0 and serverId < 500 then
                MyServerId = serverId
            end
        end

        Wait(1000)
    end
end)