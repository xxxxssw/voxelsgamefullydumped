-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.IsStorageBlockState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Libs.BlockState)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
return function(p3) --[[ Name: IsStorageBlockState, Line 4 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v4 = u1.getBlockId(p3)
    return u2.StorageBlocksFormats[v4] ~= nil
end