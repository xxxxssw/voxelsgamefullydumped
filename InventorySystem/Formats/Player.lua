-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Formats.Player
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local v2 = require(game.ReplicatedStorage.Systems.InventorySystem.Constraints)
local v3 = {
    ["Boots"] = "37",
    ["Leggings"] = "38",
    ["Chestplate"] = "39",
    ["Helmet"] = "40",
    ["CraftGrid1"] = "41",
    ["CraftGrid2"] = "42",
    ["CraftGrid3"] = "43",
    ["CraftGrid4"] = "44",
    ["CraftGrid5"] = "45",
    ["CraftGrid6"] = "46",
    ["CraftGrid7"] = "47",
    ["CraftGrid8"] = "48",
    ["CraftGrid9"] = "49",
    ["Mouse"] = "50"
}
local u6 = {
    ["specialSlots"] = v3,
    ["size"] = 50,
    ["constraints"] = {
        [v3.Boots] = v2.Boots,
        [v3.Leggings] = v2.Leggings,
        [v3.Chestplate] = v2.Chestplate,
        [v3.Helmet] = v2.Helmet,
        [v3.CraftGrid1] = v2.CraftGrid,
        [v3.CraftGrid2] = v2.CraftGrid,
        [v3.CraftGrid3] = v2.CraftGrid,
        [v3.CraftGrid4] = v2.CraftGrid,
        [v3.CraftGrid5] = v2.CraftGrid,
        [v3.CraftGrid6] = v2.CraftGrid,
        [v3.CraftGrid7] = v2.CraftGrid,
        [v3.CraftGrid8] = v2.CraftGrid,
        [v3.CraftGrid9] = v2.CraftGrid,
        [v3.Mouse] = v2.Mouse
    },
    ["createEmpty"] = function() --[[ Name: createEmpty, Line 45 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u1
        --]]
        local v4 = {
            ["format"] = script.Name
        }
        for v5 = 1, u6.size do
            v4[tostring(v5)] = u1.NoItemSymbol
        end
        return v4
    end
}
return u6