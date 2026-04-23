-- Roblox script dump
-- ClassName: ModuleScript
-- Path: Lighting.ClockSystem.TimeConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = {
    ["HOUR_LENGTH"] = 60,
    ["SERVER_INITIAL_HOUR"] = 7,
    ["DAY_SECTIONS"] = {
        ["NIGHT"] = NumberRange.new(4, 19),
        ["DAWN"] = NumberRange.new(4, 6),
        ["DAY"] = NumberRange.new(6, 18),
        ["DUSK"] = NumberRange.new(18, 19)
    }
}
return v1