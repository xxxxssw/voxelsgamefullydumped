-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Teleport
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.PlayersSystem)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 5 ]]
        return true
    end,
    ["run"] = function(u2, p3, u4) --[[ Name: run, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v12, _ = pcall(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u1
                [3] = u2
            --]]
            local v5 = string.split(u4, " ")
            local v6 = v5[2]
            local v7 = tonumber(v6)
            local v8 = v5[3]
            local v9 = tonumber(v8)
            local v10 = v5[4]
            local v11 = tonumber(v10)
            if v7 and (v9 and v11) then
                u1.server_teleportPlayer(u2, (Vector3.new(v7, v9, v11)))
            end
        end)
        if v12 then
            p3("Starting teleportation..")
        else
            p3("Error using command. Example: /tp 100 200 100", Color3.fromRGB(255, 0, 0))
        end
    end
}