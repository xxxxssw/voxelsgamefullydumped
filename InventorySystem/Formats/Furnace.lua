-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Formats.Furnace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local v2 = require(game.ReplicatedStorage.Systems.InventorySystem.Constraints)
local v3 = {
    ["Item"] = "1",
    ["Fuel"] = "2",
    ["Output"] = "3"
}
local u6 = {
    ["specialSlots"] = v3,
    ["size"] = 3,
    ["constraints"] = {
        [v3.Fuel] = v2.Fuel,
        [v3.Output] = v2.Output
    },
    ["createEmpty"] = function() --[[ Name: createEmpty, Line 19 ]]
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