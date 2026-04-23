-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Worlds.GameModes
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = {}
local v2 = {
    ["order"] = 1,
    ["displayName"] = "CLASSIC",
    ["description"] = "Recommanded, normal difficulty, nights are bright to enjoy the game.",
    ["icon"] = "rbxassetid://15890962673",
    ["naturalRegen"] = {
        ["maxHealth"] = 8,
        ["regenCooldown"] = 10,
        ["regenDelay"] = 4
    }
}
v1.classic = v2
local v3 = {
    ["order"] = 2,
    ["displayNameColor"] = Color3.fromRGB(255, 0, 0),
    ["displayName"] = "HARD",
    ["description"] = "Nights are completely dark, enemies will spawn stronger and more frequently.",
    ["icon"] = "rbxassetid://15890961623",
    ["naturalRegen"] = {
        ["maxHealth"] = 5,
        ["regenCooldown"] = 30,
        ["regenDelay"] = 10
    }
}
v1.hard = v3
return v1