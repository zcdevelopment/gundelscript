CurrentVersion = '1.0'

print("-------------------------------")
print("| ZC Developments Delete Gun Script |")
print("|     Current Version: " .. CurrentVersion .. "    |")
print("-------------------------------")


AddEventHandler('chatMessage', function(source, n, msg)
    local chatMsg = string.lower(msg)
    if chatMsg == "/delgunon" then
        TriggerClientEvent('DelGunOn', source)
        CancelEvent()
    elseif chatMsg == "/delgunoff" then
        TriggerClientEvent('DelGunOff', source)
        CancelEvent()
    end
end)
    