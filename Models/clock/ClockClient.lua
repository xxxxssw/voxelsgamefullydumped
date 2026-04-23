-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Models.clock.ClockClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Lighting")
local v2 = script.Parent
local v3 = v1:GetMinutesAfterMidnight() / 60
v2.Hitbox.SurfaceGui.Clock.Needle.Rotation = v3 * 15 - 90
while task.wait(6) do
    local v4 = v1:GetMinutesAfterMidnight() / 60
    v2.Hitbox.SurfaceGui.Clock.Needle.Rotation = v4 * 15 - 90
end