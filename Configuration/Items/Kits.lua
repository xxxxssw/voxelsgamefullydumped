-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.Kits
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v2 = {
    ["chest"] = {
        [v1.itemIdFromName("chest")] = 64,
        [v1.itemIdFromName("ender_chest")] = 64,
        [v1.itemIdFromName("void_chest")] = 2,
        [v1.itemIdFromName("pink_wool")] = 64,
        [v1.itemIdFromName("blue_wool")] = 64,
        [v1.itemIdFromName("crafting_table")] = 64,
        [v1.itemIdFromName("furnace")] = 64
    },
    ["agr"] = {
        [v1.itemIdFromName("bone_meal")] = 64,
        [v1.itemIdFromName("wheat_seeds")] = 64,
        [v1.itemIdFromName("tomato_seeds")] = 64,
        [v1.itemIdFromName("blueberries")] = 64,
        [v1.itemIdFromName("coffee_beans")] = 64,
        [v1.itemIdFromName("melon_slice")] = 64,
        [v1.itemIdFromName("diamond_hoe")] = 1,
        [v1.itemIdFromName("water_bucket")] = 2,
        [v1.itemIdFromName("dirt")] = 64
    },
    ["structure"] = {
        [v1.itemIdFromName("debug_setStructureCornerATool")] = 1,
        [v1.itemIdFromName("debug_setStructureCornerBTool")] = 1,
        [v1.itemIdFromName("debug_setStructureRootTool")] = 1,
        [v1.itemIdFromName("structure_forced_air")] = 64,
        [v1.itemIdFromName("structure_generator")] = 64,
        [v1.itemIdFromName("structure_entity_block")] = 64,
        [v1.itemIdFromName("structure_random_block")] = 64,
        [v1.itemIdFromName("dirt")] = 64,
        [v1.itemIdFromName("debug_editBlockMetadata")] = 1
    },
    ["portal"] = {
        [v1.itemIdFromName("obsidian")] = 64,
        [v1.itemIdFromName("green_wool")] = 64,
        [v1.itemIdFromName("diamond_pickaxe")] = 3
    },
    ["saplings"] = {
        [v1.itemIdFromName("oak_sapling")] = 64,
        [v1.itemIdFromName("spruce_sapling")] = 64,
        [v1.itemIdFromName("birch_sapling")] = 64,
        [v1.itemIdFromName("jungle_sapling")] = 64,
        [v1.itemIdFromName("acacia_sapling")] = 64,
        [v1.itemIdFromName("dark_oak_sapling")] = 64,
        [v1.itemIdFromName("bone_meal")] = 128
    },
    ["tools"] = {
        [v1.itemIdFromName("iron_sword")] = 1,
        [v1.itemIdFromName("iron_pickaxe")] = 1,
        [v1.itemIdFromName("iron_axe")] = 1,
        [v1.itemIdFromName("iron_shovel")] = 1,
        [v1.itemIdFromName("iron_hoe")] = 1,
        [v1.itemIdFromName("shears")] = 1
    },
    ["build"] = {
        [v1.itemIdFromName("oak_log")] = 64,
        [v1.itemIdFromName("oak_planks")] = 64,
        [v1.itemIdFromName("oak_fence")] = 64,
        [v1.itemIdFromName("oak_stairs")] = 64,
        [v1.itemIdFromName("oak_slab")] = 64,
        [v1.itemIdFromName("torch")] = 64,
        [v1.itemIdFromName("cobblestone")] = 64,
        [v1.itemIdFromName("dirt")] = 64,
        [v1.itemIdFromName("grass_block")] = 64
    },
    ["base"] = {
        [v1.itemIdFromName("crafting_table")] = 4,
        [v1.itemIdFromName("chest")] = 16,
        [v1.itemIdFromName("furnace")] = 4,
        [v1.itemIdFromName("torch")] = 20,
        [v1.itemIdFromName("white_bed")] = 1
    },
    ["beds"] = {
        [v1.itemIdFromName("black_bed")] = 1,
        [v1.itemIdFromName("blue_bed")] = 1,
        [v1.itemIdFromName("brown_bed")] = 1,
        [v1.itemIdFromName("cyan_bed")] = 1,
        [v1.itemIdFromName("gray_bed")] = 1,
        [v1.itemIdFromName("green_bed")] = 1,
        [v1.itemIdFromName("light_blue_bed")] = 1,
        [v1.itemIdFromName("light_gray_bed")] = 1,
        [v1.itemIdFromName("lime_bed")] = 1,
        [v1.itemIdFromName("magenta_bed")] = 1,
        [v1.itemIdFromName("orange_bed")] = 1,
        [v1.itemIdFromName("pink_bed")] = 1,
        [v1.itemIdFromName("purple_bed")] = 1,
        [v1.itemIdFromName("red_bed")] = 1,
        [v1.itemIdFromName("white_bed")] = 1,
        [v1.itemIdFromName("yellow_bed")] = 1
    },
    ["food"] = {
        [v1.itemIdFromName("bread")] = 32,
        [v1.itemIdFromName("wheat")] = 32
    },
    ["plants"] = {
        [v1.itemIdFromName("fern")] = 64,
        [v1.itemIdFromName("large_fern")] = 64,
        [v1.itemIdFromName("dandelion")] = 64,
        [v1.itemIdFromName("poppy")] = 64,
        [v1.itemIdFromName("oxeye_daisy")] = 64,
        [v1.itemIdFromName("blue_orchid")] = 64,
        [v1.itemIdFromName("allium")] = 64,
        [v1.itemIdFromName("azure_bluet")] = 64,
        [v1.itemIdFromName("orange_tulip")] = 64,
        [v1.itemIdFromName("pink_tulip")] = 64,
        [v1.itemIdFromName("red_tulip")] = 64,
        [v1.itemIdFromName("white_tulip")] = 64,
        [v1.itemIdFromName("cornflower")] = 64,
        [v1.itemIdFromName("lily_of_the_valley")] = 64,
        [v1.itemIdFromName("peony")] = 64,
        [v1.itemIdFromName("lilac")] = 64,
        [v1.itemIdFromName("sunflower")] = 64,
        [v1.itemIdFromName("rose_bush")] = 64,
        [v1.itemIdFromName("brown_mushroom")] = 64,
        [v1.itemIdFromName("red_mushroom")] = 64,
        [v1.itemIdFromName("tall_grass")] = 64
    },
    ["dyes"] = {
        [v1.itemIdFromName("red_dye")] = 64,
        [v1.itemIdFromName("green_dye")] = 64,
        [v1.itemIdFromName("purple_dye")] = 64,
        [v1.itemIdFromName("cyan_dye")] = 64,
        [v1.itemIdFromName("light_gray_dye")] = 64,
        [v1.itemIdFromName("gray_dye")] = 64,
        [v1.itemIdFromName("pink_dye")] = 64,
        [v1.itemIdFromName("lime_dye")] = 64,
        [v1.itemIdFromName("yellow_dye")] = 64,
        [v1.itemIdFromName("light_blue_dye")] = 64,
        [v1.itemIdFromName("magenta_dye")] = 64,
        [v1.itemIdFromName("orange_dye")] = 64,
        [v1.itemIdFromName("blue_dye")] = 64,
        [v1.itemIdFromName("brown_dye")] = 64,
        [v1.itemIdFromName("black_dye")] = 64,
        [v1.itemIdFromName("white_dye")] = 64
    }
}
return v2