-- Roblox script dump
-- ClassName: Script
-- Path: Lighting.CloudsSystem.CloudsClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Workspace")
local u2 = game:GetService("RunService")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("Debris")
local u5 = game:GetService("Players")
local u6 = game:GetService("ReplicatedStorage")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u7 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
local v8 = script.Parent
local u9 = u1.CurrentCamera
local u10 = v8.Clouds
local u11 = v8.Cloud
local u12 = v8.Configuration.ServerStart
local u13 = v8.Configuration.WidthAmplitude
local u14 = v8.Configuration.LengthAmplitude
local u15 = v8.Configuration.NoiseThreshold
local v16 = v8.CloudsQuality
local u17 = v8.LowQualityClouds
local _ = v8.Configuration.Seed.Value
assert(true, "CLOUD_UNIT must be divisible by speed.")
u10.Parent = u9
u11.Size = Vector3.new(40, 20, 40)
local u18 = 0
local function u27() --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u5
        [3] = u10
        [4] = u3
        [5] = u4
        [6] = u1
        [7] = u12
        [8] = u13
        [9] = u14
        [10] = u15
        [11] = u11
    --]]
    u18 = u18 + 0.25
    if u5.LocalPlayer.Character and u5.LocalPlayer.Character.PrimaryPart then
        local v19 = u5.LocalPlayer.Character.PrimaryPart.Position
        u10:PivotTo(CFrame.new(Vector3.new(0, 500, 0) + v19 * Vector3.new(1, 0, 1) - Vector3.new(500, 0, 500)))
    end
    for _, v20 in ipairs(u10:GetChildren()) do
        if v20 ~= u10.PrimaryPart then
            v20.Position = v20.Position + Vector3.new(0.25, 0, 0)
            local v21 = u18
            local v22 = v20.Name
            if tonumber(v22) <= v21 then
                u3:Create(v20, TweenInfo.new(1), {
                    ["Transparency"] = 1
                }):Play()
                u4:AddItem(v20, 1)
            end
        end
    end
    local v23 = (u1:GetServerTimeNow() - u12.Value) / 160
    if u18 % 40 == 0 then
        for v24 = 1, 25 do
            local v25 = v24 / 25
            if math.noise(v25 * u13.Value, v23 * u14.Value) > u15.Value then
                local v26 = u11:Clone()
                v26.Position = u10.PrimaryPart.Position + Vector3.new(0, 0, 1) * v24 * 40
                v26.Name = u18 + 1000
                v26.Transparency = 1
                v26.Parent = u10
                u3:Create(v26, TweenInfo.new(1), {
                    ["Transparency"] = 0
                }):Play()
            end
        end
    end
end
local u28 = nil
local function v35(p29) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u28
        [4] = u2
        [5] = u27
        [6] = u10
        [7] = u5
        [8] = u17
        [9] = u9
    --]]
    local v30 = u7[u6.Client.States.CurrentDimension.Value].cloudsDisabled == true and 0 or p29
    if u28 ~= nil then
        u28:Disconnect()
        u28 = nil
    end
    if v30 == 2 then
        u28 = u2.Stepped:Connect(u27)
    else
        for _, v31 in ipairs(u10:GetChildren()) do
            if v31 ~= u10.PrimaryPart then
                v31:Destroy()
            end
        end
    end
    if v30 == 1 then
        u28 = u2.Stepped:Connect(function(p32) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u17
            --]]
            if u5.LocalPlayer.Character and u5.LocalPlayer.Character.PrimaryPart then
                local v33 = u5.LocalPlayer.Character.PrimaryPart.Position
                local v34 = p32 / 0.016666666666666666
                u17.Position = v33 * Vector3.new(1, 0, 1) * v34 + Vector3.new(0, 500, 0)
            end
        end)
        u17:SetAttribute("Enabled", true)
        u17.Parent = u9
    else
        u17:SetAttribute("Enabled", false)
        u17.Parent = nil
    end
end
u6.Client.States.CurrentDimension.Changed:Connect(v35)
v16.Changed:Connect(v35)
v35(v16.Value)