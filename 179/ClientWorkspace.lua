-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.179.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u4 = script.Parent
    local function v9() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
        --]]
        local v5 = u4:GetAttribute(u3.ATTRIBUTE)
        local v6 = u3.getBlockId(v5)
        local v7 = u3.getMetadata(v5) or {}
        local v8 = u2.getPropertiesValuesTable(v6, v7.compressed)
        script.Parent.Geometry1.Material = v8.lit == true and Enum.Material.Neon or Enum.Material.SmoothPlastic
    end
    u4:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v9)
    v9()
end