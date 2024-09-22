--hi

local rep = "https://raw.githubusercontent.com/NuIlFire/NullFire/main/Games/"

if game.PlaceId == 6839171747 then
    loadstring(game:HttpGet(rep.."Doors.lua"))()
elseif game.PlaceId == 12552538292 then
    lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Fire-Hub/main/Core/UI-Library"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Fire-Hub/main/Core/Scripts/Pressure/Loader.lua")()
else
    game.Players.LocalPlayer:Kick('Game is not added yet! Wait for balz')
end
