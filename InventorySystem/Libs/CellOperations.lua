-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.CellOperations
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u6 = require(game.ReplicatedStorage.Systems.DropsSystem)
local u7 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u8 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.CellReference)
local u9 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
local u10 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u11 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
local u12 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u13 = require(game.ReplicatedStorage.Libs.Coordinates)
local u14 = require(game.ReplicatedStorage.Systems.CraftingSystem)
local u15 = require(game.ReplicatedStorage.Systems.InventorySystem.Constraints)
local u16 = require(game.ReplicatedStorage.Libs.Utils)
local u17 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u18 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u19 = u1.Systems.InventorySystem.Network
local u20 = u1.Client.States.InventoryState.CurrentContainer
local u21 = v2.LocalPlayer
local u22 = u1.Client.Events.LocalNotification
local u23 = v3:IsClient()
u12.itemIdFromName("void_chest")
local u24 = {}
function craftOnce(p25, p26, p27, p28)
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u5
        [4] = u10
    --]]
    for v29, v30 in pairs(u9.constraints) do
        if v30 == u15.CraftGrid then
            if p25[v29] == u5.NoItemSymbol then
                if p28[v29] ~= u5.NoItemSymbol then
                    return false
                end
            else
                if p25[v29].id ~= p28[v29].id then
                    return false
                end
                if u10.substractFromSlot(p25, v29, 1, u10.TransactionType.Craft) == 0 then
                    return false
                end
            end
        end
    end
    return u10.addToSlot(p25, u9.specialSlots.Mouse, p26, p27) == 0
end
function u24.craft(p31, p32) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
    --]]
    local v33, v34 = u14.getCraftResult(p31)
    if v33 == nil then
        return false
    end
    local v35 = p31
    local v36 = false
    for _ = 1, p32 do
        local v37 = u16.deepCopy(p31)
        if not craftOnce(v37, v33, v34, v35) then
            break
        end
        p31 = v37
        v36 = true
    end
    return v36, p31
end
function u24.canPourIntoSlot(p38, p39) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u18
        [4] = u23
        [5] = u22
        [6] = u12
    --]]
    local v40 = u8.readCellData(p38)
    local v41 = u8.readCellData(p39)
    if v40 == nil or v41 == nil then
        return false
    elseif v40 == u4.NoItemSymbol then
        return false
    else
        if p38.container ~= p39.container then
            if p38.container ~= u8.InfiniteContainer and (v40 ~= u4.NoItemSymbol and u18.PlayerLocked[v40.id]) then
                if u23 then
                    u22:Fire("This item cannot placed in a container")
                end
                return false
            end
            if p39.container ~= u8.InfiniteContainer and (v41 ~= u4.NoItemSymbol and u18.PlayerLocked[v41.id]) then
                if u23 then
                    u22:Fire("This item cannot placed in a container")
                end
                return false
            end
        end
        local v42 = u8.getConstraint(p39)
        if v42 == nil or v42(v40.id) == true then
            local v43 = u12.getStackSize(v40.id)
            if v41 == u4.NoItemSymbol then
                return true, v43
            else
                local v44 = v43 - v41.qty
                if v44 <= 0 then
                    return false
                else
                    return v40.id == v41.id, v44
                end
            end
        else
            return false
        end
    end
end
function pourIntoSlot(p45, p46, p47)
    --[[
    Upvalues:
        [1] = u24
        [2] = u8
        [3] = u10
        [4] = u23
        [5] = u1
    --]]
    local v48, v49 = u24.canPourIntoSlot(p45, p46)
    if not v48 then
        return false
    end
    local v50 = u8.getInventory(p45)
    local v51 = u8.getInventory(p46)
    local v52 = u8.readCellData(p45)
    local v53 = v52.id
    if v49 >= p47 then
        v49 = p47
    end
    if p45.container ~= u8.InfiniteContainer then
        v49 = u10.substractFromSlot(v50, p45.slot, v49)
    end
    if p46.container ~= u8.InfiniteContainer then
        u10.addToSlot(v51, p46.slot, v53, v49, v52)
    end
    if p45.container ~= u8.InfiniteContainer then
        u8.setCellData(p45, v50[p45.slot])
    end
    if p46.container ~= u8.InfiniteContainer then
        u8.setCellData(p46, v51[p46.slot])
    end
    if u23 then
        u1.Client.Events.AnimateCell:Fire(p45, p46, v49)
    end
    return true
