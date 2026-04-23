-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Godmode
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.CombatSystem)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 5 ]]
        return true
    end,
    ["run"] = function(p2, p3, _) --[[ Name: run, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1.godmodeEnabled[p2.UserId] = not u1.godmodeEnabled[p2.UserId]
        local v4 = u1.godmodeEnabled[p2.UserId]
        p3("Set godmode to: " .. tostring(v4))
    end
}