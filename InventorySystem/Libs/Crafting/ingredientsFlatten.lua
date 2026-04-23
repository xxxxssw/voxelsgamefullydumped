-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.Crafting.ingredientsFlatten
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = require(game.ReplicatedStorage.Configuration.Items.ItemsWhitelist)
local v2 = require(script.ingredientsFlattenWithoutFilter)
local v3 = require(script.Utils)
local v4 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v5 = {}
for v6, v7 in v2:gmatch("{\"(%d+)\"([^}]+)}") do
    if v1[tonumber(v6)] then
        local v8 = string.format
        table.insert(v5, v8("{\"%i\"%s}", v6, v7))
    end
end
for v9 in v3.Dye do
    for v10 in v3.Bed do
        if v10 ~= v4.itemIdFromName("white_bed") then
            local v11 = v4.getItemName(v9)
            local v12 = string.match(v11, "(.*)_dye")
            local v13 = string.format("%s_bed", v12)
            local v14 = v4.itemIdFromName(v13)
            if v10 ~= v14 then
                local v15
                if v10 < v9 then
                    v15 = string.format("{\"%i\": \"%i %i\"}", v14, v10, v9)
                else
                    v15 = string.format("{\"%i\": \"%i %i\"}", v14, v9, v10)
                end
                table.insert(v5, v15)
            end
        end
    end
end
return table.concat(v5, ",")