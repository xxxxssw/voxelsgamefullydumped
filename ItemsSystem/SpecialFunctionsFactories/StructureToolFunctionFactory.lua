-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctionsFactories.StructureToolFunctionFactory
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local v1 = game:GetService("RunService")
local u2 = game:GetService("Players")
local u3 = require(game.ReplicatedStorage.Libs.Cursor)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u5
if v1:IsServer() then
    u5 = require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
else
    u5 = nil
end
return function(u6) --[[ Name: StructureToolFunctionFactory, Line 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
        [4] = u5
    --]]
    return {
        ["client_getNetworkParams"] = function() --[[ Name: client_getNetworkParams, Line 21 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            return u3.coordinatesFromHoveredBlock()
        end,
        ["client_onUse"] = function() --[[ Name: client_onUse, Line 25 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
            --]]
            return u4.hasDebugTools(u2.LocalPlayer)
        end,
        ["server_onUse"] = function(p7, _, p8) --[[ Name: server_onUse, Line 29 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u5
                [3] = u6
            --]]
            if u4.hasDebugTools(p7) then
                u5.server_setDebugPoint(u6, p8)
            end
        end
    }
end