-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.480.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Configuration.VariablesConfiguration)
if not script:IsDescendantOf(v1) then
    local u4 = false
    local u5 = script.Parent
    local u6 = v1.Client.LocalSounds.Environment.Blocks.DoorToggle:Clone()
    u6.Parent = u5:WaitForChild("Hitbox", true)
    local u7 = nil
    local function v15() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
            [4] = u4
            [5] = u7
            [6] = u6
        --]]
        local v8 = u5:GetAttribute(u3.ATTRIBUTE)
        local v9 = u3.getBlockId(v8)
        local v10 = u3.getMetadata(v8) or {}
        u2.getProperty(v9, v10.compressed, "half")
        local v11 = u2.getProperty(v9, v10.compressed, "open")
        local v12 = u2.getProperty(v9, v10.compressed, "hinge")
        local v13 = u2.getProperty(v9, v10.compressed, "powered")
        if v12 == "left" then
            u5.Hitbox.Front.Door.ImageRectOffset = Vector2.new(16, 0)
            u5.Hitbox.Back.Door.ImageRectOffset = Vector2.new(0, 0)
        end
        if v11 or v13 then
            local v14 = string.format("Open_%s", v12)
            u5.Hitbox.CFrame = u5.PrimaryPart:FindFirstChild(v14).WorldCFrame
        else
            u5.Hitbox.CFrame = u5.PrimaryPart.Close.WorldCFrame
        end
        if u4 and u7 ~= v11 then
            u6:Play()
            u7 = v11
        end
    end
    u5:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v15)
    v15()
    task.wait(0.5)
    u4 = true
end