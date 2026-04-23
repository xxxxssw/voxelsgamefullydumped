-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.ControlsEnabled
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("StarterGui")
local u3 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u4 = require(game.ReplicatedStorage.Client.States.GameState)
local u5 = u1.Client.States.SettingsOpened
return function() --[[ Name: ControlsEnabled, Line 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u1
        [4] = u3
        [5] = u2
    --]]
    if u5.Value or (u4.isGameshopOpened() or (u4.isGuideOpened() or u4.isPetMenuOpened())) then
        return false
    end
    if u4.isDeathScreen() then
        return false
    end
    if u1.Client.States.WritingSign.Value then
        return false
    end
    if u3.getState().windowName ~= "" then
        return false
    end
    local u6 = nil
    local v7, _ = pcall(function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
        --]]
        u6 = u2:GetCore("ChatBarDisabled")
    end)
    return (not v7 or u6 ~= true) and true or false
end