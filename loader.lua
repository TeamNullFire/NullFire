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

if s then
    local data = e.Body
    local dfnasdb = game:GetService("HttpService"):JsonDecode(data)

    for i,v in dfnasdb do
        if v.GameId == game.GameId then
            loadstring(game:HttpGet(rep..i..".lua"))()
        end
    end
end
