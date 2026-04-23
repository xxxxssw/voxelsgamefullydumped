-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.CameraTilt
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("Players")
local u2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local u4 = v1.LocalPlayer
local u5 = {}
local u6 = Instance.new("CFrameValue")
local u7 = nil
u6.Changed:Connect(function(p8) --[[ Line: 12 ]]
    script.Tilt.Value = p8
end)
function u5.reset() --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    if u7 then
        u7:Cancel()
        u7 = nil
    end
    script.Tilt.Value = CFrame.new()
    u6.Value = CFrame.new()
end
function u5.tween(p9, p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u6
    --]]
    if u7 then
        u7:Cancel()
        u7 = nil
    end
    u7 = u2:Create(u6, p10 or TweenInfo.new(2), {
        ["Value"] = p9
    })
    u7:Play()
    return u7
end
v3.Client.Events.Damaged.Event:Connect(function() --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v11 = u4
    local v12 = tonumber(v11:GetAttribute("health"))
    if v12 ~= nil and v12 > 0 then
        u5.tween(CFrame.Angles(0, 0, 0.06981317007977318), TweenInfo.new(0.05)).Completed:Wait()
        u5.tween(CFrame.Angles(0, 0, 0), TweenInfo.new(0.05)).Completed:Wait()
    end
end)
return u5