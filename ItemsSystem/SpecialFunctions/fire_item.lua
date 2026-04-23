-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.fire_item
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u1 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem)
require(game.ReplicatedStorage.Client.States.InventoryState)
require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u3 = require(game.ReplicatedStorage.Libs.Cursor)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
local u4 = require(game.ReplicatedStorage.Libs.BlockState)
local u5 = require(game.ReplicatedStorage.Libs.Coordinates)
require(game.ReplicatedStorage.Client.States.HotbarState)
local u6 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
require(game.ReplicatedStorage.Libs.BlockMetadata)
local u7 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u8 = u6.getBlockIdFromName("air")
local v9 = {}
local u10 = nil
function v9.client_getNetworkParams() --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10
end
function v9.client_onUse() --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
        [3] = u5
        [4] = u4
        [5] = u8
        [6] = u10
    --]]
    local v11 = u3.getHoveredBlockState()
    local v12, v13, v14 = u3.getNamesFromHoveredBlock()
    if not (v11 and v12) then
        return false
    end
    if u1.isBlockStateTransparent(v11) then
        return false
    end
    local v15 = u5.coordinatesFromNames(v12, v13, v14)
    local v16 = u1.getBlockState(v15 + Vector3.new(0, 1, 0))
    if u4.getBlockId(v16) ~= u8 then
        return false
    end
    u10 = v15
    return true
end
function v9.server_onUse(p17, p18, p19) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
        [3] = u8
        [4] = u2
        [5] = u7
        [6] = u6
    --]]
    if typeof(p19) == "Vector3" then
        local v20 = u1.getBlockState(p19)
        u4.getBlockId(v20)
        if v20 ~= nil then
            local v21 = u1.getBlockState(p19 + Vector3.new(0, 1, 0))
            if u4.getBlockId(v21) ~= u8 then
                return false
            end
            local v22 = u2.server_getPlayerInventory(p17)
            if v22 then
                v22 = v22[tostring(p18)]
            end
            if v22 == u7.NoItemSymbol then
                return false
            end
            local v23 = v22.id
            tonumber(v23)
            local v24 = u6.getBlockIdFromName("fire")
            local v25 = u4.create(v24, -1, nil)
            u1.server_setBlockState(p19 + Vector3.new(0, 1, 0), v25)
            return true
        end
    end
    return false
end
return v9