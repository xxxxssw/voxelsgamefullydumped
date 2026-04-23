-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Give
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u3 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 7 ]]
        return true
    end,
    ["run"] = function(u4, p5, u6) --[[ Name: run, Line 11 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u2
            [3] = u3
        --]]
        local v12, v13 = pcall(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u1
                [3] = u2
                [4] = u4
                [5] = u3
            --]]
            local v7 = string.split(u6, " ")
            local v8 = u1.itemIdFromName(v7[2])
            local v9 = v7[3]
            local v10 = tonumber(v9) or 1
            local v11 = u2.server_getPlayerInventory(u4)
            u3.pushItem(v11, v8, v10)
            u2.server_setPlayerInventory(u4, v11, true)
        end)
        if v12 then
            p5("Gave item(s)")
        else
            p5("Error using command. Example: /give red_bed 1", Color3.fromRGB(255, 0, 0))
            warn(v13)
        end
    end
}