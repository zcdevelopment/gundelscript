RegisterNetEvent('GunDelOn')
RegisterNetEvent('GunDelOff')
local toggle = false 

AddEventHandler('GunDelOn', function()
    toggle = true
    response("~b~Del Gun Activated")
end)

AddEventHandler('GunDelOff', function()
    toggle = false
    response("~r~Del Gun De-Activated")
end)

Citizen.CreateThread(function()

while true do 
    Citizen.Wait(0)
    if toggle then 
        local pid = PlayerId()
        if IsPlayerFreeAiming(pid) then 
            local prop = receiveProp(pid)
            if IsPedShooting(pid) then
                SetEntityAsMissionEntity(prop, true, true)
                DeleteEntity(prop)
            end        
        end
    end    
end)

function receiveProp(player)
    local result, pit = GetEntityPlayerIsFreeAimingAt(player)
    return pit
end

function response(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

