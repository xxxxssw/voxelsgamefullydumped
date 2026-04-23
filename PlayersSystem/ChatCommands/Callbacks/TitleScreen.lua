-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.TitleScreen
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 7 ]]
        return true
    end,
    ["run"] = function(p3, _, _) --[[ Name: run, Line 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        if p3.Character then
            p3.Character:Destroy()
            p3.Character = nil
        end
        u2.server_setPlayerCoordinates(p3, nil)
        u1.Systems.PlayersSystem.Network.Command_TitleScreen:FireClient(p3)
    end
}