-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.ItemTags
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v2 = require(game.ReplicatedStorage.Systems.ItemsSystem.Libs.Consumables)
local v3 = require(game.ReplicatedStorage.Assets.AssetsConfiguration)
local v4 = require(game.ReplicatedStorage.Systems.HumanoidModifiersSystem)
local v5 = {
    ["AttackDebounce"] = {
        [v1.itemIdFromName("wooden_sword")] = 0.6,
        [v1.itemIdFromName("wooden_axe")] = 1,
        [v1.itemIdFromName("stone_sword")] = 0.7,
        [v1.itemIdFromName("stone_axe")] = 1.1,
        [v1.itemIdFromName("iron_sword")] = 0.6,
        [v1.itemIdFromName("iron_axe")] = 1,
        [v1.itemIdFromName("golden_sword")] = 0.5,
        [v1.itemIdFromName("golden_axe")] = 0.7,
        [v1.itemIdFromName("mythril_sword")] = 0.6,
        [v1.itemIdFromName("mythril_axe")] = 1,
        [v1.itemIdFromName("diamond_sword")] = 0.6,
        [v1.itemIdFromName("diamond_axe")] = 1,
        [v1.itemIdFromName("netherite_sword")] = 0.6,
        [v1.itemIdFromName("netherite_axe")] = 1,
        [v1.itemIdFromName("olmec_hammer")] = 1,
        [v1.itemIdFromName("khepesh")] = 0.6,
        [v1.itemIdFromName("fire_sword")] = 0.6
    },
    ["KnockbackMultiplied"] = {
        [v1.itemIdFromName("olmec_hammer")] = 3
    },
    ["ToolTip"] = {
        [v1.itemIdFromName("armor_potion")] = "Increases your defense for a while",
        [v1.itemIdFromName("damage_potion")] = "Increases your damage for a while",
        [v1.itemIdFromName("regen_potion")] = "Slowly regenerate your health for a while",
        [v1.itemIdFromName("fire_resistance_potion")] = "Reduce fire damage for a while",
        [v1.itemIdFromName("coffee")] = "Increases speed for a short while",
        [v1.itemIdFromName("compass")] = "Use it to place a waypoint. Hold it to see the waypoint",
        [v1.itemIdFromName("ender_chest")] = "Chest\'s content is shared with every Soulbound Chest",
        [v1.itemIdFromName("void_chest")] = "Keeps items inside when broken",
        [v1.itemIdFromName("recall_bell")] = "Teleports you back to your respawn point",
        [v1.itemIdFromName("debug_editBlockMetadata")] = "Dev",
        [v1.itemIdFromName("structure_entity_block")] = "Dev",
        [v1.itemIdFromName("structure_generator")] = "Dev",
        [v1.itemIdFromName("structure_forced_air")] = "Dev",
        [v1.itemIdFromName("debug_setStructureRootTool")] = "Dev",
        [v1.itemIdFromName("debug_setStructureCornerBTool")] = "Dev",
        [v1.itemIdFromName("debug_setStructureCornerATool")] = "Dev",
        [v1.itemIdFromName("debug_telemetryStick")] = "Dev",
        [v1.itemIdFromName("willothewisp")] = "Used to open a crimson portal",
        [v1.itemIdFromName("idol")] = "Offer something to it to have a bonus"
    },
    ["PlayerLocked"] = {
        [v1.itemIdFromName("mythril_sword")] = true,
        [v1.itemIdFromName("mythril_bow")] = true,
        [v1.itemIdFromName("mythril_axe")] = true,
        [v1.itemIdFromName("mythril_pickaxe")] = true,
        [v1.itemIdFromName("mythril_shovel")] = true,
        [v1.itemIdFromName("mythril_helmet")] = true,
        [v1.itemIdFromName("mythril_chestplate")] = true,
        [v1.itemIdFromName("mythril_leggings")] = true,
        [v1.itemIdFromName("mythril_boots")] = true
    },
    ["Viewport_"] = {},
    ["Viewport"] = {
        [v1.itemIdFromName("torch")] = true,
        [v1.itemIdFromName("lever")] = true,
        [v1.itemIdFromName("oak_trapdoor")] = true,
        [v1.itemIdFromName("birch_trapdoor")] = true,
        [v1.itemIdFromName("spruce_trapdoor")] = true,
        [v1.itemIdFromName("dark_oak_trapdoor")] = true,
        [v1.itemIdFromName("jungle_trapdoor")] = true,
        [v1.itemIdFromName("acacia_trapdoor")] = true,
        [v1.itemIdFromName("oak_pressure_plate")] = true,
        [v1.itemIdFromName("birch_pressure_plate")] = true,
        [v1.itemIdFromName("spruce_pressure_plate")] = true,
        [v1.itemIdFromName("dark_oak_pressure_plate")] = true,
        [v1.itemIdFromName("jungle_pressure_plate")] = true,
        [v1.itemIdFromName("acacia_pressure_plate")] = true,
        [v1.itemIdFromName("note_block")] = true,
        [v1.itemIdFromName("bomb")] = true,
        [v1.itemIdFromName("stone_button")] = true,
        [v1.itemIdFromName("oak_button")] = true,
        [v1.itemIdFromName("spruce_button")] = true,
        [v1.itemIdFromName("birch_button")] = true,
        [v1.itemIdFromName("jungle_button")] = true,
        [v1.itemIdFromName("acacia_button")] = true,
        [v1.itemIdFromName("dark_oak_button")] = true,
        [v1.itemIdFromName("woodcampfire")] = true,
        [v1.itemIdFromName("brazier")] = true,
        [v1.itemIdFromName("idol")] = true
    },
    ["Bed"] = {
        [v1.itemIdFromName("black_bed")] = true,
        [v1.itemIdFromName("blue_bed")] = true,
        [v1.itemIdFromName("brown_bed")] = true,
        [v1.itemIdFromName("cyan_bed")] = true,
        [v1.itemIdFromName("gray_bed")] = true,
        [v1.itemIdFromName("green_bed")] = true,
        [v1.itemIdFromName("light_blue_bed")] = true,
        [v1.itemIdFromName("light_gray_bed")] = true,
        [v1.itemIdFromName("lime_bed")] = true,
        [v1.itemIdFromName("magenta_bed")] = true,
        [v1.itemIdFromName("orange_bed")] = true,
        [v1.itemIdFromName("pink_bed")] = true,
        [v1.itemIdFromName("purple_bed")] = true,
        [v1.itemIdFromName("red_bed")] = true,
        [v1.itemIdFromName("white_bed")] = true,
        [v1.itemIdFromName("yellow_bed")] = true
    },
    ["Handglider"] = {
        [v1.itemIdFromName("black_handglider")] = "black",
        [v1.itemIdFromName("blue_handglider")] = "blue",
        [v1.itemIdFromName("brown_handglider")] = "brown",
        [v1.itemIdFromName("cyan_handglider")] = "cyan",
        [v1.itemIdFromName("gray_handglider")] = "gray",
        [v1.itemIdFromName("green_handglider")] = "green",
        [v1.itemIdFromName("light_blue_handglider")] = "light_blue",
        [v1.itemIdFromName("light_gray_handglider")] = "light_gray",
        [v1.itemIdFromName("lime_handglider")] = "lime",
        [v1.itemIdFromName("magenta_handglider")] = "magenta",
        [v1.itemIdFromName("orange_handglider")] = "orange",
        [v1.itemIdFromName("pink_handglider")] = "pink",
        [v1.itemIdFromName("purple_handglider")] = "purple",
        [v1.itemIdFromName("red_handglider")] = "red",
        [v1.itemIdFromName("white_handglider")] = "white",
        [v1.itemIdFromName("yellow_handglider")] = "yellow"
    },
    ["NoDespawn"] = {},
    ["NoDespawn_"] = {
        [v1.itemIdFromName("bread")] = true,
        [v1.itemIdFromName("torch")] = true,
        [v1.itemIdFromName("chest")] = true,
        [v1.itemIdFromName("furnace")] = true,
        [v1.itemIdFromName("coal")] = true,
        [v1.itemIdFromName("ender_chest")] = true,
        [v1.itemIdFromName("void_chest")] = true,
        [v1.itemIdFromName("iron_block")] = true,
        [v1.itemIdFromName("iron_ingot")] = true,
        [v1.itemIdFromName("iron_sword")] = true,
        [v1.itemIdFromName("iron_pickaxe")] = true,
        [v1.itemIdFromName("iron_axe")] = true,
        [v1.itemIdFromName("iron_shovel")] = true,
        [v1.itemIdFromName("iron_hoe")] = true,
        [v1.itemIdFromName("iron_helmet")] = true,
        [v1.itemIdFromName("iron_chestplate")] = true,
        [v1.itemIdFromName("iron_leggings")] = true,
        [v1.itemIdFromName("iron_boots")] = true,
        [v1.itemIdFromName("gold_block")] = true,
        [v1.itemIdFromName("gold_ingot")] = true,
        [v1.itemIdFromName("golden_sword")] = true,
        [v1.itemIdFromName("golden_pickaxe")] = true,
        [v1.itemIdFromName("golden_axe")] = true,
        [v1.itemIdFromName("golden_shovel")] = true,
        [v1.itemIdFromName("golden_hoe")] = true,
        [v1.itemIdFromName("golden_helmet")] = true,
        [v1.itemIdFromName("golden_chestplate")] = true,
        [v1.itemIdFromName("golden_leggings")] = true,
        [v1.itemIdFromName("golden_boots")] = true,
        [v1.itemIdFromName("diamond_block")] = true,
        [v1.itemIdFromName("diamond")] = true,
        [v1.itemIdFromName("diamond_sword")] = true,
        [v1.itemIdFromName("diamond_pickaxe")] = true,
        [v1.itemIdFromName("diamond_axe")] = true,
        [v1.itemIdFromName("diamond_shovel")] = true,
        [v1.itemIdFromName("diamond_hoe")] = true,
        [v1.itemIdFromName("diamond_helmet")] = true,
        [v1.itemIdFromName("diamond_chestplate")] = true,
        [v1.itemIdFromName("diamond_leggings")] = true,
        [v1.itemIdFromName("diamond_boots")] = true,
        [v1.itemIdFromName("willothewisp")] = true,
        [v1.itemIdFromName("recall_bell")] = true,
        [v1.itemIdFromName("damage_potion")] = true,
        [v1.itemIdFromName("armor_potion")] = true,
        [v1.itemIdFromName("regen_potion")] = true,
        [v1.itemIdFromName("heal_potion")] = true,
        [v1.itemIdFromName("fire_resistance_potion")] = true,
        [v1.itemIdFromName("idol")] = true,
        [v1.itemIdFromName("olmec_hammer")] = true,
        [v1.itemIdFromName("fire_sword")] = true,
        [v1.itemIdFromName("burger")] = true,
        [v1.itemIdFromName("soup")] = true
    },
    ["Consumable"] = {
        [v1.itemIdFromName("apple")] = v2.foodEatenFactory(3, 3),
        [v1.itemIdFromName("cherries")] = v2.foodEatenFactory(2, 3),
        [v1.itemIdFromName("banana")] = v2.foodEatenFactory(3, 5),
        [v1.itemIdFromName("mango")] = v2.foodEatenFactory(4, 3),
        [v1.itemIdFromName("avocado")] = v2.foodEatenFactory(4, 3),
        [v1.itemIdFromName("bread")] = v2.foodEatenFactory(4, 4),
        [v1.itemIdFromName("beef")] = v2.foodEatenFactory(2, 20),
        [v1.itemIdFromName("cooked_beef")] = v2.foodEatenFactory(5, 4),
        [v1.itemIdFromName("porkchop")] = v2.foodEatenFactory(2, 20),
        [v1.itemIdFromName("cooked_porkchop")] = v2.foodEatenFactory(5, 4),
        [v1.itemIdFromName("milk_bucket")] = v2.foodEatenFactory(1, 10),
        [v1.itemIdFromName("melon_slice")] = v2.foodEatenFactory(0, 0),
        [v1.itemIdFromName("heal_potion")] = v2.foodEatenFactory(5, 0),
        [v1.itemIdFromName("regen_potion")] = v2.foodEatenFactory(0, 0),
        [v1.itemIdFromName("armor_potion")] = v2.foodEatenFactory(0, 0),
        [v1.itemIdFromName("damage_potion")] = v2.foodEatenFactory(0, 0),
        [v1.itemIdFromName("fire_resistance_potion")] = v2.foodEatenFactory(0, 0),
        [v1.itemIdFromName("tomato")] = v2.foodEatenFactory(2, 3),
        [v1.itemIdFromName("cheese")] = v2.foodEatenFactory(2, 3),
        [v1.itemIdFromName("soup")] = v2.foodEatenFactory(5, 3),
        [v1.itemIdFromName("burger")] = v2.foodEatenFactory(9, 3),
        [v1.itemIdFromName("coffee")] = v2.foodEatenFactory(0, 3),
        [v1.itemIdFromName("blueberries")] = v2.foodEatenFactory(1, 3),
        [v1.itemIdFromName("blueberry_pie")] = v2.foodEatenFactory(5, 3),
        [v1.itemIdFromName("spaghetti")] = v2.foodEatenFactory(5, 3)
    },
    ["PetConsumable"] = {
        [v1.itemIdFromName("apple")] = 3,
        [v1.itemIdFromName("cherries")] = 3,
        [v1.itemIdFromName("banana")] = 3,
        [v1.itemIdFromName("mango")] = 4,
        [v1.itemIdFromName("avocado")] = 4,
        [v1.itemIdFromName("bread")] = 4,
        [v1.itemIdFromName("beef")] = 2,
        [v1.itemIdFromName("cooked_beef")] = 5,
        [v1.itemIdFromName("porkchop")] = 2,
        [v1.itemIdFromName("cooked_porkchop")] = 5,
        [v1.itemIdFromName("melon_slice")] = 2,
        [v1.itemIdFromName("heal_potion")] = 8,
        [v1.itemIdFromName("tomato")] = 2,
        [v1.itemIdFromName("cheese")] = 2,
        [v1.itemIdFromName("soup")] = 8,
        [v1.itemIdFromName("burger")] = 10,
        [v1.itemIdFromName("blueberries")] = 8,
        [v1.itemIdFromName("blueberry_pie")] = 8,
        [v1.itemIdFromName("spaghetti")] = 10
    },
    ["Slurpable"] = {
        [v1.itemIdFromName("milk_bucket")] = true,
        [v1.itemIdFromName("heal_potion")] = true,
        [v1.itemIdFromName("regen_potion")] = true,
        [v1.itemIdFromName("armor_potion")] = true,
        [v1.itemIdFromName("damage_potion")] = true,
        [v1.itemIdFromName("fire_resistance_potion")] = true,
        [v1.itemIdFromName("soup")] = true,
        [v1.itemIdFromName("coffee")] = true
    },
    ["ReturnsOnConsume"] = {
        [v1.itemIdFromName("milk_bucket")] = v1.itemIdFromName("bucket")
    }
}
local v6 = {
    [v1.itemIdFromName("regen_potion")] = {
        ["name"] = v4.MODIFIERS.HealthRegen,
        ["duration"] = 30
    },
    [v1.itemIdFromName("melon_slice")] = {
        ["name"] = v4.MODIFIERS.HealthRegen,
        ["duration"] = 5
    },
    [v1.itemIdFromName("damage_potion")] = {
        ["name"] = v4.MODIFIERS.DamageBoost,
        ["duration"] = 120
    },
    [v1.itemIdFromName("armor_potion")] = {
        ["name"] = v4.MODIFIERS.ArmorBoost,
        ["duration"] = 180
    },
    [v1.itemIdFromName("fire_resistance_potion")] = {
        ["name"] = v4.MODIFIERS.FireResistance,
        ["duration"] = 80
    },
    [v1.itemIdFromName("soup")] = {
        ["name"] = v4.MODIFIERS.HealthRegen,
        ["duration"] = 5
    },
    [v1.itemIdFromName("burger")] = {
        ["name"] = v4.MODIFIERS.HealthRegen,
        ["duration"] = 7
    },
    [v1.itemIdFromName("spaghetti")] = {
        ["name"] = v4.MODIFIERS.DamageBoost,
        ["duration"] = 5
    },
    [v1.itemIdFromName("blueberry_pie")] = {
        ["name"] = v4.MODIFIERS.ArmorBoost,
        ["duration"] = 5
    },
    [v1.itemIdFromName("coffee")] = {
        ["name"] = v4.MODIFIERS.SpeedBoost,
        ["duration"] = 35
    }
}
v5.ModifierOnConsume = v6
v5.OnHitApplyModifier = {}
v5.RequiresMissingHealth = {
    [v1.itemIdFromName("apple")] = true,
    [v1.itemIdFromName("bread")] = true,
    [v1.itemIdFromName("beef")] = true,
    [v1.itemIdFromName("cooked_beef")] = true,
    [v1.itemIdFromName("porkchop")] = true,
    [v1.itemIdFromName("cooked_porkchop")] = true,
    [v1.itemIdFromName("cherries")] = true,
    [v1.itemIdFromName("banana")] = true,
    [v1.itemIdFromName("mango")] = true,
    [v1.itemIdFromName("avocado")] = true,
    [v1.itemIdFromName("heal_potion")] = true,
    [v1.itemIdFromName("burger")] = true,
    [v1.itemIdFromName("soup")] = true,
    [v1.itemIdFromName("tomato")] = true,
    [v1.itemIdFromName("cheese")] = true,
    [v1.itemIdFromName("blueberries")] = true,
    [v1.itemIdFromName("blueberry_pie")] = true,
    [v1.itemIdFromName("spaghetti")] = true
}
v5.RecolorGui = {
    [v1.itemIdFromName("grass")] = Color3.fromRGB(83, 170, 83),
    [v1.itemIdFromName("tall_grass")] = Color3.fromRGB(83, 170, 83),
    [v1.itemIdFromName("fern")] = Color3.fromRGB(83, 170, 83),
    [v1.itemIdFromName("large_fern")] = Color3.fromRGB(83, 170, 83),
    [v1.itemIdFromName("oak_door")] = v3.WOOD_ESSENCES.oak,
    [v1.itemIdFromName("acacia_door")] = v3.WOOD_ESSENCES.acacia,
    [v1.itemIdFromName("birch_door")] = v3.WOOD_ESSENCES.birch,
    [v1.itemIdFromName("dark_oak_door")] = v3.WOOD_ESSENCES.dark_oak,
    [v1.itemIdFromName("spruce_door")] = v3.WOOD_ESSENCES.spruce,
    [v1.itemIdFromName("jungle_door")] = v3.WOOD_ESSENCES.jungle,
    [v1.itemIdFromName("oak_trapdoor")] = v3.WOOD_ESSENCES.oak,
    [v1.itemIdFromName("acacia_trapdoor")] = v3.WOOD_ESSENCES.acacia,
    [v1.itemIdFromName("birch_trapdoor")] = v3.WOOD_ESSENCES.birch,
    [v1.itemIdFromName("dark_oak_trapdoor")] = v3.WOOD_ESSENCES.dark_oak,
    [v1.itemIdFromName("spruce_trapdoor")] = v3.WOOD_ESSENCES.spruce,
    [v1.itemIdFromName("jungle_trapdoor")] = v3.WOOD_ESSENCES.jungle
}
v5.InterestCow = {
    [v1.itemIdFromName("tall_grass")] = true,
    [v1.itemIdFromName("wheat")] = true,
    [v1.itemIdFromName("grass")] = true
}
v5.InterestSheep = {
    [v1.itemIdFromName("tall_grass")] = true,
    [v1.itemIdFromName("wheat")] = true,
    [v1.itemIdFromName("grass")] = true,
    [v1.itemIdFromName("bread")] = true
}
v5.InterestPig = {
    [v1.itemIdFromName("apple")] = true,
    [v1.itemIdFromName("avocado")] = true,
    [v1.itemIdFromName("mango")] = true,
    [v1.itemIdFromName("cherries")] = true,
    [v1.itemIdFromName("banana")] = true,
    [v1.itemIdFromName("bread")] = true,
    [v1.itemIdFromName("melon_slice")] = true,
    [v1.itemIdFromName("burger")] = true,
    [v1.itemIdFromName("soup")] = true,
    [v1.itemIdFromName("tomato")] = true,
    [v1.itemIdFromName("cheese")] = true
}
v5.InterestTurkey = {
    [v1.itemIdFromName("wheat_seeds")] = true,
    [v1.itemIdFromName("tomato_seeds")] = true,
    [v1.itemIdFromName("cherries")] = true,
    [v1.itemIdFromName("wheat")] = true,
    [v1.itemIdFromName("bread")] = true,
    [v1.itemIdFromName("melon_slice")] = true
}
v5.InterestHoodCreature = {
    [v1.itemIdFromName("gold_ingot")] = 1,
    [v1.itemIdFromName("gold_ore")] = 1,
    [v1.itemIdFromName("golden_shovel")] = 1,
    [v1.itemIdFromName("golden_sword")] = 2,
    [v1.itemIdFromName("golden_hoe")] = 2,
    [v1.itemIdFromName("golden_boots")] = 2,
    [v1.itemIdFromName("golden_pickaxe")] = 3,
    [v1.itemIdFromName("golden_axe")] = 3,
    [v1.itemIdFromName("golden_helmet")] = 3,
    [v1.itemIdFromName("golden_leggings")] = 3,
    [v1.itemIdFromName("golden_chestplate")] = 4,
    [v1.itemIdFromName("gold_block")] = 4
}
return v5