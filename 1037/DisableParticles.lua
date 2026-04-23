-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1037.DisableParticles
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("Workspace")
local v2 = game:GetService("ReplicatedStorage")
local v3 = script.Parent
if not v3:IsDescendantOf(v2) then
    if not v3:IsDescendantOf(v1.Map) then
        for _, v4 in ipairs(v3:GetDescendants()) do
            if v4:IsA("PointLight") then
                v4.Enabled = false
            elseif v4:IsA("ParticleEmitter") then
                v4.Enabled = false
            end
        end
    end
end