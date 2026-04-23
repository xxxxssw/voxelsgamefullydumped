-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.LoadSpawnLocationAsync
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
game:GetService("Workspace")
local u2 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local u3 = require(game.ReplicatedStorage.Systems.ChunksSystem)
require(game.ReplicatedStorage.Systems.BlocksSystem)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities)
local u5 = require(game.ReplicatedStorage.Libs.Coordinates)
require(game.ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates.HighestAltitude)
local u6 = require(game.ReplicatedStorage.Client.States.GameState)
require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u7 = require(game.ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates)
local u8 = v1.LocalPlayer
local u9 = u2.Systems.RegionsSystem.ServerPool
local u10 = u2.Systems.ChunksSystem.ServerPool
return function(p11) --[[ Name: loadSpawnLocationAsync, Line 20 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u2
        [4] = u5
        [5] = u4
        [6] = u9
        [7] = u10
        [8] = u3
        [9] = u7
    --]]
    u6.setLoadingInfos({
        ["message"] = "Loading..",
        ["progress"] = 0
    })
    while u8.Character ~= nil do
        u6.setLoadingInfos({
            ["message"] = "Awaiting character deletion..",
            ["progress"] = 0.05
        })
        task.wait()
    end
    u2.Client.States.CurrentDimension.Value = u5.getDimensionId(p11)
    u4.client_setLocalPlayerCoordinates(p11)
    u2.Client.States.GenerationHasPriority.Value = true
    local v12 = u5.regionNameFromCoordinates(p11)
    local v13 = u5.chunkNameFromCoordinates(p11)
    while not u9:FindFirstChild(v12) do
        u6.setLoadingInfos({
            ["message"] = "Awaiting region..",
            ["progress"] = 0.1
        })
        u9.ChildAdded:Wait()
    end
    local v14 = u9:FindFirstChild(v12)
    while v14:GetAttribute("DataLoaded") == false or v14:GetAttribute("MapLoaded") == false do
        local v15 = ""
        if not v14:GetAttribute("DataLoaded") then
            v15 = v15 .. "saved data"
        end
        if not v14:GetAttribute("MapLoaded") then
            if v15 ~= "" then
                v15 = v15 .. " and "
            end
            v15 = v15 .. "map data"
        end
        u6.setLoadingInfos({
            ["message"] = "Awaiting region " .. v15 .. "..",
            ["progress"] = 0.25
        })
        task.wait()
    end
    local v16 = u10:FindFirstChild(v12 .. "_" .. v13)
    while v16 == nil or v16:GetAttribute("Status") == u3.ChunkStatus.Loading do
        u6.setLoadingInfos({
            ["message"] = "Awaiting server chunk..",
            ["progress"] = 0.3
        })
        v16 = u10:FindFirstChild(v12 .. "_" .. v13)
        task.wait()
    end
    local v17 = u3.readChunkStatus(v12, v13, true)
    while v17 ~= u3.ChunkStatus.Rendered do
        u6.setLoadingInfos({
            ["message"] = "Waiting for chunk data.. (" .. tostring(v17 or "None") .. ")",
            ["progress"] = 0.4
        })
        task.wait()
        v17 = u3.readChunkStatus(v12, v13, true)
        if v17 == u3.ChunkStatus.Empty then
            u6.setLoadingInfos({
                ["message"] = "Chunk is empty?",
                ["progress"] = 0.35
            })
            task.wait(1)
        end
    end
    u6.setLoadingInfos({
        ["message"] = "Beginning rendering..",
        ["progress"] = 0.45
    })
    local v18 = u3.getChunksFolder():WaitForChild(v12 .. "_" .. v13)
    while not v18:GetAttribute("Rendered") do
        u6.setLoadingInfos({
            ["message"] = "Rendering chunk..",
            ["progress"] = 0.5
        })
        task.wait()
    end
    u6.setLoadingInfos({
        ["message"] = "Rendering nearby chunks..",
        ["progress"] = 0.6
    })
    local u19 = Instance.new("BindableEvent")
    task.spawn(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
        --]]
        u3.client_waitChunksLoadingStabilization()
        u19:Fire(false)
    end)
    task.delay(12, function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:Fire(true)
    end)
    local v20 = u19.Event:Wait()
    u19:Destroy()
    if v20 then
        u6.setLoadingInfos({
            ["message"] = "Rendering timed out..",
            ["progress"] = 0.7
        })
        task.wait(0.5)
    end
    u6.setLoadingInfos({
        ["message"] = "Finding spawning block..",
        ["progress"] = 0.95
    })
    local v21 = u7(p11)
    while not v18:GetAttribute("Rendered") do
        u6.setLoadingInfos({
            ["message"] = "Making sure the chunk is loaded..",
            ["progress"] = 0.99
        })
        task.wait()
    end
    task.spawn(function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
        --]]
        u6.setLoadingInfos({
            ["message"] = "Waiting for character..",
            ["progress"] = 1
        })
        while u8.Character == nil do
            task.wait()
        end
        u6.setLoadingInfos({
            ["message"] = "Done",
            ["progress"] = 1
        })
        task.wait(0.5)
        u6.setLoadingInfos(nil)
    end)
    u2.Client.States.GenerationHasPriority.Value = false
    return v21
end