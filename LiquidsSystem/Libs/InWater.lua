-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local v2 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
local u4 = require(game.ReplicatedStorage.Libs.BlockState)
local u5 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
v2.getBlockIdFromName("water")
return function(u6) --[[ Name: InWater, Line 9 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u5
        [4] = u4
    --]]
    local u7 = nil
    local v8, _ = pcall(function() --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u1
            [3] = u3
            [4] = u6
        --]]
        u7 = u1.getBlockState(u3.coordinatesFromWorkspaceVector3(u6))
    end)
    if v8 and u7 then
        return u5.Liquids[u4.getBlockId(u7)]
    else
        return false
    end
end