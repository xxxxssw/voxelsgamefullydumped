-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.LocalSounds.AmbientSounds.AmbientConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("ReplicatedStorage").Client.LocalSounds.Environment.Ambient
local v2 = {
    ["Underground"] = {
        ["AtmosphereNight"] = v1.Atmosphere.underground,
        ["AtmosphereDay"] = v1.Atmosphere.underground
    },
    ["Swamp"] = {
        ["AtmosphereNight"] = v1.Atmosphere.swamp,
        ["RandomSounds"] = {}
    },
    ["RichForest"] = {
        ["AtmosphereNight"] = v1.Atmosphere.night,
        ["AtmosphereDay"] = v1.Atmosphere.richforest
    },
    ["Forest"] = {
        ["AtmosphereNight"] = v1.Atmosphere.night,
        ["AtmosphereDay"] = v1.Atmosphere.day
    },
    ["Underworld"] = {
        ["AtmosphereNight"] = v1.Atmosphere.wastelands,
        ["AtmosphereDay"] = v1.Atmosphere.wastelands,
        ["RandomSounds"] = {
            v1.RandomNoises.scary1,
            v1.RandomNoises.scary2,
            v1.RandomNoises.creepy1,
            v1.RandomNoises.creepy2,
            v1.RandomNoises.creepy3
        }
    }
}
return {
    ["deep_ocean"] = v2.Swamp,
    ["ocean"] = v2.Swamp,
    ["beach"] = v2.Swamp,
    ["forest"] = v2.RichForest,
    ["wooded_hills"] = v2.RichForest,
    ["plains"] = v2.Forest,
    ["sunflower_plains"] = v2.Forest,
    ["taiga_hills"] = v2.Forest,
    ["wooded_mountains"] = v2.Forest,
    ["taiga_mountains"] = v2.Forest,
    ["taiga"] = v2.Forest,
    ["nether_wastes"] = v2.Underworld
}