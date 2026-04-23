-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.EncodeStructure
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
local u2 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
return {
    ["allowed"] = function(p3, _) --[[ Name: allowed, Line 6 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.hasDebugTools(p3)
    end,
    ["run"] = function(_, p4, p5) --[[ Name: run, Line 10 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v6 = string.split(p5, " ")
        if #v6 == 2 then
            local v7 = v6[2]
            return u1.doEncode(p4, v7)
        end
        p4("You need to specify a name for the structure.", Color3.fromRGB(255, 0, 0))
    end
}