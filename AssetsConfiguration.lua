-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Assets.AssetsConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local v2 = {
    ["COMPILED_MATERIALS_FOLDER_NAME"] = "CompiledMaterials",
    ["DEFAULT_METALNESS_MAP"] = "rbxassetid://15809298440",
    ["DEFAULT_ROUGHNESS_MAP"] = "rbxassetid://15809153276",
    ["GRASS_MATERIAL_SIDE_OVERRIDE"] = 4.25,
    ["WOOD_ESSENCES"] = {
        ["oak"] = Color3.fromRGB(167, 137, 106),
        ["spruce"] = Color3.fromRGB(185, 83, 0),
        ["birch"] = Color3.fromRGB(211, 190, 150),
        ["dark_oak"] = Color3.fromRGB(127, 97, 80),
        ["acacia"] = Color3.fromRGB(170, 67, 67),
        ["jungle"] = Color3.fromRGB(150, 133, 133)
    },
    ["WOOD_ESSENCES_ACCENT_COLOR"] = {
        ["oak"] = Color3.fromRGB(255, 89, 89),
        ["spruce"] = Color3.fromRGB(85, 170, 127),
        ["birch"] = Color3.fromRGB(4, 175, 236),
        ["dark_oak"] = Color3.fromRGB(199, 199, 199),
        ["acacia"] = Color3.fromRGB(40, 40, 40),
        ["jungle"] = Color3.fromRGB(61, 21, 133)
    },
    ["BLOCKS_COLOR_OVERRIDE"] = {
        [v1.getBlockIdFromName("birch_leaves")] = Color3.fromRGB(128, 167, 85),
        [v1.getBlockIdFromName("spruce_leaves")] = Color3.fromRGB(97, 153, 97)
    }
}
return v2