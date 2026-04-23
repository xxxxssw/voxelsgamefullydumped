-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Memory
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("HttpService")
local u3 = require(game.ReplicatedStorage.Systems.GreedyMeshingSystem)
local u17 = {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 8 ]]
        return true
    end,
    ["dump"] = function() --[[ Name: dump, Line 20 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        print("-- Memory infos --")
        local v4 = u2:JSONEncode(shared)
        print("shared: " .. string.len(v4))
        local v5, v6 = u3.debug_getMemory()
        local v7 = print
        local v8 = 0
        local v9 = "GreedyMeshingSystem all_indexes: "
        for _ in pairs(v5) do
            v8 = v8 + 1
        end
        v7(v9, v8)
        local v10 = print
        local v11 = 0
        local v12 = "GreedyMeshingSystem all_rectangles: "
        for _ in pairs(v6) do
            v11 = v11 + 1
        end
        v10(v12, v11)
    end,
    ["run"] = function(p13, p14, p15) --[[ Name: run, Line 33 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u1
        --]]
        local v16 = string.split(p15, " ")[2]
        if v16 == "server" then
            u17.dump()
            return
        elseif v16 == "client" then
            u1.Systems.PlayersSystem.Network.Command_Memory:FireClient(p13)
        else
            p14("Specify peer \'client\' or \'server\'", Color3.fromRGB(255, 0, 0))
        end
    end
}
return u17