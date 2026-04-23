-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.DatastoreTokens
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("RunService")
local u2 = game:GetService("ReplicatedStorage")
local u3 = require(game.ReplicatedStorage.Libs.Utils)
local u4 = v1:IsStudio() and 3 or 20
local u5 = Instance.new("BindableEvent")
local v6 = {
    ["shuttingDown"] = u5.Event
}
local u7 = false
function v6.new(p8) --[[ Line: 21 ]]
    local v9 = Instance.new("StringValue")
    v9.Name = p8
    v9.Parent = script
    return v9
end
function v6.isShuttingDown() --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7
end
local function u14() --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u5
        [4] = u4
        [5] = u3
    --]]
    u7 = true
    u2.Systems.WorldSystem.ShuttingDown.Value = true
    u5:Fire()
    local u10 = Instance.new("BoolValue")
    task.delay(u4, function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10.Value = true
    end)
    local v11 = #script:GetChildren()
    while v11 > 0 and u10.Value == false do
        u3.waitForFirst(script.ChildRemoved, u10.Changed)
        v11 = #script:GetChildren()
    end
    task.wait(1)
    if u10.Value then
        local v12 = ""
        for _, v13 in ipairs(script:GetChildren()) do
            v12 = v12 .. v13.Name .. " "
        end
        warn("Possible data loss on " .. v12)
    end
end
function v6.init() --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    game:BindToClose(u14)
end
return v6