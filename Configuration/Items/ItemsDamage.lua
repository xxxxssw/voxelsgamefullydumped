-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.ItemsDamage
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v2 = {
    [v1.itemIdFromName("arrow")] = 4,
    [v1.itemIdFromName("wooden_sword")] = 3,
    [v1.itemIdFromName("wooden_axe")] = 3,
    [v1.itemIdFromName("wooden_pickaxe")] = 2,
    [v1.itemIdFromName("wooden_shovel")] = 2,
    [v1.itemIdFromName("stone_sword")] = 4,
    [v1.itemIdFromName("stone_axe")] = 4,
    [v1.itemIdFromName("stone_pickaxe")] = 2,
    [v1.itemIdFromName("stone_shovel")] = 2,
    [v1.itemIdFromName("iron_sword")] = 5,
    [v1.itemIdFromName("iron_axe")] = 5,
    [v1.itemIdFromName("iron_pickaxe")] = 3,
    [v1.itemIdFromName("iron_shovel")] = 3,
    [v1.itemIdFromName("golden_sword")] = 5,
    [v1.itemIdFromName("golden_axe")] = 5,
    [v1.itemIdFromName("golden_pickaxe")] = 3,
    [v1.itemIdFromName("golden_shovel")] = 3,
    [v1.itemIdFromName("mythril_sword")] = 5,
    [v1.itemIdFromName("mythril_axe")] = 5,
    [v1.itemIdFromName("mythril_pickaxe")] = 3,
    [v1.itemIdFromName("mythril_shovel")] = 3,
    [v1.itemIdFromName("diamond_sword")] = 6,
    [v1.itemIdFromName("diamond_axe")] = 6,
    [v1.itemIdFromName("diamond_pickaxe")] = 3,
    [v1.itemIdFromName("diamond_shovel")] = 3,
    [v1.itemIdFromName("netherite_sword")] = 7,
    [v1.itemIdFromName("netherite_axe")] = 7,
    [v1.itemIdFromName("netherite_pickaxe")] = 3,
    [v1.itemIdFromName("netherite_shovel")] = 3,
    [v1.itemIdFromName("olmec_hammer")] = 5,
    [v1.itemIdFromName("khepesh")] = 5,
    [v1.itemIdFromName("fire_sword")] = 5
}
for v3, _ in v2 do
    if string.find(v1.getItemName(v3), "mythril") then
        local v4 = string.gsub(v1.getItemName(v3), "mythril", "diamond")
        local v5 = v1.itemIdFromName(v4, true)
        if v1.itemIdExists(v5) and v2[v5] then
            v2[v3] = v2[v5]
        end
    end
end
return v2