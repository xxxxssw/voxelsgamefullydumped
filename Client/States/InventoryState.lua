-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.States.InventoryState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local u3 = game:GetService("HttpService")
local u4 = game:GetService("ReplicatedStorage")
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
local u6 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
local u7 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u8 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u9 = require(game.ReplicatedStorage.Libs.Coordinates)
local u10 = require(game.ReplicatedStorage.Client.States.GameState)
local u11 = require(game.ReplicatedStorage.Client.States.JsonEditorState)
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng)
local u12 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u13 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.ClientConfiguration)
local u14 = v1.LocalPlayer
local u15 = {
    ["stateChanged"] = script.StateChanged.Event
}
local u16 = nil
local u17 = nil
local u18 = false
local function u19() --[[ Line: 55 ]]
    script.StateChanged:Fire()
end
function u15.overrideCreativeMode() --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18 = true
end
function u15.isMouseHoldingSomething() --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
        [3] = u7
    --]]
    return u15.getState().predictedInventories.Player[u6.specialSlots.Mouse] ~= u7.NoItemSymbol
end
function u15.isAnyWindowOpen() --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return u15.getState().windowName ~= ""
end
function u15.openInventoryOnlyContainer() --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
    --]]
    if u10.getLoadingInfos() == nil then
        if u10.isDeathScreen() then
            return
        elseif not u10.isTitleScreenOpened() then
            script.CurrentContainer.Value = u14
        end
    else
        return
    end
end
function u15.openStorageBlockContainer(p20) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
    --]]
    local v21 = p20:GetAttribute(u8.ATTRIBUTE)
    local v22 = u8.getBlockId(v21)
    local v23 = u8.getMetadata(v21)
    if u12.NoInventoryStorageBlocks[v22] or v23 and v23.inventory then
        script.CurrentContainer.Value = p20
    end
end
function u15.closeWindow() --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
    --]]
    u11.close()
    u17 = nil
    script.CurrentContainer.Value = nil
end
function u15.setPredictedPlayerInventory(p24) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16 = p24
    script.StateChanged:Fire()
end
function u15.setPredictedBlockInventory(p25) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17 = p25
    script.StateChanged:Fire()
end
function u15.reconcile() --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
    --]]
    u16 = nil
    u17 = nil
    script.StateChanged:Fire()
end
function u15.getState() --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u3
        [3] = u6
        [4] = u16
        [5] = u11
        [6] = u8
        [7] = u12
        [8] = u13
        [9] = u17
        [10] = u18
        [11] = u4
    --]]
    local v26 = script.CurrentContainer.Value
    local v27 = {}
    local v28 = {}
    local v29 = u14:GetAttribute("inventory")
    local v30
    if v29 then
        v30 = u3:JSONDecode(v29)
    else
        v30 = u6.createEmpty()
    end
    v28.Player = v30
    v27.serverinventories = v28
    v27.predictedInventories = {
        ["Player"] = u16
    }
    v27.windowName = ""
    if u16 == nil then
        local v31 = u14:GetAttribute("inventory")
        local v32
        if v31 then
            v32 = u3:JSONDecode(v31)
        else
            v32 = u6.createEmpty()
        end
        u16 = v32
        v27.predictedInventories.Player = u16
    end
    if u11.state.enabled then
        v27.windowName = "JsonEditor"
        return v27
    else
        if v26 and v26.Parent ~= nil then
            if v26 ~= u14 then
                local v33 = v26:GetAttribute(u8.ATTRIBUTE)
                local v34 = u8.getBlockId(v33)
                local v35 = u8.getMetadata(v33)
                if u12.NoInventoryStorageBlocks[u8.getBlockId(v33)] then
                    local v36
                    if u13[v34] then
                        v36 = u13[v34].windowName
                    else
                        v36 = nil
                    end
                    v27.windowName = v36
                else
                    v27.serverinventories.Block = v35.inventory
                    v27.predictedInventories.Block = u17
                    if u17 == nil then
                        u17 = table.clone(v35.inventory)
                        v27.predictedInventories.Block = u17
                    end
                    local v37
                    if u13[v34] then
                        v37 = u13[v34].windowName
                    else
                        v37 = nil
                    end
                    v27.windowName = v37 or v35.inventory.format
                end
                v27.storageBlockInstance = v26
                return v27
            end
            if u18 or u4.Systems.WorldSystem.GameMode.Value == "creative" then
                v27.windowName = "Creative"
                return v27
            end
            v27.windowName = "InventoryOnly"
        end
        return v27
    end
end
if v2:IsClient() then
    u4.Systems.InventorySystem.Network.Reconcile.OnClientEvent:Connect(function(p38) --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u17
        --]]
        if p38 == "player" then
            u16 = nil
        elseif p38 == "block" then
            u17 = nil
        end
        script.StateChanged:Fire()
    end)
    local u39 = {}
    script.CurrentContainer.Changed:Connect(function(p40) --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u39
            [3] = u14
            [4] = u8
            [5] = u19
            [6] = u5
            [7] = u9
            [8] = u18
        --]]
        u17 = nil
        if u39 then
            for _, v41 in ipairs(u39) do
                v41:Disconnect()
            end
            u39 = nil
        end
        if p40 and p40 ~= u14 then
            u39 = { p40.Destroying:Connect(function() --[[ Line: 213 ]]
                    script.CurrentContainer.Value = nil
                end), p40:GetAttributeChangedSignal(u8.ATTRIBUTE):Connect(u19) }
            u5.client_setOpenedContainer(u9.fromBlockInstance(script.CurrentContainer.Value))
        else
            u5.client_setOpenedContainer(nil)
        end
        if p40 == nil then
            u18 = false
        end
        script.StateChanged:Fire()
    end)
    u11.changed:Connect(u19)
end
return u15