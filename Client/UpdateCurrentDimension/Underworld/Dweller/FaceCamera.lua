-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.UpdateCurrentDimension.Underworld.Dweller.FaceCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local v1 = game:GetService("RunService")
local v2 = game:GetService("Workspace")
if script:IsDescendantOf(v2) then
    local u3 = script.Parent
    local u4 = u3.HumanoidRootPart.TorsoPart.C0
    local u5 = u3.HumanoidRootPart.Neck.C0
    v1.Heartbeat:Connect(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u5
        --]]
        local v6 = CFrame.lookAt(u3.PrimaryPart.Position * Vector3.new(1, 0, 1), workspace.CurrentCamera.CFrame.Position * Vector3.new(1, 0, 1))
        local v7 = v6 - v6.Position
        u3.HumanoidRootPart.TorsoPart.C0 = u4 * v7
        local v8 = CFrame.lookAt(u3.PrimaryPart.Position, workspace.CurrentCamera.CFrame.Position)
        local v9 = v8 - v8.Position
        u3.HumanoidRootPart.Neck.C0 = u5 * v9
    end)
end