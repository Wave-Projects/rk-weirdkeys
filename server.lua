RegisterNetEvent("rk:weirdkeys:log", function()
    local plyName = GetPlayerName(source)
    local ids = GetPlayerIdentifiers(source)[1]
    local reason = "Weird Keys Detected"

    local whData = {
        title = plyName,
        color = 16711689,
        message = 
        '**[User]: **'..plyName..'\n'..
        '**[Identifier]: **'..ids..'\n'..
        '**[Reason]: **'..reason..'\n'
    }

    RK.Title = whData.title
    RK.Color = whData.color
    RK.Message = whData.message

    SendWebHook(RK.Webhooklink, RK.Title, RK.Color, RK.Message)
end)

function SendWebHook(whLink, title, color, message)
    local embedMsg = {}
    RK.Timestamp = os.date("%c")
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] =  ""..message.."",
            ["footer"] ={
                ["text"] = RK.Timestamp..".",
            },
        }
    }
    PerformHttpRequest(whLink,
    function(err, text, headers)end, 'POST', json.encode({username = "Weird Keys", embeds = embedMsg}), { ['Content-Type']= 'application/json' })
end
