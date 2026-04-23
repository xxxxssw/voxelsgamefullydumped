-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.468.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Libs.Utils)
local u3 = require(game.ReplicatedStorage.Libs.BlockMetadata)
if script:IsDescendantOf(v1) then
    return
else
    local u4 = script.Parent
    if u4:FindFirstChild("Left") or u4:FindFirstChild("Right") then
        local u5 = {
            [u4.Left] = u4.Left.PrimaryPart.CFrame,
            [u4.Right] = u4.Right.PrimaryPart.CFrame
        }
        local function v10() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u3
                [4] = u5
            --]]
            local v6 = u4:GetAttribute(u2.ATTRIBUTE)
            local v7 = u2.getBlockId(v6)
            local v8 = u2.getMetadata(v6)
            local v9 = u3.getPropertiesValuesTable(v7, v8.compressed)
            if v9.open or v9.powered then
                u4.Left:SetPrimaryPartCFrame(u5[u4.Left] * CFrame.Angles(0, 1.5707963267948966, 0))
                u4.Right:SetPrimaryPartCFrame(u5[u4.Right] * CFrame.Angles(0, -1.5707963267948966, 0))
                u4.FenceCollision.CanCollide = false
            else
                u4.Left:SetPrimaryPartCFrame(u5[u4.Left] * CFrame.Angles(0, 0, 0))
                u4.Right:SetPrimaryPartCFrame(u5[u4.Right] * CFrame.Angles(0, 0, 0))
                u4.FenceCollision.CanCollide = true
            end
        end
        u4:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v10)
        v10()
    end
end