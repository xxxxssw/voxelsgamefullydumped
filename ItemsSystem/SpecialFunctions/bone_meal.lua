-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.bone_meal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u4 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u6 = require(game.ReplicatedStorage.Libs.Cursor)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
local u8 = require(game.ReplicatedStorage.Libs.BlockState)
local u9 = require(game.ReplicatedStorage.Libs.Coordinates)
local u10 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u11 = v1.CurrentCamera
local v12 = {}
local u13 = nil
function v12.client_getNetworkParams() --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return u13
end
function v12.client_onUse() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u7
        [4] = u4
        [5] = u5
        [6] = u10
        [7] = u13
        [8] = u9
    --]]
    local v14 = u6.getHoveredBlockState()
    local v15, v16, v17 = u6.getNamesFromHoveredBlock()
    if v14 and v15 then
        local v18 = u8.getBlockId(v14)
        if #u7.getDispatchedFunctions(u7.Functions.ServerOnFertilizerUsed, v18) > 0 then
            local v19 = u4.getState().predictedInventories.Player
            u5.substractFromSlot(v19, u10.getCurrentHotbarSlot(), 1)
            u4.setPredictedPlayerInventory(v19)
            u13 = u9.coordinatesOffsetFromRegionName(v15) + u9.coordinatesOffsetFromChunkName(v16) + u9.coordinatesOffsetFromBlockName(v17)
            return true
        end
    end
    return false
end
function v12.server_onUse(p20, p21, p22) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u7
        [4] = u3
        [5] = u5
    --]]
    if typeof(p22) == "Vector3" then
        local v23 = u2.getBlockState(p22)
        if v23 ~= nil then
            local v24 = u8.getBlockId(v23)
            if #u7.getDispatchedFunctions(u7.Functions.ServerOnFertilizerUsed, v24) > 0 then
                local v25 = u3.server_getPlayerInventory(p20)
                u5.substractFromSlot(v25, p21, 1)
                u3.server_setPlayerInventory(p20, v25, false)
                u7.dispatch(u7.Functions.ServerOnFertilizerUsed, v23, p22)
                script.Network:FireAllClients(p22 * 4)
                return true
            end
        end
    end
    return false
end
function v12.client_init() --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    script.Network.OnClientEvent:Connect(function(p26) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        if (u11.CFrame.Position - p26).Magnitude <= 100 then
            local v27 = script.FertilizerParticles:Clone()
            v27.Position = p26 + Vector3.new(0, 2, 0)
            v27.Parent = u11
            task.wait(0.5)
            for _, v28 in ipairs(v27:GetChildren()) do
                v28.Rate = 0
            end
            task.wait(1)
            v27:Destroy()
        end
    end)
end
return v12