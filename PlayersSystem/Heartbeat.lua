-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Heartbeat
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("RunService")
local u2 = game:GetService("ReplicatedStorage")
local u3 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.RenderDistance)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities)
local u5 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u6 = require(game.ReplicatedStorage.Libs.Coordinates)
local u7 = require(game.ReplicatedStorage.Systems.RegionsSystem)
local u8 = require(game.ReplicatedStorage.Systems.HorizonSystem)
local u9 = require(script.Parent.Libs.UtilsDistance)
local u10 = v1:IsClient()
local u11 = v1:IsServer()
local u12 = u9.DistanceType.Euclidean
return function() --[[ Name: heartbeat, Line 18 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u9
        [4] = u12
        [5] = u6
        [6] = u11
        [7] = u7
        [8] = u5
        [9] = u10
        [10] = u8
        [11] = u2
    --]]
    if not script.Parent.Debug.Paused.Value then
        u4.update()
        for _, v13 in u4.getTrackers() do
            local v14 = v13.coordinates
            if v14 ~= nil then
                local v15 = u3.getRenderDistance(v13.player)
                for v16 = -v15 * 2, v15 * 2 do
                    for v17 = -v15 * 2, v15 * 2 do
                        if v15 >= u9.getDistance(u12, v16, v17) then
                            local v18 = u6.regionNameFromCoordinates(v14 + u6.Chunk * Vector3.new(v16, 0, v17))
                            local v19 = u6.chunkNameFromCoordinates(v14 + u6.Chunk * Vector3.new(v16, 0, v17))
                            if u11 and u7.readRegionStatus(v18) == nil then
                                u7.requestRegionLoading(v18)
                            end
                            if u5.readChunkStatus(v18, v19) == nil then
                                u5.requestChunkLoading(v18, v19)
                            end
                        end
                    end
                end
                if u10 and (u8.enabled and u2.Client.States.HorizonDistance.Value > 0) then
                    local v20 = v15 + u2.Client.States.HorizonDistance.Value
                    for v21 = -v20 * 2, v20 * 2 do
                        for v22 = -v20 * 2, v20 * 2 do
                            if v20 >= u9.getDistance(u12, v21, v22) and (math.abs(v21) >= 1 or math.abs(v22) >= 1) then
                                local v23 = u6.regionNameFromCoordinates(v14 + u6.Chunk * Vector3.new(v21, 0, v22))
                                local v24 = u6.chunkNameFromCoordinates(v14 + u6.Chunk * Vector3.new(v21, 0, v22))
                                u8.client_requestChunkLoading(v23, v24)
                            end
                        end
                    end
                end
            end
        end
        local v25 = {}
        local v26 = {}
        for _, v27 in u4.getTrackers() do
            local v28 = v27.coordinates
            if v28 ~= nil then
                local v29 = u3.getUnRenderDistance(v27.player)
                for v30 = -v29 * 2, v29 * 2 do
                    for v31 = -v29 * 2, v29 * 2 do
                        if v29 >= u9.getDistance(u12, v30, v31) then
                            v25[u6.regionNameFromCoordinates(v28 + u6.Chunk * Vector3.new(v30, 0, v31)) .. "_" .. u6.chunkNameFromCoordinates(v28 + u6.Chunk * Vector3.new(v30, 0, v31))] = true
                        end
                    end
                end
                if u8.enabled and u2.Client.States.HorizonDistance.Value > 0 then
                    local v32 = v29 + u2.Client.States.HorizonDistance.Value
                    for v33 = -v32 * 2, v32 * 2 do
                        for v34 = -v32 * 2, v32 * 2 do
                            if v32 >= u9.getDistance(u12, v33, v34) then
                                v26[u6.regionNameFromCoordinates(v28 + u6.Chunk * Vector3.new(v33, 0, v34)) .. "_" .. u6.chunkNameFromCoordinates(v28 + u6.Chunk * Vector3.new(v33, 0, v34))] = true
                            end
                        end
                    end
                end
            end
        end
        for _, v35 in ipairs(u5.getChunksFolder():GetChildren()) do
            if not v25[v35.Name] then
                if v35:GetAttribute("Rendered") then
                    local v36 = string.split
                    local v37 = v35.Name
                    local v38, v39 = table.unpack(v36(v37, "_"))
                    if u5.readChunkStatus(v38, v39) == u5.ChunkStatus.Rendered then
                        u5.unloadChunk(v35, v38, v39)
                    end
                else
                    local v40 = string.split
                    local v41 = v35.Name
                    local v42, v43 = table.unpack(v40(v41, "_"))
                    u5.cancelLoading(v42, v43)
                end
            end
        end
        for _, v44 in ipairs(u8.client_getHorizonsFolder():GetChildren()) do
            local v45 = string.split
            local v46 = v44.Name
            local v47, v48 = table.unpack(v45(v46, "_"))
            if not v26[v44.Name] or u5.readChunkStatus(v47, v48) == u5.ChunkStatus.Rendered then
                v44:Destroy()
            end
        end
    end
end