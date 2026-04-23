-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ClearInventory
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u1 = require(game.ReplicatedStorage.Systems.InventorySystem)
require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 9 ]]
        return true
    end,
    ["run"] = function(p2, _, _) --[[ Name: run, Line 13 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1.server_setPlayerInventory(p2, u1.Formats.Player.createEmpty(), true)
    end
}