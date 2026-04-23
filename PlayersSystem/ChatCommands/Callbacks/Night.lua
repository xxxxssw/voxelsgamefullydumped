-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Night
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = game:GetService("Lighting")
local v2 = game:GetService("ReplicatedStorage")
local u3 = require(v1.ClockSystem.TimeConfiguration)
local u4 = v2.Systems.WorldSystem.CurrentTick
local v5 = {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 10 ]]
        return true
    end
}
local u6 = u3.HOUR_LENGTH * 24
function v5.run(_, p7, _) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
    --]]
    local v8 = u4.Value / u6
    u4.Value = (math.floor(v8) + 1) * u6 + u3.HOUR_LENGTH * u3.DAY_SECTIONS.DUSK.Max
    p7("Night set", Color3.fromRGB(255, 255, 127))
end
return v5