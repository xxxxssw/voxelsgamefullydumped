-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.LocalSounds.AmbientSounds
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Workspace")
local v3 = game:GetService("Players")
local u4 = require(game.Lighting.ClockSystem)
local u5 = require(game.ReplicatedStorage.Systems.ChunksSystem.Libs.UtilsBiome)
local u6 = require(script.AmbientConfiguration)
local u7 = v1.Client.States.CurrentBiomeId
local u8 = v1.Client.States.IsUnderground
local u9 = v3.LocalPlayer
local v10 = v2.CurrentCamera
local u11 = Random.new()
local u12 = nil
local u13 = nil
local function v18() --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u7
        [4] = u8
        [5] = u9
        [6] = u6
        [7] = u4
        [8] = u12
        [9] = u11
    --]]
    if u13 ~= nil then
        task.cancel(u13)
        u13 = nil
    end
    local v14 = u5.getBiomeNameFromBiomeId(u7.Value)
    local v15 = u8.Value and "Underground" or v14
    if u9.Character == nil or script.SettingEnabled.Value == false then
        v15 = nil
    end
    local u16 = u6[v15]
    if u16 then
        local v17 = u4.getDaySection() ~= "DAY" and u16.AtmosphereNight or u16.AtmosphereDay
        if v17 ~= u12 then
            if u12 ~= nil then
                u12:Stop()
            end
            u12 = v17
            if v17 ~= nil then
                v17:Play()
            end
        end
        if u16.RandomSounds and #u16.RandomSounds > 0 then
            u13 = task.spawn(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u16
                --]]
                while task.wait(u11:NextInteger(100, 160)) do
                    u16.RandomSounds[u11:NextInteger(1, #u16.RandomSounds)]:Play()
                end
            end)
            return
        end
    elseif u12 ~= nil then
        if u12 ~= nil then
            u12:Stop()
        end
        u12 = nil
    end
end
u7.Changed:Connect(v18)
u4.sectionChanged:Connect(v18)
u8.Changed:Connect(v18)
u9:GetPropertyChangedSignal("Character"):Connect(v18)
script.SettingEnabled.Changed:Connect(v18)
v18()
if not u9.Character then
    u9.CharacterAdded:Wait()
end
while task.wait(3) do
    if v1.Systems.WorldSystem.MapName.Value ~= "Superflat" then
        u8.Value = v10.CFrame.Y < 140
    end
end