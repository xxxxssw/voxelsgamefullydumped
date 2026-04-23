-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.debug_telemetryStick
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u2 = game:GetService("Players")
local u3 = require(game.ReplicatedStorage.Libs.Cursor)
local u4 = require(game.ReplicatedStorage.Client.Libs.Telemetry)
local u5 = require(game.ReplicatedStorage.Client.States.JsonEditorState)
local _ = v1.CurrentCamera
local v6 = {}
local u7 = nil
function v6.client_getNetworkParams() --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7
end
function v6.client_onUse() --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u2
    --]]
    u7 = u2:GetPlayerFromCharacter((u3.getHoveredCharacterOrEntity()))
    return u7 and true or false
end
function v6.server_onUse(p8, _, p9) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if not p9 then
        return false
    end
    local v10 = u4.server_fetchTelemetry(p9)
    script.SendTelemetry:FireClient(p8, p9, v10)
    return true
end
function v6.client_init() --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    script.SendTelemetry.OnClientEvent:Connect(function(p11, p12) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v13 = "-- Telemetry of " .. tostring(p11) .. "\n"
        local v14 = {}
        for v15, v16 in pairs(p12) do
            local v17 = tostring(v15) .. " = " .. tostring(v16)
            table.insert(v14, v17)
        end
        table.sort(v14)
        for _, v18 in ipairs(v14) do
            v13 = v13 .. v18 .. "\n"
        end
        u5.displayString(v13)
    end)
end
return v6