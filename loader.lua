--hi

local rep = "https://raw.githubusercontent.com/TeamNullFire/NullFire/main/Games/"

local s, e = pcall(function()
    return getgenv().request({
        Url = "https://raw.githubusercontent.com/TeamNullFire/NullFire/refs/heads/main/jhbfgs.json",
        Method = "GET",
        Body = nil,
        Headers = {}
    })
end)

local suc,easd = pcall(function()
    return getgenv().request({
        Url = "https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Core/Data/SupportedGames.json",
        Method = "GET",
        Body = nil,
        Headers = {}
    })
end)

local found = false

if s then
    local data = e.Body
    local dfnasdb = game:GetService("HttpService"):JSONDecode(data)
    for i,v in pairs(dfnasdb) do
        if v.GameId == game.GameId then
            found = true
            loadstring(game:HttpGet(rep..i..".lua"))()
            break
        end
    end

    if suc and not found then
        local cherrydata = game.HttpService:JSONDecode(easd.Body)
        for i,v in cherrydata do
            if typeof(v) == "table" and table.find(v, game.PlaceId) then
                found = true
                loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
                break
            end
        end
    elseif not suc then
        warn("failed to get cherry's supported data")
    end

    if not found then
        loadstring(game:HttpGet(rep.."Universal.lua"))()
    end
else
    warn("failed to get supported data "..e)
end
