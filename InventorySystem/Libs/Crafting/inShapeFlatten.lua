-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.Crafting.inShapeFlatten
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = require(game.ReplicatedStorage.Configuration.Items.ItemsWhitelist)
local v2 = require(script.inShapeFlattenWithoutFilter)
local v3 = {}
for v4, v5 in string.gsub(v2, "{\"526\": \"111_583 X X 545 X X 553\"}", "{\"526\": \"111_12 X X 545 X X 553\"}"):gmatch("{\"(%d+)\"([^}]+)}") do
    if v1[tonumber(v4)] then
        local v6 = string.format
        table.insert(v3, v6("{\"%i\"%s}", v4, v5))
    end
end
return table.concat(v3, ",")