--hi

local rep = "https://raw.githubusercontent.com/NuIlFire/NullFire/main/Games/"

local s, e = pcall(function()
    return getgenv().request({
    Url = "https://raw.githubusercontent.com/NuIlFire/NullFire/refs/heads/main/jhbfgs.json",
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
    if not found then
        warn("game probably not supported yet")
    end
else
    warn("failed to get supported data "..e)
end
