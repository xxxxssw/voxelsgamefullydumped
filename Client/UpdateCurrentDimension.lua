-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.UpdateCurrentDimension
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local u2 = game:GetService("ReplicatedStorage")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
local v4 = require(game.ReplicatedStorage.Systems.WorldSystem.Libs.SafeZone)
local u5 = v1.LocalPlayer
u5:GetAttributeChangedSignal("LastPosition"):Connect(function() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u2
    --]]
    local v6 = u3.coordinatesFromWorkspaceVector3(u5:GetAttribute("LastPosition"))
    u2.Client.States.CurrentDimension.Value = u3.getDimensionId(v6)
end)
if u2.Systems.WorldSystem.MapName.Value == "" then
    u2.Systems.WorldSystem.MapName.Changed:Wait()
end
while task.wait(1) do
    if u5.Character and u5.Character.PrimaryPart then
        local v7 = u3.coordinatesFromWorkspaceVector3(u5.Character.PrimaryPart.Position)
        u2.Client.States.InSafeZone.Value = v4.isCoordinatesIn(v7)
    else
        u2.Client.States.InSafeZone.Value = false
    end
end