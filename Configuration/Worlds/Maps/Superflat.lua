-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Worlds.Maps.Superflat
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

game:GetService("HttpService")
local v1 = nil
if game:GetService("RunService"):IsServer() then
    local v2 = require(game.ServerScriptService.Secret.GetKeys)
    if v2["Superflat World"] then
        regions = v2["Superflat World"].regions
        v1 = {
            ["folderName"] = "Superflat World",
            ["uuid"] = regions["r.0.0"].uuid
        }
    else
        warn("Superflat World", "map unavailable")
    end
end
local v3 = {
    ["enabled"] = true,
    ["icon"] = "rbxassetid://16199028251",
    ["description"] = "Superflat",
    ["spawns"] = {
        {
            ["x"] = 48,
            ["z"] = 48
        }
    },
    ["repeatingRegion"] = v1
}
return v3