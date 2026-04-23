-- Roblox script dump
-- ClassName: ModuleScript
-- Path: Lighting.ClockSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
game:GetService("RunService")
local u2 = game:GetService("Lighting")
local u3 = game:GetService("TweenService")
local u4 = require(script.TimeConfiguration)
local u5 = require(script.Lightings)
local u6 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
local u7 = u4.HOUR_LENGTH * 24
local u8 = nil
local u9 = Instance.new("BindableEvent")
local u10 = {
    ["sectionChanged"] = u9.Event
}
local function u24() --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
        [3] = u2
        [4] = u7
        [5] = u4
        [6] = u10
        [7] = u8
        [8] = u9
        [9] = u5
        [10] = u3
    --]]
    local v11 = u6[u1.Client.States.CurrentDimension.Value].lightingMode
    if v11 == "DefaultCycle" then
        local v12 = u2
        local v13 = u1.Systems.WorldSystem.CurrentTick.Value
        local v14 = v13 / u7
        v12.ClockTime = (v13 - math.floor(v14) * u7) / u4.HOUR_LENGTH
        local v15 = u10.getDaySection()
        if v15 ~= u8 then
            u9:Fire()
            u8 = v15
            for v16, v17 in pairs(u5[u8]) do
                for v18, v19 in pairs(v17) do
                    u3:Create(v16, TweenInfo.new(3), {
                        [v18] = v19
                    }):Play()
                end
            end
            return
        end
    else
        u2.ClockTime = 12
        for v20, v21 in pairs(u5[v11]) do
            for v22, v23 in pairs(v21) do
                v20[v22] = v23
            end
        end
        u8 = "Hell"
    end
end
function u10.getDaySection() --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u7
        [3] = u4
    --]]
    local v25 = u1.Systems.WorldSystem.CurrentTick.Value
    local v26 = v25 / u7
    local v27 = (v25 - math.floor(v26) * u7) / u4.HOUR_LENGTH
    if u4.DAY_SECTIONS.NIGHT.Max < v27 then
        return "NIGHT"
    end
    if v27 < u4.DAY_SECTIONS.NIGHT.Min then
        return "NIGHT"
    end
    for v28, v29 in pairs(u4.DAY_SECTIONS) do
        if v28 ~= "NIGHT" and (v29.Min <= v27 and v27 <= v29.Max) then
            return v28
        end
    end
    return "NIGHT"
end
function u10.client_init() --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    task.spawn(function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        while task.wait() do
            u24()
        end
    end)
end
return u10