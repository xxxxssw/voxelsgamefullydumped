-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1039.IdolClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("Workspace")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(game.ReplicatedStorage.Libs.Coordinates)
if script:IsDescendantOf(v1.Map) then
    local u4 = script.Parent
    local u5 = v3.fromBlockInstance(u4)
    v2.Systems.BlocksSystem.BlocksFunctions.idol.Network.OnClientEvent:Connect(function(p6) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
        --]]
        if u5 == p6 then
            u4.Hitbox.Blessing:Play()
            for _, v7 in ipairs(u4.Hitbox.Attachment:GetChildren()) do
                v7.Enabled = true
            end
            task.wait(1.25)
            for _, v8 in ipairs(u4.Hitbox.Attachment:GetChildren()) do
                v8.Enabled = false
            end
        end
    end)
end