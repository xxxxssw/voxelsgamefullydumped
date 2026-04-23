-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.153.ClientSign
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
require(game.ReplicatedStorage.Libs.BlockMetadata)
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Configuration.Colors)
if not script:IsDescendantOf(v1) then
    local u4 = script.Parent
    local u5 = u4:FindFirstChild("TextLabel", true)
    local function v8() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u5
            [4] = u3
        --]]
        local v6 = u4:GetAttribute(u2.ATTRIBUTE)
        u2.getBlockId(v6)
        local v7 = u2.getMetadata(v6) or {}
        u5.Text = v7.filteredText or ""
        u5.TextColor3 = u3[v7.textColor or "white"]
    end
    u4:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v8)
    v8()
end