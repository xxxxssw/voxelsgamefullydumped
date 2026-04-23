-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.Culling
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Libs.Coordinates)
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u3 = require(game.ReplicatedStorage.Systems.ChunksSystem)
require(game.ReplicatedStorage.Systems.RegionsSystem)
local u4 = require(game.ReplicatedStorage.Systems.MutationsSystem)
local u5 = require(game.ReplicatedStorage.Libs.BlockState)
local u6 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks).getBlockIdFromName("water")
local u29 = {
    ["neighborsOrder"] = {
        [Enum.NormalId.Right] = 0,
        [Enum.NormalId.Left] = 1,
        [Enum.NormalId.Back] = 2,
        [Enum.NormalId.Front] = 3,
        [Enum.NormalId.Top] = 4,
        [Enum.NormalId.Bottom] = 5
    },
    ["neighborsSumIncludes"] = function(p7, p8) --[[ Name: neighborsSumIncludes, Line 26 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v9 = u29.neighborsOrder[p8]
        return bit32.extract(p7, v9, 1) == 1
    end,
    ["computeCullingForLiquidBlock"] = function(p10) --[[ Name: computeCullingForLiquidBlock, Line 48 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
            [3] = u3
            [4] = u5
            [5] = u6
            [6] = u29
        --]]
        u2.getBlockState(p10)
        local v11 = 0
        for _, v12 in ipairs(Enum.NormalId:GetEnumItems()) do
            local v13 = p10 + Vector3.fromNormalId(v12)
            if v13.Y > 1 and v13.Y < 255 then
                local v14 = u1.regionNameFromCoordinates(v13)
                local v15 = u1.chunkNameFromCoordinates(v13)
                if u3.statusIsLoadedOrRendered(v14, v15) then
                    local v16 = u2.getBlockState(v13)
                    if u2.isBlockStateTransparent(v16) and u5.getBlockId(v16) ~= u6 then
                        local v17 = u29.neighborsOrder[v12]
                        v11 = v11 + math.pow(2, v17)
                    end
                end
            end
        end
        if v11 == 0 then
            v11 = nil
        end
        return v11
    end,
    ["computeCullingForClassicBlock"] = function(p18) --[[ Name: computeCullingForClassicBlock, Line 76 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
            [3] = u2
            [4] = u29
        --]]
        local v19 = 0
        for _, v20 in ipairs(Enum.NormalId:GetEnumItems()) do
            local v21 = p18 + Vector3.fromNormalId(v20)
            if v21.Y >= 0 and v21.Y <= 255 then
                local v22 = u1.regionNameFromCoordinates(v21)
                local v23 = u1.chunkNameFromCoordinates(v21)
                if u3.statusIsLoadedOrRendered(v22, v23) then
                    local v24 = u2.getBlockState(v21)
                    if u2.isBlockStateTransparent(v24) then
                        local v25 = u29.neighborsOrder[v20]
                        v19 = v19 + math.pow(2, v25)
                    end
                end
            else
                local v26 = u29.neighborsOrder[v20]
                v19 = v19 + math.pow(2, v26)
            end
        end
        if v19 == 0 then
            v19 = nil
        end
        return v19
    end,
    ["computeNeighborsSum"] = function(p27) --[[ Name: computeNeighborsSum, Line 102 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u6
            [4] = u29
        --]]
        local v28 = u2.getBlockState(p27)
        if u5.getBlockId(v28) == u6 then
            return u29.computeCullingForLiquidBlock(p27)
        else
            return u29.computeCullingForClassicBlock(p27)
        end
    end
}
local function u40(p30) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u2
        [4] = u5
        [5] = u29
        [6] = u4
    --]]
    local v31 = u1.regionNameFromCoordinates(p30)
    local v32 = u1.chunkNameFromCoordinates(p30)
    local v33 = u1.blockNameFromCoordinates(p30)
    if u3.statusIsLoadedOrRendered(v31, v32) then
        local v34 = u2.getBlockState(p30)
        local v35 = u5.getBlockId(v34)
        if v35 == 0 then
            return
        end
        local v36 = u29.computeNeighborsSum(p30)
        local v37 = u3.readChunkData(v31, v32)
        if u5.isClientPredicted(v34) then
            local v38 = u4.client_readPrediction(v31, v32, v33)
            if v38 then
                u4.client_writePrediction(v31, v32, v33, u5.setNeighborsSum(v38, v36))
                return
            end
        else
            if v36 == 0 or v35 == 0 then
                v37.cullingVisibles[tonumber(v33)] = nil
                if v36 == 0 then
                    v37.greedyMeshing[tonumber(v33)] = {
                        ["id"] = v35,
                        ["c"] = false
                    }
                else
                    v37.greedyMeshing[tonumber(v33)] = {
                        ["id"] = v35,
                        ["c"] = true
                    }
                end
            else
                v37.cullingVisibles[tonumber(v33)] = v36
                v37.greedyMeshing[tonumber(v33)] = {
                    ["id"] = v35,
                    ["c"] = true
                }
            end
            local v39 = u5.setNeighborsSum(v34, v36)
            if v34 == v39 then
                return
            end
            u4.addMutation(v31, v32, v33, v39)
        end
    end
end
function u29.computeNeighbors(p41) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    u40(p41)
    for _, v42 in ipairs(Enum.NormalId:GetEnumItems()) do
        local v43 = p41 + Vector3.fromNormalId(v42)
        if v43.Y >= 0 and v43.Y <= 255 then
            u40(v43)
        end
    end
end
function u29.canCoordinatesBeEdited(p44) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    local v45 = u1.regionNameFromCoordinates(p44)
    local v46 = u1.chunkNameFromCoordinates(p44)
    local v47 = u1.blockGridFromCoordinates
    local v48 = Vector3.new(v47(p44))
    local v49 = {}
    if v48.X == 0 then
        local v50 = Enum.NormalId.Left
        table.insert(v49, v50)
    elseif v48.X == 15 then
        local v51 = Enum.NormalId.Right
        table.insert(v49, v51)
    end
    if v48.Z == 0 then
        local v52 = Enum.NormalId.Front
        table.insert(v49, v52)
    elseif v48.Z == 15 then
        local v53 = Enum.NormalId.Back
        table.insert(v49, v53)
    end
    local v54 = u1.coordinatesOffsetFromRegionName(v45) + u1.coordinatesOffsetFromChunkName(v46)
    for _, v55 in ipairs(v49) do
        local v56 = v54 + u1.Chunk * Vector3.fromNormalId(v55)
        local v57 = u1.regionNameFromCoordinates(v56)
        local v58 = u1.chunkNameFromCoordinates(v56)
        local v59 = u3.readChunkStatus(v57, v58)
        if v59 ~= u3.ChunkStatus.Rendered and v59 ~= u3.ChunkStatus.Empty then
            return false
        end
    end
    return true
end
return u29