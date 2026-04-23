-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.ItemsDataChanges
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u2 = require(game.ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData)
local u3 = script
local _ = {
    [v1.itemIdFromName("oak_sign")] = {
        ["displayName"] = "Wooden Sign"
    },
    [v1.itemIdFromName("ender_chest")] = {
        ["displayName"] = "Soulbound Chest",
        ["guiColor"] = Color3.fromRGB(255, 88, 88)
    },
    [v1.itemIdFromName("netherrack")] = {
        ["displayName"] = "Basalt Block"
    },
    [v1.itemIdFromName("soul_sand")] = {
        ["displayName"] = "Ashes Block"
    },
    [v1.itemIdFromName("magma_block")] = {
        ["displayName"] = "Magma"
    },
    [v1.itemIdFromName("nether_quartz_ore")] = {
        ["displayName"] = "Gilded Basalt Block"
    },
    [v1.itemIdFromName("beef")] = {
        ["displayName"] = "Raw Patty"
    },
    [v1.itemIdFromName("cooked_beef")] = {
        ["displayName"] = "Cooked Patty"
    },
    [v1.itemIdFromName("porkchop")] = {
        ["displayName"] = "Raw Sausage"
    },
    [v1.itemIdFromName("cooked_porkchop")] = {
        ["displayName"] = "Cooked Sausage"
    },
    [v1.itemIdFromName("melon")] = {
        ["displayName"] = "Giantberry"
    },
    [v1.itemIdFromName("melon_slice")] = {
        ["displayName"] = "Regenberries"
    },
    [v1.itemIdFromName("melon_seeds")] = {
        ["displayName"] = "Giantberry Seeds"
    },
    [v1.itemIdFromName("redstone_torch")] = {
        ["displayName"] = "Logic Torch"
    },
    [v1.itemIdFromName("repeater")] = {
        ["displayName"] = "Capacitor"
    },
    [v1.itemIdFromName("note_block")] = {
        ["displayName"] = "Sound Module"
    },
    [v1.itemIdFromName("redstone_lamp")] = {
        ["displayName"] = "Light Module"
    },
    [v1.itemIdFromName("gunpowder")] = {
        ["displayName"] = "Sulphur"
    },
    [v1.itemIdFromName("bucket")] = {
        ["stackSize"] = 1
    },
    [v1.itemIdFromName("diamond")] = {
        ["displayName"] = "Amethyst",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_ore")] = {
        ["displayName"] = "Amethyst Ore",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_block")] = {
        ["displayName"] = "Amethyst Block",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_sword")] = {
        ["displayName"] = "Amethyst Sword",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_shovel")] = {
        ["displayName"] = "Amethyst Shovel",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_pickaxe")] = {
        ["displayName"] = "Amethyst Pickaxe",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_axe")] = {
        ["displayName"] = "Amethyst Axe",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_hoe")] = {
        ["displayName"] = "Amethyst Hoe",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_helmet")] = {
        ["displayName"] = "Amethyst Helmet",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_chestplate")] = {
        ["displayName"] = "Amethyst Armor",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_leggings")] = {
        ["displayName"] = "Amethyst Pants",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("diamond_boots")] = {
        ["displayName"] = "Amethyst Boots",
        ["guiColor"] = Color3.fromRGB(177, 135, 255)
    },
    [v1.itemIdFromName("mythril_sword")] = {
        ["durability"] = 250,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_shovel")] = {
        ["durability"] = 250,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_pickaxe")] = {
        ["durability"] = 250,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_axe")] = {
        ["durability"] = 250,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_helmet")] = {
        ["durability"] = 165,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_chestplate")] = {
        ["durability"] = 240,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_leggings")] = {
        ["durability"] = 225,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_boots")] = {
        ["durability"] = 195,
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("mythril_bow")] = {
        ["guiColor"] = Color3.fromRGB(45, 255, 174)
    },
    [v1.itemIdFromName("iron_helmet")] = {
        ["displayName"] = "Iron Helmet"
    },
    [v1.itemIdFromName("iron_chestplate")] = {
        ["displayName"] = "Iron Armor"
    },
    [v1.itemIdFromName("iron_leggings")] = {
        ["displayName"] = "Iron Pants"
    },
    [v1.itemIdFromName("iron_boots")] = {
        ["displayName"] = "Iron Boots"
    },
    [v1.itemIdFromName("golden_helmet")] = {
        ["displayName"] = "Gold Helmet"
    },
    [v1.itemIdFromName("golden_chestplate")] = {
        ["displayName"] = "Gold Armor"
    },
    [v1.itemIdFromName("golden_leggings")] = {
        ["displayName"] = "Gold Pants"
    },
    [v1.itemIdFromName("golden_boots")] = {
        ["displayName"] = "Gold Boots"
    },
    [v1.itemIdFromName("leather_helmet")] = {
        ["displayName"] = "Hide Hat"
    },
    [v1.itemIdFromName("leather_chestplate")] = {
        ["displayName"] = "Hide Armor"
    },
    [v1.itemIdFromName("leather_leggings")] = {
        ["displayName"] = "Hide Pants"
    },
    [v1.itemIdFromName("leather_boots")] = {
        ["displayName"] = "Hide Boots"
    },
    [v1.itemIdFromName("leather")] = {
        ["displayName"] = "Hide"
    },
    [v1.itemIdFromName("orange_terracotta")] = {
        ["displayName"] = "Canyonstone"
    },
    [v1.itemIdFromName("brown_terracotta")] = {
        ["displayName"] = "Dark Canyonstone"
    },
    [v1.itemIdFromName("sandstone")] = {
        ["displayName"] = "Desertstone"
    },
    [v1.itemIdFromName("sandstone_slab")] = {
        ["displayName"] = "Desertstone Slab"
    },
    [v1.itemIdFromName("sandstone_stairs")] = {
        ["displayName"] = "Desertstone Stairs"
    },
    [v1.itemIdFromName("diorite")] = {
        ["displayName"] = "Marble"
    },
    [v1.itemIdFromName("diorite_slab")] = {
        ["displayName"] = "Marble Slab"
    },
    [v1.itemIdFromName("diorite_stairs")] = {
        ["displayName"] = "Marble Stairs"
    },
    [v1.itemIdFromName("polished_diorite")] = {
        ["displayName"] = "Smooth Marble"
    },
    [v1.itemIdFromName("granite")] = {
        ["displayName"] = "Copper Ore"
    },
    [v1.itemIdFromName("andesite")] = {
        ["displayName"] = "Sulphur ore"
    },
    [v1.itemIdFromName("polished_andesite")] = {
        ["displayName"] = "Smooth Volcanic Rock"
    },
    [v1.itemIdFromName("mossy_cobblestone")] = {
        ["displayName"] = "Forgotten Cobblestone"
    },
    [v1.itemIdFromName("stone_bricks")] = {
        ["displayName"] = "Castle Bricks"
    },
    [v1.itemIdFromName("stone_brick_slab")] = {
        ["displayName"] = "Castle Bricks Slab"
    },
    [v1.itemIdFromName("stone_brick_stairs")] = {
        ["displayName"] = "Castle Bricks Stairs"
    },
    [v1.itemIdFromName("mossy_stone_bricks")] = {
        ["displayName"] = "Forgotten Castle Bricks"
    },
    [v1.itemIdFromName("prismarine")] = {
        ["displayName"] = "Decorated Dungeon Bricks"
    },
    [v1.itemIdFromName("prismarine_bricks")] = {
        ["displayName"] = "Dungeon Bricks"
    },
    [v1.itemIdFromName("prismarine_brick_slab")] = {
        ["displayName"] = "Dungeon Bricks Slab"
    },
    [v1.itemIdFromName("prismarine_brick_stairs")] = {
        ["displayName"] = "Dungeon Bricks Stairs"
    },
    [v1.itemIdFromName("red_nether_bricks")] = {
        ["displayName"] = "Decorated Olmec Bricks"
    },
    [v1.itemIdFromName("nether_bricks")] = {
        ["displayName"] = "Olmec Bricks"
    },
    [v1.itemIdFromName("nether_brick_slab")] = {
        ["displayName"] = "Olmec Bricks Slab"
    },
    [v1.itemIdFromName("nether_brick_stairs")] = {
        ["displayName"] = "Olmec Bricks Stairs"
    },
    [v1.itemIdFromName("fern")] = {
        ["displayName"] = "Forest Fern"
    },
    [v1.itemIdFromName("large_fern")] = {
        ["displayName"] = "Forest Fern"
    },
    [v1.itemIdFromName("dandelion")] = {
        ["displayName"] = "Daffodil"
    },
    [v1.itemIdFromName("poppy")] = {
        ["displayName"] = "Rose"
    },
    [v1.itemIdFromName("oxeye_daisy")] = {
        ["displayName"] = "Cottonflower"
    },
    [v1.itemIdFromName("blue_orchid")] = {
        ["displayName"] = "Swamp teaflower"
    },
    [v1.itemIdFromName("allium")] = {
        ["displayName"] = "Crocus"
    },
    [v1.itemIdFromName("azure_bluet")] = {
        ["displayName"] = "White Holly"
    },
    [v1.itemIdFromName("orange_tulip")] = {
        ["displayName"] = "Marigold"
    },
    [v1.itemIdFromName("pink_tulip")] = {
        ["displayName"] = "Sweet Pea"
    },
    [v1.itemIdFromName("red_tulip")] = {
        ["displayName"] = "Amaryllis"
    },
    [v1.itemIdFromName("white_tulip")] = {
        ["displayName"] = "Jasmine"
    },
    [v1.itemIdFromName("cornflower")] = {
        ["displayName"] = "Blue Jazz"
    },
    [v1.itemIdFromName("lily_of_the_valley")] = {
        ["displayName"] = "Pikeflower"
    },
    [v1.itemIdFromName("peony")] = {
        ["displayName"] = "Wizardflowers"
    },
    [v1.itemIdFromName("lilac")] = {
        ["displayName"] = "Spangleflower"
    },
    [v1.itemIdFromName("sunflower")] = {
        ["displayName"] = "Sunflower"
    },
    [v1.itemIdFromName("rose_bush")] = {
        ["displayName"] = "Fairy Roses"
    },
    [v1.itemIdFromName("brown_mushroom")] = {
        ["displayName"] = "Morel"
    },
    [v1.itemIdFromName("red_mushroom")] = {
        ["displayName"] = "Mushroom"
    },
    [v1.itemIdFromName("spruce_planks")] = {
        ["displayName"] = "Pine Planks"
    },
    [v1.itemIdFromName("spruce_sapling")] = {
        ["displayName"] = "Pine Sapling"
    },
    [v1.itemIdFromName("spruce_log")] = {
        ["displayName"] = "Pine Log"
    },
    [v1.itemIdFromName("spruce_wood")] = {
        ["displayName"] = "Pine Wood"
    },
    [v1.itemIdFromName("spruce_leaves")] = {
        ["displayName"] = "Pine Needles"
    },
    [v1.itemIdFromName("spruce_slab")] = {
        ["displayName"] = "Pine Slab"
    },
    [v1.itemIdFromName("spruce_fence")] = {
        ["displayName"] = "Pine Fence"
    },
    [v1.itemIdFromName("spruce_trapdoor")] = {
        ["displayName"] = "Pine Trapdoor"
    },
    [v1.itemIdFromName("spruce_stairs")] = {
        ["displayName"] = "Pine Stairs"
    },
    [v1.itemIdFromName("spruce_button")] = {
        ["displayName"] = "Pine Button"
    },
    [v1.itemIdFromName("spruce_door")] = {
        ["displayName"] = "Pine Door"
    },
    [v1.itemIdFromName("spruce_sign")] = {
        ["displayName"] = "Pine Sign"
    },
    [v1.itemIdFromName("spruce_pressure_plate")] = {
        ["displayName"] = "Pine Pressure Plate"
    },
    [v1.itemIdFromName("dark_oak_planks")] = {
        ["displayName"] = "Old Oak Planks"
    },
    [v1.itemIdFromName("dark_oak_sapling")] = {
        ["displayName"] = "Old Oak Sapling"
    },
    [v1.itemIdFromName("dark_oak_log")] = {
        ["displayName"] = "Old Oak Log"
    },
    [v1.itemIdFromName("dark_oak_wood")] = {
        ["displayName"] = "Old Oak Wood"
    },
    [v1.itemIdFromName("dark_oak_leaves")] = {
        ["displayName"] = "Old Oak Leaves"
    },
    [v1.itemIdFromName("dark_oak_slab")] = {
        ["displayName"] = "Old Oak Slab"
    },
    [v1.itemIdFromName("dark_oak_fence")] = {
        ["displayName"] = "Old Oak Fence"
    },
    [v1.itemIdFromName("dark_oak_trapdoor")] = {
        ["displayName"] = "Old Oak Trapdoor"
    },
    [v1.itemIdFromName("dark_oak_stairs")] = {
        ["displayName"] = "Old Oak Stairs"
    },
    [v1.itemIdFromName("dark_oak_button")] = {
        ["displayName"] = "Old Oak Button"
    },
    [v1.itemIdFromName("dark_oak_door")] = {
        ["displayName"] = "Old Oak Door"
    },
    [v1.itemIdFromName("dark_oak_sign")] = {
        ["displayName"] = "Old Oak Sign"
    },
    [v1.itemIdFromName("dark_oak_pressure_plate")] = {
        ["displayName"] = "Old Oak Pressure Plate"
    },
    [v1.itemIdFromName("jungle_planks")] = {
        ["displayName"] = "Exotic Planks"
    },
    [v1.itemIdFromName("jungle_sapling")] = {
        ["displayName"] = "Exotic Sapling"
    },
    [v1.itemIdFromName("jungle_log")] = {
        ["displayName"] = "Exotic Log"
    },
    [v1.itemIdFromName("jungle_wood")] = {
        ["displayName"] = "Exotic Wood"
    },
    [v1.itemIdFromName("jungle_leaves")] = {
        ["displayName"] = "Exotic Leaves"
    },
    [v1.itemIdFromName("jungle_slab")] = {
        ["displayName"] = "Exotic Slab"
    },
    [v1.itemIdFromName("jungle_fence")] = {
        ["displayName"] = "Exotic Fence"
    },
    [v1.itemIdFromName("jungle_trapdoor")] = {
        ["displayName"] = "Exotic Trapdoor"
    },
    [v1.itemIdFromName("jungle_stairs")] = {
        ["displayName"] = "Exotic Stairs"
    },
    [v1.itemIdFromName("jungle_button")] = {
        ["displayName"] = "Exotic Button"
    },
    [v1.itemIdFromName("jungle_door")] = {
        ["displayName"] = "Exotic Door"
    },
    [v1.itemIdFromName("jungle_sign")] = {
        ["displayName"] = "Exotic Sign"
    },
    [v1.itemIdFromName("jungle_pressure_plate")] = {
        ["displayName"] = "Exotic Pressure Plate"
    },
    [v1.itemIdFromName("acacia_planks")] = {
        ["displayName"] = "Savanna Planks"
    },
    [v1.itemIdFromName("acacia_sapling")] = {
        ["displayName"] = "Savanna Sapling"
    },
    [v1.itemIdFromName("acacia_log")] = {
        ["displayName"] = "Savanna Log"
    },
    [v1.itemIdFromName("acacia_wood")] = {
        ["displayName"] = "Savanna Wood"
    },
    [v1.itemIdFromName("acacia_leaves")] = {
        ["displayName"] = "Savanna Leaves"
    },
    [v1.itemIdFromName("acacia_slab")] = {
        ["displayName"] = "Savanna Slab"
    },
    [v1.itemIdFromName("acacia_fence")] = {
        ["displayName"] = "Savanna Fence"
    },
    [v1.itemIdFromName("acacia_trapdoor")] = {
        ["displayName"] = "Savanna Trapdoor"
    },
    [v1.itemIdFromName("acacia_stairs")] = {
        ["displayName"] = "Savanna Stairs"
    },
    [v1.itemIdFromName("acacia_button")] = {
        ["displayName"] = "Savanna Button"
    },
    [v1.itemIdFromName("acacia_door")] = {
        ["displayName"] = "Savanna Door"
    },
    [v1.itemIdFromName("acacia_sign")] = {
        ["displayName"] = "Savanna Sign"
    },
    [v1.itemIdFromName("acacia_pressure_plate")] = {
        ["displayName"] = "Savanna Pressure Plate"
    },
    [v1.itemIdFromName("crafting_table")] = {
        ["displayName"] = "Workbench"
    },
    [v1.itemIdFromName("bone_meal")] = {
        ["displayName"] = "Fertilizer"
    }
}
local u4 = {
    [v1.itemIdFromName("ender_chest")] = {
        ["guiColor"] = Color3.fromRGB(255, 88, 88)
    },
    [v1.itemIdFromName("void_chest")] = {
        ["displayName"] = "Shulker Box",
        ["guiColor"] = Color3.fromRGB(113, 93, 233)
    }
}
local v5 = {}
for v6, v7 in u4 do
    if string.find(v1.getItemName(v6), "mythril") then
        local v8 = string.gsub(v1.getItemName(v6), "mythril", "iron")
        local v9 = v1.itemIdFromName(v8, true)
        if v1.itemIdExists(v9) then
            v7.durability = v1.getDurability(v9) * 2
        end
    end
end
function v5.init() --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
    --]]
    for v10, v11 in pairs(u4) do
        for v12, v14 in pairs(v11) do
            if v14 == u3 then
                local v14 = nil
            end
            u2[v10][v12] = v14
        end
    end
end
return v5