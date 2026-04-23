-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.UpdateCurrentDimension.Underworld
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Players")
local u3 = game:GetService("Workspace")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u4 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
local u5 = require(game.ReplicatedStorage.Client.ControlsEnabled)
local u6 = u2.LocalPlayer
local u7 = u3.CurrentCamera
local u8 = Instance.new("BoolValue")
local u9 = nil
local function u12(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u7
    --]]
    local v11 = RaycastParams.new()
    v11.FilterDescendantsInstances = { u6.Character }
    v11.FilterType = Enum.RaycastFilterType.Exclude
    return u3:Raycast(p10, CFrame.lookAt(p10, u7.CFrame.Position).LookVector * (p10 - u7.CFrame.Position).Magnitude, v11) == nil
end
local function u15(p13) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    for _, v14 in ipairs(u2:GetPlayers()) do
        if v14 ~= u6 and (v14.Character and (v14.Character.PrimaryPart and (p13 - v14.Character.PrimaryPart.Position).Magnitude < 48)) then
            return false
        end
    end
    return true
end
local function u28() --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u3
        [4] = u12
        [5] = u15
    --]]
    if Random.new():NextNumber() <= 0.95 then
        task.wait(Random.new():NextInteger(120, 500))
        while task.wait(10) do
            local v16 = u7.CFrame
            local v17 = CFrame.Angles
            local v18 = math.random() > 0.5 and 35 or -35
            local v19 = v16 * v17(0, math.rad(v18), 0)
            local v20 = CFrame.lookAt(v19.Position * Vector3.new(1, 0, 1), (v19.Position + v19.LookVector) * Vector3.new(1, 0, 1))
            local v21 = u7.CFrame.Position.Y
            local v22 = v20 + Vector3.new(0, v21, 0)
            local v23 = 20 + Random.new():NextInteger(0, 80)
            local v24 = v22.Position + v22.LookVector * v23
            if u5() then
                local v25 = u3:Raycast(v24 + Vector3.new(0, 60, 0), Vector3.new(0, -170, 0))
                if v25 and v25.Instance ~= u3.Terrain then
                    local v26 = v25.Position + Vector3.new(0, 0.1, 0)
                    if u3:Raycast(v26, Vector3.new(0, 11, 0)) == nil and (u12(v26 + Vector3.new(0, 2, 0)) and (u12(v26 + Vector3.new(0, 8, 0)) and u15(v26))) then
                        local v27 = script.Dweller:Clone()
                        v27:PivotTo(CFrame.new(v26 + Vector3.new(0, 4, 0)))
                        v27.Parent = u3
                        task.wait(0.5)
                        v27:Destroy()
                        task.wait(Random.new():NextInteger(700, 1200))
                    end
                end
            end
        end
    end
end
u8.Changed:Connect(function(p29) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u28
    --]]
    if u9 then
        task.cancel(u9)
        u9 = nil
    end
    if p29 then
        u9 = task.spawn(u28)
    end
end)
u1.Client.States.CurrentDimension.Changed:Connect(function() --[[ Name: onDimensionChanged, Line 109 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
        [3] = u8
    --]]
    u8.Value = u4[u1.Client.States.CurrentDimension.Value].dwellerEnabled
end)
u8.Value = u4[u1.Client.States.CurrentDimension.Value].dwellerEnabled