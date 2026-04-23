-- Roblox script dump
-- ClassName: Script
-- Path: WaterScript
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

if not script:IsDescendantOf(game.ReplicatedStorage) then
    local _ = script.Parent
    local _ = game.ReplicatedStorage.Configuration.WATER_ANIMATION
    tick()
    local u1 = {
        ["still_water_0"] = 18394295192,
        ["still_water_1"] = 18394295052,
        ["still_water_10"] = 18394293201,
        ["still_water_11"] = 18394293025,
        ["still_water_12"] = 18394292841,
        ["still_water_13"] = 18394292611,
        ["still_water_14"] = 18394292389,
        ["still_water_15"] = 18394292186,
        ["still_water_16"] = 18394299455,
        ["still_water_17"] = 18394291579,
        ["still_water_18"] = 18394291440,
        ["still_water_19"] = 18394291141,
        ["still_water_2"] = 18394294855,
        ["still_water_20"] = 18394290969,
        ["still_water_21"] = 18394290515,
        ["still_water_22"] = 18394290291,
        ["still_water_23"] = 18394290006,
        ["still_water_24"] = 18394289729,
        ["still_water_25"] = 18394289438,
        ["still_water_26"] = 18394289067,
        ["still_water_27"] = 18394288694,
        ["still_water_28"] = 18394288457,
        ["still_water_29"] = 18394288214,
        ["still_water_3"] = 18394294661,
        ["still_water_30"] = 18394287903,
        ["still_water_31"] = 18394287612,
        ["still_water_4"] = 18394294385,
        ["still_water_5"] = 18394294175,
        ["still_water_6"] = 18394293976,
        ["still_water_7"] = 18394293784,
        ["still_water_8"] = 18394293599,
        ["still_water_9"] = 18394293425
    }
    game:GetService("RunService").RenderStepped:Connect(function(_) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v2 = tick() / 0.1 % 32
        local v3 = math.floor(v2)
        script.Parent.Texture = string.format("rbxassetid://%s", u1[string.format("still_water_%s", v3)])
    end)
end