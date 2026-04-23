-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.CharactersDrawDistance
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(game.ReplicatedStorage.Client.Settings).Settings.RenderDistanceSetting
return {
    ["changed"] = u1.valueChanged,
    ["getDistance"] = function() --[[ Name: getDistance, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return (u1.getSettingValue() + 1.5) * 16 * 4
    end
}