end
function swapSlots(p54, p55)
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u18
        [4] = u23
        [5] = u22
        [6] = u5
        [7] = u1
    --]]
    local v56 = u8.readCellData(p54)
    local v57 = u8.readCellData(p55)
    if v56 == nil or v57 == nil then
        return false
    end
    local v58 = u8.getConstraint(p55)
    if v56 ~= u4.NoItemSymbol and (v58 ~= nil and v58(v56.id) ~= true) then
        return false
    end
    local v59 = u8.getConstraint(p54)
    if v57 ~= u4.NoItemSymbol and (v59 ~= nil and v59(v57.id) ~= true) then
        return false
    end
    if p54.container ~= p55.container and p55.container ~= u8.InfiniteContainer then
        if v56 ~= u4.NoItemSymbol and u18.PlayerLocked[v56.id] then
            if u23 then
                u22:Fire("This item cannot placed in a container")
            end
            return false
        end
        if v57 ~= u4.NoItemSymbol and u18.PlayerLocked[v57.id] then
            if u23 then
                u22:Fire("This item cannot placed in a container")
            end
            return false
        end
    end
    if p55.container == u8.InfiniteContainer then
        if v56 == u5.NoItemSymbol then
            u8.setCellData(p54, v57)
        else
            u8.setCellData(p54, u5.NoItemSymbol)
        end
    else
        u8.setCellData(p54, v57)
    end
    u8.setCellData(p55, v56)
    if u23 then
        local v60 = u1.Client.Events.AnimateCell
        local v61
        if v56 == u4.NoItemSymbol then
            v61 = false
        else
            v61 = v56.qty
        end
        v60:Fire(p54, p55, v61)
        local v62 = u1.Client.Events.AnimateCell
        local v63
        if v57 == u4.NoItemSymbol then
            v63 = false
        else
            v63 = v57.qty
        end
        v62:Fire(p55, p54, v63)
    end
    return true
end
function u24.client_craft(u64) --[[ Line: 271 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u24
        [3] = u19
    --]]
    local v65 = u7.getState()
    local v66, v67 = u24.craft(v65.predictedInventories.Player, u64)
    if not v66 then
        return v66
    end
    u7.setPredictedPlayerInventory(v67)
    local u68 = nil
    local _, v69 = pcall(function() --[[ Line: 279 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u19
            [3] = u64
        --]]
        u68 = u19.Craft:InvokeServer(u64)
    end)
    if u68 ~= true then
        u7.reconcile()
        if v69 then
            warn("CellOperations.client_craft " .. v69)
        end
    end
    return u68
end
function u24.client_pourIntoSlot(u70, u71, u72) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u7
    --]]
    if pourIntoSlot(u70, u71, u72) then
        local u73 = nil
        local _, v74 = pcall(function() --[[ Line: 302 ]]
            --[[
            Upvalues:
                [1] = u73
                [2] = u19
                [3] = u70
                [4] = u71
                [5] = u72
            --]]
            u73 = u19.PourIntoSlot:InvokeServer(u70, u71, u72)
        end)
        if u73 ~= true then
            u7.reconcile()
            if v74 then
                warn("CellOperations.client_pourIntoSlot " .. v74)
            end
        end
    end
end
function u24.client_swapSlots(u75, u76) --[[ Line: 315 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u7
    --]]
    if swapSlots(u75, u76) then
        local u77 = nil
        local _, v78 = pcall(function() --[[ Line: 322 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u19
                [3] = u75
                [4] = u76
            --]]
            u77 = u19.SwapSlots:InvokeServer(u75, u76)
        end)
        if u77 ~= true then
            u7.reconcile()
            if v78 then
                warn("CellOperations.client_swapSlots " .. v78)
            end
        end
    end
