-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.Libs.CanConsume
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.CombatSystem.Configuration)
local u2 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
return function(p3, p4) --[[ Name: CanConsume, Line 4 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    if u2.Consumable[p4] == nil then
        return false
    else
        return not u2.RequiresMissingHealth[p4] and true or p3:GetAttribute("health") < u1.PLAYER_MAX_HEALTH
    end
end