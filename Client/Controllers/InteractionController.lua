-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.Controllers.InteractionController
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("UserInputService")
local v2 = game:GetService("RunService")
local u3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("Players")
local v5 = game:GetService("ContextActionService")
local u6 = require(game.ReplicatedStorage.Libs.Cursor)
require(game.ReplicatedStorage.Systems.ItemsSystem)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u8 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
local u9 = require(game.ReplicatedStorage.Libs.BlockState)
local u10 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockOrientation)
local u11 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u12 = require(game.ReplicatedStorage.Systems.ActionsSystem)
local u13 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u14 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u15 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.IsStorageBlockState)
local u16 = require(game.ReplicatedStorage.Client.ControlsEnabled)
local u17 = require(game.ReplicatedStorage.Systems.ActionsSystem.Libs.Event)
local u18 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u19 = require(game.ReplicatedStorage.Systems.ItemsSystem.Libs.CanConsume)
local u20 = require(game.ReplicatedStorage.Systems.LiquidsSystem)
local u21 = require(game.ReplicatedStorage.Systems.ItemsSystem.ItemsSpecialFunctions)
local v22 = require(game.ReplicatedStorage.Client.Touchscreen)
local u23 = require(game.ReplicatedStorage.Client.LocalSounds.LocalSoundPlayer)
require(game.ReplicatedStorage.Libs.BlockMetadata)
local u24 = require(u3.Systems.ActionsSystem.Libs.ComputeBlockId)
local u25 = u3.Client.Events.ArmAnimation
local u26 = u3.Client.States.Sneaking
local u27 = 0
local u28 = v4.LocalPlayer
local u29 = Instance.new("IntValue")
local u30 = false
local u31 = 0
local u32 = false
local function u39() --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u28
        [3] = u7
        [4] = u9
        [5] = u11
        [6] = u27
        [7] = u10
        [8] = u12
    --]]
    local v33 = u6.coordinatesFromHoveredBlock()
    if v33 and (u28.Character and u28.Character.PrimaryPart) then
        local _, _ = u6.getHoveredBlockInstance()
        local _, v34 = u6.getHoveredBlockInstance()
        local v35 = v33 + v34.Normal
        local v36 = u7.getBlockState(v35)
        local v37 = u9.getBlockId(v36)
        if u11.Overwritable[v37] == true then
            u27 = tick()
            local v38 = u10.client_getOrientationInfos(v35 * 4, workspace.CurrentCamera.CFrame, v34)
            return u12.client_placeBlock(v35, v38)
        end
    end
end
u29.Changed:Connect(function(p40) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u3
        [3] = u29
        [4] = u30
        [5] = u12
    --]]
    u31 = tick()
    if p40 > 0 then
        local u41 = u31
        u3.Client.States.CharacterEating.Value = true
        task.delay(1.5, function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u41
                [3] = u29
                [4] = u30
                [5] = u12
            --]]
            if u31 == u41 then
                u29.Value = 0
                u30 = true
                u12.client_consumeItem()
                task.wait(0.5)
                u30 = false
            end
        end)
    else
        u3.Client.States.CharacterEating.Value = false
    end
end)
local u42 = tick()
local function u50(p43) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u26
        [4] = u10
        [5] = u13
        [6] = u17
        [7] = u28
        [8] = u8
        [9] = u27
        [10] = u12
    --]]
    local v44 = u6.getHoveredBlockState(p43)
    local v45 = u9.getBlockId(v44)
    if not u26.Value and (v45 and u6.coordinatesFromHoveredBlock(p43)) then
        local _, v46 = u6.getHoveredBlockInstance(p43)
        local v47 = u6.coordinatesFromHoveredBlock(p43)
        local v48 = u10.client_getOrientationInfos(v47 * 4, workspace.CurrentCamera.CFrame, v46)
        u13.getCurrentlyHeldItemId()
        local v49 = u17.new(u28, u17.Action.RIGHT_CLICK_BLOCK, u6.coordinatesFromHoveredBlock(p43), u13.getCurrentHotbarSlot(), v48)
        if u8.canInteract(v49) then
            u27 = tick()
            u12.client_interactWithBlock(v49)
            return true
        end
    end
