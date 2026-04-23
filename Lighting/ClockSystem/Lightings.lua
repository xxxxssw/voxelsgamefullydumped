-- Roblox script dump
-- ClassName: ModuleScript
-- Path: Lighting.ClockSystem.Lightings
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = game:GetService("Lighting")
local v2 = {
    ["Density"] = v1.Atmosphere.Density,
    ["Offset"] = v1.Atmosphere.Offset,
    ["Color"] = v1.Atmosphere.Color,
    ["Decay"] = v1.Atmosphere.Decay,
    ["Glare"] = v1.Atmosphere.Glare,
    ["Haze"] = v1.Atmosphere.Haze
}
local v3 = {}
local v4 = {
    [v1] = {
        ["Brightness"] = 2.4,
        ["OutdoorAmbient"] = Color3.fromRGB(166, 166, 166),
        ["Ambient"] = Color3.fromRGB(166, 166, 166),
        ["FogColor"] = Color3.fromRGB(180, 209, 218)
    },
    [v1.Atmosphere] = v2
}
v3.DAY = v4
local v5 = {
    [v1] = {
        ["Brightness"] = 2.4,
        ["OutdoorAmbient"] = Color3.fromRGB(166, 166, 166),
        ["Ambient"] = Color3.fromRGB(79, 101, 130),
        ["FogColor"] = Color3.fromRGB(180, 209, 218)
    },
    [v1.Atmosphere] = v2
}
v3.DAWN = v5
local v6 = {
    [v1] = {
        ["Brightness"] = 2.4,
        ["OutdoorAmbient"] = Color3.fromRGB(166, 166, 166),
        ["Ambient"] = Color3.fromRGB(79, 101, 130),
        ["FogColor"] = Color3.fromRGB(180, 209, 218)
    },
    [v1.Atmosphere] = v2
}
v3.DUSK = v6
local v7 = {
    [v1] = {
        ["Brightness"] = 2.4,
        ["OutdoorAmbient"] = Color3.fromRGB(57, 93, 195),
        ["Ambient"] = Color3.fromRGB(68, 87, 207),
        ["FogColor"] = Color3.fromRGB(0, 11, 62)
    },
    [v1.Atmosphere] = v2
}
v3.NIGHT = v7
local v8 = {
    [v1] = {
        ["Brightness"] = 3.4,
        ["OutdoorAmbient"] = Color3.fromRGB(255, 111, 111),
        ["Ambient"] = Color3.fromRGB(157, 49, 49),
        ["FogColor"] = Color3.fromRGB(0, 0, 0)
    },
    [v1.Atmosphere] = {
        ["Density"] = 0.358,
        ["Offset"] = 1,
        ["Color"] = Color3.fromRGB(153, 87, 65),
        ["Decay"] = Color3.fromRGB(36, 0, 0),
        ["Glare"] = 0.75,
        ["Haze"] = 1.7
    }
}
v3.Hell = v8
return v3