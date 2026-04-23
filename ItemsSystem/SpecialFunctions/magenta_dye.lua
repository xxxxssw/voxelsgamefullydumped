-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.magenta_dye
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u1 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u3 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u5 = require(game.ReplicatedStorage.Libs.Cursor)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
local u6 = require(game.ReplicatedStorage.Libs.BlockState)
local u7 = require(game.ReplicatedStorage.Libs.Coordinates)
local u8 = require(game.ReplicatedStorage.Client.States.HotbarState)
local v9 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u10 = {
    [v9.getBlockIdFromName("oak_wall_sign")] = "textColor",
    [v9.getBlockIdFromName("oak_sign")] = "textColor"
}
local v11 = {}
local u12 = nil
function v11.client_getNetworkParams() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return u12
end
function v11.client_onUse() --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u10
        [4] = u3
        [5] = u4
        [6] = u8
        [7] = u12
        [8] = u7
    --]]
    local v13 = u5.getHoveredBlockState()
    local v14, v15, v16 = u5.getNamesFromHoveredBlock()
    if not (v13 and (v14 and u10[u6.getBlockId(v13)])) then
        return false
    end
    local v17 = u3.getState().predictedInventories.Player
    u4.substractFromSlot(v17, u8.getCurrentHotbarSlot(), 1)
    u3.setPredictedPlayerInventory(v17)
    u12 = u7.coordinatesOffsetFromRegionName(v14) + u7.coordinatesOffsetFromChunkName(v15) + u7.coordinatesOffsetFromBlockName(v16)
    return true
end
function v11.server_onUse(p18, p19, p20) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u6
        [3] = u10
        [4] = u2
        [5] = u4
    --]]
    if typeof(p20) == "Vector3" then
        local v21 = u1.getBlockState(p20)
        if v21 ~= nil then
            local v22 = u6.getBlockId(v21)
            if u10[v22] then
                local v23 = script.Name:sub(1, -5)
                local v24 = u2.server_getPlayerInventory(p18)
                u4.substractFromSlot(v24, p19, 1)
                u2.server_setPlayerInventory(p18, v24, false)
                local v25 = u6.getMetadata(v21)
                v25[u10[v22]] = v23
                u1.server_setBlockState(p20, u6.setMetadata(v21, v25))
                return true
            end
        end
    end
    return false
end
return v11