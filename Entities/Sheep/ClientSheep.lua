-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Entities.Sheep.ClientSheep
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u1 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local u2 = require(game.ReplicatedStorage.Configuration.Colors)
local u3 = script.Parent
local u4 = u3:WaitForChild("Wool", (1 / 0))
u4:WaitForChild("WoolBody", (1 / 0))
local function v7() --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u4
        [4] = u2
    --]]
    local v5 = u1.readEntityData(u3)
    u4.WoolBody.Transparency = v5.wool and 0 or 1
    for _, v6 in ipairs(u4:GetChildren()) do
        v6.Color = u2[v5.color]
    end
end
u3:GetAttributeChangedSignal("EntityData"):Connect(v7)
v7()