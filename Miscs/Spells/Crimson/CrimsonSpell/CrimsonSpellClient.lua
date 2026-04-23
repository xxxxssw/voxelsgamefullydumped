-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.Spells.Crimson.CrimsonSpell.CrimsonSpellClient
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
        v3.RenderStepped:Connect(function() --[[ Line: 21 ]]
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
        task.spawn(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            for _ = 1, 5 do
                local v7 = u5.SpikeSound:Clone()
                v7.Parent = u5
                v7:Play()
                task.wait(0.1)
            end
        end)
        local v8 = v2.Assets.Miscs.Spells.Crimson.Visuals.Spikes:Clone()
        v8:PivotTo(u5.CFrame)
        v8.Parent = script.Parent
        for _, v9 in ipairs(v8:GetChildren()) do
            local v10 = v9 == v8.PrimaryPart and 12 or 8
            task.wait()
            local v11 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
            local v12 = {
                ["Size"] = v9.Size + Vector3.new(0, v10, 0)
            }
            local v13 = v9.Position
            local v14 = v10 * 0.5
            v12.Position = v13 + Vector3.new(0, v14, 0)
            v4:Create(v9, v11, v12):Play()
        end
        task.wait(1)
        v4:Create(u5.SurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["ImageTransparency"] = 1
        }):Play()
        for _, v15 in ipairs(v8:GetChildren()) do
            v4:Create(v15, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Transparency"] = 1
            }):Play()
        end
    end
else
    return
end