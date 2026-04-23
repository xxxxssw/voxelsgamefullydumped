-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.Spells.Crimson.CrimsonTeleportation.CrimsonTeleportationClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("Workspace")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local v4 = game:GetService("TweenService")
if script:IsDescendantOf(v1) then
    if (v1.CurrentCamera.CFrame.Position - script.Parent.Position).Magnitude <= 180 then
        local u5 = v2.Assets.Miscs.Spells.Crimson.Visuals.SummonRing:Clone()
        u5.CFrame = script.Parent.CFrame - script.Parent.Size * 0.5 * Vector3.new(0, 1, 0)
        u5.Parent = script.Parent
        u5.Casting:Play()
        u5.Smoke:Emit(15)
        v3.RenderStepped:Connect(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            local v6 = u5.SurfaceGui.ImageLabel
            v6.Rotation = v6.Rotation + 10
        end)
        v4:Create(u5.SurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.fromScale(1, 1)
        }):Play()
        task.wait(1)
        v4:Create(u5.SurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["ImageTransparency"] = 1
        }):Play()
        u5.Smoke.Rate = 0
    end
else
    return
end