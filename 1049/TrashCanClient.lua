-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1049.TrashCanClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("Workspace")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
if script:IsDescendantOf(v1.Map) then
    local v4 = require(game.ReplicatedStorage.Libs.Coordinates)
    local u5 = script.Parent
    local u6 = v4.fromBlockInstance(u5)
    local u7 = false
    local u8 = u5["Meshes/trash_can_Lid"].Weld.C0
    v2.Systems.BlocksSystem.BlocksFunctions.trash_can.Used.OnClientEvent:Connect(function(p9) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
            [3] = u3
            [4] = u5
            [5] = u8
        --]]
        if p9 == u6 then
            if u7 then
                return
            end
            u7 = true
            u3:Create(u5["Meshes/trash_can_Lid"].Weld, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                ["C0"] = CFrame.new(Vector3.new(0, -1, 0))
            }):Play()
            u5.Hitbox.Audio:Play()
            task.wait(0.25)
            u5["Meshes/trash_can_Lid"].Weld.C0 = u8
            u7 = false
        end
    end)
end