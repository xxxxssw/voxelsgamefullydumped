-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.CellReference
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local u4 = require(game.ReplicatedStorage.Systems.InventorySystem)
local v5 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
local u6 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u8 = require(game.ReplicatedStorage.Libs.BlockState)
local u9 = require(game.ReplicatedStorage.Libs.Coordinates)
local u10 = require(script.UtilsCellReference)
local u11 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u12 = v3.Client.States.InventoryState.CurrentContainer
local u13 = v1.LocalPlayer
local u48 = {
    ["LocalMouse"] = {
        ["slot"] = v5.specialSlots.Mouse,
        ["container"] = u13
    },
    ["InfiniteContainer"] = script.Infinity,
    ["new"] = function(p14, p15) --[[ Name: new, Line 37 ]]
        return {
            ["container"] = p14,
            ["slot"] = tostring(p15)
        }
    end,
    ["fromCellButtonInstance"] = function(p16) --[[ Name: fromCellButtonInstance, Line 44 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u48
            [3] = u12
            [4] = u9
            [5] = u7
            [6] = u8
            [7] = u11
        --]]
        local v17 = {
            ["slot"] = p16.Name
        }
        if p16.Parent.Name == "Player" then
            v17.container = u13
            return v17
        end
        if p16:FindFirstAncestor("Creative") ~= nil then
            v17.container = u48.InfiniteContainer
            return v17
        end
        if u12.Value == nil then
            return nil
        end
        local v18 = u9.fromBlockInstance(u12.Value)
        local v19 = u7.getBlockState(v18)
        if u8.getBlockId(v19) ~= u11.getBlockIdFromName("ender_chest") then
            v17.container = v18
            return v17
        end
        v17.container = u13
        v17.key = "ender_chest"
        return v17
    end,
    ["equals"] = function(p20, p21) --[[ Name: equals, Line 74 ]]
        local v22
        if p20.container == p21.container then
            v22 = p20.slot == p21.slot
        else
            v22 = false
        end
        return v22
    end,
    ["getInventory"] = function(p23) --[[ Name: getInventory, Line 78 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u13
            [4] = u10
            [5] = u4
            [6] = u7
            [7] = u8
        --]]
        if u2:IsClient() then
            local v24 = u6.getState()
            if p23.container == u13 then
                return u10.client_getTableFromCellRef(v24, p23)
            else
                return v24.predictedInventories.Block
            end
        else
            local v25 = p23.container
            if typeof(v25) == "Instance" and p23.container:IsA("Player") then
                local v26 = u4.server_getPlayerInventory(p23.container)
                return u10.server_getTableFromCellRef(p23, v26)
            end
            local v27 = p23.container
            if typeof(v27) == "Vector3" then
                local v28 = u7.getBlockState(p23.container)
                local v29 = v28 ~= nil and u8.getMetadata(v28)
                if v29 then
                    return v29.inventory
                end
            end
            return
        end
    end,
    ["getConstraint"] = function(p30) --[[ Name: getConstraint, Line 108 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u4
        --]]
        local v31 = u48.getInventory(p30)
        if v31 ~= nil then
            local v32 = v31.format
            return u4.Formats[v32].constraints[p30.slot]
        end
    end,
    ["readCellData"] = function(p33) --[[ Name: readCellData, Line 117 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u2
            [3] = u6
            [4] = u10
        --]]
        if p33.container == u48.InfiniteContainer then
            local v34 = {}
            local v35 = p33.slot
            v34.id = tonumber(v35)
            v34.qty = 1
            return v34
        end
        if u2:IsClient() then
            local v36 = u6.getState()
            return u10.client_getTableFromCellRef(v36, p33)[p33.slot]
        end
        local v37 = u48.getInventory(p33)
        if v37 ~= nil then
            return v37[p33.slot]
        end
    end,
    ["setCellData"] = function(p38, p39) --[[ Name: setCellData, Line 147 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u2
            [3] = u6
            [4] = u13
            [5] = u10
            [6] = u4
            [7] = u7
            [8] = u8
        --]]
        if p38.container == u48.InfiniteContainer then
            return
        elseif u2:IsClient() then
            local v40 = u6.getState()
            if p38.container == u13 then
                u10.client_getTableFromCellRef(v40, p38)[p38.slot] = p39
                u6.setPredictedPlayerInventory(v40.predictedInventories.Player)
            else
                v40.predictedInventories.Block[p38.slot] = p39
                u6.setPredictedBlockInventory(v40.predictedInventories.Block)
            end
        else
            local v41 = p38.container
            if typeof(v41) == "Instance" and p38.container:IsA("Player") then
                local v42 = p38.container
                local v43 = u4.server_getPlayerInventory(v42)
                u10.server_getTableFromCellRef(p38, v43)[p38.slot] = p39
                u4.server_setPlayerInventory(p38.container, v43, false)
            else
                local v44 = p38.container
                if typeof(v44) == "Vector3" then
                    local v45 = u7.getBlockState(p38.container)
                    local v46 = v45 ~= nil and u8.getMetadata(v45)
                    if v46 then
                        v46.inventory[p38.slot] = p39
                        local v47 = u8.setMetadata(v45, v46)
                        u7.server_setBlockState(p38.container, v47)
                    end
                end
            end
        end
    end
}
return u48