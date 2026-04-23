-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.chest_old.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = game:GetService("TweenService")
local v2 = game:GetService("Workspace")
local v3 = game:GetService("ReplicatedStorage")
if script:IsDescendantOf(v2) then
    local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
    local v5 = require(game.ReplicatedStorage.Libs.Coordinates)
    local v6 = script.Parent
    local u7 = v6.State
    local u8 = v6.HingeBottom.Weld
    local u9 = TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local u10 = {
        [true] = u8.C0 * CFrame.Angles(0, 0, 1.5707963267948966),
        [false] = u8.C0
    }
    local u11 = v3.Client.LocalSounds.Environment.Blocks.ChestOpen:Clone()
    local v12 = v3.Client.LocalSounds.Environment.Blocks.ChestClosed:Clone()
    u11.Parent = v6.PrimaryPart
    v12.Parent = v6.PrimaryPart
    local u13 = false
    local function v14() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u8
            [3] = u9
            [4] = u10
            [5] = u7
            [6] = u13
            [7] = u11
        --]]
        u1:Create(u8, u9, {
            ["C0"] = u10[u7.Value]
        }):Play()
        if u13 and u7.Value then
            u11:Play()
        end
    end
    u7.Changed:Connect(v14)
    v14()
    local u15 = v5.fromBlockInstance(v6)
    u7.Value = u4.isContainerOpenAtCoordinates(u15)
    u4.containerOpenedOrClosed:Connect(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u15
        --]]
        u7.Value = u4.isContainerOpenAtCoordinates(u15)
    end)
    task.wait(0.5)
    u13 = true
end