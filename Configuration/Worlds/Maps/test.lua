-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Worlds.Maps.test
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("HttpService")
local v2 = game:GetService("RunService")
local v3 = script:FindFirstChild("EncodedRegions")
regions = nil
if v3 then
    regions = v1:JSONDecode(require(v3))
elseif v2:IsServer() then
    local v4 = require(game.ServerScriptService.Secret.GetKeys)
    if v4.test then
        regions = v4.test.regions
    else
        warn("test", "map unavailable")
    end
end
local v5 = {
    ["enabled"] = true,
    ["icon"] = nil,
    ["description"] = "Default map",
    ["spawns"] = {
        {
            ["x"] = -800,
            ["z"] = -800
        }
    },
    ["regions"] = regions,
    ["mapName"] = "test",
    ["server_uniqueMapKey"] = "test",
    ["displayName"] = "test"
}
return v5