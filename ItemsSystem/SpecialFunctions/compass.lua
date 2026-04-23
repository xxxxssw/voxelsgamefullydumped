-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.compass
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("Workspace")
local u2 = game:GetService("ReplicatedStorage")
require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Systems.InventorySystem)
require(game.ReplicatedStorage.Client.States.InventoryState)
require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u4 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u5 = require(game.ReplicatedStorage.Libs.Cursor)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
require(game.ReplicatedStorage.Libs.BlockState)
local u6 = require(game.ReplicatedStorage.Libs.Coordinates)
require(game.ReplicatedStorage.Client.States.HotbarState)
local u7 = require(game.ReplicatedStorage.Libs.Utils)
local _ = v1.CurrentCamera
local v8 = {}
local u9 = nil
function v8.client_getNetworkParams() --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9
end
function v8.client_onUse() --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u6
    --]]
    local v10 = u5.getHoveredBlockState()
    local v11, v12, v13 = u5.getNamesFromHoveredBlock()
    if v10 and v11 then
        u9 = u6.coordinatesOffsetFromRegionName(v11) + u6.coordinatesOffsetFromChunkName(v12) + u6.coordinatesOffsetFromBlockName(v13)
    else
        u9 = -1
    end
    script.compassSound:Play()
    return true
end
function v8.server_onUse(p14, p15, p16) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
        [4] = u7
    --]]
    local v17 = (typeof(p16) == "Vector3" or p16 == -1) and u3.server_getPlayerInventory(p14)
    if v17 then
        local v18 = v17[tostring(p15)]
        if v18 and (v18 ~= u3.NoItemSymbol and v18.id == u4.itemIdFromName("compass")) then
            if p16 == -1 then
                u2.Client.Events.NetworkNotification:FireClient(p14, "Marker removed")
                v18.compass = -1
            else
                u2.Client.Events.NetworkNotification:FireClient(p14, "Marker placed")
                v18.compass = u7.encodeVector3(p16)
            end
            u3.server_setPlayerInventory(p14, v17, true)
            return true
        end
    end
    return false
end
return v8