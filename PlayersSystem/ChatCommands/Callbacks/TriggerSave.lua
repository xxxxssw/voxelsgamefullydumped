-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.TriggerSave
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = game:GetService("ReplicatedStorage")
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 5 ]]
        return true
    end,
    ["run"] = function(_, _, _) --[[ Name: run, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        for _, v2 in ipairs(u1.Systems.RegionsSystem.ServerPool:GetChildren()) do
            v2:SendMessage("TestSave")
        end
    end
}