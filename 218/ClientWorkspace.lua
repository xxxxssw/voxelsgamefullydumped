-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.218.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
local u3 = require(game.ReplicatedStorage.Libs.BlockMetadata)
if not script:IsDescendantOf(v1) then
    local u4 = false
    local u5 = script.Parent
    local u6 = v1.Client.LocalSounds.Environment.Blocks.DoorToggle:Clone()
    u6.Parent = u5:WaitForChild("Hitbox", true)
    local u7 = nil
    local function v14() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u3
            [4] = u4
            [5] = u7
            [6] = u6
        --]]
        local v8 = u5:GetAttribute(u2.ATTRIBUTE)
        local v9 = u2.getBlockId(v8)
        local v10 = u2.getMetadata(v8) or {}
        local v11 = u3.getProperty(v9, v10.compressed, "open")
        local v12 = u3.getProperty(v9, v10.compressed, "half")
        if v11 or u3.getProperty(v9, v10.compressed, "powered") then
            local v13 = string.format("Open_%s", v12)
            u5.Hitbox.CFrame = u5.PrimaryPart:FindFirstChild(v13).WorldCFrame
        else
            u5.Hitbox.CFrame = u5.PrimaryPart.Close.WorldCFrame
        end
        if u4 and u7 ~= v11 then
            u6:Play()
            u7 = v11
        end
    end
    u5:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v14)
    v14()
    task.wait(0.5)
    u4 = true
end