-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.States.GameState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local u2 = game:GetService("ReplicatedStorage")
local u3 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities)
local u4 = v1.LocalPlayer
local v5 = {
    ["stateChanged"] = script.StateChanged.Event
}
local function v6() --[[ Line: 13 ]]
    script.StateChanged:Fire()
end
local u7 = "Worlds"
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = false
local u13 = false
local u14 = false
local u15 = false
function v5.setLoadingInfos(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8 = p16
    script.StateChanged:Fire()
end
function v5.setWorldCreationInfos(p17) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9 = p17
    script.StateChanged:Fire()
end
function v5.setWorldEditionInfos(p18) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10 = p18
    script.StateChanged:Fire()
end
function v5.setTitleScreenWindow(p19) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7 ~= p19 then
        u7 = p19
        script.StateChanged:Fire()
    end
end
function v5.setFullScreenMessage(p20, p21) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    u11 = p20
    u12 = p21
    script.StateChanged:Fire()
end
function v5.setGameshopOpened(p22) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u15
        [4] = u2
    --]]
    if p22 ~= u13 then
        u13 = p22
        if p22 then
            u14 = false
            u15 = false
            u2.Client.States.SettingsOpened.Value = false
        end
        script.StateChanged:Fire()
    end
end
function v5.setPetMenuOpened(p23) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u14
        [4] = u2
    --]]
    if p23 ~= u15 then
        u15 = p23
        if p23 then
            u13 = false
            u14 = false
            u2.Client.States.SettingsOpened.Value = false
        end
        script.StateChanged:Fire()
    end
end
function v5.setGuideOpened(p24) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u15
        [4] = u2
    --]]
    if p24 ~= u14 then
        u14 = p24
        if p24 == true then
            u13 = false
            u15 = false
            u2.Client.States.SettingsOpened.Value = false
        end
        script.StateChanged:Fire()
    end
end
function v5.getWorldCreationInfos() --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9
end
function v5.getWorldEditionInfos() --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10
end
function v5.getLoadingInfos(_) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8
end
function v5.getFullScreenMessage() --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11
end
function v5.isFullScreenMessageCloseButtonDisabled() --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return u12
end
function v5.isDeathScreen() --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if u4.Character then
        local v25 = u4.Character:FindFirstChildOfClass("Humanoid")
        if v25 and v25:GetState() == Enum.HumanoidStateType.Dead then
            return true
        end
    end
    return u4.Character == nil
end
function v5.isTitleScreenOpened() --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7 ~= nil
end
function v5.getTitleScreenWindow() --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7
end
function v5.isGameshopOpened() --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return u13
end
function v5.isPetMenuOpened() --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return u15
end
function v5.isGuideOpened() --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return u14
end
function v5.onHumanoidDeath() --[[ Line: 148 ]]
    script.StateChanged:Fire()
end
if u4 ~= nil then
    u4:GetPropertyChangedSignal("Character"):Connect(v6)
    u2.Systems.PlayersSystem.Network.Command_TitleScreen.OnClientEvent:Connect(function() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
        --]]
        u7 = "Worlds"
        u3.client_setLocalPlayerCoordinates(nil)
        script.StateChanged:Fire()
    end)
end
return v5