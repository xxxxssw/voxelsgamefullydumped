-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local u2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("CollectionService")
game:GetService("RunService")
local u4 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u5 = require(game.ReplicatedStorage.Systems.ActionsSystem)
local u6 = require(game.ReplicatedStorage.Systems.MutationsSystem)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u8 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u9 = require(game.ReplicatedStorage.Libs.Culling)
local v10 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v11 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u12 = require(game.ReplicatedStorage.Libs.Coordinates)
local u13 = require(game.ReplicatedStorage.Libs.Cursor)
local u14 = require(game.ReplicatedStorage.Libs.BlockState)
local u15 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u16 = require(game.ReplicatedStorage.Client.States.InventoryState)
require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
local u17 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u18 = require(script.Libs.Utils)
local u19 = require(script.Configuration.Configuration)
local u20 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
require(game.ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater)
local u21 = v11.getBlockIdFromName("water")
local u22 = v10.itemIdFromName("bucket")
local u23 = v10.itemIdFromName("water_bucket")
local u24 = v1.LocalPlayer
local u26 = {
    ["COLLECTION_NAME"] = "liquid",
    ["isAnyBucket"] = function(p25) --[[ Name: isAnyBucket, Line 37 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
        --]]
        return p25 == u22 and true or p25 == u23
    end
}
local function u38(p27, p28, p29, p30, p31) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u14
        [4] = u7
        [5] = u20
        [6] = u9
        [7] = u17
        [8] = u4
        [9] = u23
        [10] = u22
        [11] = u21
    --]]
    if not u5.canPlayerDoAction(p27) then
        warn("server_onBucketPlaceRequest Player cannot do actions")
        return false
    end
    if not u5.canChunkBeEdited(p28, p29) then
        warn("server_onBucketPlaceRequest Chunk cannot be edited")
        return false
    end
    local v32 = u12.coordinatesFromNames(p28, p29, p30)
    local v33 = u14.getBlockId(u7.getBlockState(v32))
    if u20[u12.getDimensionId(v32)].waterDisplay == "Lava" then
        return false
    end
    if not u9.canCoordinatesBeEdited(v32) then
        warn("server_onBucketPlaceRequest Culling prevented coordinates edition")
        return false
    end
    if u17.Overwritable[v33] ~= true then
        warn("server_onBucketPlaceRequest Block id cannot be overriden")
        return false
    end
    local v34 = u4.server_getPlayerInventory(p27)
    local v35
    if v34 then
        v35 = v34[tostring(p31)]
    else
        v35 = v34
    end
    if not v35 or (v35 == u4.NoItemSymbol or v35.id ~= u23) then
        warn("server_onBucketPlaceRequest Inventory error")
        return false
    end
    local v36 = {
        ["id"] = u22,
        ["qty"] = 1
    }
    v34[tostring(p31)] = v36
    local v37 = u14.create(u21, -1, nil)
    u4.server_setPlayerInventory(p27, v34)
    u7.server_setBlockState(v32, v37)
    return true
end
local function u55(p39, p40, p41, p42, p43) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u7
        [4] = u14
        [5] = u17
        [6] = u20
        [7] = u9
        [8] = u4
        [9] = u21
        [10] = u22
        [11] = u23
        [12] = u19
    --]]
    if not u5.canPlayerDoAction(p39) then
        warn("server_onBucketPlaceRequest Player cannot do actions")
        return false
    end
    if not u5.canChunkBeEdited(p40, p41) then
        warn("server_onBucketPlaceRequest Chunk cannot be edited")
        return false
    end
    local v44 = u12.coordinatesFromNames(p40, p41, p42)
    local v45 = u7.getBlockState(v44)
    local v46 = u14.getBlockId(v45)
    u14.getMetadata(v45)
    local v47 = u12.getDimensionId(v44)
    local v48 = u7.getBlockState(v44)
    local v49 = u14.getBlockId(v48)
    if not u17.Water[v49] then
        return false
    end
    if u20[v47].waterDisplay == "Lava" then
        return false
    end
    if not u9.canCoordinatesBeEdited(v44) then
        warn("server_onBucketPlaceRequest Culling prevented coordinates edition")
        return false
    end
    local v50 = u4.server_getPlayerInventory(p39)
    local v51
    if v50 then
        v51 = v50[tostring(p43)]
    else
        v51 = v50
    end
    if v46 ~= u21 or (v51 == u4.NoItemSymbol or v51.id ~= u22) then
        return false
    end
    local v52 = {
        ["id"] = u23,
        ["qty"] = 1
    }
    v50[tostring(p43)] = v52
    u4.server_setPlayerInventory(p39, v50)
    local v53
    if u17.Water[v49] then
        v53 = u19.Water.Infinite
    else
        v53 = false
    end
    if not v53 then
        local v54 = u14.create(0, -1, nil)
        u7.client_setPredictionBlockState(v44, v54, nil)
    end
    return true
