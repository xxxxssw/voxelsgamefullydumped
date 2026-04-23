-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.169.LeverClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
local _ = script.Parent
if not script:IsDescendantOf(v1) then
    local u3 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u4 = script.Parent
    local u5 = 0
    local function v9(_) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
            [4] = u5
        --]]
        local v6 = u4:GetAttribute(u2.ATTRIBUTE)
        local v7 = u2.getBlockId(v6)
        local v8 = u2.getMetadata(v6) or {}
        if u3.getProperty(v7, v8.compressed, "powered") then
            u4.On.Transparency = 0
            u4.Off.Transparency = 1
        else
            u4.On.Transparency = 1
            u4.Off.Transparency = 0
        end
        if u5 > 1 then
            u4.PrimaryPart.Sound:Play()
        end
        u5 = u5 + 1
    end
    u4:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v9)
    v9(true)
end