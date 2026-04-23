-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1041.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
require(game.ReplicatedStorage.Libs.BlockMetadata)
local v2 = require(game.ReplicatedStorage.Libs.Coordinates)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockOrientation.UtilsOrientation)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u4 = script.Parent
    local u5 = require(game.ReplicatedStorage.Systems.BlocksSystem.BlocksFunctions.Painting)
    local u6 = v2.coordinatesFromWorkspaceVector3(u4.PrimaryPart.Position)
    u4:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(function() --[[ Name: onBlockStateChanged, Line 22 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u5
            [4] = u6
        --]]
        local v7 = u4:GetAttribute(u3.ATTRIBUTE)
        u5.clientRendered(v7, u6, u4)
    end)
    local v8 = u4:GetAttribute(u3.ATTRIBUTE)
    u5.clientRendered(v8, u6, u4)
end