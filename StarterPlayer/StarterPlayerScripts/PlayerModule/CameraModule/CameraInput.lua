-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = game:GetService("ContextActionService")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("Players")
local v4 = game:GetService("RunService")
local u5 = UserSettings():GetService("UserGameSettings")
local u6 = game:GetService("VRService")
game:GetService("StarterGui")
local u7 = v3.LocalPlayer
local u8 = Enum.ContextActionPriority.Medium.Value
local u9 = Vector2.new(1, 0.77) * 0.008726646259971648
local u10 = Vector2.new(1, 0.77) * 0.12217304763960307
local u11 = Vector2.new(1, 0.66) * 0.017453292519943295
local u12 = Vector2.new(1, 0.77) * 0.06981317007977318
local u13 = require(game.ReplicatedStorage.Client.ControlsEnabled)
local v14, v15 = pcall(function() --[[ Line: 31 ]]
    return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local u16 = v14 and v15
local u17 = Instance.new("BindableEvent")
local u18 = Instance.new("BindableEvent")
local u19 = u17.Event
local u20 = u18.Event
u2.InputBegan:Connect(function(p21, p22) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p22 and p21.UserInputType == Enum.UserInputType.MouseButton2 then
        u17:Fire()
    end
end)
u2.InputEnded:Connect(function(p23, _) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p23.UserInputType == Enum.UserInputType.MouseButton2 then
        u18:Fire()
    end
end)
local function u27(p24) --[[ Line: 62 ]]
    local v25 = (math.abs(p24) - 0.1) / 0.9 * 2
    local v26 = (math.exp(v25) - 1) / 6.38905609893065
    return math.sign(p24) * math.clamp(v26, 0, 1)
end
local function u32(p28) --[[ Line: 76 ]]
    local v29 = _G.internalCamera
    if not v29 then
        return p28
    end
    local v30 = v29.CFrame:ToEulerAnglesYXZ()
    if p28.Y * v30 >= 0 then
        return p28
    end
    local v31 = (1 - (math.abs(v30) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25
    return Vector2.new(1, v31) * p28
end
local function u39(p33) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v34 = u7:FindFirstChildOfClass("PlayerGui")
    if v34 then
        v34 = v34:FindFirstChild("TouchGui")
    end
    local v35
    if v34 then
        v35 = v34:FindFirstChild("TouchControlFrame")
    else
        v35 = v34
    end
    if v35 then
        v35 = v35:FindFirstChild("DynamicThumbstickFrame")
    end
    if not v35 then
        return false
    end
    if not v34.Enabled then
        return false
    end
    local v36 = v35.AbsolutePosition
    local v37 = v36 + v35.AbsoluteSize
    local v38
    if p33.X >= v36.X and (p33.Y >= v36.Y and p33.X <= v37.X) then
        v38 = p33.Y <= v37.Y
    else
        v38 = false
    end
    return v38
end
local u40 = 0.016666666666666666
v4.Stepped:Connect(function(_, p41) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    u40 = p41
end)
local v42 = {}
local u43 = {}
local u44 = 0
local u45 = {
    ["Thumbstick2"] = Vector2.new()
}
local u46 = {
    ["Left"] = 0,
    ["Right"] = 0,
    ["I"] = 0,
    ["O"] = 0
}
local u47 = {
    ["Movement"] = Vector2.new(),
    ["Wheel"] = 0,
    ["Pan"] = Vector2.new(),
    ["Pinch"] = 0
}
local u48 = {
    ["Move"] = Vector2.new(),
    ["Pinch"] = 0
}
local u49 = Instance.new("BindableEvent")
v42.gamepadZoomPress = u49.Event
local u50 = u6.VREnabled and Instance.new("BindableEvent") or nil
if u6.VREnabled then
    v42.gamepadReset = u50.Event
end
function v42.getRotationActivated() --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u45
    --]]
    return u44 > 0 and true or u45.Thumbstick2.Magnitude > 0
end
function v42.getRotation(p51) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u46
        [3] = u40
        [4] = u45
        [5] = u47
        [6] = u32
        [7] = u48
        [8] = u12
        [9] = u9
        [10] = u10
        [11] = u11
    --]]
    local v52 = Vector2.new(1, u5:GetCameraYInvertValue())
    local v53 = Vector2.new(u46.Right - u46.Left, 0) * u40
    local v54 = u45.Thumbstick2
    local v55 = u47.Movement
    local v56 = u47.Pan
    local v57 = u32(u48.Move)
    if p51 then
        v53 = Vector2.new()
    end
    return (v53 * 2.0943951023931953 + v54 * u12 + v55 * u9 + v56 * u10 + v57 * u11) * v52
end
function v42.getZoomDelta() --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u47
        [3] = u48
    --]]
    local v58 = u46.O - u46.I
    local v59 = -u47.Wheel + u47.Pinch
    local v60 = -u48.Pinch
    return v58 * 0.1 + v59 * 1 + v60 * 0.04
