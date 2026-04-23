-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.RenderDistanceShortcut
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u1 = game:GetService("UserInputService")
local u2 = game:GetService("ReplicatedStorage")
local u3 = require(game.ReplicatedStorage.Client.Settings).Settings.RenderDistanceSetting
u1.InputBegan:Connect(function(p4, p5) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u2
    --]]
    if not p5 and (p4.KeyCode == Enum.KeyCode.Up and u1:IsKeyDown(Enum.KeyCode.RightShift)) then
        u3.increaseSettingValue()
        u2.Client.Events.LocalNotification:Fire("Render distance=" .. u3.getSettingValue())
    end
end)
u1.InputBegan:Connect(function(p6, p7) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u2
    --]]
    if not p7 and (p6.KeyCode == Enum.KeyCode.Down and u1:IsKeyDown(Enum.KeyCode.RightShift)) then
        u3.decreaseSettingValue()
        u2.Client.Events.LocalNotification:Fire("Render distance=" .. u3.getSettingValue())
    end
end)