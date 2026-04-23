-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.MutationsSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

game:GetService("SharedTableRegistry")
local v1 = game:GetService("RunService")
local u2 = v1:IsServer()
local u3 = v1:IsClient()
return {
    ["server_writeRegionMutations"] = function(p4, p5) --[[ Name: server_writeRegionMutations, Line 24 ]]
        shared.MUTATIONS[p4] = p5
    end,
    ["server_readRegionMutations"] = function(p6) --[[ Name: server_readRegionMutations, Line 29 ]]
        return shared.MUTATIONS[p6]
    end,
    ["readChunkMutations"] = function(p7, p8) --[[ Name: readChunkMutations, Line 35 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if u2 then
            return (shared.MUTATIONS[p7] or {})[p8] or {}
        end
        local v9 = string.format("region_%s_chunk_%s", p7, p8)
        return shared.MUTATIONS[v9] or {}
    end,
    ["writeChunkMutations"] = function(p10, p11, p12) --[[ Name: writeChunkMutations, Line 46 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        if u3 then
            local v13 = string.format("region_%s_chunk_%s", p10, p11)
            shared.MUTATIONS[v13] = p12
        end
    end,
    ["addMutation"] = function(p14, p15, p16, p17) --[[ Name: addMutation, Line 57 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v18 = shared.MUTATIONS
        if u2 then
            if not v18[p14][p15] then
                v18[p14][p15] = {}
            end
            v18[p14][p15][tostring(p16)] = p17
        else
            local v19 = v18[string.format("region_%s_chunk_%s", p14, p15)]
            if v19 then
                v19[tostring(p16)] = p17
            end
        end
    end,
    ["client_readPrediction"] = function(p20, p21, p22) --[[ Name: client_readPrediction, Line 78 ]]
        local v23 = shared.PREDICTIONS
        local v24 = string.format("region_%s_chunk_%s_block_%s", p20, p21, p22)
        if v23 then
            v23 = v23[v24]
        end
        return v23
    end,
    ["client_writePrediction"] = function(p25, p26, p27, p28) --[[ Name: client_writePrediction, Line 84 ]]
        shared.PREDICTIONS[string.format("region_%s_chunk_%s_block_%s", p25, p26, p27)] = p28
    end,
    ["init"] = function() --[[ Name: init, Line 90 ]]
        debug.setmemorycategory("s_mutations")
        shared.MUTATIONS = {}
        debug.resetmemorycategory()
        debug.setmemorycategory("s_predictions")
        shared.PREDICTIONS = {}
        debug.resetmemorycategory()
    end
}