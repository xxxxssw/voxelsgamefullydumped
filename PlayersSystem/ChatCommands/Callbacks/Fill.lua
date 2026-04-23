-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Fill
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

require(game.ServerScriptService.Systems.StructuresSystem)
require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
local u1 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
require(game.ReplicatedStorage.Systems.BlocksSystem.BlocksFunctions.structure_generator)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u5 = require(game.ReplicatedStorage.Libs.Coordinates)
local _ = game.ServerScriptService.Systems.StructuresSystem.Structures.SavedStructures
u3.getBlockIdFromName("structure_generator")
return {
    ["allowed"] = function(p6, _) --[[ Name: allowed, Line 17 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4.hasDebugTools(p6)
    end,
    ["run"] = function(p7, p8, p9) --[[ Name: run, Line 28 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
            [4] = u1
        --]]
        local v10 = string.split(p9, " ")
        if #v10 == 2 or #v10 == 3 then
            local v11 = u3.getBlockIdFromName(v10[2])
            local v12 = u3.getBlockIdFromName(v10[3]) or u3.getBlockIdFromName("structure_forced_air")
            if v11 and v12 then
                local v13 = p7.Character
                local v14 = v13.HumanoidRootPart
                u5.coordinatesFromWorkspaceVector3(v13.HumanoidRootPart.Position)
                local v15 = {}
                for _, v16 in workspace:GetPartBoundsInBox(v14.CFrame, Vector3.new(128, 128, 128)) do
                    local v17 = v16:GetAttribute(u2.ATTRIBUTE)
                    if v17 and u2.getBlockId(v17) == v11 then
                        local v18 = u5.coordinatesFromWorkspaceVector3
                        local v19 = v16.Position
                        table.insert(v15, v18(v19))
                    end
                end
                if #v15 < 2 then
                    p8("can\'t find two blocks", Color3.fromRGB(255, 0, 0))
                else
                    local v20 = u2.create(v12, -1, nil)
                    local v21 = v15[1]
                    local v22 = v15[2]
                    local v23 = v21.X
                    local v24 = v22.X
                    local v25 = math.min(v23, v24)
                    local v26 = v21.X
                    local v27 = v22.X
                    local v28 = math.max(v26, v27)
                    local v29 = v21.Y
                    local v30 = v22.Y
                    local v31 = math.min(v29, v30)
                    local v32 = v21.Y
                    local v33 = v22.Y
                    local v34 = math.max(v32, v33)
                    local v35 = v21.Z
                    local v36 = v22.Z
                    local v37 = math.min(v35, v36)
                    local v38 = v21.Z
                    local v39 = v22.Z
                    local v40 = math.max(v38, v39)
                    for v41 = v25, v28 do
                        for v42 = v37, v40 do
                            for v43 = v31, v34 do
                                local v44 = Vector3.new(v41, v43, v42)
                                local v45 = u1.getBlockState(v44)
                                if u2.getBlockId(v45) == 0 then
                                    u1.server_setBlockState(v44, v20, nil)
                                end
                            end
                        end
                    end
                end
            else
                p8("invalid block name", Color3.fromRGB(255, 0, 0))
                return
            end
        else
            p8("/fill block1 block2 (region made by block1 is fill of block2", Color3.fromRGB(255, 0, 0))
            return
        end
    end
}