end
local function u63(_, _, p61) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u27
    --]]
    local v62 = p61.Position
    u45[p61.KeyCode.Name] = Vector2.new(u27(v62.X), -u27(v62.Y))
    return Enum.ContextActionResult.Pass
end
local function u66(_, p64, p65) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    u46[p65.KeyCode.Name] = p64 == Enum.UserInputState.Begin and 1 or 0
end
local function u68(_, p67, _) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u49
    --]]
    if p67 == Enum.UserInputState.Begin then
        u49:Fire()
    end
end
local function u70(_, p69, _) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u50
    --]]
    if p69 == Enum.UserInputState.Begin then
        u50:Fire()
    end
end
local function u75() --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u46
        [3] = u47
        [4] = u48
    --]]
    local v71 = {
        u45,
        u46,
        u47,
        u48
    }
    for _, v72 in pairs(v71) do
        for v73, v74 in pairs(v72) do
            if type(v74) == "boolean" then
                v72[v73] = false
            else
                v72[v73] = v72[v73] * 0
            end
        end
    end
end
local u76 = {}
local u77 = nil
local u78 = nil
local function u84(p79, p80) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u77
        [2] = u39
        [3] = u44
        [4] = u76
    --]]
    local v81 = p79.UserInputType == Enum.UserInputType.Touch
    assert(v81)
    local v82 = p79.UserInputState == Enum.UserInputState.Begin
    assert(v82)
    if u77 == nil and (u39(p79.Position) and not p80) then
        u77 = p79
    else
        if not p80 then
            local v83 = u44 + 1
            u44 = math.max(0, v83)
        end
        u76[p79] = p80
    end
end
local function u89(p85, _) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u77
        [2] = u76
        [3] = u78
        [4] = u44
    --]]
    local v86 = p85.UserInputType == Enum.UserInputType.Touch
    assert(v86)
    local v87 = p85.UserInputState == Enum.UserInputState.End
    assert(v87)
    if p85 == u77 then
        u77 = nil
    end
    if u76[p85] == false then
        u78 = nil
        local v88 = u44 - 1
        u44 = math.max(0, v88)
    end
    u76[p85] = nil
end
local function u101(p90, p91) --[[ Line: 310 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u77
        [3] = u76
        [4] = u48
        [5] = u78
    --]]
    if u13() then
        local v92 = p90.UserInputType == Enum.UserInputType.Touch
        assert(v92)
        local v93 = p90.UserInputState == Enum.UserInputState.Change
        assert(v93)
        if p90 == u77 then
            return
        else
            if u76[p90] == nil then
                u76[p90] = p91
            end
            local v94 = {}
            for v95, v96 in pairs(u76) do
                if not v96 then
                    table.insert(v94, v95)
                end
            end
            if #v94 == 1 and u76[p90] == false then
                local v97 = p90.Delta
                local v98 = u48
                v98.Move = v98.Move + Vector2.new(v97.X, v97.Y)
            end
            if #v94 == 2 then
                local v99 = (v94[1].Position - v94[2].Position).Magnitude
                if u78 then
                    local v100 = u48
                    v100.Pinch = v100.Pinch + (v99 - u78)
                end
                u78 = v99
            else
                u78 = nil
            end
        end
    else
        return
    end
end
local function u102() --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u77
        [3] = u78
        [4] = u16
        [5] = u44
    --]]
    u76 = {}
    u77 = nil
    u78 = nil
    if u16 then
        u44 = 0
    end
end
local function u107(p103, p104, p105, p106) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u47
    --]]
    if not p106 then
        u47.Wheel = p103
        u47.Pan = p104
        u47.Pinch = -p105
    end
end
local function u111(p108, p109) --[[ Line: 378 ]]
    --[[
    Upvalues:
        [1] = u84
        [2] = u44
    --]]
    if p108.UserInputType == Enum.UserInputType.Touch then
        u84(p108, p109)
    elseif p108.UserInputType == Enum.UserInputType.MouseButton2 and not p109 then
        local v110 = u44 + 1
        u44 = math.max(0, v110)
    end
end
local function u115(p112, p113) --[[ Line: 387 ]]
    --[[
    Upvalues:
        [1] = u101
        [2] = u47
    --]]
    if p112.UserInputType == Enum.UserInputType.Touch then
        u101(p112, p113)
    elseif p112.UserInputType == Enum.UserInputType.MouseMovement then
        local v114 = p112.Delta
        u47.Movement = Vector2.new(v114.X, v114.Y)
    end
end
local function u119(p116, p117) --[[ Line: 396 ]]
    --[[
    Upvalues:
        [1] = u89
        [2] = u44
    --]]
    if p116.UserInputType == Enum.UserInputType.Touch then
        u89(p116, p117)
    elseif p116.UserInputType == Enum.UserInputType.MouseButton2 then
        local v118 = u44 - 1
        u44 = math.max(0, v118)
    end
