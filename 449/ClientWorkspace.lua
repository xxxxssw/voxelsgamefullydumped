-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.449.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u4 = script.Parent
    local function v8() --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
        --]]
        local v5 = u4:GetAttribute(u3.ATTRIBUTE)
        local v6 = u3.getBlockId(v5)
        local v7 = u3.getMetadata(v5) or {}
        if u2.getProperty(v6, v7.compressed, "type") == "double" then
            u4.Geometry_top.Transparency = 0
            u4.Geometry_top.CanCollide = true
        else
            u4.Geometry_top.Transparency = 1
            u4.Geometry_top.CanCollide = false
        end
    end
    u4:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v8)
    v8()
end