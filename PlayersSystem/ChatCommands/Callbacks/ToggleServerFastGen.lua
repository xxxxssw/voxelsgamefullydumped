-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.ToggleServerFastGen
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = {}
local u2 = game:GetService("ReplicatedStorage").Systems.ChunksSystem.ServerFastTerrainGen
function v1.allowed(_, _) --[[ Line: 7 ]]
    return true
end
function v1.run(_, p3, _) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.Value = not u2.Value
    local v4 = u2.Value
    p3("Server fast terrain generation set to:" .. tostring(v4))
end
return v1