-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.145.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = game:GetService("TweenService")
local v2 = game:GetService("Workspace")
local v3 = game:GetService("ReplicatedStorage")
if script:IsDescendantOf(v2) then
    local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
    local v5 = require(game.ReplicatedStorage.Libs.Coordinates)
    local v6 = script.Parent
    local u7 = v6:WaitForChild("State")
    local v8 = v6:WaitForChild("Lid")
    local u9 = v8:WaitForChild("Hinge"):WaitForChild("Weld")
    local u10 = TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local u11 = {
        [true] = u9.C0 * CFrame.Angles(-1.5707963267948966, 0, 0),
        [false] = u9.C0
    }
    local u12 = v3.Client.LocalSounds.Environment.Blocks.ChestOpen:Clone()
    local v13 = v3.Client.LocalSounds.Environment.Blocks.ChestClosed:Clone()
    u12.Parent = v8.Frame
    v13.Parent = v8.Frame
    local u14 = false
    local function v15() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u9
            [3] = u10
            [4] = u11
            [5] = u7
            [6] = u14
            [7] = u12
        --]]
        u1:Create(u9, u10, {
            ["C0"] = u11[u7.Value]
        }):Play()
        if u14 and u7.Value then
            u12:Play()
        end
    end
    u7.Changed:Connect(v15)
    v15()
    local u16 = v5.fromBlockInstance(v6)
    u7.Value = u4.isContainerOpenAtCoordinates(u16)
    u4.containerOpenedOrClosed:Connect(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u16
        --]]
        u7.Value = u4.isContainerOpenAtCoordinates(u16)
    end)
    task.wait(0.5)
    u14 = true
end