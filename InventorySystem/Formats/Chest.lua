-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Formats.Chest
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u4 = {
    ["size"] = 27,
    ["constraints"] = {},
    ["createEmpty"] = function() --[[ Name: createEmpty, Line 8 ]]
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