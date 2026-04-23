-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.ClientConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local v2 = {
    [v1.getBlockIdFromName("crafting_table")] = {
        ["handleByPlayerWindow"] = true,
        ["windowName"] = "CraftingTable"
    },
    [v1.getBlockIdFromName("ender_chest")] = {
        ["windowName"] = "Chest",
        ["displayName"] = "Ender Chest",
        ["formatName"] = "Enderchest"
    },
    [v1.getBlockIdFromName("void_chest")] = {
        ["displayName"] = "Shulker Box",
        ["windowName"] = "Chest"
    }
}
return v2