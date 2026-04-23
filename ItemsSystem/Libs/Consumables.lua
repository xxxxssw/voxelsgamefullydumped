-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.Libs.Consumables
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.CombatSystem)
return {
    ["foodEatenFactory"] = function(u2, _) --[[ Name: foodEatenFactory, Line 5 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return function(p3) --[[ Line: 6 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u2
            --]]
            u1.server_healPlayer(p3, u2)
        end
    end
}