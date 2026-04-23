-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Kit
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u2 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u3 = require(game.ReplicatedStorage.Configuration.Items.Kits)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 7 ]]
        return true
    end,
    ["run"] = function(u4, p5, u6) --[[ Name: run, Line 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u1
            [3] = u2
        --]]
        local v12, v13 = pcall(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u1
                [4] = u4
                [5] = u2
            --]]
            local v7 = string.split(u6, " ")[2]
            local v8 = u3[tostring(v7)] or error("No kit found " .. tostring(v7))
            local v9 = u1.server_getPlayerInventory(u4)
            for v10, v11 in pairs(v8) do
                u2.pushItem(v9, v10, v11)
            end
            u1.server_setPlayerInventory(u4, v9, true)
        end)
        if v12 then
            p5("Gave item(s)")
        else
            local v14 = ""
            for v15, _ in pairs(u3) do
                v14 = v14 .. v15 .. " "
            end
            p5("Error using command. Example: /kit tools. Available kits: " .. v14, Color3.fromRGB(255, 0, 0))
            warn(v13)
        end
    end
}