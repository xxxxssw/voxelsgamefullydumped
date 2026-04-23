-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Heal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.CombatSystem)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 5 ]]
        return true
    end,
    ["run"] = function(u2, p3, u4) --[[ Name: run, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v7, v8 = pcall(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u1
                [3] = u2
            --]]
            local v5 = string.split(u4, " ")[2]
            local v6 = tonumber(v5) or error("Invalid amount")
            if v6 < 1 then
                error("Invalid amount")
            end
            u1.server_healPlayer(u2, v6)
        end)
        if v7 then
            p3("Healed")
        else
            p3("Error using command. Example: /heal 20", Color3.fromRGB(255, 0, 0))
            warn(v8)
        end
    end
}