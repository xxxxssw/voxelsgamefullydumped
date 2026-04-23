-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Workspace")
local v2 = game:GetService("RunService")
local u3 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u5 = require(game.ReplicatedStorage.Libs.Coordinates)
local u6 = require(game.ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates.HighestAltitude)
local u7 = require(game.ReplicatedStorage.Libs.BlockState)
local u8 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
v2:IsStudio()
return function(p9) --[[ Name: GetSpawnCFrameFromCoordinates, Line 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u6
        [4] = u4
        [5] = u7
        [6] = u8
        [7] = u1
    --]]
    local v10 = u5.regionNameFromCoordinates(p9)
    local v11 = u5.chunkNameFromCoordinates(p9)
    local v12 = u3.getChunkFolder(v10, v11)
    local v13 = nil
    if not u6.isToken(p9.Y) then
        local v14 = u4.getBlockState(p9 + Vector3.new(0, 1, 0))
        local v15 = u7.getBlockId(v14)
        local v16 = u7.getBlockId(u4.getBlockState(p9))
        local v17 = u7.getBlockId(u4.getBlockState(p9 - Vector3.new(0, 1, 0)))
        if v16 == 0 and v17 == 0 then
            v13 = CFrame.new(p9 * 4)
        elseif v15 == u4.AIR or (u8.NoCollision[v15] or (u8.CrossedSprites[v15] or u8.Bed[v15])) then
            v13 = CFrame.new(p9 * 4)
        else
            local v18 = p9.X
            local v19 = u6.TOKEN
            local v20 = p9.Z
            p9 = Vector3.new(v18, v19, v20)
        end
    end
    if u6.isToken(p9.Y) then
        local v21 = u5.coordinatesOffsetFromRegionName(v10) * 4 + u5.coordinatesOffsetFromChunkName(v11) * 4
        local v22 = u5.coordinatesOffsetFromBlockName
        local v23 = u5.blockNameFromCoordinates
        local v24 = p9.X
        local v25 = p9.Z
        local v26 = v21 + v22(v23((Vector3.new(v24, 255, v25)))) * 4
        local v27 = RaycastParams.new()
        v27.FilterType = Enum.RaycastFilterType.Include
        v27.FilterDescendantsInstances = { v12 }
        local v28 = u1:Raycast(v26, Vector3.new(-0, -4000, -0), v27)
        if v28 and v28.Instance then
            local v29 = u5.blockNameFromCoordinates(u5.coordinatesFromWorkspaceVector3(v28.Instance.Position))
            return CFrame.new(u5.coordinatesOffsetFromRegionName(v10) * 4 + u5.coordinatesOffsetFromChunkName(v11) * 4 + u5.coordinatesOffsetFromBlockName(v29) * 4 + Vector3.new(0, 4, 0))
        end
        warn("Could not find a block to spawn on. Spawning character in the sky instead.")
        v13 = CFrame.new(v26)
    end
    return v13
end