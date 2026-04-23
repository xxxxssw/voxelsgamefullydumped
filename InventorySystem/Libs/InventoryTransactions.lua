-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

game:GetService("RunService")
local v1 = require(game.ReplicatedStorage.Systems.EnchantmentsSystem)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u3 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng)
local u4 = nil
local u5 = require(game.ReplicatedStorage.Systems.CraftingSystem.Configuration.CraftingTags)
local u6 = game.ReplicatedStorage.Systems.InventorySystem.Formats
local u7 = {}
local u8 = {
    ["durability"] = u3.getDurability,
    ["enchantments"] = v1.generateEnchantmentsFromCraft,
    ["compass"] = function() --[[ Name: compass, Line 21 ]] end,
    ["item_inventory"] = function() --[[ Name: item_inventory, Line 22 ]] end
}
local u9 = { "item_inventory" }
u7.TransactionType = {
    ["Default"] = "Default",
    ["Craft"] = "Craft"
}
function u7.getItemMetadataFromCell(p10) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v11 = p10 or {}
    local v12 = {}
    for _, v13 in u9 do
        v12[v13] = v11[v13]
    end
    return v12
end
function u7.substractOneFromInventory(p14, p15) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u7
    --]]
    local v16 = require(u6:FindFirstChild(p14.format))
    for v17 = 1, v16.size do
        local v18 = p14[tostring(v17)]
        if v16.constraints[tostring(v17)] == nil and (v18 ~= u2.NoItemSymbol and v18.id == p15) then
            return u7.substractFromSlot(p14, tostring(v17), 1)
        end
    end
    return 0
end
function u7.substractFromSlot(p19, p20, p21, p22) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u5
    --]]
    local v23 = tostring(p20)
    local v24 = p19[v23]
    if not v24 or v24 == u2.NoItemSymbol then
        return 0
    end
    local v25 = v24.id
    local v26 = tonumber(v25)
    if p22 == u7.TransactionType.Craft and u5.RemainingAfterCrafting[v26] then
        v24.id = u5.RemainingAfterCrafting[v26]
        return 1
    end
    if v24.qty < p21 then
        p21 = v24.qty
    end
    local v27 = p21 >= 0
    assert(v27, "negative amount?")
    v24.qty = v24.qty - p21
    if v24.qty <= 0 then
        p19[v23] = u2.NoItemSymbol
    end
    return p21
end
function u7.removeSlot(p28, p29) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p28[p29] = u2.NoItemSymbol
end
function u7.addToSlot(p30, p31, p32, p33, p34) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u8
    --]]
    local v35 = tostring(p31)
    local v36 = p34 or {}
    local v37 = u3.getStackSize(p32)
    local v38 = p30[v35]
    if v38 ~= u2.NoItemSymbol then
        local v39 = v38.id == p32
        assert(v39, "Trying to merge two stacks of different item ids")
        v38.qty = v38.qty + p33
        local v40
        if v37 < v38.qty then
            v40 = v38.qty - v37
            v38.qty = v37
        else
            v40 = 0
        end
        return v40
    end
    local v41 = typeof(p33) == "number"
    local v42 = tostring(p33) .. " is not a valid qty"
    assert(v41, v42)
    local v43 = {}
    for v44, v45 in u8 do
        v43[v44] = v36[v44] or v45(p32)
    end
    local v46 = {
        ["id"] = p32,
        ["qty"] = p33
    }
    for v47, v48 in v43 do
        v46[v47] = v48
    end
    p30[v35] = v46
    return 0
end
function u7.pushItem(p49, p50, p51, p52, p53) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u8
        [4] = u2
        [5] = u4
    --]]
    local v54 = p52 or {}
    if p51 == 0 then
        return
    end
    local v55 = require(u6:FindFirstChild(p49.format))
    local v56 = u3.getStackSize(p50)
    local v57 = {}
    for v58, v59 in u8 do
        v57[v58] = v54[v58] or v59(p50)
    end
    for v60 = 1, v55.size do
        local v61 = p49[tostring(v60)]
        if v61 ~= u2.NoItemSymbol and v61.id == p50 then
            local v62 = v56 - v61.qty
            local v63 = math.min(p51, v62)
            v61.qty = v61.qty + v63
            p51 = p51 - v63
        end
    end
    if p51 > 0 then
        for v64 = 1, v55.size do
            local v65 = p49[tostring(v64)]
            if v55.constraints[tostring(v64)] == nil and v65 == u2.NoItemSymbol then
                local v66 = math.min(p51, v56)
                local v67 = {
                    ["id"] = p50,
                    ["qty"] = v66
                }
                for v68, v69 in v57 do
                    v67[v68] = v69
                end
                p49[tostring(v64)] = v67
                p51 = p51 - v66
                if p51 == 0 then
                    break
                end
            end
        end
    end
    if typeof(p53) ~= "Vector3" or p51 <= 0 then
        return p51
    end
    u4 = require(game.ReplicatedStorage.Systems:FindFirstChild("DropsSystem"))
    local v70 = {
        ["id"] = p50,
        ["qty"] = p51
    }
    for v71, v72 in v57 do
        v70[v71] = v72
    end
    u4.server_createDrop(v70, p53)
    return 0
end
function u7.removeDurability(p73, p74) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v75 = p73[p74]
    local v76
    if v75 == u2.NoItemSymbol then
        v76 = false
    else
        v76 = v75.id
    end
    if v75 ~= u2.NoItemSymbol and v75.durability then
        local v77 = v75.durability - 1
        local v78 = u3.getDurability
        v75.durability = math.clamp(v77, 0, v78(v76))
        if v75.durability == 0 then
            p73[p74] = u2.NoItemSymbol
        end
    end
end
return u7