end
function u26.client_init() --[[ Line: 157 ]] end
local function u69(p56) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u14
        [4] = u20
        [5] = u5
        [6] = u6
        [7] = u9
        [8] = u17
        [9] = u19
        [10] = u16
        [11] = u15
        [12] = u23
    --]]
    local u57 = u12.regionNameFromCoordinates(p56)
    local u58 = u12.chunkNameFromCoordinates(p56)
    local u59 = u12.blockNameFromCoordinates(p56)
    local v60 = u12.getDimensionId(p56)
    local v61 = u7.getBlockState(p56)
    local v62 = u14.getBlockId(v61)
    if u20[v60].waterDisplay == "Lava" then
        return false
    elseif u5.canChunkBeEdited(u57, u58) then
        if u6.client_readPrediction(u57, u58, u59) == nil then
            if u9.canCoordinatesBeEdited(p56) then
                local v63
                if u17.Water[v62] then
                    v63 = u19.Water.Infinite
                else
                    v63 = false
                end
                if not v63 then
                    local v64 = u14.create(0, -1, nil)
                    u7.client_setPredictionBlockState(p56, v64, nil)
                end
                local v65 = u16.getState().predictedInventories.Player
                local v66 = u15.getCurrentHotbarSlot
                v65[tostring(v66())] = {
                    ["id"] = u23,
                    ["qty"] = 1
                }
                u16.setPredictedPlayerInventory(v65)
                local u67 = nil
                local _, v68 = pcall(function() --[[ Line: 242 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u57
                        [3] = u58
                        [4] = u59
                        [5] = u15
                    --]]
                    u67 = script.Network.BucketFill:InvokeServer(u57, u58, u59, u15.getCurrentHotbarSlot())
                end)
                if u67 ~= true or v68 ~= nil then
                    u16.reconcile()
                    if v68 ~= nil then
                        warn("client_fillBucket error: " .. v68)
                    end
                end
                u7.client_setPredictionBlockState(p56, nil)
            else
                warn("client_fillBucket Coordinates cannot be edited")
            end
        else
            warn("client_fillBucket An operation is already being processed")
            return
        end
    else
        warn("client_fillBucket Chunk cannot be edited")
        return
    end
end
local function u80(p70, _) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u20
        [3] = u5
        [4] = u6
        [5] = u9
        [6] = u7
        [7] = u14
        [8] = u21
        [9] = u16
        [10] = u15
        [11] = u22
    --]]
    local u71 = u12.regionNameFromCoordinates(p70)
    local u72 = u12.chunkNameFromCoordinates(p70)
    local u73 = u12.blockNameFromCoordinates(p70)
    if u20[u12.getDimensionId(p70)].waterDisplay == "Lava" then
        return false
    elseif u5.canChunkBeEdited(u71, u72) then
        if u6.client_readPrediction(u71, u72, u73) == nil then
            if u9.canCoordinatesBeEdited(p70) then
                local v74 = u7.getBlockState(p70)
                if u14.getBlockId(v74) == 0 then
                    local v75 = u14.create(u21, -1, nil)
                    u7.client_setPredictionBlockState(p70, v75, nil)
                    local v76 = u16.getState().predictedInventories.Player
                    local v77 = u15.getCurrentHotbarSlot
                    v76[tostring(v77())] = {
                        ["id"] = u22,
                        ["qty"] = 1
                    }
                    u16.setPredictedPlayerInventory(v76)
                    local u78 = nil
                    local _, v79 = pcall(function() --[[ Line: 303 ]]
                        --[[
                        Upvalues:
                            [1] = u78
                            [2] = u71
                            [3] = u72
                            [4] = u73
                            [5] = u15
                        --]]
                        u78 = script.Network.BucketPlace:InvokeServer(u71, u72, u73, u15.getCurrentHotbarSlot())
                    end)
                    if u78 ~= true or v79 ~= nil then
                        u16.reconcile()
                        if v79 ~= nil then
                            warn("server_onBucketPlaceRequest error: " .. v79)
                        end
                    end
                    u7.client_setPredictionBlockState(p70, nil)
                end
            else
                warn("client_placeBucket Coordinates cannot be edited")
                return
            end
        else
            warn("client_placeBucket An operation is already being processed")
            return
        end
    else
        warn("client_placeBucket Chunk cannot be edited")
        return
    end
