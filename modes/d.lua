local LP = game:GetService("Players").LocalPlayer
local room = workspace:WaitForChild("CurrentRooms", 9e9):WaitForChild("0", 9e9)

local shopui = LP.PlayerGui:WaitForChild("MainUI", 9e9):FindFirstChild("ItemShop")
local rems = game:GetService("ReplicatedStorage").RemotesFolder
if not shopui or not shopui.Visible then rems.PlayAgain:FireServer(); return end
if shopui then shopui.Visible = false end

local key: Model = room:WaitForChild("Assets", 9e9):WaitForChild("KeyObtain", 9e9)
local hitbox = key:WaitForChild("Hitbox", 9e9)
LP.Character:PivotTo(hitbox:GetPivot())
repeat 
    task.wait()
    LP.Character:PivotTo(hitbox:GetPivot())
until LP.Character:FindFirstChild("Key")

local door = room:WaitForChild("Door", 9e9)
local hidden = door:WaitForChild("Hidden", 9e9)
local unlockprompt: ProximityPrompt = door:WaitForChild("Lock", 9e9):WaitForChild("UnlockPrompt", 9e9)
local latestroom = game:GetService("ReplicatedStorage").GameData.LatestRoom

repeat
    LP.Character:PivotTo(hidden:GetPivot())
    unlockprompt.HoldDuration = 0
    fireproximityprompt(unlockprompt)
    task.wait()
until latestroom.Value ~= 0

if replicatesignal then
    replicatesignal(LP.Kill)
else
    rems.Underwater:FireServer(true)
end

LP:GetAttributeChangedSignal("Alive"):Wait()

local queue = queue_on_teleport or queueonteleport
rems.PlayAgain:FireServer()
queue([[
loadstring(game:HttpGet("https://raw.githubusercontent.com/TeamNullFire/NullFire/refs/heads/main/modes/d.lua"))()
]])
