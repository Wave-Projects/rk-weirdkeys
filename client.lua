
RK.TimesPressed = 0

CreateThread(function()
    local ped = PlayerPedId()
    while true do 
        Wait(0)
        for _,v in pairs(RK.WeirdKeys) do
            if IsControlPressed(0, v) then 
                RK.TimesPressed = RK.TimesPressed + 1
                SetTimeout(1000 * 60 * RK.ResetTime, function()
                    RK.TimesPressed = 0
                end)
                if RK.TimesPressed >= RK.PressesCount then
                    TriggerServerEvent("rk:weirdkeys:log", RK.TimesPressed)
                    RK.TimesPressed = 0
                end
            end
        end
    end
end)