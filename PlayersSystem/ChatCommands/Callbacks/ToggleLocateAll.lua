-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ToggleLocateAll
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Client.Libs.MarkerSystem)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 5 ]]
        return true
    end,
    ["run"] = function(p2, p3, _) --[[ Name: run, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v4 = p2:GetAttribute(u1.ADMIN_LOCATOR_ATTRIBUTE)
        p2:SetAttribute(u1.ADMIN_LOCATOR_ATTRIBUTE, not v4)
        p3("All players locator set to:" .. tostring(not v4))
    end
}