-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.RbxGroup
-- Source: decompile
-- Dumped: 2026-04-23 03:45:35

local v1 = {}
local u2 = require(game.ReplicatedStorage.Configuration.MainConfiguration).GAME_GROUP_ID
local u3 = {}
function v1.isInGameGroup(u4) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    if not u4 or u4.UserId <= 0 then
        return false
    end
    if u3[u4.UserId] == nil then
        local u5 = false
        pcall(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u2
            --]]
            u5 = u4:IsInGroup(u2)
        end)
        u3[u4.UserId] = u5
    end
    return u3[u4.UserId]
end
return v1