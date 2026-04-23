-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Blocks.BlockTags
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local v2 = require(game.ReplicatedStorage.Systems.FarmingSystem)
local v3 = {
    ["StemAndAttachedStem"] = {},
    ["CropsWithoutStem"] = {},
    ["Liquids"] = {
        [v1.getBlockIdFromName("water")] = true,
        [v1.getBlockIdFromName("lava")] = true
    },
    ["BiomeColor"] = {
        [v1.getBlockIdFromName("grass_block")] = true,
        [v1.getBlockIdFromName("oak_leaves")] = true,
        [v1.getBlockIdFromName("birch_leaves")] = true,
        [v1.getBlockIdFromName("dark_oak_leaves")] = true,
        [v1.getBlockIdFromName("acacia_leaves")] = true,
        [v1.getBlockIdFromName("jungle_leaves")] = true,
        [v1.getBlockIdFromName("spruce_leaves")] = true
    },
    ["Signs"] = {
        [v1.getBlockIdFromName("oak_sign")] = true,
        [v1.getBlockIdFromName("spruce_sign")] = true,
        [v1.getBlockIdFromName("birch_sign")] = true,
        [v1.getBlockIdFromName("acacia_sign")] = true,
        [v1.getBlockIdFromName("jungle_sign")] = true,
        [v1.getBlockIdFromName("dark_oak_sign")] = true,
        [v1.getBlockIdFromName("oak_wall_sign")] = true,
        [v1.getBlockIdFromName("spruce_wall_sign")] = true,
        [v1.getBlockIdFromName("birch_wall_sign")] = true,
        [v1.getBlockIdFromName("acacia_wall_sign")] = true,
        [v1.getBlockIdFromName("jungle_wall_sign")] = true,
        [v1.getBlockIdFromName("dark_oak_wall_sign")] = true
    },
    ["DungeonSpawnerProtected"] = {
        [v1.getBlockIdFromName("prismarine")] = true,
        [v1.getBlockIdFromName("prismarine_bricks")] = true,
        [v1.getBlockIdFromName("prismarine_brick_slab")] = true,
        [v1.getBlockIdFromName("prismarine_brick_stairs")] = true,
        [v1.getBlockIdFromName("willothewisp")] = true
    },
    ["OlmecsProtected"] = {
        [v1.getBlockIdFromName("red_nether_bricks")] = true,
        [v1.getBlockIdFromName("nether_bricks")] = true,
        [v1.getBlockIdFromName("nether_brick_slab")] = true,
        [v1.getBlockIdFromName("nether_brick_stairs")] = true,
        [v1.getBlockIdFromName("idol")] = true
    },
    ["PassiveMobSpawnAllowed"] = {
        [v1.getBlockIdFromName("grass_block")] = true,
        [v1.getBlockIdFromName("dirt")] = true,
        [v1.getBlockIdFromName("sand")] = true
    },
    ["CircuitConstantPowerSource"] = {
        [v1.getBlockIdFromName("torch")] = true,
        [v1.getBlockIdFromName("wall_torch")] = true,
        [v1.getBlockIdFromName("redstone_torch")] = true,
        [v1.getBlockIdFromName("redstone_wall_torch")] = true
    },
    ["CircuitPowerSource"] = {
        [v1.getBlockIdFromName("redstone_torch")] = true,
        [v1.getBlockIdFromName("redstone_wall_torch")] = true,
        [v1.getBlockIdFromName("stone_button")] = true,
        [v1.getBlockIdFromName("oak_button")] = true,
        [v1.getBlockIdFromName("spruce_button")] = true,
        [v1.getBlockIdFromName("birch_button")] = true,
        [v1.getBlockIdFromName("jungle_button")] = true,
        [v1.getBlockIdFromName("acacia_button")] = true,
        [v1.getBlockIdFromName("dark_oak_button")] = true,
        [v1.getBlockIdFromName("lever")] = true,
        [v1.getBlockIdFromName("stone_pressure_plate")] = true,
        [v1.getBlockIdFromName("oak_pressure_plate")] = true,
        [v1.getBlockIdFromName("spruce_pressure_plate")] = true,
        [v1.getBlockIdFromName("birch_pressure_plate")] = true,
        [v1.getBlockIdFromName("jungle_pressure_plate")] = true,
        [v1.getBlockIdFromName("acacia_pressure_plate")] = true,
        [v1.getBlockIdFromName("dark_oak_pressure_plate")] = true
    },
    ["CircuitWire"] = {
        [v1.getBlockIdFromName("copper_wire")] = true
    },
    ["CircuitOpenable"] = {
        [v1.getBlockIdFromName("redstone_lamp")] = true,
        [v1.getBlockIdFromName("oak_trapdoor")] = true,
        [v1.getBlockIdFromName("spruce_trapdoor")] = true,
        [v1.getBlockIdFromName("birch_trapdoor")] = true,
        [v1.getBlockIdFromName("jungle_trapdoor")] = true,
        [v1.getBlockIdFromName("acacia_trapdoor")] = true,
        [v1.getBlockIdFromName("dark_oak_trapdoor")] = true,
        [v1.getBlockIdFromName("iron_trapdoor")] = true,
        [v1.getBlockIdFromName("oak_fence_gate")] = true,
        [v1.getBlockIdFromName("spruce_fence_gate")] = true,
        [v1.getBlockIdFromName("birch_fence_gate")] = true,
        [v1.getBlockIdFromName("jungle_fence_gate")] = true,
        [v1.getBlockIdFromName("acacia_fence_gate")] = true,
        [v1.getBlockIdFromName("dark_oak_fence_gate")] = true,
        [v1.getBlockIdFromName("spruce_door")] = true,
        [v1.getBlockIdFromName("birch_door")] = true,
        [v1.getBlockIdFromName("jungle_door")] = true,
        [v1.getBlockIdFromName("acacia_door")] = true,
        [v1.getBlockIdFromName("dark_oak_door")] = true,
        [v1.getBlockIdFromName("oak_door")] = true,
        [v1.getBlockIdFromName("iron_door")] = true
    },
    ["CircuitConnectables"] = {
        [v1.getBlockIdFromName("copper_wire")] = true,
        [v1.getBlockIdFromName("note_block")] = true,
        [v1.getBlockIdFromName("powered_rail")] = true,
        [v1.getBlockIdFromName("detector_rail")] = true,
        [v1.getBlockIdFromName("oak_door")] = true,
        [v1.getBlockIdFromName("lever")] = true,
        [v1.getBlockIdFromName("stone_pressure_plate")] = true,
        [v1.getBlockIdFromName("iron_door")] = true,
        [v1.getBlockIdFromName("oak_pressure_plate")] = true,
        [v1.getBlockIdFromName("spruce_pressure_plate")] = true,
        [v1.getBlockIdFromName("birch_pressure_plate")] = true,
        [v1.getBlockIdFromName("jungle_pressure_plate")] = true,
        [v1.getBlockIdFromName("acacia_pressure_plate")] = true,
        [v1.getBlockIdFromName("dark_oak_pressure_plate")] = true,
        [v1.getBlockIdFromName("stone_button")] = true,
        [v1.getBlockIdFromName("repeater")] = true,
        [v1.getBlockIdFromName("oak_trapdoor")] = true,
        [v1.getBlockIdFromName("spruce_trapdoor")] = true,
        [v1.getBlockIdFromName("birch_trapdoor")] = true,
        [v1.getBlockIdFromName("jungle_trapdoor")] = true,
        [v1.getBlockIdFromName("acacia_trapdoor")] = true,
        [v1.getBlockIdFromName("dark_oak_trapdoor")] = true,
        [v1.getBlockIdFromName("oak_fence_gate")] = true,
        [v1.getBlockIdFromName("oak_button")] = true,
        [v1.getBlockIdFromName("spruce_button")] = true,
        [v1.getBlockIdFromName("birch_button")] = true,
        [v1.getBlockIdFromName("jungle_button")] = true,
        [v1.getBlockIdFromName("acacia_button")] = true,
        [v1.getBlockIdFromName("dark_oak_button")] = true,
        [v1.getBlockIdFromName("activator_rail")] = true,
        [v1.getBlockIdFromName("iron_trapdoor")] = true,
        [v1.getBlockIdFromName("spruce_fence_gate")] = true,
        [v1.getBlockIdFromName("birch_fence_gate")] = true,
        [v1.getBlockIdFromName("jungle_fence_gate")] = true,
        [v1.getBlockIdFromName("acacia_fence_gate")] = true,
        [v1.getBlockIdFromName("dark_oak_fence_gate")] = true,
        [v1.getBlockIdFromName("spruce_door")] = true,
        [v1.getBlockIdFromName("birch_door")] = true,
        [v1.getBlockIdFromName("jungle_door")] = true,
        [v1.getBlockIdFromName("acacia_door")] = true,
        [v1.getBlockIdFromName("dark_oak_door")] = true
    },
    ["Seats"] = {
        [v1.getBlockIdFromName("oak_stool")] = true,
        [v1.getBlockIdFromName("dark_oak_stool")] = true,
        [v1.getBlockIdFromName("jungle_stool")] = true,
        [v1.getBlockIdFromName("acacia_stool")] = true,
        [v1.getBlockIdFromName("birch_stool")] = true,
        [v1.getBlockIdFromName("spruce_stool")] = true
    },
    ["Torches"] = {
        [v1.getBlockIdFromName("torch")] = true,
        [v1.getBlockIdFromName("redstone_torch")] = true
    },
    ["WallTorches"] = {
        [v1.getBlockIdFromName("wall_torch")] = true,
        [v1.getBlockIdFromName("redstone_wall_torch")] = true
    },
    ["PressurePlates"] = {
        [v1.getBlockIdFromName("stone_pressure_plate")] = true,
        [v1.getBlockIdFromName("oak_pressure_plate")] = true,
        [v1.getBlockIdFromName("spruce_pressure_plate")] = true,
        [v1.getBlockIdFromName("birch_pressure_plate")] = true,
        [v1.getBlockIdFromName("jungle_pressure_plate")] = true,
        [v1.getBlockIdFromName("acacia_pressure_plate")] = true,
        [v1.getBlockIdFromName("dark_oak_pressure_plate")] = true
    },
    ["Buttons"] = {
        [v1.getBlockIdFromName("stone_button")] = true,
        [v1.getBlockIdFromName("oak_button")] = true,
        [v1.getBlockIdFromName("spruce_button")] = true,
        [v1.getBlockIdFromName("birch_button")] = true,
        [v1.getBlockIdFromName("jungle_button")] = true,
        [v1.getBlockIdFromName("acacia_button")] = true,
        [v1.getBlockIdFromName("dark_oak_button")] = true
    },
    ["Lever"] = {
        [v1.getBlockIdFromName("lever")] = true
    },
    ["Door"] = {
        [v1.getBlockIdFromName("oak_door")] = true,
        [v1.getBlockIdFromName("birch_door")] = true,
        [v1.getBlockIdFromName("spruce_door")] = true,
        [v1.getBlockIdFromName("dark_oak_door")] = true,
        [v1.getBlockIdFromName("jungle_door")] = true,
        [v1.getBlockIdFromName("acacia_door")] = true
    },
    ["Trapdoor"] = {
        [v1.getBlockIdFromName("oak_trapdoor")] = true,
        [v1.getBlockIdFromName("birch_trapdoor")] = true,
        [v1.getBlockIdFromName("spruce_trapdoor")] = true,
        [v1.getBlockIdFromName("dark_oak_trapdoor")] = true,
        [v1.getBlockIdFromName("jungle_trapdoor")] = true,
        [v1.getBlockIdFromName("acacia_trapdoor")] = true
    },
    ["Bed"] = {
        [v1.getBlockIdFromName("black_bed")] = true,
        [v1.getBlockIdFromName("blue_bed")] = true,
        [v1.getBlockIdFromName("brown_bed")] = true,
        [v1.getBlockIdFromName("cyan_bed")] = true,
        [v1.getBlockIdFromName("gray_bed")] = true,
        [v1.getBlockIdFromName("green_bed")] = true,
        [v1.getBlockIdFromName("light_blue_bed")] = true,
        [v1.getBlockIdFromName("light_gray_bed")] = true,
        [v1.getBlockIdFromName("lime_bed")] = true,
        [v1.getBlockIdFromName("magenta_bed")] = true,
        [v1.getBlockIdFromName("orange_bed")] = true,
        [v1.getBlockIdFromName("pink_bed")] = true,
        [v1.getBlockIdFromName("purple_bed")] = true,
        [v1.getBlockIdFromName("red_bed")] = true,
        [v1.getBlockIdFromName("white_bed")] = true,
        [v1.getBlockIdFromName("yellow_bed")] = true
    },
    ["WallFlag"] = {
        [v1.getBlockIdFromName("black_wall_flag")] = true,
        [v1.getBlockIdFromName("blue_wall_flag")] = true,
        [v1.getBlockIdFromName("brown_wall_flag")] = true,
        [v1.getBlockIdFromName("cyan_wall_flag")] = true,
        [v1.getBlockIdFromName("gray_wall_flag")] = true,
        [v1.getBlockIdFromName("green_wall_flag")] = true,
        [v1.getBlockIdFromName("light_blue_wall_flag")] = true,
        [v1.getBlockIdFromName("light_gray_wall_flag")] = true,
        [v1.getBlockIdFromName("lime_wall_flag")] = true,
        [v1.getBlockIdFromName("magenta_wall_flag")] = true,
        [v1.getBlockIdFromName("orange_wall_flag")] = true,
        [v1.getBlockIdFromName("pink_wall_flag")] = true,
        [v1.getBlockIdFromName("purple_wall_flag")] = true,
        [v1.getBlockIdFromName("red_wall_flag")] = true,
        [v1.getBlockIdFromName("white_wall_flag")] = true,
        [v1.getBlockIdFromName("yellow_wall_flag")] = true
    },
    ["DirtOrGrass"] = {
        [v1.getBlockIdFromName("dirt")] = true,
        [v1.getBlockIdFromName("grass_block")] = true
    },
    ["StorageBlocks"] = {
        [v1.getBlockIdFromName("chest")] = true,
        [v1.getBlockIdFromName("treasure_chest")] = true,
        [v1.getBlockIdFromName("furnace")] = true,
        [v1.getBlockIdFromName("void_chest")] = true
    },
    ["NoDropContentStorageBlocks"] = {
        [v1.getBlockIdFromName("void_chest")] = true,
        [v1.getBlockIdFromName("crafting_table")] = true,
        [v1.getBlockIdFromName("ender_chest")] = true
    },
    ["NoInventoryStorageBlocks"] = {
        [v1.getBlockIdFromName("crafting_table")] = true,
        [v1.getBlockIdFromName("ender_chest")] = true
    },
    ["WallMounted"] = {},
    ["FloorOrWallMounted"] = {},
    ["Water"] = {
        [v1.getBlockIdFromName("water")] = true
    },
    ["Lava"] = {
        [v1.getBlockIdFromName("lava")] = true
    },
    ["FencesOrWalls"] = {
        [v1.getBlockIdFromName("oak_fence")] = true,
        [v1.getBlockIdFromName("spruce_fence")] = true,
        [v1.getBlockIdFromName("birch_fence")] = true,
        [v1.getBlockIdFromName("dark_oak_fence")] = true,
        [v1.getBlockIdFromName("acacia_fence")] = true,
        [v1.getBlockIdFromName("jungle_fence")] = true
    },
    ["FenceGates"] = {
        [v1.getBlockIdFromName("oak_fence_gate")] = true,
        [v1.getBlockIdFromName("spruce_fence_gate")] = true,
        [v1.getBlockIdFromName("birch_fence_gate")] = true,
        [v1.getBlockIdFromName("jungle_fence_gate")] = true,
        [v1.getBlockIdFromName("acacia_fence_gate")] = true,
        [v1.getBlockIdFromName("dark_oak_fence_gate")] = true
    },
    ["GlassPane"] = {
        [v1.getBlockIdFromName("black_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("blue_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("brown_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("cyan_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("glass_pane")] = true,
        [v1.getBlockIdFromName("gray_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("green_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("light_blue_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("light_gray_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("lime_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("magenta_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("orange_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("pink_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("purple_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("red_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("white_stained_glass_pane")] = true,
        [v1.getBlockIdFromName("yellow_stained_glass_pane")] = true
    },
    ["WildPlant"] = {
        [v1.getBlockIdFromName("grass")] = "Dirt",
        [v1.getBlockIdFromName("fern")] = "Dirt",
        [v1.getBlockIdFromName("dandelion")] = "Dirt",
        [v1.getBlockIdFromName("poppy")] = "Dirt",
        [v1.getBlockIdFromName("oxeye_daisy")] = "Dirt",
        [v1.getBlockIdFromName("blue_orchid")] = "Dirt",
        [v1.getBlockIdFromName("allium")] = "Dirt",
        [v1.getBlockIdFromName("azure_bluet")] = "Dirt",
        [v1.getBlockIdFromName("orange_tulip")] = "Dirt",
        [v1.getBlockIdFromName("pink_tulip")] = "Dirt",
        [v1.getBlockIdFromName("red_tulip")] = "Dirt",
        [v1.getBlockIdFromName("white_tulip")] = "Dirt",
        [v1.getBlockIdFromName("cornflower")] = "Dirt",
        [v1.getBlockIdFromName("lily_of_the_valley")] = "Dirt",
        [v1.getBlockIdFromName("cactus")] = "Sand",
        [v1.getBlockIdFromName("oak_sapling")] = "Dirt",
        [v1.getBlockIdFromName("birch_sapling")] = "Dirt",
        [v1.getBlockIdFromName("spruce_sapling")] = "Dirt",
        [v1.getBlockIdFromName("dark_oak_sapling")] = "Dirt",
        [v1.getBlockIdFromName("jungle_sapling")] = "Dirt",
        [v1.getBlockIdFromName("acacia_sapling")] = "Dirt",
        [v1.getBlockIdFromName("brown_mushroom")] = "Mushroom",
        [v1.getBlockIdFromName("red_mushroom")] = "Mushroom"
    },
    ["Sapling"] = {
        [v1.getBlockIdFromName("oak_sapling")] = "OakTreesFolder",
        [v1.getBlockIdFromName("birch_sapling")] = "BirchTreesFolder",
        [v1.getBlockIdFromName("spruce_sapling")] = "SpruceTreesFolder",
        [v1.getBlockIdFromName("dark_oak_sapling")] = "DarkOakTreesFolder",
        [v1.getBlockIdFromName("jungle_sapling")] = "JungleTreesFolder",
        [v1.getBlockIdFromName("acacia_sapling")] = "AcaciaTreesFolder"
    },
    ["TallPlant"] = {
        [v1.getBlockIdFromName("large_fern")] = true,
        [v1.getBlockIdFromName("tall_grass")] = true,
        [v1.getBlockIdFromName("peony")] = true,
        [v1.getBlockIdFromName("lilac")] = true,
        [v1.getBlockIdFromName("sunflower")] = true,
        [v1.getBlockIdFromName("rose_bush")] = true
    },
    ["Overwritable"] = {
        [0] = true,
        [v1.getBlockIdFromName("grass")] = true,
        [v1.getBlockIdFromName("tall_grass")] = true,
        [v1.getBlockIdFromName("water")] = true
    },
    ["EdibleSliceBlock"] = {
        [v1.getBlockIdFromName("cooked_pizza_pepperoni")] = true
    },
    ["Fire"] = {
        [v1.getBlockIdFromName("fire")] = true
    },
    ["CrossedSprites"] = {
        [v1.getBlockIdFromName("grass")] = "Grass",
        [v1.getBlockIdFromName("fern")] = "Grass",
        [v1.getBlockIdFromName("dandelion")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("poppy")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("oxeye_daisy")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("blue_orchid")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("allium")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("azure_bluet")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("orange_tulip")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("pink_tulip")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("red_tulip")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("white_tulip")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("cornflower")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("lily_of_the_valley")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("peony")] = "Large",
        [v1.getBlockIdFromName("lilac")] = "Large",
        [v1.getBlockIdFromName("sunflower")] = "Large",
        [v1.getBlockIdFromName("rose_bush")] = "Large",
        [v1.getBlockIdFromName("large_fern")] = "Large",
        [v1.getBlockIdFromName("tall_grass")] = "Large",
        [v1.getBlockIdFromName("sweet_berry_bush")] = "Grass",
        [v1.getBlockIdFromName("dead_bush")] = "Grass",
        [v1.getBlockIdFromName("brown_mushroom")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("red_mushroom")] = "SmallFlowersAndMushrooms",
        [v1.getBlockIdFromName("oak_sapling")] = "Large",
        [v1.getBlockIdFromName("birch_sapling")] = "Large",
        [v1.getBlockIdFromName("spruce_sapling")] = "Large",
        [v1.getBlockIdFromName("dark_oak_sapling")] = "Large",
        [v1.getBlockIdFromName("jungle_sapling")] = "Large",
        [v1.getBlockIdFromName("acacia_sapling")] = "Large",
        [v1.getBlockIdFromName("sugar_cane")] = "Large"
    },
    ["NoCollision"] = {
        [v1.getBlockIdFromName("torch")] = true
    },
    ["FacingXZ"] = {
        [v1.getBlockIdFromName("furnace")] = true,
        [v1.getBlockIdFromName("chest")] = true,
        [v1.getBlockIdFromName("treasure_chest")] = true,
        [v1.getBlockIdFromName("oak_door")] = true,
        [v1.getBlockIdFromName("birch_door")] = true,
        [v1.getBlockIdFromName("spruce_door")] = true,
        [v1.getBlockIdFromName("dark_oak_door")] = true,
        [v1.getBlockIdFromName("jungle_door")] = true,
        [v1.getBlockIdFromName("acacia_door")] = true,
        [v1.getBlockIdFromName("oak_stairs")] = true,
        [v1.getBlockIdFromName("birch_stairs")] = true,
        [v1.getBlockIdFromName("spruce_stairs")] = true,
        [v1.getBlockIdFromName("dark_oak_stairs")] = true,
        [v1.getBlockIdFromName("acacia_stairs")] = true,
        [v1.getBlockIdFromName("jungle_stairs")] = true,
        [v1.getBlockIdFromName("cobblestone_stairs")] = true,
        [v1.getBlockIdFromName("sandstone_stairs")] = true,
        [v1.getBlockIdFromName("stone_brick_stairs")] = true,
        [v1.getBlockIdFromName("black_bed")] = true,
        [v1.getBlockIdFromName("blue_bed")] = true,
        [v1.getBlockIdFromName("brown_bed")] = true,
        [v1.getBlockIdFromName("cyan_bed")] = true,
        [v1.getBlockIdFromName("gray_bed")] = true,
        [v1.getBlockIdFromName("green_bed")] = true,
        [v1.getBlockIdFromName("light_blue_bed")] = true,
        [v1.getBlockIdFromName("light_gray_bed")] = true,
        [v1.getBlockIdFromName("lime_bed")] = true,
        [v1.getBlockIdFromName("magenta_bed")] = true,
        [v1.getBlockIdFromName("orange_bed")] = true,
        [v1.getBlockIdFromName("pink_bed")] = true,
        [v1.getBlockIdFromName("purple_bed")] = true,
        [v1.getBlockIdFromName("red_bed")] = true,
        [v1.getBlockIdFromName("white_bed")] = true,
        [v1.getBlockIdFromName("yellow_bed")] = true,
        [v1.getBlockIdFromName("oak_trapdoor")] = true,
        [v1.getBlockIdFromName("birch_trapdoor")] = true,
        [v1.getBlockIdFromName("spruce_trapdoor")] = true,
        [v1.getBlockIdFromName("dark_oak_trapdoor")] = true,
        [v1.getBlockIdFromName("jungle_trapdoor")] = true,
        [v1.getBlockIdFromName("acacia_trapdoor")] = true,
        [v1.getBlockIdFromName("ladder")] = true
    },
    ["ServerSafeBlocks"] = {
        [v1.getBlockIdFromName("torch")] = true,
        [v1.getBlockIdFromName("black_bed")] = true,
        [v1.getBlockIdFromName("blue_bed")] = true,
        [v1.getBlockIdFromName("brown_bed")] = true,
        [v1.getBlockIdFromName("cyan_bed")] = true,
        [v1.getBlockIdFromName("gray_bed")] = true,
        [v1.getBlockIdFromName("green_bed")] = true,
        [v1.getBlockIdFromName("light_blue_bed")] = true,
        [v1.getBlockIdFromName("light_gray_bed")] = true,
        [v1.getBlockIdFromName("lime_bed")] = true,
        [v1.getBlockIdFromName("magenta_bed")] = true,
        [v1.getBlockIdFromName("orange_bed")] = true,
        [v1.getBlockIdFromName("pink_bed")] = true,
        [v1.getBlockIdFromName("purple_bed")] = true,
        [v1.getBlockIdFromName("red_bed")] = true,
        [v1.getBlockIdFromName("white_bed")] = true,
        [v1.getBlockIdFromName("yellow_bed")] = true
    },
    ["ServerSkipRendering"] = {
        [v1.getBlockIdFromName("torch")] = false,
        [v1.getBlockIdFromName("copper_wire")] = true
    },
    ["StructureCreationBlock"] = {
        [v1.getBlockIdFromName("structure_entity_block")] = true,
        [v1.getBlockIdFromName("structure_random_block")] = true
    },
    ["StructureWeak"] = {
        [v1.getBlockIdFromName("oak_sapling")] = true,
        [v1.getBlockIdFromName("birch_sapling")] = true,
        [v1.getBlockIdFromName("spruce_sapling")] = true,
        [v1.getBlockIdFromName("dark_oak_sapling")] = true,
        [v1.getBlockIdFromName("jungle_sapling")] = true,
        [v1.getBlockIdFromName("acacia_sapling")] = true,
        [v1.getBlockIdFromName("oak_leaves")] = true,
        [v1.getBlockIdFromName("birch_leaves")] = true,
        [v1.getBlockIdFromName("dark_oak_leaves")] = true,
        [v1.getBlockIdFromName("acacia_leaves")] = true,
        [v1.getBlockIdFromName("jungle_leaves")] = true,
        [v1.getBlockIdFromName("spruce_leaves")] = true
    },
    ["TerrainInfosValidGround"] = {
        [v1.getBlockIdFromName("grass_block")] = true,
        [v1.getBlockIdFromName("dirt")] = true,
        [v1.getBlockIdFromName("stone")] = true,
        [v1.getBlockIdFromName("sand")] = true,
        [v1.getBlockIdFromName("andesite")] = true,
        [v1.getBlockIdFromName("granite")] = true,
        [v1.getBlockIdFromName("diorite")] = true
    },
    ["Leaves"] = {
        [v1.getBlockIdFromName("oak_leaves")] = true,
        [v1.getBlockIdFromName("birch_leaves")] = true,
        [v1.getBlockIdFromName("dark_oak_leaves")] = true,
        [v1.getBlockIdFromName("acacia_leaves")] = true,
        [v1.getBlockIdFromName("jungle_leaves")] = true,
        [v1.getBlockIdFromName("spruce_leaves")] = true
    },
    ["Logs"] = {
        [v1.getBlockIdFromName("oak_log")] = true,
        [v1.getBlockIdFromName("birch_log")] = true,
        [v1.getBlockIdFromName("dark_oak_log")] = true,
        [v1.getBlockIdFromName("acacia_log")] = true,
        [v1.getBlockIdFromName("jungle_log")] = true,
        [v1.getBlockIdFromName("spruce_log")] = true
    },
    ["Falling"] = {
        [v1.getBlockIdFromName("sand")] = true
    },
    ["Stairs"] = {
        [v1.getBlockIdFromName("acacia_stairs")] = true,
        [v1.getBlockIdFromName("andesite_stairs")] = true,
        [v1.getBlockIdFromName("birch_stairs")] = true,
        [v1.getBlockIdFromName("brick_stairs")] = true,
        [v1.getBlockIdFromName("cobblestone_stairs")] = true,
        [v1.getBlockIdFromName("dark_oak_stairs")] = true,
        [v1.getBlockIdFromName("dark_prismarine_stairs")] = true,
        [v1.getBlockIdFromName("diorite_stairs")] = true,
        [v1.getBlockIdFromName("end_stone_brick_stairs")] = true,
        [v1.getBlockIdFromName("granite_stairs")] = true,
        [v1.getBlockIdFromName("jungle_stairs")] = true,
        [v1.getBlockIdFromName("mossy_cobblestone_stairs")] = true,
        [v1.getBlockIdFromName("mossy_stone_brick_stairs")] = true,
        [v1.getBlockIdFromName("nether_brick_stairs")] = true,
        [v1.getBlockIdFromName("oak_stairs")] = true,
        [v1.getBlockIdFromName("polished_andesite_stairs")] = true,
        [v1.getBlockIdFromName("polished_diorite_stairs")] = true,
        [v1.getBlockIdFromName("polished_granite_stairs")] = true,
        [v1.getBlockIdFromName("prismarine_brick_stairs")] = true,
        [v1.getBlockIdFromName("prismarine_stairs")] = true,
        [v1.getBlockIdFromName("purpur_stairs")] = true,
        [v1.getBlockIdFromName("quartz_stairs")] = true,
        [v1.getBlockIdFromName("red_nether_brick_stairs")] = true,
        [v1.getBlockIdFromName("red_sandstone_stairs")] = true,
        [v1.getBlockIdFromName("sandstone_stairs")] = true,
        [v1.getBlockIdFromName("smooth_quartz_stairs")] = true,
        [v1.getBlockIdFromName("smooth_red_sandstone_stairs")] = true,
        [v1.getBlockIdFromName("smooth_sandstone_stairs")] = true,
        [v1.getBlockIdFromName("spruce_stairs")] = true,
        [v1.getBlockIdFromName("stone_brick_stairs")] = true,
        [v1.getBlockIdFromName("stone_stairs")] = true
    },
    ["Slabs"] = {
        [v1.getBlockIdFromName("prismarine_slab")] = true,
        [v1.getBlockIdFromName("prismarine_brick_slab")] = true,
        [v1.getBlockIdFromName("dark_prismarine_slab")] = true,
        [v1.getBlockIdFromName("oak_slab")] = true,
        [v1.getBlockIdFromName("spruce_slab")] = true,
        [v1.getBlockIdFromName("birch_slab")] = true,
        [v1.getBlockIdFromName("jungle_slab")] = true,
        [v1.getBlockIdFromName("acacia_slab")] = true,
        [v1.getBlockIdFromName("dark_oak_slab")] = true,
        [v1.getBlockIdFromName("stone_slab")] = true,
        [v1.getBlockIdFromName("smooth_stone_slab")] = true,
        [v1.getBlockIdFromName("sandstone_slab")] = true,
        [v1.getBlockIdFromName("cut_sandstone_slab")] = true,
        [v1.getBlockIdFromName("petrified_oak_slab")] = true,
        [v1.getBlockIdFromName("cobblestone_slab")] = true,
        [v1.getBlockIdFromName("brick_slab")] = true,
        [v1.getBlockIdFromName("stone_brick_slab")] = true,
        [v1.getBlockIdFromName("nether_brick_slab")] = true,
        [v1.getBlockIdFromName("quartz_slab")] = true,
        [v1.getBlockIdFromName("red_sandstone_slab")] = true,
        [v1.getBlockIdFromName("cut_red_sandstone_slab")] = true,
        [v1.getBlockIdFromName("purpur_slab")] = true,
        [v1.getBlockIdFromName("polished_granite_slab")] = true,
        [v1.getBlockIdFromName("smooth_red_sandstone_slab")] = true,
        [v1.getBlockIdFromName("mossy_stone_brick_slab")] = true,
        [v1.getBlockIdFromName("polished_diorite_slab")] = true,
        [v1.getBlockIdFromName("mossy_cobblestone_slab")] = true,
        [v1.getBlockIdFromName("end_stone_brick_slab")] = true,
        [v1.getBlockIdFromName("smooth_sandstone_slab")] = true,
        [v1.getBlockIdFromName("smooth_quartz_slab")] = true,
        [v1.getBlockIdFromName("granite_slab")] = true,
        [v1.getBlockIdFromName("andesite_slab")] = true,
        [v1.getBlockIdFromName("red_nether_brick_slab")] = true,
        [v1.getBlockIdFromName("polished_andesite_slab")] = true,
        [v1.getBlockIdFromName("diorite_slab")] = true
    },
    ["Painting"] = {
        [v1.getBlockIdFromName("painting")] = true
    },
    ["Furnitures"] = {
        [v1.getBlockIdFromName("torch")] = true,
        [v1.getBlockIdFromName("ladder")] = true,
        [v1.getBlockIdFromName("chest")] = true,
        [v1.getBlockIdFromName("treasure_chest")] = true,
        [v1.getBlockIdFromName("bomb")] = true
    },
    ["PortalActivation"] = {
        [v1.getBlockIdFromName("green_wool")] = true,
        [v1.getBlockIdFromName("willothewisp")] = true
    },
    ["PortalOutline"] = {
        [v1.getBlockIdFromName("glowstone")] = true,
        [v1.getBlockIdFromName("obsidian")] = true
    },
    ["PortalCenter"] = {
        [v1.getBlockIdFromName("nether_portal")] = true,
        [v1.getBlockIdFromName("end_portal")] = true
    },
    ["SolidBlocks"] = {}
}
for _, v4 in v2.getAllCropsWithoutStem() do
    v3.CropsWithoutStem[v4] = true
end
for _, v5 in v2.getAllStemsAndAttachedStems() do
    v3.StemAndAttachedStem[v5] = true
end
for _, v6 in { v3.CrossedSprites, v3.Water } do
    for v7 in v6 do
        v3.Overwritable[v7] = true
    end
end
v3.ManyBlocks = {}
for _, v8 in { v3.Door, v3.Painting, v3.Bed } do
    for v9 in v8 do
        v3.ManyBlocks[v9] = true
    end
end
return v3