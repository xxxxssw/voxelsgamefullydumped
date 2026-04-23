-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ForcedAirToggle
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
local v7 = {
    ["allowed"] = function(p6, _) --[[ Name: allowed, Line 17 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4.hasDebugTools(p6)
    end
}
local u8 = nil
function v7.run(_, p9, p10) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u8
        [4] = u5
        [5] = u1
    --]]
    local v11 = string.split(p10, " ")
    if #v11 == 1 or #v11 == 2 then
        local v12 = u3.getBlockIdFromName("structure_forced_air")
        local v13 = {}
        for _, v14 in workspace.CurrentCamera:GetDescendants() do
            local v15 = v14:GetAttribute(u2.ATTRIBUTE)
            if v15 and v12 == u2.getBlockId(v15) then
                if not u8 then
                    u8 = v14.Hitbox.Transparency
                end
                local v16 = u2.getMetadata(v15)
                if #v11 == 2 then
                    local v17 = v11[2]
                    v16.transparency = tonumber(v17)
                else
                    v16.transparency = 1 - u8
                end
                local v18 = u2.setMetadata(v15, v16)
                local v19 = {
                    ["coordinates"] = u5.coordinatesFromWorkspaceVector3(v14.Hitbox.Position),
                    ["state"] = v18
                }
                table.insert(v13, v19)
            end
        end
        u8 = 1 - u8
        if #v13 > 0 then
            u1.server_addMutationsTable(v13)
            return
        end
    else
        p9("/forcedairtoggle", Color3.fromRGB(255, 0, 0))
    end
end
return v7