-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.UtilsItems
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = {}
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
local u3 = require(game.ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData)
local u4 = require(game.ReplicatedStorage.Assets.Sprites.SpriteSheet.Position2dItems)
local u5 = require(game.ReplicatedStorage.Assets.Sprites.SpriteSheet.Position2dBlocks)
local u6 = game.ReplicatedStorage.Assets.Geometry
local u7 = require(script.Parent.Enums.ItemType)
function u1.itemIdFromName(p8, p9) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for v10, v11 in pairs(u3) do
        if v11.name == p8 then
            return v10
        end
    end
    if not p9 then
        warn(p8 .. " doesn\'t exist.")
    end
end
local u12 = {
    ["Shovel"] = "Shovel",
    ["Hoe"] = "Hoe",
    ["Pickaxe"] = "Pickaxe",
    ["Axe"] = "Axe",
    ["Sword"] = "Sword",
    ["Bow"] = "Bow",
    ["Hammer"] = "Hammer"
}
local u13 = {
    [u12.Shovel] = {},
    [u12.Hoe] = {},
    [u12.Pickaxe] = {},
    [u12.Axe] = {},
    [u12.Sword] = { u1.itemIdFromName("fire_sword"), u1.itemIdFromName("khepesh") },
    [u12.Bow] = { u1.itemIdFromName("bow") },
    [u12.Hammer] = { u1.itemIdFromName("olmec_hammer") }
}
local u14 = {
    ["Chestplate"] = "Chestplate",
    ["Helmet"] = "Helmet",
    ["Leggings"] = "Leggings",
    ["Boots"] = "Boots"
}
local u15 = {
    [u14.Chestplate] = { u1.itemIdFromName("ancient_armor") }
}
local u16 = {
    [u1.itemIdFromName("wheat")] = true,
    [u1.itemIdFromName("tomato")] = true
}
u1.ToolCategory = u12
u1.ArmorCategory = u14
function u1.getToolCategory(p17) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u12
    --]]
    if not p17 then
        return nil
    end
    if p17 == -1 then
        return nil
    end
    for v18, v19 in u13 do
        if table.find(v19, p17) then
            return v18
        end
    end
    local v20 = u3[p17].displayName:split(" ")[2]
    return v20 and u12[v20] or nil
end
function u1.getArmorCategory(p21) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u3
        [3] = u14
    --]]
    if not p21 then
        return nil
    end
    if p21 == -1 then
        return nil
    end
    for v22, v23 in u15 do
        if table.find(v23, p21) then
            return v22
        end
    end
    local v24 = (u3[p21].name:split(" ")[2] or ""):gsub("^%l", string.upper)
    return v24 and u14[v24] or nil
end
function u1.getItemBoundingBoxFromItemId(p25) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v26 = u1.getBlockIdFromItemId(p25)
    return v26 and u2[v26].boundingBox or nil
end
function u1.getItemTypeFromItemId(p27) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u6
        [3] = u7
    --]]
    local v28 = u1.getItemBoundingBoxFromItemId(p27) == "block"
    local v29 = u1.getToolCategory(p27) ~= nil
    for _, v30 in { "pressure_plate", "button" } do
        if string.find(u1.getItemName(p27), v30) then
            local v31 = u1.getBlockIdFromItemId(p27)
            if u6.Blocks:FindFirstChild(v31) then
                v28 = true
            end
        end
    end
    if v28 then
        return u7.Block
    elseif v29 then
        return u7.Tool
    else
        return u7.Object
    end
end
local u32 = {}
function u1.getBlockIdFromItemId(p33) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u32
        [3] = u3
        [4] = u2
    --]]
    if u16[p33] then
        return nil
    end
    local v34 = typeof(p33) == "number"
    local v35 = "itemId should be a number, got " .. typeof(p33)
    assert(v34, v35)
    if u32[p33] then
        return u32[p33]
    end
    local v36 = u3[p33]
    for v37, v38 in pairs(u2) do
        if v38.name == v36.name then
            u32[p33] = v37
            return v37
        end
    end
end
local u39 = {}
function u1.getItemIdFromBlockId(p40) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u2
        [3] = u3
    --]]
    local v41 = typeof(p40) == "number"
    local v42 = "itemId should be a number, got " .. typeof(p40)
    assert(v41, v42)
    if u39[p40] then
        return u39[p40]
    end
    local v43 = u2[p40]
    for v44, v45 in pairs(u3) do
        if v43.name == v45.name then
            u39[p40] = v44
            return v44
        end
    end
end
function u1.getStackSize(p46) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v47 = tonumber(p46)
    assert(v47)
    local v48 = u3[v47]
    return v48 and v48.stackSize or 1
end
function u1.getDurability(p49) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v50 = tonumber(p49)
    assert(v50)
    local v51 = u3[v50]
    if v51 then
        v51 = v51.durability
    end
    return v51
end
function u1.getItemName(p52) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v53 = u3[tonumber(p52)]
    if v53 then
        v53 = v53.name
    end
    return v53
end
function u1.getItemDisplayName(p54) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v55 = tonumber(p54)
    local v56 = u3[v55]
    if not (v56 and v56.displayName) then
        warn(v55, "not found.")
    end
    if v56 then
        v56 = v56.displayName
    end
    return v56
end
function u1.getImagePosition(p57) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
        [3] = u5
    --]]
    local v58 = u1.getItemName(p57)
    if v58 then
        return u4.data[v58] and {
            ["x"] = u4.data[v58].x,
            ["y"] = u4.data[v58].y,
            ["pixel"] = u4.meta.pixel,
            ["image"] = u4.meta.image_id
        } or (u5.data[v58] and {
            ["x"] = u5.data[v58].x,
            ["y"] = u5.data[v58].y,
            ["pixel"] = u5.meta.pixel,
            ["image"] = u5.meta.image_id
        } or nil)
    end
end
function u1.itemIdExists(p59) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3[p59]
end
function u1.getGuiColor(p60) --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v61 = u3[p60]
    if v61 then
        v61 = u3[p60].guiColor
    end
    return v61
end
function u1.getItemIdFromDisplayName(p62) --[[ Line: 255 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for v63, v64 in u3 do
        if v64.displayName == p62 then
            return v63
        end
    end
end
return u1