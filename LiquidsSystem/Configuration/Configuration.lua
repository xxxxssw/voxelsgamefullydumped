-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Configuration.Configuration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = {}
local v2 = {
    ["MAX_SPREAD"] = 3,
    ["BlocksUpdate"] = {
        [require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks).getBlockIdFromName("water")] = true
    },
    ["Infinite"] = true
}
v1.Water = v2
return v1