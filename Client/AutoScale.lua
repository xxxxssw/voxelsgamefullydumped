-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.AutoScale
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
game:GetService("RunService")
local u2 = game:GetService("GuiService")
local u3 = require(game.ReplicatedStorage.Client.Settings).Settings.GuiScaleSetting
local u4 = v1.CurrentCamera
local function u10() --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u3
    --]]
    local v5 = game.Players.LocalPlayer.PlayerGui:WaitForChild("MasterScreenGui", (1 / 0)).AbsoluteSize.Y
    local v6 = u4.ViewportSize.Y
    local v7 = math.min(v6, v5)
    local v8 = v7 < 300 and 0.6 or (v7 < 500 and 0.7 or (v7 < 600 and 0.8 or (v7 < 700 and 0.9 or (v7 < 800 and 1 or (v7 < 900 and 1.1 or (v7 < 1000 and 1.2 or (v7 < 1100 and 1.3 or 1)))))))
    if u2:IsTenFootInterface() then
        v8 = v8 + 0.2
    end
    local v9 = game.Players.LocalPlayer.Name == "dm94ZWxfMQ" and 1.5 or v8
    u3.setValue(v9)
end
local u11 = 0
u4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    local u12 = tick()
    u11 = u12
    task.delay(0.5, function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u10
        --]]
        if u11 == u12 then
            u10()
        end
    end)
end)
u10()