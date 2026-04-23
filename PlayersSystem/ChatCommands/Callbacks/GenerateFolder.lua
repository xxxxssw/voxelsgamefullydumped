-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.GenerateFolder
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ServerScriptService.Systems.StructuresSystem)
require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local v4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u5 = require(game.ReplicatedStorage.Systems.BlocksSystem.BlocksFunctions.structure_generator)
local u6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u7 = game.ServerScriptService.Systems.StructuresSystem.Structures.SavedStructures
local u8 = v4.getBlockIdFromName("structure_generator")
local v10 = {
    ["allowed"] = function(p9, _) --[[ Name: allowed, Line 17 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6.hasDebugTools(p9)
    end
}
local function u13(p11) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    for _, v12 in ipairs(u7:GetChildren()) do
        if v12.Name:lower() == p11:lower() then
            return v12
        end
    end
end
function v10.run(_, p14, p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u2
        [4] = u8
        [5] = u13
        [6] = u1
    --]]
    local v16 = string.split(p15, " ")
    if #v16 == 2 then
        if u5.lastGeneratorPlaced ~= nil then
            if u3.getBlockId(u2.getBlockState(u5.lastGeneratorPlaced)) == u8 then
                local v17 = v16[2]
                local v18 = u5.lastGeneratorPlaced
                local v19 = u13(v17)
                if v19 then
                    local v20 = #v19:GetChildren()
                    local v21 = math.sqrt(v20) / 2
                    local v22 = math.floor(v21)
                    print(#v19:GetChildren(), v22)
                    local v23 = v19:GetChildren()
                    local v24 = 1
                    for v25 = -v22, v22 do
                        for v26 = -v22, v22 do
                            local v27 = v23[v24]
                            v24 = v24 + 1
                            if v27 then
                                local v28 = v18 + Vector3.new(1, 0, 0) * v25 * 32 + Vector3.new(0, 0, 1) * v26 * 32
                                local v29 = u1.placeStructure(v28, v27.Name, {
                                    ["NoStructureProcessing"] = true
                                })
                                if v29 then
                                    p14(string.format("Structure %s generated.", v27.Name), Color3.fromRGB(255, 255, 127))
                                else
                                    print(v29)
                                    p14(string.format("Structure %s fail.", v27.Name), Color3.fromRGB(255, 0, 0))
                                end
                            end
                        end
                    end
                    u5.lastGeneratorPlaced = nil
                else
                    p14("Invalid folder name.", Color3.fromRGB(255, 0, 0))
                end
            end
            u5.lastGeneratorPlaced = nil
        end
        p14("You must place a Structure Generator first.", Color3.fromRGB(255, 0, 0))
    else
        p14("You need to specify a name for the structure.", Color3.fromRGB(255, 0, 0))
    end
end
return v10