-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("RunService")
local u2 = require(game.ReplicatedStorage.Configuration.MainConfiguration)
local v3 = {}
local v4 = {
    ["DEV"] = {
        ["text"] = "DEV",
        ["color"] = Color3.fromRGB(241, 185, 41),
        ["users_id"] = {}
    },
    ["VIP"] = {
        ["text"] = "VIP",
        ["color"] = Color3.fromRGB(217, 200, 11),
        ["users_id"] = {}
    }
}
v3.Roles = v4
function v3.hasCreativeInventoryAccess(p5) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1:IsStudio() and true or u2.ADMINS[p5.UserId] ~= nil
end
function v3.hasDebugTools(p6) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1:IsStudio() and true or u2.ADMINS[p6.UserId] ~= nil
end
function v3.hasAnyCommand(p7) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1:IsStudio() and true or u2.ADMINS[p7.UserId] ~= nil
end
function v3.hasFreecam(p8) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1:IsStudio() and true or u2.ADMINS[p8.UserId] ~= nil
end
function v3.canUseSkinDownloader(p9) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1:IsStudio() and true or u2.ADMINS[p9.UserId] ~= nil
end
return v3