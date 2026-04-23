-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.recall_bell
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

game:GetService("Workspace")
local u1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local u3 = game:GetService("RunService")
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.BedSystem)
local u4 = require(game.ReplicatedStorage.Systems.ActionsSystem)
local u5 = require(game.ReplicatedStorage.Systems.HumanoidModifiersSystem)
local u6 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u7 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u8 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u9 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u10 = require(game.ReplicatedStorage.Systems.PlayersSystem)
local u11 = v2.LocalPlayer
local v12 = {}
local function u14(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u1
        [4] = u5
    --]]
    if not u4.canPlayerDoAction(p13) then
        if u3:IsClient() then
            u1.Client.Events.LocalNotification:Fire("You can\'t teleport right now.")
        end
        return false
    end
    if u5.playerHasModifier(p13, u5.MODIFIERS.Channeling) then
        if u3:IsClient() then
            u1.Client.Events.LocalNotification:Fire("You are already teleporting.")
        end
        return false
    end
    if u5.playerHasModifier(p13, u5.MODIFIERS.InCombat) then
        if u3:IsClient() then
            u1.Client.Events.LocalNotification:Fire("Cannot do that while in combat.")
        end
        return false
    end
    if p13:GetAttribute("bedCoordinates") ~= nil then
        return true
    end
    if u3:IsClient() then
        u1.Client.Events.LocalNotification:Fire("You have no respawn point set.")
    end
    return false
end
function v12.client_getNetworkParams() --[[ Line: 50 ]]
    return nil
end
function v12.client_onUse() --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u7
        [4] = u8
        [5] = u9
    --]]
    if not u14(u11) then
        return false
    end
    local v15 = u7.getState().predictedInventories.Player
    u8.substractFromSlot(v15, u9.getCurrentHotbarSlot(), 1)
    u7.setPredictedPlayerInventory(v15)
    return true
end
function v12.server_onUse(u16, p17, _) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u8
        [4] = u5
        [5] = u1
        [6] = u10
    --]]
    if u14(u16) then
        local v18 = u6.server_getPlayerInventory(u16)
        u8.substractFromSlot(v18, p17, 1)
        u6.server_setPlayerInventory(u16, v18, false)
        u5.server_giveModifier(u16.Character, u5.MODIFIERS.Channeling, 2)
        local u19 = u16:GetAttribute("bedCoordinates")
        local u20 = u1.Assets.Miscs.TeleportationEffectHolder.TeleportationEffect:Clone()
        u20.Parent = u16.Character.PrimaryPart
        u20.Bubble.Enabled = true
        local u21 = u1.Assets.Miscs.TeleportationEffectHolder.TeleportSound:Clone()
        u21.Parent = u16.Character.PrimaryPart
        u21:Play()
        task.delay(2, function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u5
                [4] = u16
                [5] = u14
                [6] = u1
                [7] = u10
                [8] = u19
            --]]
            u20:Destroy()
            u21:Destroy()
            u5.server_removeModifier(u16.Character, u5.MODIFIERS.Channeling)
            if u14(u16) then
                u1.Client.Events.NetworkNotification:FireClient(u16, "Teleporting...")
                u10.server_teleportPlayer(u16, u19)
            else
                u1.Client.Events.NetworkNotification:FireClient(u16, "Your teleportation was interrupted.")
            end
        end)
    end
end
return v12