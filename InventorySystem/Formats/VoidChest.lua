-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Formats.VoidChest
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local v2 = require(game.ReplicatedStorage.Systems.InventorySystem.Constraints)
local u3 = {
    ["size"] = 27,
    ["constraints"] = {}
}
for v4 = 1, u3.size do
    u3.constraints[tostring(v4)] = v2.VoidChest
end
function u3.createEmpty() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v5 = {
        ["format"] = script.Name
    }
    for v6 = 1, u3.size do
        v5[tostring(v6)] = u1.NoItemSymbol
    end
    return v5
end
return u3