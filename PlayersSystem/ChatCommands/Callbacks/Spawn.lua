-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Spawn
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
local u4 = require(game.ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates.HighestAltitude)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 9 ]]
        return true
    end,
    ["run"] = function(p5, _, p6) --[[ Name: run, Line 13 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
            [3] = u2
            [4] = u4
        --]]
        local v7 = string.split(p6, " ")
        local v8 = v7[2]
        local v9 = v7[3]
        local v10 = tonumber(v9) or 1
        if u1.Assets.Entities:FindFirstChild(v8) == nil then
            error("Missing entity")
        else
            for _ = 1, v10 do
                local v11 = p5.Character.PrimaryPart.CFrame
                local v12 = u3.coordinatesFromWorkspaceVector3(v11.Position + v11.LookVector * Vector3.new(1, 0, 1) * 4)
                local v13 = u2.server_spawn
                local v14 = v12.X
                local v15 = u4.TOKEN
                local v16 = v12.Z
                v13(v8, (Vector3.new(v14, v15, v16)))
            end
        end
    end
}