-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Worlds.Maps.voxel_map_8
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
    if v4.voxels_v1 then
        regions = v4.voxels_v1.regions
    else
        warn("voxels_v1", "map unavailable")
    end
end
local v5 = {
    ["enabled"] = true,
    ["icon"] = nil,
    ["description"] = "Default map",
    ["spawns"] = {
        {
            ["x"] = 136,
            ["z"] = 386
        },
        {
            ["x"] = -1344,
            ["z"] = -2468
        },
        {
            ["x"] = -743,
            ["z"] = -2952
        },
        {
            ["x"] = -1984,
            ["z"] = 389
        },
        {
            ["x"] = 122,
            ["z"] = -2012
        },
        {
            ["x"] = 357,
            ["z"] = -1851
        },
        {
            ["x"] = -2047,
            ["z"] = 684
        },
        {
            ["x"] = -1915,
            ["z"] = -2200
        },
        {
            ["x"] = -2169,
            ["z"] = -1161
        },
        {
            ["x"] = 557,
            ["z"] = -308
        },
        {
            ["x"] = 702,
            ["z"] = -1034
        },
        {
            ["x"] = -1184,
            ["z"] = -237
        },
        {
            ["x"] = -1673,
            ["z"] = -103
        },
        {
            ["x"] = -1980,
            ["z"] = -29
        },
        {
            ["x"] = -3043,
            ["z"] = -1420
        },
        {
            ["x"] = 149,
            ["z"] = -1253
        },
        {
            ["x"] = 746,
            ["z"] = -979
        },
        {
            ["x"] = 732,
            ["z"] = -958
        },
        {
            ["x"] = 586,
            ["z"] = -2220
        },
        {
            ["x"] = -2710,
            ["z"] = -1549
        },
        {
            ["x"] = -2096,
            ["z"] = -941
        },
        {
            ["x"] = -2547,
            ["z"] = -825
        },
        {
            ["x"] = -2306,
            ["z"] = -718
        },
        {
            ["x"] = -1493,
            ["z"] = -928
        },
        {
            ["x"] = -1471,
            ["z"] = -738
        },
        {
            ["x"] = -1401,
            ["z"] = -549
        },
        {
            ["x"] = -1112,
            ["z"] = -538
        },
        {
            ["x"] = -282,
            ["z"] = -617
        },
        {
            ["x"] = 728,
            ["z"] = 9
        },
        {
            ["x"] = -2692,
            ["z"] = -2281
        },
        {
            ["x"] = 480,
            ["z"] = -2530
        },
        {
            ["x"] = 79,
            ["z"] = -2327
        },
        {
            ["x"] = -2545,
            ["z"] = 103
        },
        {
            ["x"] = -2386,
            ["z"] = 384
        },
        {
            ["x"] = 537,
            ["z"] = -2951
        },
        {
            ["x"] = -396,
            ["z"] = 721
        },
        {
            ["x"] = -2930,
            ["z"] = -322
        },
        {
            ["x"] = -2795,
            ["z"] = -39
        },
        {
            ["x"] = -920,
            ["z"] = -1442
        },
        {
            ["x"] = 360,
            ["z"] = 652
        },
        {
            ["x"] = -242,
            ["z"] = -306
        },
        {
            ["x"] = -1886,
            ["z"] = -1512
        },
        {
            ["x"] = -1835,
            ["z"] = -1213
        },
        {
            ["x"] = -1289,
            ["z"] = -1461
        },
        {
            ["x"] = -1379,
            ["z"] = -1272
        },
        {
            ["x"] = -1226,
            ["z"] = -1056
        },
        {
            ["x"] = -2276,
            ["z"] = -2003
        },
        {
            ["x"] = -2552,
            ["z"] = -1778
        },
        {
            ["x"] = -2723,
            ["z"] = -2877
        },
        {
            ["x"] = -2875,
            ["z"] = -994
        },
        {
            ["x"] = -2857,
            ["z"] = -846
        },
        {
            ["x"] = -946,
            ["z"] = -970
        },
        {
            ["x"] = -942,
            ["z"] = -684
        },
        {
            ["x"] = -645,
            ["z"] = -646
        },
        {
            ["x"] = 459,
            ["z"] = -1020
        },
        {
            ["x"] = 27,
            ["z"] = -785
        },
        {
            ["x"] = -2944,
            ["z"] = 253
        },
        {
            ["x"] = -1927,
            ["z"] = -729
        }
    },
    ["regions"] = regions,
    ["mapName"] = "voxel_map_8",
    ["server_uniqueMapKey"] = "voxels_v1",
    ["displayName"] = "Default map"
}
return v5