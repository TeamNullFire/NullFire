--hi

local rep = "https://raw.githubusercontent.com/NuIlFire/NullFire/main/Games/"

if game.PlaceId == 6839171747 then
    loadstring(game:HttpGet(rep.."Doors.lua"))()
else
    game.Players.LocalPlayer:Kick('Game is not added yet! Wait for balz')
end