end
local u120 = false
function v42.setInputEnabled(p121) --[[ Line: 407 ]]
    --[[
    Upvalues:
        [1] = u120
        [2] = u75
        [3] = u102
        [4] = u1
        [5] = u63
        [6] = u8
        [7] = u66
        [8] = u6
        [9] = u70
        [10] = u68
        [11] = u43
        [12] = u2
        [13] = u111
        [14] = u115
        [15] = u119
        [16] = u107
        [17] = u16
    --]]
    if u120 ~= p121 then
        u120 = p121
        u75()
        u102()
        if u120 then
            u1:BindActionAtPriority("RbxCameraThumbstick", u63, false, u8, Enum.KeyCode.Thumbstick2)
            u1:BindActionAtPriority("RbxCameraKeypress", u66, false, u8, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
            if u6.VREnabled then
                u1:BindAction("RbxCameraGamepadReset", u70, false, Enum.KeyCode.ButtonL3)
            end
            u1:BindAction("RbxCameraGamepadZoom", u68, false, Enum.KeyCode.ButtonR3)
            local v122 = u43
            local v123 = u2.InputBegan
            local v124 = u111
            table.insert(v122, v123:Connect(v124))
            local v125 = u43
            local v126 = u2.InputChanged
            local v127 = u115
            table.insert(v125, v126:Connect(v127))
            local v128 = u43
            local v129 = u2.InputEnded
            local v130 = u119
            table.insert(v128, v129:Connect(v130))
            local v131 = u43
            local v132 = u2.PointerAction
            local v133 = u107
            table.insert(v131, v132:Connect(v133))
            if u16 then
                local v134 = u43
                local v135 = game:GetService("GuiService").MenuOpened
                local v136 = u102
                table.insert(v134, v135:connect(v136))
                return
            end
        else
            u1:UnbindAction("RbxCameraThumbstick")
            u1:UnbindAction("RbxCameraMouseMove")
            u1:UnbindAction("RbxCameraMouseWheel")
            u1:UnbindAction("RbxCameraKeypress")
            u1:UnbindAction("RbxCameraGamepadZoom")
            if u6.VREnabled then
                u1:UnbindAction("RbxCameraGamepadReset")
            end
            for _, v137 in pairs(u43) do
                v137:Disconnect()
            end
            u43 = {}
        end
    end
end
function v42.getInputEnabled() --[[ Line: 479 ]]
    --[[
    Upvalues:
        [1] = u120
    --]]
    return u120
end
function v42.resetInputForFrameEnd() --[[ Line: 483 ]]
    --[[
    Upvalues:
        [1] = u47
        [2] = u48
    --]]
    u47.Movement = Vector2.new()
    u48.Move = Vector2.new()
    u48.Pinch = 0
    u47.Wheel = 0
    u47.Pan = Vector2.new()
    u47.Pinch = 0
end
u2.WindowFocused:Connect(u75)
u2.WindowFocusReleased:Connect(u75)
local u138 = false
local u139 = false
local u140 = 0
function v42.getHoldPan() --[[ Line: 504 ]]
    --[[
    Upvalues:
        [1] = u138
    --]]
    return u138
end
function v42.getTogglePan() --[[ Line: 508 ]]
    --[[
    Upvalues:
        [1] = u139
    --]]
    return u139
end
function v42.getPanning() --[[ Line: 512 ]]
    --[[
    Upvalues:
        [1] = u139
        [2] = u138
    --]]
    return u139 or u138
end
function v42.setTogglePan(p141) --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u139
    --]]
    u139 = p141
end
local u142 = false
local u143 = nil
local u144 = nil
function v42.enableCameraToggleInput() --[[ Line: 524 ]]
    --[[
    Upvalues:
        [1] = u142
        [2] = u138
        [3] = u139
        [4] = u143
        [5] = u144
        [6] = u19
        [7] = u140
        [8] = u20
        [9] = u2
    --]]
    if not u142 then
        u142 = true
        u138 = false
        u139 = false
        if u143 then
            u143:Disconnect()
        end
        if u144 then
            u144:Disconnect()
        end
        u143 = u19:Connect(function() --[[ Line: 541 ]]
            --[[
            Upvalues:
                [1] = u138
                [2] = u140
            --]]
            u138 = true
            u140 = tick()
        end)
        u144 = u20:Connect(function() --[[ Line: 546 ]]
            --[[
            Upvalues:
                [1] = u138
                [2] = u140
                [3] = u139
                [4] = u2
            --]]
            u138 = false
            if tick() - u140 < 0.3 and (u139 or u2:GetMouseDelta().Magnitude < 2) then
                u139 = not u139
            end
        end)
    end
end
function v42.disableCameraToggleInput() --[[ Line: 554 ]]
    --[[
    Upvalues:
        [1] = u142
        [2] = u143
        [3] = u144
    --]]
    if u142 then
        u142 = false
        if u143 then
            u143:Disconnect()
            u143 = nil
        end
        if u144 then
            u144:Disconnect()
            u144 = nil
        end
    end
end
return v42