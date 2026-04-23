-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctionsFactories.Bow
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("Workspace")
local u2 = game:GetService("ReplicatedStorage")
local u3 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u4 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems).itemIdFromName("arrow")
local u7 = u1.CurrentCamera
return function(u8) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u5
        [4] = u6
        [5] = u2
        [6] = u3
        [7] = u1
    --]]
    local v9 = {}
    local u10 = 0
    function v9.client_getNetworkParams() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7.CFrame
    end
    function v9.client_onUse() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u5
            [4] = u6
            [5] = u2
        --]]
        local v11 = u4.getState().predictedInventories.Player
        local v12 = tick()
        if v12 - u10 < 0.6 then
            return false
        end
        u10 = v12
        if u5.substractOneFromInventory(v11, u6) ~= 1 then
            u2.Client.Events.LocalNotification:Fire("Arrow is required")
            return false
        end
        u4.setPredictedPlayerInventory(v11)
        u2.Client.LocalSounds.Fighting.Bow:Play()
        return true
    end
    function v9.server_onUse(p13, _, p14) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
            [4] = u2
            [5] = u8
            [6] = u1
        --]]
        if typeof(p14) ~= "CFrame" or not (p13.Character and p13.Character.PrimaryPart) then
            return false
        end
        local v15 = u3.server_getPlayerInventory(p13)
        if u5.substractOneFromInventory(v15, u6) ~= 1 then
            return false
        end
        u3.server_setPlayerInventory(p13, v15, false)
        local v16 = u2.Assets.Miscs.Arrow:Clone()
        v16:PivotTo(p14 - p14.Position + p13.Character.HeadPart.Position)
        v16.Source.Value = p13.Character
        v16.Direction.Value = p14
        v16:SetAttribute("bowName", u8)
        local v17 = Instance.new("Folder")
        v17.Name = "NoCollisions"
        v17.Parent = v16
        for _, v18 in ipairs(p13.Character:GetChildren()) do
            if v18:IsA("BasePart") then
                local v19 = Instance.new("NoCollisionConstraint")
                v19.Part0 = v18
                v19.Part1 = v16.PrimaryPart
                v19.Parent = v17
            end
        end
        v16.Parent = u1.Projectiles
        return true
    end
    return v9
end