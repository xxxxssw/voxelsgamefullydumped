-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Telemetry
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Client.Libs.Telemetry)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 8 ]]
        return true
    end,
    ["run"] = function(_, p3, p4) --[[ Name: run, Line 12 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u2
        --]]
        local v5 = string.split(p4, " ")[2]
        local v6 = tostring(v5)
        local v7 = u1:FindFirstChild(v6)
        if v7 == nil then
            for _, v8 in ipairs(u1:GetPlayers()) do
                if v8.DisplayName == v6 then
                    v7 = v8
                end
            end
        end
        if v7 == nil then
            return p3("No player", Color3.fromRGB(255, 0, 0))
        end
        u2.server_printTelemetry(v7)
    end
}