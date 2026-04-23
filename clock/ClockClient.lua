-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.clock.ClockClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Lighting")
local v2 = script.Parent:FindFirstChild("Needle", true)
v2.Rotation = v1.ClockTime * 15 - 90
while task.wait(10) do
    v2.Rotation = v1.ClockTime * 15 - 90
end