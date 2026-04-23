-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ToggleGeneration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = game:GetService("ReplicatedStorage").Systems.PlayersSystem.Debug.Paused
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 7 ]]
        return true
    end,
    ["run"] = function(_, p2, _) --[[ Name: run, Line 11 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1.Value = not u1.Value
        local v3 = u1.Value
        p2("Generation paused:" .. tostring(v3))
    end
}