end
function u26.client_onBucketUsed() --[[ Line: 319 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u22
        [3] = u13
        [4] = u7
        [5] = u14
        [6] = u17
        [7] = u69
        [8] = u23
        [9] = u24
        [10] = u80
    --]]
    local v81 = u15.getCurrentlyHeldItemId()
    if v81 == u22 then
        local v82, v83 = u13.getHoveredLiquidBlockInstance()
        if v82 == nil then
            return false
        end
        local v84 = u7.getBlockState(v83)
        local v85 = u14.getBlockId(v84)
        u14.getMetadata(v84)
        if not u17.Water[v85] then
            return false
        end
        u69(v83)
    elseif v81 == u23 then
        local v86 = u13.coordinatesFromHoveredBlock()
        if v86 and (u24.Character and u24.Character.PrimaryPart) then
            local _, v87 = u13.getHoveredBlockInstance()
            u80(v86 + v87.Normal, v81)
        end
    end
end
function u26.server_init() --[[ Line: 354 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u3
        [4] = u26
        [5] = u38
        [6] = u55
    --]]
    local v88 = u2.Assets.Geometry.Blocks:FindFirstChild(u21)
    if script.Debug_CursorShowLiquids.Value then
        v88.PrimaryPart.CollisionGroup = "Default"
    end
    u3:AddTag(v88, u26.COLLECTION_NAME)
    script.Network.BucketPlace.OnServerInvoke = u38
    script.Network.BucketFill.OnServerInvoke = u55
end
require(script.Libs.Queue)
local u89 = require(script.Libs.Directions)
function u26.WaterOnBlockStateChanged___(p90, p91) --[[ Line: 374 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u26
        [4] = u19
        [5] = u18
        [6] = u89
        [7] = u12
        [8] = u8
    --]]
    local v92 = p91:GetAttribute("blockState")
    local v93 = u14.getMetadata(v92) or {}
    task.wait(0.5)
    local v94 = v93.level or 0
    if not v93.current then
        Vector2.new()
    end
    local v95 = p90 + Vector3.fromNormalId(Enum.NormalId.Bottom)
    local v96 = u7.getBlockState(v95)
    local v97 = u14.getBlockId(v96)
    if v97 == u7.AIR then
        local v98 = u14.setMetadata(v92, {
            ["level"] = 0
        })
        u7.server_setBlockState(v95, v98)
    elseif v97 ~= u7.AIR and (v97 ~= u7.WATER and v97 ~= u7.LAVA) then
        local v99 = u26.BreadthFirstSearch(p90, u19.Water.MAX_SPREAD)
        local v100 = {}
        if v99 then
            for _, v101 in v99 do
                local v102 = v101.direction:split(";")[1]
                local v103 = u18.string2normalId
                table.insert(v100, v103(v102))
            end
        else
            v100 = u89.lateralDirection
        end
        for _, v104 in v100 do
            local v105 = p90 + Vector3.fromNormalId(v104)
            local v106 = u7.getBlockState(v105)
            local v107 = u14.getBlockId(v106)
            if v107 == u7.AIR then
                if v94 < u19.Water.MAX_SPREAD then
                    local v108 = {
                        ["level"] = v94 + 1
                    }
                    local v109 = u14.setMetadata(v92, v108)
                    u7.server_setBlockState(v105, v109)
                end
            elseif u19.Water.BlocksUpdate[v107] then
                local v110 = u12.regionNameFromCoordinates(v105)
                local v111 = u12.chunkNameFromCoordinates(v105)
                if u8.readChunkStatus(v110, v111) == u8.ChunkStatus.Ready then
                    local v112 = u8.getChunkFolder(v110, v111)
                    if not v112 then
                        return
                    end
                    v112:FindFirstChild((u12.blockNameFromCoordinates(p90)))
                end
            end
        end
    end
end
return u26