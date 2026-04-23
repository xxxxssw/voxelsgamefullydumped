-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Assets.TextureProvider.TexturesLinker.classic
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

require(game.ReplicatedStorage.Assets.AssetsConfiguration)
local v1 = require(game.ReplicatedStorage.Configuration.Colors)
local v2 = {
    ["hay_block"] = {
        ["Default"] = "default_hay_side",
        ["Top"] = "default_hay_top",
        ["Bottom"] = "default_hay_top"
    },
    ["tomato"] = {
        ["stage"] = "tomato_stage"
    },
    ["wheat"] = {
        ["stage"] = "wheat_stage"
    },
    ["blueberries_crop"] = {
        ["stage"] = "blueberries_stage"
    },
    ["beans_crop"] = {
        ["stage"] = "beans_stage"
    },
    ["fire"] = {
        ["stage"] = "fire_stage"
    },
    ["water"] = {
        ["Default"] = "default_water"
    },
    ["acacia_log"] = {
        ["Default"] = "acacia_log_side",
        ["Top"] = "acacia_log_top",
        ["Bottom"] = "acacia_log_top"
    },
    ["birch_log"] = {
        ["Default"] = "birch_log_side",
        ["Top"] = "birch_log_top",
        ["Bottom"] = "birch_log_top"
    },
    ["dark_oak_log"] = {
        ["Default"] = "dark_oak_log_side",
        ["Top"] = "dark_oak_log_top",
        ["Bottom"] = "dark_oak_log_top"
    },
    ["oak_log"] = {
        ["Default"] = "oak_log_side",
        ["Top"] = "oak_log_top",
        ["Bottom"] = "oak_log_top"
    },
    ["jungle_log"] = {
        ["Default"] = "jungle_log_side",
        ["Top"] = "jungle_log_top",
        ["Bottom"] = "jungle_log_top"
    },
    ["spruce_log"] = {
        ["Default"] = "spruce_log_side",
        ["Top"] = "spruce_log_top",
        ["Bottom"] = "spruce_log_top"
    },
    ["acacia_wood"] = {
        ["Default"] = "acacia_log_side"
    },
    ["birch_wood"] = {
        ["Default"] = "birch_log_side"
    },
    ["dark_oak_wood"] = {
        ["Default"] = "dark_oak_log_side"
    },
    ["oak_wood"] = {
        ["Default"] = "oak_log_side"
    },
    ["jungle_wood"] = {
        ["Default"] = "jungle_log_side"
    },
    ["spruce_wood"] = {
        ["Default"] = "spruce_log_side"
    },
    ["acacia_planks"] = {
        ["Default"] = "acacia_planks"
    },
    ["birch_planks"] = {
        ["Default"] = "birch_planks"
    },
    ["dark_oak_planks"] = {
        ["Default"] = "dark_oak_planks"
    },
    ["oak_planks"] = {
        ["Default"] = "oak_planks"
    },
    ["jungle_planks"] = {
        ["Default"] = "jungle_planks"
    },
    ["spruce_planks"] = {
        ["Default"] = "spruce_planks"
    },
    ["black_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.black
    },
    ["white_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.white
    },
    ["red_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.red
    },
    ["purple_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.purple
    },
    ["pink_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.pink
    },
    ["orange_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.orange
    },
    ["magenta_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.magenta
    },
    ["lime_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.lime
    },
    ["light_gray_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.light_gray
    },
    ["light_blue_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.light_blue
    },
    ["green_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.green
    },
    ["gray_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.gray
    },
    ["cyan_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.cyan
    },
    ["brown_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.brown
    },
    ["blue_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.blue
    },
    ["yellow_wool"] = {
        ["Default"] = "default_wool",
        ["Color"] = v1.yellow
    },
    ["nether_bricks"] = {
        ["Default"] = "nether_bricks"
    },
    ["red_nether_bricks"] = {
        ["Default"] = "red_nether_bricks"
    },
    ["cactus"] = {
        ["Top"] = "cactus_top",
        ["Bottom"] = "cactus_top",
        ["Default"] = "cactus_side"
    },
    ["acacia_leaves"] = {
        ["Default"] = "acacia_leaves"
    },
    ["acacia_sapling"] = {
        ["Default"] = "acacia_sapling"
    },
    ["allium"] = {
        ["Default"] = "allium"
    },
    ["andesite"] = {
        ["Default"] = "andesite"
    },
    ["bedrock"] = {
        ["Default"] = "bedrock"
    },
    ["birch_leaves"] = {
        ["Default"] = "birch_leaves"
    },
    ["birch_sapling"] = {
        ["Default"] = "birch_sapling"
    },
    ["black_stained_glass"] = {
        ["Default"] = "black_stained_glass"
    },
    ["blast_furnace_on"] = {
        ["Front"] = "blast_furnace_front_on"
    },
    ["blue_concrete"] = {
        ["Default"] = "blue_concrete"
    },
    ["blue_concrete_powder"] = {
        ["Default"] = "blue_concrete_powder"
    },
    ["blue_glazed_terracotta"] = {
        ["Default"] = "blue_glazed_terracotta"
    },
    ["blue_orchid"] = {
        ["Default"] = "blue_orchid"
    },
    ["blue_shulker_box"] = {
        ["Default"] = "blue_shulker_box"
    },
    ["blue_stained_glass"] = {
        ["Default"] = "blue_stained_glass"
    },
    ["blue_stained_glass_pane"] = {
        ["Top"] = "blue_stained_glass_pane_top"
    },
    ["blue_terracotta"] = {
        ["Default"] = "blue_terracotta"
    },
    ["azure_bluet"] = {
        ["Default"] = "azure_bluet"
    },
    ["bookshelf"] = {
        ["Default"] = "bookshelf_side",
        ["Top"] = "oak_planks",
        ["Bottom"] = "oak_planks"
    },
    ["bricks"] = {
        ["Default"] = "bricks"
    },
    ["brown_concrete"] = {
        ["Default"] = "brown_concrete"
    },
    ["brown_concrete_powder"] = {
        ["Default"] = "brown_concrete_powder"
    },
    ["brown_glazed_terracotta"] = {
        ["Default"] = "brown_glazed_terracotta"
    },
    ["brown_mushroom"] = {
        ["Default"] = "brown_mushroom"
    },
    ["brown_mushroom_block"] = {
        ["Default"] = "brown_mushroom_block"
    },
    ["brown_shulker_box"] = {
        ["Default"] = "brown_shulker_box"
    },
    ["brown_stained_glass"] = {
        ["Default"] = "brown_stained_glass"
    },
    ["brown_stained_glass_pane"] = {
        ["Top"] = "brown_stained_glass_pane_top"
    },
    ["brown_terracotta"] = {
        ["Default"] = "brown_terracotta"
    },
    ["budding_amethyst"] = {
        ["Default"] = "budding_amethyst"
    },
    ["calcite"] = {
        ["Default"] = "calcite"
    },
    ["carrots"] = {
        ["stage"] = "carrots_stage0",
        ["Default"] = "carrots_stage3"
    },
    ["cartography_table1"] = {
        ["Default"] = "cartography_table_side1"
    },
    ["cartography_table2"] = {
        ["Default"] = "cartography_table_side2"
    },
    ["cartography_table3"] = {
        ["Default"] = "cartography_table_side3"
    },
    ["cartography_table"] = {
        ["Top"] = "cartography_table_top"
    },
    ["carved_pumpkin"] = {
        ["Default"] = "carved_pumpkin"
    },
    ["cave_vines"] = {
        ["Default"] = "cave_vines"
    },
    ["cave_vines_lit"] = {
        ["Default"] = "cave_vines_lit"
    },
    ["cave_vines_plant"] = {
        ["Default"] = "cave_vines_plant"
    },
    ["cave_vines_plant_lit"] = {
        ["Default"] = "cave_vines_plant_lit"
    },
    ["chain"] = {
        ["Default"] = "chain"
    },
    ["chiseled_deepslate"] = {
        ["Default"] = "chiseled_deepslate"
    },
    ["chiseled_polished_blackstone"] = {
        ["Default"] = "chiseled_polished_blackstone"
    },
    ["chiseled_quartz_block"] = {
        ["Default"] = "chiseled_quartz_block",
        ["Top"] = "chiseled_quartz_block_top"
    },
    ["chiseled_red_sandstone"] = {
        ["Default"] = "chiseled_red_sandstone"
    },
    ["chiseled_sandstone"] = {
        ["Default"] = "chiseled_sandstone"
    },
    ["chiseled_stone_bricks"] = {
        ["Default"] = "chiseled_stone_bricks"
    },
    ["clay"] = {
        ["Default"] = "clay"
    },
    ["coal_block"] = {
        ["Default"] = "coal_block"
    },
    ["coal_ore"] = {
        ["Default"] = "coal_ore"
    },
    ["coarse_dirt"] = {
        ["Default"] = "coarse_dirt"
    },
    ["cobbled_deepslate"] = {
        ["Default"] = "cobbled_deepslate"
    },
    ["cobblestone"] = {
        ["Default"] = "cobblestone"
    },
    ["cocoa"] = {
        ["stage"] = "cocoa_stage0",
        ["Default"] = "cocoa_stage2"
    },
    ["copper_block"] = {
        ["Default"] = "copper_block"
    },
    ["copper_ore"] = {
        ["Default"] = "copper_ore"
    },
    ["cornflower"] = {
        ["Default"] = "cornflower"
    },
    ["cracked_deepslate_bricks"] = {
        ["Default"] = "cracked_deepslate_bricks"
    },
    ["cracked_deepslate_tiles"] = {
        ["Default"] = "cracked_deepslate_tiles"
    },
    ["cracked_polished_blackstone_bricks"] = {
        ["Default"] = "cracked_polished_blackstone_bricks"
    },
    ["cracked_stone_bricks"] = {
        ["Default"] = "cracked_stone_bricks"
    },
    ["crafting_table"] = {
        ["Bottom"] = "oak_planks",
        ["Front"] = "crafting_table_front",
        ["Default"] = "crafting_table_side",
        ["Top"] = "crafting_table_top"
    },
    ["cut_sandstone"] = {
        ["Default"] = "cut_sandstone"
    },
    ["cyan_concrete"] = {
        ["Default"] = "cyan_concrete"
    },
    ["cyan_concrete_powder"] = {
        ["Default"] = "cyan_concrete_powder"
    },
    ["cyan_glazed_terracotta"] = {
        ["Default"] = "cyan_glazed_terracotta"
    },
    ["cyan_shulker_box"] = {
        ["Default"] = "cyan_shulker_box"
    },
    ["cyan_stained_glass"] = {
        ["Default"] = "cyan_stained_glass"
    },
    ["cyan_stained_glass_pane"] = {
        ["Top"] = "cyan_stained_glass_pane_top"
    },
    ["cyan_terracotta"] = {
        ["Default"] = "cyan_terracotta"
    },
    ["dandelion"] = {
        ["Default"] = "dandelion"
    },
    ["dark_oak_door"] = {
        ["Bottom"] = "dark_oak_door_bottom",
        ["Top"] = "dark_oak_door_top"
    },
    ["dark_oak_leaves"] = {
        ["Default"] = "dark_oak_leaves"
    },
    ["dark_oak_sapling"] = {
        ["Default"] = "dark_oak_sapling"
    },
    ["dark_oak_trapdoor"] = {
        ["Default"] = "dark_oak_trapdoor"
    },
    ["dark_prismarine"] = {
        ["Default"] = "dark_prismarine"
    },
    ["cursed_dungeon_bricks"] = {
        ["Default"] = "cursed_dungeons_bricks"
    },
    ["dead_bush"] = {
        ["Default"] = "dead_bush"
    },
    ["deepslate"] = {
        ["Default"] = "deepslate",
        ["Top"] = "deepslate_top"
    },
    ["deepslate_bricks"] = {
        ["Default"] = "deepslate_bricks"
    },
    ["deepslate_coal_ore"] = {
        ["Default"] = "deepslate_coal_ore"
    },
    ["deepslate_copper_ore"] = {
        ["Default"] = "deepslate_copper_ore"
    },
    ["deepslate_diamond_ore"] = {
        ["Default"] = "deepslate_diamond_ore"
    },
    ["deepslate_emerald_ore"] = {
        ["Default"] = "deepslate_emerald_ore"
    },
    ["deepslate_gold_ore"] = {
        ["Default"] = "deepslate_gold_ore"
    },
    ["deepslate_iron_ore"] = {
        ["Default"] = "deepslate_iron_ore"
    },
    ["deepslate_lapis_ore"] = {
        ["Default"] = "deepslate_lapis_ore"
    },
    ["deepslate_redstone_ore"] = {
        ["Default"] = "deepslate_redstone_ore"
    },
    ["deepslate_tiles"] = {
        ["Default"] = "deepslate_tiles"
    },
    ["detector_rail"] = {
        ["Default"] = "detector_rail"
    },
    ["detector_rail_on"] = {
        ["Default"] = "detector_rail_on"
    },
    ["diamond_block"] = {
        ["Default"] = "diamond_block"
    },
    ["diamond_ore"] = {
        ["Default"] = "diamond_ore"
    },
    ["diorite"] = {
        ["Default"] = "diorite"
    },
    ["dirt"] = {
        ["Default"] = "dirt"
    },
    ["dirt_1"] = {
        ["Default"] = "dirt_1"
    },
    ["dirt_moist"] = {
        ["Default"] = "dirt_moist"
    },
    ["dirt_path"] = {
        ["Default"] = "dirt_path_side",
        ["Top"] = "dirt_path_top"
    },
    ["dripstone_block"] = {
        ["Default"] = "dripstone_block"
    },
    ["emerald_block"] = {
        ["Default"] = "emerald_block"
    },
    ["emerald_ore"] = {
        ["Default"] = "emerald_ore"
    },
    ["enchanting_table"] = {
        ["Bottom"] = "enchanting_table_bottom",
        ["Default"] = "enchanting_table_side",
        ["Top"] = "enchanting_table_top"
    },
    ["end_stone"] = {
        ["Default"] = "end_stone"
    },
    ["end_stone_bricks"] = {
        ["Default"] = "end_stone_bricks"
    },
    ["exposed_copper"] = {
        ["Default"] = "exposed_copper"
    },
    ["exposed_cut_copper"] = {
        ["Default"] = "exposed_cut_copper"
    },
    ["farmland"] = {
        ["Default"] = "dirt",
        ["Top"] = "farmland"
    },
    ["farmland_moist"] = {
        ["Default"] = "dirt",
        ["Top"] = "farmland_moist"
    },
    ["fern"] = {
        ["Default"] = "fern"
    },
    ["fletching_table"] = {
        ["Bottom"] = "fletching_table_bottom",
        ["Front"] = "fletching_table_front",
        ["Default"] = "fletching_table_side",
        ["Top"] = "fletching_table_top"
    },
    ["flowering_azalea_leaves"] = {
        ["Default"] = "flowering_azalea_leaves"
    },
    ["flowering_azalea"] = {
        ["Default"] = "flowering_azalea_side",
        ["Top"] = "flowering_azalea_top"
    },
    ["flower_pot"] = {
        ["Default"] = "flower_pot"
    },
    ["furnace"] = {
        ["Front"] = "furnace_front",
        ["Default"] = "furnace_side",
        ["Top"] = "furnace_top"
    },
    ["furnace_on"] = {
        ["Front"] = "furnace_front_on"
    },
    ["gilded_blackstone"] = {
        ["Default"] = "gilded_blackstone"
    },
    ["glass"] = {
        ["Default"] = "glass"
    },
    ["glass_pane"] = {
        ["Top"] = "glass_pane_top"
    },
    ["glowstone"] = {
        ["Default"] = "glowstone"
    },
    ["glow_lichen"] = {
        ["Default"] = "glow_lichen"
    },
    ["gold_block"] = {
        ["Default"] = "gold_block"
    },
    ["gold_ore"] = {
        ["Default"] = "gold_ore"
    },
    ["granite"] = {
        ["Default"] = "granite"
    },
    ["grass"] = {
        ["Default"] = "grass"
    },
    ["grass_block"] = {
        ["Default"] = "grass_side_88bb66",
        ["Top"] = "grass_block_top",
        ["Bottom"] = "dirt"
    },
    ["grass_block_overlay"] = {
        ["Default"] = "grass_block_side_overlay"
    },
    ["grass_block_snow"] = {
        ["Default"] = "grass_block_snow"
    },
    ["grass_path"] = {
        ["Default"] = "grass_path_side",
        ["Top"] = "grass_path_top"
    },
    ["gravel"] = {
        ["Default"] = "gravel"
    },
    ["gray_concrete"] = {
        ["Default"] = "gray_concrete"
    },
    ["gray_concrete_powder"] = {
        ["Default"] = "gray_concrete_powder"
    },
    ["gray_glazed_terracotta"] = {
        ["Default"] = "gray_glazed_terracotta"
    },
    ["gray_shulker_box"] = {
        ["Default"] = "gray_shulker_box"
    },
    ["gray_stained_glass"] = {
        ["Default"] = "gray_stained_glass"
    },
    ["gray_stained_glass_pane"] = {
        ["Top"] = "gray_stained_glass_pane_top"
    },
    ["gray_terracotta"] = {
        ["Default"] = "gray_terracotta"
    },
    ["green_concrete"] = {
        ["Default"] = "green_concrete"
    },
    ["green_concrete_powder"] = {
        ["Default"] = "green_concrete_powder"
    },
    ["green_glazed_terracotta"] = {
        ["Default"] = "green_glazed_terracotta"
    },
    ["green_shulker_box"] = {
        ["Default"] = "green_shulker_box"
    },
    ["green_stained_glass"] = {
        ["Default"] = "green_stained_glass"
    },
    ["green_stained_glass_pane"] = {
        ["Top"] = "green_stained_glass_pane_top"
    },
    ["green_terracotta"] = {
        ["Default"] = "green_terracotta"
    },
    ["hanging_roots"] = {
        ["Default"] = "hanging_roots"
    },
    ["iron_block"] = {
        ["Default"] = "iron_block"
    },
    ["iron_door"] = {
        ["Bottom"] = "iron_door_bottom",
        ["Top"] = "iron_door_top"
    },
    ["iron_ore"] = {
        ["Default"] = "iron_ore"
    },
    ["iron_trapdoor"] = {
        ["Default"] = "iron_trapdoor"
    },
    ["jack_o_lantern"] = {
        ["Default"] = "jack_o_lantern"
    },
    ["jungle_door"] = {
        ["Bottom"] = "jungle_door_bottom",
        ["Top"] = "jungle_door_top"
    },
    ["jungle_leaves"] = {
        ["Default"] = "jungle_leaves"
    },
    ["jungle_sapling"] = {
        ["Default"] = "jungle_sapling"
    },
    ["jungle_trapdoor"] = {
        ["Default"] = "jungle_trapdoor"
    },
    ["ladder"] = {
        ["Default"] = "ladder"
    },
    ["lantern"] = {
        ["Default"] = "lantern"
    },
    ["lapis_block"] = {
        ["Default"] = "lapis_block"
    },
    ["lapis_ore"] = {
        ["Default"] = "lapis_ore"
    },
    ["large_amethyst_bud"] = {
        ["Default"] = "large_amethyst_bud"
    },
    ["large_fern"] = {
        ["Bottom"] = "large_fern_bottom",
        ["Top"] = "large_fern_top"
    },
    ["large_fern_balanced"] = {
        ["Top"] = "large_fern_top_balanced"
    },
    ["lever"] = {
        ["Default"] = "lever"
    },
    ["light_blue_concrete"] = {
        ["Default"] = "light_blue_concrete"
    },
    ["light_blue_concrete_powder"] = {
        ["Default"] = "light_blue_concrete_powder"
    },
    ["light_blue_glazed_terracotta"] = {
        ["Default"] = "light_blue_glazed_terracotta"
    },
    ["light_blue_shulker_box"] = {
        ["Default"] = "light_blue_shulker_box"
    },
    ["light_blue_stained_glass"] = {
        ["Default"] = "light_blue_stained_glass"
    },
    ["light_blue_stained_glass_pane"] = {
        ["Top"] = "light_blue_stained_glass_pane_top"
    },
    ["light_blue_terracotta"] = {
        ["Default"] = "light_blue_terracotta"
    },
    ["light_gray_concrete"] = {
        ["Default"] = "light_gray_concrete"
    },
    ["light_gray_concrete_powder"] = {
        ["Default"] = "light_gray_concrete_powder"
    },
    ["light_gray_glazed_terracotta"] = {
        ["Default"] = "light_gray_glazed_terracotta"
    },
    ["light_gray_shulker_box"] = {
        ["Default"] = "light_gray_shulker_box"
    },
    ["light_gray_stained_glass"] = {
        ["Default"] = "light_gray_stained_glass"
    },
    ["light_gray_stained_glass_pane"] = {
        ["Top"] = "light_gray_stained_glass_pane_top"
    },
    ["light_gray_terracotta"] = {
        ["Default"] = "light_gray_terracotta"
    },
    ["lilac"] = {
        ["Bottom"] = "lilac_bottom",
        ["Top"] = "lilac_top"
    },
    ["lilac_balanced"] = {
        ["Top"] = "lilac_top_balanced"
    },
    ["lily_of_the_valley"] = {
        ["Default"] = "lily_of_the_valley"
    },
    ["lime_concrete"] = {
        ["Default"] = "lime_concrete"
    },
    ["lime_concrete_powder"] = {
        ["Default"] = "lime_concrete_powder"
    },
    ["lime_glazed_terracotta"] = {
        ["Default"] = "lime_glazed_terracotta"
    },
    ["lime_shulker_box"] = {
        ["Default"] = "lime_shulker_box"
    },
    ["lime_stained_glass"] = {
        ["Default"] = "lime_stained_glass"
    },
    ["lime_stained_glass_pane"] = {
        ["Top"] = "lime_stained_glass_pane_top"
    },
    ["lime_terracotta"] = {
        ["Default"] = "lime_terracotta"
    },
    ["magenta_concrete"] = {
        ["Default"] = "magenta_concrete"
    },
    ["magenta_concrete_powder"] = {
        ["Default"] = "magenta_concrete_powder"
    },
    ["magenta_glazed_terracotta"] = {
        ["Default"] = "magenta_glazed_terracotta"
    },
    ["magenta_shulker_box"] = {
        ["Default"] = "magenta_shulker_box"
    },
    ["magenta_stained_glass"] = {
        ["Default"] = "magenta_stained_glass"
    },
    ["magenta_stained_glass_pane"] = {
        ["Top"] = "magenta_stained_glass_pane_top"
    },
    ["magenta_terracotta"] = {
        ["Default"] = "magenta_terracotta"
    },
    ["magma_block"] = {
        ["Default"] = "magma_block"
    },
    ["medium_amethyst_bud"] = {
        ["Default"] = "medium_amethyst_bud"
    },
    ["melon"] = {
        ["Default"] = "melon_side",
        ["Top"] = "melon_top"
    },
    ["melon_stem"] = {
        ["Default"] = "melon_stem"
    },
    ["attached_melon_stem"] = {
        ["Default"] = "attached_melon_stem"
    },
    ["mossy_cobblestone"] = {
        ["Default"] = "mossy_cobblestone"
    },
    ["mossy_stone_bricks"] = {
        ["Default"] = "mossy_stone_bricks"
    },
    ["moss_block"] = {
        ["Default"] = "moss_block"
    },
    ["mycelium"] = {
        ["Default"] = "mycelium_side",
        ["Top"] = "mycelium_top"
    },
    ["netherite_block"] = {
        ["Default"] = "netherite_block"
    },
    ["netherrack"] = {
        ["Default"] = "netherrack"
    },
    ["netherrack_1"] = {
        ["Default"] = "netherrack_1"
    },
    ["nether_gold_ore"] = {
        ["Default"] = "nether_gold_ore"
    },
    ["nether_quartz_ore"] = {
        ["Default"] = "nether_quartz_ore"
    },
    ["nether_sprouts"] = {
        ["Default"] = "nether_sprouts"
    },
    ["nether_wart_block"] = {
        ["Default"] = "nether_wart_block"
    },
    ["nether_wart"] = {
        ["stage"] = "nether_wart_stage0",
        ["Default"] = "nether_wart_stage2"
    },
    ["oak_leaves"] = {
        ["Default"] = "oak_leaves"
    },
    ["oak_sapling"] = {
        ["Default"] = "oak_sapling"
    },
    ["oak_trapdoor"] = {
        ["Default"] = "oak_trapdoor"
    },
    ["obsidian"] = {
        ["Default"] = "obsidian"
    },
    ["orange_concrete"] = {
        ["Default"] = "orange_concrete"
    },
    ["orange_concrete_powder"] = {
        ["Default"] = "orange_concrete_powder"
    },
    ["orange_glazed_terracotta"] = {
        ["Default"] = "orange_glazed_terracotta"
    },
    ["orange_shulker_box"] = {
        ["Default"] = "orange_shulker_box"
    },
    ["orange_stained_glass"] = {
        ["Default"] = "orange_stained_glass"
    },
    ["orange_stained_glass_pane"] = {
        ["Top"] = "orange_stained_glass_pane_top"
    },
    ["orange_terracotta"] = {
        ["Default"] = "orange_terracotta"
    },
    ["orange_tulip"] = {
        ["Default"] = "orange_tulip"
    },
    ["oxeye_daisy"] = {
        ["Default"] = "oxeye_daisy"
    },
    ["oxidized_copper"] = {
        ["Default"] = "oxidized_copper"
    },
    ["oxidized_cut_copper"] = {
        ["Default"] = "oxidized_cut_copper"
    },
    ["peony"] = {
        ["Bottom"] = "peony_bottom",
        ["Top"] = "peony_top"
    },
    ["peony_balanced"] = {
        ["Top"] = "peony_top_balanced"
    },
    ["pink_concrete"] = {
        ["Default"] = "pink_concrete"
    },
    ["pink_concrete_powder"] = {
        ["Default"] = "pink_concrete_powder"
    },
    ["pink_glazed_terracotta"] = {
        ["Default"] = "pink_glazed_terracotta"
    },
    ["pink_shulker_box"] = {
        ["Default"] = "pink_shulker_box"
    },
    ["pink_stained_glass"] = {
        ["Default"] = "pink_stained_glass"
    },
    ["pink_stained_glass_pane"] = {
        ["Top"] = "pink_stained_glass_pane_top"
    },
    ["pink_terracotta"] = {
        ["Default"] = "pink_terracotta"
    },
    ["pink_tulip"] = {
        ["Default"] = "pink_tulip"
    },
    ["podzol"] = {
        ["Default"] = "podzol_side",
        ["Top"] = "podzol_top"
    },
    ["pointed_dripstone_down_base"] = {
        ["Default"] = "pointed_dripstone_down_base"
    },
    ["pointed_dripstone_down_frustum"] = {
        ["Default"] = "pointed_dripstone_down_frustum"
    },
    ["pointed_dripstone_down_middle"] = {
        ["Default"] = "pointed_dripstone_down_middle"
    },
    ["pointed_dripstone_down_tip"] = {
        ["Default"] = "pointed_dripstone_down_tip"
    },
    ["pointed_dripstone_down_tip_merge"] = {
        ["Default"] = "pointed_dripstone_down_tip_merge"
    },
    ["pointed_dripstone_up_base"] = {
        ["Default"] = "pointed_dripstone_up_base"
    },
    ["pointed_dripstone_up_frustum"] = {
        ["Default"] = "pointed_dripstone_up_frustum"
    },
    ["pointed_dripstone_up_middle"] = {
        ["Default"] = "pointed_dripstone_up_middle"
    },
    ["pointed_dripstone_up_tip"] = {
        ["Default"] = "pointed_dripstone_up_tip"
    },
    ["pointed_dripstone_up_tip_merge"] = {
        ["Default"] = "pointed_dripstone_up_tip_merge"
    },
    ["polished_andesite"] = {
        ["Default"] = "polished_andesite"
    },
    ["polished_basalt"] = {
        ["Default"] = "polished_basalt_side",
        ["Top"] = "polished_basalt_top"
    },
    ["polished_blackstone"] = {
        ["Default"] = "polished_blackstone"
    },
    ["polished_blackstone_bricks"] = {
        ["Default"] = "polished_blackstone_bricks"
    },
    ["polished_deepslate"] = {
        ["Default"] = "polished_deepslate"
    },
    ["polished_diorite"] = {
        ["Default"] = "polished_diorite"
    },
    ["polished_granite"] = {
        ["Default"] = "polished_granite"
    },
    ["poppy"] = {
        ["Default"] = "poppy"
    },
    ["potatoes"] = {
        ["stage"] = "potatoes_stage0",
        ["Default"] = "potatoes_stage3"
    },
    ["potted_azalea_bush_plant"] = {
        ["Default"] = "potted_azalea_bush_plant"
    },
    ["potted_azalea_bush"] = {
        ["Default"] = "potted_azalea_bush_side",
        ["Top"] = "potted_azalea_bush_top"
    },
    ["potted_flowering_azalea_bush_plant"] = {
        ["Default"] = "potted_flowering_azalea_bush_plant"
    },
    ["potted_flowering_azalea_bush"] = {
        ["Default"] = "potted_flowering_azalea_bush_side",
        ["Top"] = "potted_flowering_azalea_bush_top"
    },
    ["powder_snow"] = {
        ["Default"] = "powder_snow"
    },
    ["powered_rail"] = {
        ["Default"] = "powered_rail"
    },
    ["powered_rail_on"] = {
        ["Default"] = "powered_rail_on"
    },
    ["prismarine"] = {
        ["Default"] = "prismarine"
    },
    ["prismarine_bricks"] = {
        ["Default"] = "prismarine_bricks"
    },
    ["pumpkin"] = {
        ["Default"] = "pumpkin_side",
        ["Top"] = "pumpkin_top"
    },
    ["pumpkin_stem"] = {
        ["Default"] = "pumpkin_stem"
    },
    ["purple_concrete"] = {
        ["Default"] = "purple_concrete"
    },
    ["purple_concrete_powder"] = {
        ["Default"] = "purple_concrete_powder"
    },
    ["purple_glazed_terracotta"] = {
        ["Default"] = "purple_glazed_terracotta"
    },
    ["purple_shulker_box"] = {
        ["Default"] = "purple_shulker_box"
    },
    ["purple_stained_glass"] = {
        ["Default"] = "purple_stained_glass"
    },
    ["purple_stained_glass_pane"] = {
        ["Top"] = "purple_stained_glass_pane_top"
    },
    ["purple_terracotta"] = {
        ["Default"] = "purple_terracotta"
    },
    ["purpur_block"] = {
        ["Default"] = "purpur_block"
    },
    ["purpur_pillar"] = {
        ["Default"] = "purpur_pillar",
        ["Top"] = "purpur_pillar_top"
    },
    ["quartz_block"] = {
        ["Bottom"] = "quartz_block_bottom",
        ["Default"] = "quartz_block_side",
        ["Top"] = "quartz_block_top"
    },
    ["quartz_bricks"] = {
        ["Default"] = "quartz_bricks"
    },
    ["quartz_pillar"] = {
        ["Default"] = "quartz_pillar",
        ["Top"] = "quartz_pillar_top"
    },
    ["rail"] = {
        ["Default"] = "rail"
    },
    ["rail_corner"] = {
        ["Default"] = "rail_corner"
    },
    ["raw_copper_block"] = {
        ["Default"] = "raw_copper_block"
    },
    ["raw_gold_block"] = {
        ["Default"] = "raw_gold_block"
    },
    ["raw_iron_block"] = {
        ["Default"] = "raw_iron_block"
    },
    ["redstone_block"] = {
        ["Default"] = "redstone_block"
    },
    ["redstone_ore"] = {
        ["Default"] = "redstone_ore"
    },
    ["redstone_torch"] = {
        ["Default"] = "redstone_torch_off"
    },
    ["red_concrete"] = {
        ["Default"] = "red_concrete"
    },
    ["red_concrete_powder"] = {
        ["Default"] = "red_concrete_powder"
    },
    ["red_glazed_terracotta"] = {
        ["Default"] = "red_glazed_terracotta"
    },
    ["red_mushroom"] = {
        ["Default"] = "red_mushroom"
    },
    ["red_mushroom_block"] = {
        ["Default"] = "red_mushroom_block"
    },
    ["mushroom_stem"] = {
        ["Default"] = "stem_mushroom_block"
    },
    ["red_sand"] = {
        ["Default"] = "red_sand"
    },
    ["red_sandstone"] = {
        ["Default"] = "red_sandstone",
        ["Bottom"] = "red_sandstone_bottom",
        ["Top"] = "red_sandstone_top"
    },
    ["red_shulker_box"] = {
        ["Default"] = "red_shulker_box"
    },
    ["red_stained_glass"] = {
        ["Default"] = "red_stained_glass"
    },
    ["red_stained_glass_pane"] = {
        ["Top"] = "red_stained_glass_pane_top"
    },
    ["red_terracotta"] = {
        ["Default"] = "red_terracotta"
    },
    ["red_tulip"] = {
        ["Default"] = "red_tulip"
    },
    ["rooted_dirt"] = {
        ["Default"] = "rooted_dirt"
    },
    ["rose_bush"] = {
        ["Bottom"] = "rose_bush_bottom",
        ["Top"] = "rose_bush_top"
    },
    ["rose_bush_balanced"] = {
        ["Top"] = "rose_bush_top_balanced"
    },
    ["sand"] = {
        ["Default"] = "sand"
    },
    ["sandstone"] = {
        ["Default"] = "sandstone",
        ["Bottom"] = "sandstone_bottom",
        ["Top"] = "sandstone_top"
    },
    ["sea_lantern"] = {
        ["Default"] = "sea_lantern"
    },
    ["shroomlight"] = {
        ["Default"] = "shroomlight"
    },
    ["shulker_box"] = {
        ["Default"] = "shulker_box"
    },
    ["small_amethyst_bud"] = {
        ["Default"] = "small_amethyst_bud"
    },
    ["small_dripleaf"] = {
        ["Default"] = "small_dripleaf_side",
        ["Top"] = "small_dripleaf_top"
    },
    ["small_dripleaf_stem"] = {
        ["Bottom"] = "small_dripleaf_stem_bottom",
        ["Top"] = "small_dripleaf_stem_top"
    },
    ["smithing_table"] = {
        ["Bottom"] = "smithing_table_bottom",
        ["Front"] = "smithing_table_front",
        ["Default"] = "smithing_table_side",
        ["Top"] = "smithing_table_top"
    },
    ["smoker"] = {
        ["Bottom"] = "smoker_bottom",
        ["Front"] = "smoker_front",
        ["Default"] = "smoker_side",
        ["Top"] = "smoker_top"
    },
    ["smoker_on"] = {
        ["Front"] = "smoker_front_on"
    },
    ["smooth_basalt"] = {
        ["Default"] = "smooth_basalt"
    },
    ["smooth_stone"] = {
        ["Default"] = "smooth_stone"
    },
    ["smooth_stone_slab"] = {
        ["Default"] = "smooth_stone_slab_side"
    },
    ["smooth_sandstone"] = {
        ["Default"] = "sandstone_top"
    },
    ["snow"] = {
        ["Default"] = "snow"
    },
    ["soul_lantern"] = {
        ["Default"] = "soul_lantern"
    },
    ["soul_torch"] = {
        ["Default"] = "soul_torch"
    },
    ["spore_blossom"] = {
        ["Default"] = "spore_blossom"
    },
    ["spore_blossom_base"] = {
        ["Default"] = "spore_blossom_base"
    },
    ["spruce_door"] = {
        ["Bottom"] = "spruce_door_bottom",
        ["Top"] = "spruce_door_top"
    },
    ["spruce_leaves"] = {
        ["Default"] = "spruce_leaves"
    },
    ["spruce_sapling"] = {
        ["Default"] = "spruce_sapling"
    },
    ["spruce_trapdoor"] = {
        ["Default"] = "spruce_trapdoor"
    },
    ["stone"] = {
        ["Default"] = "stone"
    },
    ["stone_bricks"] = {
        ["Default"] = "stone_bricks"
    },
    ["sugar_cane"] = {
        ["Default"] = "sugar_cane"
    },
    ["sunflower_back"] = {
        ["Default"] = "sunflower_back"
    },
    ["sunflower"] = {
        ["Bottom"] = "sunflower_bottom",
        ["Front"] = "sunflower_front",
        ["Top"] = "sunflower_top"
    },
    ["sunflower_balanced"] = {
        ["Front"] = "sunflower_front_balanced"
    },
    ["sweet_berry_bush"] = {
        ["stage"] = "sweet_berry_bush_stage0",
        ["Default"] = "sweet_berry_bush_stage3"
    },
    ["tall_grass"] = {
        ["Bottom"] = "tall_grass_bottom",
        ["Top"] = "tall_grass_top"
    },
    ["tall_grass_balanced"] = {
        ["Top"] = "tall_grass_top_balanced"
    },
    ["terracotta"] = {
        ["Default"] = "terracotta"
    },
    ["tinted_glass"] = {
        ["Default"] = "tinted_glass"
    },
    ["torch"] = {
        ["Default"] = "torch"
    },
    ["tuff"] = {
        ["Default"] = "tuff"
    },
    ["twisting_vines"] = {
        ["Default"] = "twisting_vines"
    },
    ["white_concrete"] = {
        ["Default"] = "white_concrete"
    },
    ["white_concrete_powder"] = {
        ["Default"] = "white_concrete_powder"
    },
    ["white_glazed_terracotta"] = {
        ["Default"] = "white_glazed_terracotta"
    },
    ["white_shulker_box"] = {
        ["Default"] = "white_shulker_box"
    },
    ["white_stained_glass"] = {
        ["Default"] = "white_stained_glass"
    },
    ["white_stained_glass_pane"] = {
        ["Top"] = "white_stained_glass_pane_top"
    },
    ["white_terracotta"] = {
        ["Default"] = "white_terracotta"
    },
    ["white_tulip"] = {
        ["Default"] = "white_tulip"
    },
    ["wither_rose"] = {
        ["Default"] = "wither_rose"
    },
    ["yellow_concrete"] = {
        ["Default"] = "yellow_concrete"
    },
    ["yellow_concrete_powder"] = {
        ["Default"] = "yellow_concrete_powder"
    },
    ["yellow_glazed_terracotta"] = {
        ["Default"] = "yellow_glazed_terracotta"
    },
    ["yellow_shulker_box"] = {
        ["Default"] = "yellow_shulker_box"
    },
    ["yellow_stained_glass"] = {
        ["Default"] = "yellow_stained_glass"
    }
}
return v2