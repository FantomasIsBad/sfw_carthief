local CREATE_AUTOMOBILE = `CREATE_AUTOMOBILE`
function CreateAutomobile(hash, coords, angle)
    local v = Citizen.InvokeNative(CREATE_AUTOMOBILE, hash, coords.x, coords.y, coords.z)

    if DoesEntityExist(v) then
        SetEntityHeading(v, angle+0.0)
        return v
    end

    return nil
end