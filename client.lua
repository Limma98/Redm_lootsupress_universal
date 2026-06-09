-- client.lua
local function IsHumanPed(ped)
    return Citizen.InvokeNative(0xB980061DA992779D, ped)
end

local function IsPedHogtied(ped)
    return Citizen.InvokeNative(0x3AA24CCC0D451379, ped)
end

local processedPeds = {}

CreateThread(function()
    while true do
        Wait(500)

        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local handle, ped = FindFirstPed()
        local found = true

        while found do
            if ped ~= player and not processedPeds[ped] then
                local dist = #(playerCoords - GetEntityCoords(ped))

                if dist < 50.0 and IsHumanPed(ped) then
                    -- Apply to dead peds AND hogtied peds
                    if IsPedDeadOrDying(ped, true) or IsPedHogtied(ped) then
                        SetLootingFlag(ped, 0, false) -- LOOT_FLAG_CAN_BE_LONG_LOOTED
                        SetLootingFlag(ped, 1, false) -- LOOT_FLAG_CAN_BE_QUICK_LOOTED
                        processedPeds[ped] = true
                    end
                end
            end
            found, ped = FindNextPed(handle)
        end

        EndFindPed(handle)
    end
end)

-- Flush processed peds every 60s
CreateThread(function()
    while true do
        Wait(60000)
        processedPeds = {}
    end
end)
