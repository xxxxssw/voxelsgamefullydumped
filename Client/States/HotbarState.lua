-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.States.HotbarState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u2 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u3 = 1
return {
    ["stateChanged"] = script.StateChanged.Event,
    ["getCurrentlyHeldItemId"] = function() --[[ Name: getCurrentlyHeldItemId, Line 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u1
        --]]
        local v4 = u3
        local v5 = u2.getState().predictedInventories.Player[tostring(v4)]
        if v5 == u1.NoItemSymbol then
            return nil
        else
            return v5.id, v5.qty, v5
        end
    end,
    ["setCurrentHotbarSlot"] = function(p6) --[[ Name: setCurrentHotbarSlot, Line 23 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        if p6 ~= u3 then
            u3 = p6
            script.StateChanged:Fire()
        end
    end,
    ["getCurrentHotbarSlot"] = function() --[[ Name: getCurrentHotbarSlot, Line 30 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3
    end
}