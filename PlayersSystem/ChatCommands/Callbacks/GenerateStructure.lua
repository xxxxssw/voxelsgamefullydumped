-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.GenerateStructure
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ServerScriptService.Systems.StructuresSystem)
require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local v4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u5 = require(game.ReplicatedStorage.Systems.BlocksSystem.BlocksFunctions.structure_generator)
local u6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u7 = v4.getBlockIdFromName("structure_generator")
return {
    ["allowed"] = function(p8, _) --[[ Name: allowed, Line 15 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6.hasDebugTools(p8)
    end,
    ["run"] = function(_, p9, p10) --[[ Name: run, Line 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
            [4] = u7
            [5] = u1
        --]]
        local v11 = string.split(p10, " ")
        if #v11 == 2 or #v11 == 3 then
            if u5.lastGeneratorPlaced ~= nil then
                if u3.getBlockId(u2.getBlockState(u5.lastGeneratorPlaced)) == u7 then
                    local v12 = v11[2]
                    local v13 = #v11 == 2
                    if u1.studio_placeStructure(u5.lastGeneratorPlaced, v12, {
                        ["NoStructureProcessing"] = v13
                    }) then
                        p9("Structure generated.", Color3.fromRGB(255, 255, 127))
                        u5.lastGeneratorPlaced = nil
                    end
                    return
                end
                u5.lastGeneratorPlaced = nil
            end
            p9("You must place a Structure Generator first.", Color3.fromRGB(255, 0, 0))
        else
            p9("You need to specify a name for the structure.", Color3.fromRGB(255, 0, 0))
        end
    end
}