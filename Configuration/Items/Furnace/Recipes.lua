-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.Furnace.Recipes
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local u1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems).itemIdFromName
local v3 = {
    ["itemIdFromName"] = function(p2) --[[ Name: itemIdFromName, Line 6 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1(p2, true) or 10000
    end
}
return {
    [v3.itemIdFromName("beef")] = v3.itemIdFromName("cooked_beef"),
    [v3.itemIdFromName("porkchop")] = v3.itemIdFromName("cooked_porkchop"),
    [v3.itemIdFromName("coffee_beans")] = v3.itemIdFromName("roasted_coffee_beans"),
    [v3.itemIdFromName("pizza_pepperoni")] = v3.itemIdFromName("cooked_pizza_pepperoni"),
    [v3.itemIdFromName("nether_quartz_ore")] = v3.itemIdFromName("gold_ingot"),
    [v3.itemIdFromName("granite")] = v3.itemIdFromName("copper_ingot"),
    [v3.itemIdFromName("acacia_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("acacia_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("birch_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("birch_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("dark_oak_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("dark_oak_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("jungle_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("jungle_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("oak_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("oak_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("spruce_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("spruce_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_acacia_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_acacia_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_birch_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_birch_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_dark_oak_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_dark_oak_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_jungle_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_jungle_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_oak_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_oak_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_spruce_log")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("stripped_spruce_wood")] = v3.itemIdFromName("charcoal"),
    [v3.itemIdFromName("coal_ore")] = v3.itemIdFromName("coal"),
    [v3.itemIdFromName("cobblestone")] = v3.itemIdFromName("stone"),
    [v3.itemIdFromName("diamond_ore")] = v3.itemIdFromName("diamond"),
    [v3.itemIdFromName("gold_ore")] = v3.itemIdFromName("gold_ingot"),
    [v3.itemIdFromName("iron_ore")] = v3.itemIdFromName("iron_ingot"),
    [v3.itemIdFromName("sand")] = v3.itemIdFromName("glass")
}