-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Formats.Player.Enderchest
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
require(game.ReplicatedStorage.Systems.InventorySystem.Constraints)
local u4 = {
    ["specialSlots"] = {},
    ["size"] = 27,
    ["constraints"] = {},
    ["key"] = "ender_chest",
    ["createEmpty"] = function() --[[ Name: createEmpty, Line 15 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u1
        --]]
        local v2 = {
            ["format"] = script.Name
        }
        for v3 = 1, u4.size do
            v2[tostring(v3)] = u1.NoItemSymbol
        end
        return v2
    end
}
return u4