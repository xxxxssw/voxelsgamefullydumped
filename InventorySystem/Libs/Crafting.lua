-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.Crafting
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
local u3 = require(script.inShapeFlatten)
local u4 = require(script.ingredientsFlatten)
local u5 = require(game.ReplicatedStorage.Configuration.Items.RecipesData)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData)
local u7 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u8 = {
    ["gridSlots"] = {
        u2.specialSlots.CraftGrid1,
        u2.specialSlots.CraftGrid2,
        u2.specialSlots.CraftGrid3,
        u2.specialSlots.CraftGrid4,
        u2.specialSlots.CraftGrid5,
        u2.specialSlots.CraftGrid6,
        u2.specialSlots.CraftGrid7,
        u2.specialSlots.CraftGrid8,
        u2.specialSlots.CraftGrid9
    }
}
local function u20(p9) --[[ Line: 44 ]]
    local v10 = ""
    local v11 = ""
    for v12 = 1, 3 do
        local v13 = 0
        for v14 = 1, 3 do
            local v15 = v14 + (v12 - 1) * 3
            local v16
            if p9[v15] then
                v16 = v10 .. p9[v15]
                v13 = v13 + 1
            else
                v16 = v10 .. "X"
            end
            v10 = v16 .. " "
        end
        if v13 ~= 0 then
            v11 = v11 .. tostring(v13)
        end
    end
    local v17, _ = string.find(v10, "%d+")
    local v18, _ = string.find(string.reverse(v10), "%d+")
    if v17 then
        v10 = string.sub(v10, v17)
    end
    if v18 then
        local v19 = string.len(v10) - v18 + 1
        v10 = string.sub(v10, 1, v19)
    end
    return "{\"%d+\": \"" .. v11 .. "_" .. v10 .. "\"}"
end
local function u28(p21) --[[ Line: 75 ]]
    local v22 = {}
    local v23 = ""
    for v24 = 1, 9 do
        if p21[v24] then
            local v25 = p21[v24]
            table.insert(v22, v25)
        end
    end
    table.sort(v22)
    for v26 = 1, 9 do
        if v22[v26] then
            v23 = v23 .. v22[v26] .. " "
        end
    end
    local v27 = string.len(v23) - 1
    return "{\"%d+\": \"" .. string.sub(v23, 1, v27) .. "\"}"
end
function getCraftGrid(p29)
    --[[
    Upvalues:
        [1] = u8
        [2] = u1
    --]]
    local v30 = {}
    for _, v31 in ipairs(u8.gridSlots) do
        if p29[v31] == u1.NoItemSymbol then
            table.insert(v30, false)
        else
            local v32 = p29[v31].id
            table.insert(v30, v32)
        end
    end
    return v30
end
local function u39(p33, p34) --[[ Line: 105 ]]
    local v35 = {}
    for _, v36 in p34.ingredients do
        if not v35[v36] then
            v35[v36] = 0
        end
        v35[v36] = v35[v36] + 1
    end
    for v37, v38 in v35 do
        if not p33[v37] or p33[v37] < v38 then
            return false
        end
    end
    return true
end
local function u47(p40, p41) --[[ Line: 122 ]]
    local v42 = {}
    for _, v43 in p41.inShape do
        for _, v44 in v43 do
            if not v42[v44] then
                v42[v44] = 0
            end
            v42[v44] = v42[v44] + 1
        end
    end
    for v45, v46 in v42 do
        if not p40[v45] or p40[v45] < v46 then
            return false
        end
    end
    return true
end
local function u52(p48) --[[ Line: 141 ]]
    for v49, v50 in p48.inShape do
        if v49 == 3 then
            return false
        end
        for v51, _ in v50 do
            if v51 == 3 then
                return false
            end
        end
    end
    return true
end
function u8.client_getAvailableRecipes() --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u1
        [4] = u5
        [5] = u39
        [6] = u52
        [7] = u47
        [8] = u6
    --]]
    local v53 = u7.getState()
    local v54 = v53.windowName == "CraftingTable"
    local v55 = v53.predictedInventories.Player
    local v56 = {}
    for v57 = 1, u2.size do
        local v58 = v55[tostring(v57)]
        if v58 ~= u1.NoItemSymbol then
            if not v56[v58.id] then
                v56[v58.id] = 0
            end
            local v59 = v58.id
            v56[v59] = v56[v59] + v58.qty
        end
    end
    local v60 = {}
    for _, v61 in u5 do
        for _, v62 in v61 do
            if v62.ingredients then
                if u39(v56, v62) then
                    table.insert(v60, v62)
                end
            elseif v62.inShape then
                if (v54 or u52(v62)) and u47(v56, v62) then
                    table.insert(v60, v62)
                end
            else
                warn("problem:" .. v62)
            end
        end
    end
    for _, v63 in v60 do
        v63.name = u6[v63.result.id].displayName
    end
    table.sort(v60, function(p64, p65) --[[ Line: 201 ]]
        return p64.name < p65.name
    end)
    return v60
end
function u8.getCraftResult(p66) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u28
        [3] = u3
        [4] = u5
        [5] = u4
    --]]
    local v67 = p66.format == "Player"
    assert(v67)
    local v68 = getCraftGrid(p66)
    local v69 = u20(v68)
    local v70 = u28(v68)
    local v71 = u3
    local v72, v73 = string.find(v71, v69)
    local v74, v75
    if v72 then
        v74 = string.sub(v71, v72, v73)
        v75 = true
    else
        v75 = false
        v74 = nil
    end
    if v75 then
        local v76, v77 = string.find(v74, "\"%d+\"")
        local v78 = v76 + 1
        local v79 = v77 - 1
        local v80 = string.sub(v74, v78, v79)
        local v81 = tonumber(v80)
        local v82 = u5[v81][1].result.count
        return v81, tonumber(v82)
    end
    local v83 = u4
    local v84, v85 = string.find(v83, v70)
    local v86, v87
    if v84 then
        v86 = string.sub(v83, v84, v85)
        v87 = true
    else
        v87 = false
        v86 = nil
    end
    if not v87 then
        return nil
    end
    local v88, v89 = string.find(v86, "\"%d+\"")
    local v90 = v88 + 1
    local v91 = v89 - 1
    local v92 = string.sub(v86, v90, v91)
    local v93 = tonumber(v92)
    local v94 = u5[v93][1].result.count
    return v93, tonumber(v94)
end
return u8