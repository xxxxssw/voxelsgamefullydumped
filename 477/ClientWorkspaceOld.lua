-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.477.ClientWorkspaceOld
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u3 = false
    local u4 = script.Parent
    local u5 = v1.Client.LocalSounds.Environment.Blocks.DoorToggle:Clone()
    u5.Parent = u4:WaitForChild("Hitbox", true)
    local u6 = nil
    local function v9() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u3
            [4] = u6
            [5] = u5
        --]]
        local v7 = u2.getMetadata(u4:GetAttribute(u2.ATTRIBUTE))
        if v7 then
            if v7.reversed then
                u4.Hitbox.Front.Door.ImageRectOffset = Vector2.new(16, 0)
                u4.Hitbox.Back.Door.ImageRectOffset = Vector2.new(0, 0)
            end
            if v7.open then
                u4.Hitbox.CFrame = u4.PrimaryPart:FindFirstChild(v7.reversed and "Open_R" or "Open").WorldCFrame
            else
                u4.Hitbox.CFrame = u4.PrimaryPart.Close.WorldCFrame
            end
        end
        if u3 then
            local v8 = v7.open
            if u6 ~= v8 then
                u5:Play()
                u6 = v8
            end
        end
    end
    u4:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v9)
    v9()
    task.wait(0.5)
    u3 = true
end