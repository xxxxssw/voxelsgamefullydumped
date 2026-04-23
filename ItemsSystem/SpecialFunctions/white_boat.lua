-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.white_boat
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.Cursor)
require(game.ReplicatedStorage.Libs.BlockState)
local u3 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u5 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u6 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u7 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local v8 = {}
local u9 = nil
local u10 = script.Name:sub(0, -6)
function v8.client_getNetworkParams() --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9
end
function v8.client_onUse() --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
        [4] = u5
        [5] = u9
        [6] = u1
    --]]
    local v11, v12 = u2.getHoveredLiquidBlockInstance()
    if not (v11 and v12) then
        u1.Client.Events.LocalNotification:Fire("Can only be used on water")
        return false
    end
    local v13 = u3.getState().predictedInventories.Player
    u4.substractFromSlot(v13, u5.getCurrentHotbarSlot(), 1)
    u3.setPredictedPlayerInventory(v13)
    u9 = v12
    return true
end
function v8.server_onUse(p14, p15, p16) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
        [4] = u10
    --]]
    if typeof(p16) ~= "Vector3" then
        return false
    end
    local v17 = u6.server_getPlayerInventory(p14)
    u4.substractFromSlot(v17, p15, 1)
    u6.server_setPlayerInventory(p14, v17, false)
    local v18 = u7.server_spawn("Boat", p16)
    u7.server_updateEntityData(v18, function(p19) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        p19.color = u10
        return p19
    end)
    return true
end
return v8