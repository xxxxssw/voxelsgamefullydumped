-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.Telemetry
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("ReplicatedStorage")
local u1 = game:GetService("Workspace")
local v2 = {}
local u3 = {}
local function u9() --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v4 = require(game.ReplicatedStorage.Client.ControlsEnabled)
    local v5 = require(game.ReplicatedStorage.Client.Settings)
    local v6 = game:GetService("UserInputService")
    u3["Workspace.Camera.ViewportSize"] = u1.Camera.ViewportSize
    u3["UserInputService.MouseEnabled"] = v6.MouseEnabled
    u3["UserInputService.TouchEnabled"] = v6.TouchEnabled
    u3["UserInputService.GamepadEnabled"] = v6.GamepadEnabled
    u3["ControlsEnabled()"] = v4()
    for v7, v8 in pairs(v5.Settings) do
        u3["Setting " .. tostring(v7)] = v8.getSettingValue()
    end
    return u3
end
function v2.server_printTelemetry(p10) --[[ Line: 28 ]]
    local v11 = script.FetchTelemetry:InvokeClient(p10)
    print("-----", p10.Name, "\'S TELEMETRY -----")
    for v12, v13 in pairs(v11) do
        print(v12, " = ", v13)
    end
    print("------------")
end
function v2.server_fetchTelemetry(p14) --[[ Line: 38 ]]
    return script.FetchTelemetry:InvokeClient(p14)
end
function v2.client_addData(p15, p16) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3[p15] = p16
end
function v2.client_incrementData(p17) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if u3[p17] == nil then
        u3[p17] = 0
    end
    local v18 = u3
    v18[p17] = v18[p17] + 1
end
function v2.client_init() --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    script.FetchTelemetry.OnClientInvoke = u9
end
return v2