end
local function u54(p51, p52) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u26
        [3] = u9
        [4] = u15
        [5] = u3
        [6] = u14
    --]]
    u6.getHoveredBlockState(p51)
    local v53 = u6.getHoveredBlockInstance(p51)
    if p52 then
        p52 = u26.Value
    end
    if not p52 and (v53 and u15((v53:GetAttribute(u9.ATTRIBUTE)))) then
        u3.Client.Events.ArmAnimation:Fire()
        u14.openStorageBlockContainer(v53)
        return true
    end
end
local function u56() --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u20
        [3] = u27
        [4] = u21
    --]]
    local v55 = u13.getCurrentlyHeldItemId()
    if u20.isAnyBucket(v55) then
        u27 = tick()
        u20.client_onBucketUsed()
        return true
    end
    if u21.getSpecialFunctions(v55) ~= nil then
        u27 = tick()
        if u21.client_useSpecialItem(v55) then
            return true
        end
    end
end
local function u66(p57) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u16
        [3] = u6
        [4] = u25
        [5] = u12
        [6] = u27
        [7] = u54
        [8] = u56
        [9] = u50
        [10] = u13
        [11] = u24
        [12] = u39
        [13] = u9
        [14] = u15
        [15] = u3
        [16] = u14
    --]]
    local v58
    if u29.Value > 0 then
        v58 = false
    else
        v58 = u16() and true or false
    end
    if v58 then
        local v59
        if p57 then
            local v60 = u6.getHoveredCharacterOrEntity()
            if v60 == nil then
                v59 = nil
            else
                u25:Fire()
                u12.client_interactEntity(v60)
                v59 = true
            end
        else
            v59 = nil
        end
        if v59 then
            return
        elseif p57 == false and tick() - u27 < 0.33 then
            return
        elseif u54(false, true) then
            return
        elseif u56() then
            return
        elseif u50(false) then
            return
        else
            local v61 = u13.getCurrentlyHeldItemId()
            local v62
            if v61 and v61 ~= 0 then
                local v63 = u24(v61)
                if v63 and v63 ~= 0 and u39() then
                    u27 = tick()
                    v62 = true
                else
                    v62 = nil
                end
            else
                v62 = nil
            end
            if v62 then
                return
            else
                u6.getHoveredBlockState(false)
                local v64 = u6.getHoveredBlockInstance(false)
                local v65
                if v64 and u15((v64:GetAttribute(u9.ATTRIBUTE))) then
                    u3.Client.Events.ArmAnimation:Fire()
                    u14.openStorageBlockContainer(v64)
                    v65 = true
                else
                    v65 = nil
                end
                if not v65 then
                end
            end
        end
    else
        return
    end
end
local u67 = false
local function v69() --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u67
        [3] = u32
        [4] = u16
        [5] = u30
        [6] = u13
        [7] = u18
        [8] = u19
        [9] = u28
        [10] = u29
        [11] = u42
        [12] = u27
        [13] = u23
        [14] = u66
    --]]
    if (u1:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) or (u67 or u32)) and u16() then
        if u30 == false then
            local v68 = u13.getCurrentlyHeldItemId()
            if v68 ~= nil and (u18.Consumable[v68] and u19(u28, v68)) then
                u29.Value = v68
                if u29.Value > 0 and (tick() - u42 > 0.35 and tick() - u27 > 0.15) then
                    u42 = tick()
                    if u18.Slurpable[v68] then
                        u23.play("Slurp")
                        return
                    end
                    u23.play("Eating")
                end
                return
            end
        end
        u66(false)
    end
    u29.Value = 0
end
v2.Heartbeat:Connect(v69)
v5:BindAction("interact", function(_, p70, p71) --[[ Name: interactHandler, Line 286 ]]
    --[[
    Upvalues:
        [1] = u67
        [2] = u16
        [3] = u66
    --]]
    if p71.KeyCode == Enum.KeyCode.ButtonL2 then
        if p70 == Enum.UserInputState.Begin then
            u67 = true
        elseif p70 == Enum.UserInputState.End then
            u67 = false
        end
    end
    if p70 ~= Enum.UserInputState.Begin or not u16() then
        return Enum.ContextActionResult.Pass
    end
    u66(true)
    return Enum.ContextActionResult.Sink
end, false, Enum.UserInputType.MouseButton2, Enum.KeyCode.F, Enum.KeyCode.ButtonL2)
v22.getInputBeganSignal():Connect(function(p72, _) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u32
        [3] = u66
    --]]
    if p72 == "use" and u16() then
        u32 = true
        u66(true)
    end
end)
v22.getInputEndedSignal():Connect(function(p73, _) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    if p73 == "use" then
        u32 = false
    end
end)