-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ClearPredictions
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u2 = require(game.ReplicatedStorage.Libs.Coordinates)
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 6 ]]
        return true
    end,
    ["run"] = function(_, p3, _) --[[ Name: run, Line 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        for v4, _ in shared.PREDICTIONS do
            local v5 = string.split(v4, "_")
            local v6 = v5[2]
            local v7 = v5[4]
            local v8 = v5[6]
            local v9 = u2.coordinatesOffsetFromRegionName(v6) + u2.coordinatesOffsetFromChunkName(v7) + u2.coordinatesOffsetFromBlockName(v8)
            u1.client_setPredictionBlockState(v9, nil)
        end
        p3("Cleared predictions")
        local v10 = next(shared.PREDICTIONS) == nil
        assert(v10)
    end
}