end
function u24.client_autoSort(u79) --[[ Line: 342 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u13
        [4] = u20
        [5] = u8
        [6] = u4
        [7] = u5
        [8] = u24
        [9] = u6
    --]]
    local v80 = u7.getState()
    local v81 = v80.predictedInventories.Player
    local v82 = u21
    if v80.predictedInventories.Block ~= nil and u79.container == u21 then
        v81 = v80.predictedInventories.Block
        v82 = u13.fromBlockInstance(u20.Value)
    end
    if u8.readCellData(u79) ~= u4.NoItemSymbol then
        for v83 = u5.Formats[v81.format].size, 1, -1 do
            local u84 = u8.new(v82, v83)
            if u8.readCellData(u79) == u4.NoItemSymbol then
                return
            end
            if not u8.equals(u84, u79) and (u8.readCellData(u84) ~= u4.NoItemSymbol and (u5.Formats[v81.format].constraints[tostring(v83)] == nil and u24.canPourIntoSlot(u79, u84))) then
                task.spawn(function() --[[ Line: 376 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u79
                        [3] = u84
                    --]]
                    u24.client_pourIntoSlot(u79, u84, 64)
                end)
            end
        end
    end
    if u8.readCellData(u79) ~= u4.NoItemSymbol then
        for v85 = u5.Formats[v81.format].size, 1, -1 do
            local v86 = u8.new(v82, v85)
            if u5.Formats[v81.format].constraints[tostring(v85)] == nil then
                if u8.equals(v86, u79) then
                    return
                end
                if u8.readCellData(v86) == u4.NoItemSymbol then
                    u24.client_swapSlots(u79, v86)
                    return
                end
            end
        end
    end
    if u8.readCellData(u79) ~= u4.NoItemSymbol and u79.container == u21 then
        u6.client_dropItemFromPlayerInventory(u79.slot, 64)
    end
end
function u24.server_reconcileStorageBlock(p87) --[[ Line: 414 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u19
    --]]
    local v88 = u11.server_getPlayersWithOpenedContainer(p87)
    for _, v89 in ipairs(v88) do
        u19.Reconcile:FireClient(v89, "block")
    end
end
local function u96(p90, p91) --[[ Line: 425 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u19
    --]]
    for _, v92 in ipairs(p91) do
        local v93 = v92.container
        if typeof(v93) == "Vector3" then
            local v94 = u11.server_getPlayersWithOpenedContainer(v92.container)
            for _, v95 in ipairs(v94) do
                if v95 ~= p90 then
                    u19.Reconcile:FireClient(v95, "block")
                end
            end
        end
    end
end
local function u100(p97, p98) --[[ Line: 441 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u17
    --]]
    if typeof(p98) ~= "table" then
        return false
    end
    if p98.container == u8.InfiniteContainer then
        return u17.hasCreativeInventoryAccess(p97)
    end
    local v99 = p98.container
    return (typeof(v99) ~= "Instance" or not p98.container:IsA("Player")) and true or p98.container == p97
end
function u24.server_pourIntoSlot(p101, p102, p103, p104) --[[ Line: 468 ]]
    --[[
    Upvalues:
        [1] = u100
        [2] = u96
    --]]
    if not (u100(p101, p102) and u100(p101, p103)) then
        return false
    end
    local v105 = pourIntoSlot(p102, p103, p104)
    u96(p101, { p102, p103 })
    return v105
end
function u24.server_swapSlots(p106, p107, p108) --[[ Line: 479 ]]
    --[[
    Upvalues:
        [1] = u100
        [2] = u96
    --]]
    if not (u100(p106, p107) and u100(p106, p108)) then
        return false
    end
    local v109 = swapSlots(p107, p108)
    u96(p106, { p107, p108 })
    return v109
end
function u24.server_craft(p110, p111) --[[ Line: 489 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u24
    --]]
    local v112 = u5.server_getPlayerInventory(p110)
    if typeof(p111) ~= "number" or p111 < 1 then
        return false
    end
    local v113, v114 = u24.craft(v112, p111)
    if v113 then
        u5.server_setPlayerInventory(p110, v114, false)
    end
    return v113
end
function u24.server_init() --[[ Line: 502 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u24
    --]]
    u19.SwapSlots.OnServerInvoke = u24.server_swapSlots
    u19.PourIntoSlot.OnServerInvoke = u24.server_pourIntoSlot
    u19.Craft.OnServerInvoke = u24.server_craft
end
return u24