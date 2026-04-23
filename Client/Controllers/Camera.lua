-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.Controllers.Camera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
local v2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("Lighting")
if not game.Players.LocalPlayer.Character then
    game.Players.LocalPlayer.CharacterAdded:Wait()
end
local u5 = require(game.ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater)
local u6 = v1.CurrentCamera
local u7 = v3.Client.States.CameraInWater
local u8 = Instance.new("ColorCorrectionEffect")
u8.Parent = v4
u8.Enabled = false
u8.TintColor = Color3.fromRGB(156, 220, 255)
u8.Saturation = -0.4
v2.RenderStepped:Connect(function() --[[ Name: update, Line 18 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u6
    --]]
    u7.Value = u5(u6.CFrame.Position)
end)
u7.Changed:Connect(function(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.Enabled = p9
end)