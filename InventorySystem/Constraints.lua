-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Constraints
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Configuration.Items.ArmorItems)
local u2 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v5 = {
    ["Output"] = function(_) --[[ Name: Output, Line 16 ]]
        return false
    end,
    ["Fuel"] = function(_) --[[ Name: Fuel, Line 20 ]]
        return true
    end,
    ["canBeEnchanted"] = function(p3) --[[ Name: canBeEnchanted, Line 24 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p3 == u2.itemIdFromName("diamond_sword") then
            return true
        end
    end,
    ["canBeUsedToEnchant"] = function(p4) --[[ Name: canBeUsedToEnchant, Line 30 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p4 == u2.itemIdFromName("upgrade_shard") then
            return true
        end
    end
}
local u6 = "Helmet"
function v5.Helmet(p7) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u6
    --]]
    local v8 = u1.render[p7]
    if v8 then
        return v8.geometry.Parent.Name == u6
    else
        return false
    end
end
local u9 = "Chestplate"
function v5.Chestplate(p10) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u9
    --]]
    local v11 = u1.render[p10]
    if v11 then
        return v11.geometry.Parent.Name == u9
    else
        return false
    end
end
local u12 = "Leggings"
function v5.Leggings(p13) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
    --]]
    local v14 = u1.render[p13]
    if v14 then
        return v14.geometry.Parent.Name == u12
    else
        return false
    end
end
local u15 = "Boots"
function v5.Boots(p16) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u15
    --]]
    local v17 = u1.render[p16]
    if v17 then
        return v17.geometry.Parent.Name == u15
    else
        return false
    end
end
function v5.CraftGrid() --[[ Line: 42 ]]
    return true
end
function v5.Mouse(_) --[[ Line: 46 ]]
    return true
end
function v5.VoidChest(p18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return p18 ~= u2.itemIdFromName("void_chest")
end
return v5