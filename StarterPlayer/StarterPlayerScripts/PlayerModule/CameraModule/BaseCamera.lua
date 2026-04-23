-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

Vector2.new(0.2617993877991494, 0)
Vector2.new(0.7853981633974483, 0)
Vector2.new(0, 0)
local u1 = require(script.Parent:WaitForChild("CameraUtils"))
local u2 = require(script.Parent:WaitForChild("ZoomController"))
local u3 = require(script.Parent:WaitForChild("CameraToggleStateController"))
local u4 = require(script.Parent:WaitForChild("CameraInput"))
local u5 = require(script.Parent:WaitForChild("CameraUI"))
local v6 = game:GetService("Players")
local u7 = game:GetService("UserInputService")
game:GetService("StarterGui")
local u8 = game:GetService("VRService")
local u9 = UserSettings():GetService("UserGameSettings")
local u10 = v6.LocalPlayer
local v11, v12 = pcall(function() --[[ Line: 62 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u13 = v11 and v12
local u14 = {}
u14.__index = u14
function u14.new() --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u10
        [4] = u9
    --]]
    local v15 = u14
    local u16 = setmetatable({}, v15)
    if u13 then
        u16.gamepadZoomLevels = { 0, 10, 20 }
    end
    u16.FIRST_PERSON_DISTANCE_THRESHOLD = 1
    u16.cameraType = nil
    u16.cameraMovementMode = nil
    u16.lastCameraTransform = nil
    u16.lastUserPanCamera = tick()
    u16.humanoidRootPart = nil
    u16.humanoidCache = {}
    u16.lastSubject = nil
    u16.lastSubjectPosition = Vector3.new(0, 5, 0)
    u16.lastSubjectCFrame = CFrame.new(u16.lastSubjectPosition)
    if not u13 then
        local v17 = u10.CameraMinZoomDistance
        local v18 = u10.CameraMaxZoomDistance
        u16.defaultSubjectDistance = math.clamp(12.5, v17, v18)
    end
    local v19 = u10.CameraMinZoomDistance
    local v20 = u10.CameraMaxZoomDistance
    u16.currentSubjectDistance = math.clamp(12.5, v19, v20)
    u16.inFirstPerson = false
    u16.inMouseLockedMode = false
    u16.portraitMode = false
    u16.isSmallTouchScreen = false
    u16.resetCameraAngle = true
    u16.enabled = false
    u16.PlayerGui = nil
    u16.cameraChangedConn = nil
    u16.viewportSizeChangedConn = nil
    u16.shouldUseVRRotation = false
    u16.VRRotationIntensityAvailable = false
    u16.lastVRRotationIntensityCheckTime = 0
    u16.lastVRRotationTime = 0
    u16.vrRotateKeyCooldown = {}
    u16.cameraTranslationConstraints = Vector3.new(1, 1, 1)
    u16.humanoidJumpOrigin = nil
    u16.trackingHumanoid = nil
    u16.cameraFrozen = false
    u16.subjectStateChangedConn = nil
    u16.gamepadZoomPressConnection = nil
    u16.mouseLockOffset = Vector3.new(0, 0, 0)
    if u10.Character then
        u16:OnCharacterAdded(u10.Character)
    end
    u10.CharacterAdded:Connect(function(p21) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnCharacterAdded(p21)
    end)
    if not u13 then
        if u16.cameraChangedConn then
            u16.cameraChangedConn:Disconnect()
        end
        u16.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16:OnCurrentCameraChanged()
        end)
        u16:OnCurrentCameraChanged()
    end
    if u16.playerCameraModeChangeConn then
        u16.playerCameraModeChangeConn:Disconnect()
    end
    u16.playerCameraModeChangeConn = u10:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnPlayerCameraPropertyChange()
    end)
    if u16.minDistanceChangeConn then
        u16.minDistanceChangeConn:Disconnect()
    end
    u16.minDistanceChangeConn = u10:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnPlayerCameraPropertyChange()
    end)
    if u16.maxDistanceChangeConn then
        u16.maxDistanceChangeConn:Disconnect()
    end
    u16.maxDistanceChangeConn = u10:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnPlayerCameraPropertyChange()
    end)
    if u16.playerDevTouchMoveModeChangeConn then
        u16.playerDevTouchMoveModeChangeConn:Disconnect()
    end
    u16.playerDevTouchMoveModeChangeConn = u10:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnDevTouchMovementModeChanged()
    end)
    u16:OnDevTouchMovementModeChanged()
    if u16.gameSettingsTouchMoveMoveChangeConn then
        u16.gameSettingsTouchMoveMoveChangeConn:Disconnect()
    end
    u16.gameSettingsTouchMoveMoveChangeConn = u9:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:OnGameSettingsTouchMovementModeChanged()
    end)
    u16:OnGameSettingsTouchMovementModeChanged()
    u9:SetCameraYInvertVisible()
    u9:SetGamepadCameraSensitivityVisible()
    u16.hasGameLoaded = game:IsLoaded()
    if not u16.hasGameLoaded then
        u16.gameLoadedConn = game.Loaded:Connect(function() --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16.hasGameLoaded = true
            u16.gameLoadedConn:Disconnect()
            u16.gameLoadedConn = nil
        end)
    end
    u16:OnPlayerCameraPropertyChange()
    return u16
end
function u14.GetModuleName(_) --[[ Line: 199 ]]
    return "BaseCamera"
end
function u14.OnCharacterAdded(u22, p23) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
    --]]
    u22.resetCameraAngle = u22.resetCameraAngle or u22:GetEnabled()
    u22.humanoidRootPart = nil
    if u7.TouchEnabled then
        u22.PlayerGui = u10:WaitForChild("PlayerGui")
        for _, v24 in ipairs(p23:GetChildren()) do
            if v24:IsA("Tool") then
                u22.isAToolEquipped = true
            end
        end
        p23.ChildAdded:Connect(function(p25) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if p25:IsA("Tool") then
                u22.isAToolEquipped = true
            end
        end)
        p23.ChildRemoved:Connect(function(p26) --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if p26:IsA("Tool") then
                u22.isAToolEquipped = false
            end
        end)
    end
end
function u14.GetHumanoidRootPart(p27) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v28 = (not p27.humanoidRootPart and u10.Character and true or false) and u10.Character:FindFirstChildOfClass("Humanoid")
    if v28 then
        p27.humanoidRootPart = v28.RootPart
    end
    return p27.humanoidRootPart
end
function u14.GetBodyPartToFollow(_, p29, _) --[[ Line: 238 ]]
    if p29:GetState() == Enum.HumanoidStateType.Dead then
        local v30 = p29.Parent
        if v30 and v30:IsA("Model") then
            return v30:FindFirstChild("Head") or p29.RootPart
        end
    end
    return p29.RootPart
end
function u14.GetSubjectCFrame(p31) --[[ Line: 250 ]]
    local v32 = p31.lastSubjectCFrame
    local v33 = _G.internalCamera
    if v33 then
        v33 = v33.CameraSubject
    end
    if not v33 then
        return v32
    end
    if v33:IsA("Humanoid") then
        local v34 = v33:GetState() == Enum.HumanoidStateType.Dead
        local v35 = v33.RootPart
        if v34 and (v33.Parent and v33.Parent:IsA("Model")) then
            v35 = v33.Parent:FindFirstChild("Head") or v35
        end
        if v35 and v35:IsA("BasePart") then
            local v36
            if v33.RigType == Enum.HumanoidRigType.R15 then
                if v33.AutomaticScalingEnabled then
                    v36 = Vector3.new(0, 1.5, 0)
                    local v37 = v33.RootPart
                    if v35 == v37 then
                        local v38 = (v37.Size.Y - 2) / 2
                        v36 = v36 + Vector3.new(0, v38, 0)
                    end
                else
                    v36 = Vector3.new(0, 2, 0)
                end
            else
                v36 = Vector3.new(0, 1.5, 0)
            end
            v32 = v35.CFrame * CFrame.new((v34 and Vector3.new(0, 0, 0) or v36) + v33.CameraOffset)
        end
    elseif v33:IsA("BasePart") then
        v32 = v33.CFrame
    elseif v33:IsA("Model") then
        if v33.PrimaryPart then
            v32 = v33:GetPrimaryPartCFrame()
        else
            v32 = CFrame.new()
        end
    end
    if v32 then
        p31.lastSubjectCFrame = v32
    end
    return v32
end
function u14.GetSubjectVelocity(_) --[[ Line: 316 ]]
    local v39 = _G.internalCamera
    if v39 then
        v39 = v39.CameraSubject
    end
    if not v39 then
        return Vector3.new(0, 0, 0)
    end
    if v39:IsA("BasePart") then
        return v39.Velocity
    end
    if v39:IsA("Humanoid") then
        local v40 = v39.RootPart
        if v40 then
            return v40.Velocity
        end
    else
        local v41 = v39:IsA("Model") and v39.PrimaryPart
        if v41 then
            return v41.Velocity
        end
    end
    return Vector3.new(0, 0, 0)
end
function u14.GetSubjectRotVelocity(_) --[[ Line: 345 ]]
    local v42 = _G.internalCamera
    if v42 then
        v42 = v42.CameraSubject
    end
    if not v42 then
        return Vector3.new(0, 0, 0)
    end
    if v42:IsA("BasePart") then
        return v42.RotVelocity
    end
    if v42:IsA("Humanoid") then
        local v43 = v42.RootPart
        if v43 then
            return v43.RotVelocity
        end
    else
        local v44 = v42:IsA("Model") and v42.PrimaryPart
        if v44 then
            return v44.RotVelocity
        end
    end
    return Vector3.new(0, 0, 0)
end
function u14.StepZoom(p45) --[[ Line: 374 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local v46 = p45.currentSubjectDistance
    local v47 = u4.getZoomDelta()
    if math.abs(v47) > 0 then
        local v48
        if v47 > 0 then
            local v49 = v46 + v47 * (v46 * 0.5 + 1)
            local v50 = p45.FIRST_PERSON_DISTANCE_THRESHOLD
            v48 = math.max(v49, v50)
        else
            local v51 = (v46 + v47) / (1 - v47 * 0.5)
            v48 = math.max(v51, 0.5)
        end
        p45:SetCameraToSubjectDistance(v48 < p45.FIRST_PERSON_DISTANCE_THRESHOLD and 0.5 or v48)
    end
    return u2.GetZoomRadius()
end
function u14.GetSubjectPosition(p52) --[[ Line: 399 ]]
    local v53 = p52.lastSubjectPosition
    local v54 = _G.internalCamera
    if v54 then
        v54 = v54.CameraSubject
    end
    if not v54 then
        return nil
    end
    if v54:IsA("Humanoid") then
        local v55 = v54:GetState() == Enum.HumanoidStateType.Dead
        local v56 = v54.RootPart
        if v55 and (v54.Parent and v54.Parent:IsA("Model")) then
            v56 = v54.Parent:FindFirstChild("Head") or v56
        end
        if v56 and v56:IsA("BasePart") then
            local v57
            if v54.RigType == Enum.HumanoidRigType.R15 then
                if v54.AutomaticScalingEnabled then
                    v57 = Vector3.new(0, 1.5, 0)
                    if v56 == v54.RootPart then
                        local v58 = v54.RootPart.Size.Y / 2 - 1
                        v57 = v57 + Vector3.new(0, v58, 0)
                    end
                else
                    v57 = Vector3.new(0, 2, 0)
                end
            else
                v57 = Vector3.new(0, 1.5, 0)
            end
            v53 = v56.CFrame.p + v56.CFrame:vectorToWorldSpace((v55 and Vector3.new(0, 0, 0) or v57) + v54.CameraOffset)
        end
    elseif v54:IsA("VehicleSeat") then
        v53 = v54.CFrame.p + v54.CFrame:vectorToWorldSpace(Vector3.new(0, 5, 0))
    elseif v54:IsA("SkateboardPlatform") then
        v53 = v54.CFrame.p + Vector3.new(0, 5, 0)
    elseif v54:IsA("BasePart") then
        v53 = v54.CFrame.p
    elseif v54:IsA("Model") then
        if v54.PrimaryPart then
            v53 = v54:GetPrimaryPartCFrame().p
        else
            v53 = v54:GetModelCFrame().p
        end
    end
    p52.lastSubject = v54
    p52.lastSubjectPosition = v53
    return v53
end
function u14.UpdateDefaultSubjectDistance(p59) --[[ Line: 470 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p59.portraitMode then
        local v60 = u10.CameraMinZoomDistance
        local v61 = u10.CameraMaxZoomDistance
        p59.defaultSubjectDistance = math.clamp(25, v60, v61)
    else
        local v62 = u10.CameraMinZoomDistance
        local v63 = u10.CameraMaxZoomDistance
        p59.defaultSubjectDistance = math.clamp(12.5, v62, v63)
    end
end
function u14.OnViewportSizeChanged(p64) --[[ Line: 478 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
    --]]
    local v65 = _G.internalCamera.ViewportSize
    p64.portraitMode = v65.X < v65.Y
    local v66 = u7.TouchEnabled
    if v66 then
        v66 = v65.Y < 500 and true or v65.X < 700
    end
    p64.isSmallTouchScreen = v66
    if not u13 then
        p64:UpdateDefaultSubjectDistance()
    end
end
function u14.OnCurrentCameraChanged(u67) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7.TouchEnabled then
        if u67.viewportSizeChangedConn then
            u67.viewportSizeChangedConn:Disconnect()
            u67.viewportSizeChangedConn = nil
        end
        local v68 = _G.internalCamera
        if v68 then
            u67:OnViewportSizeChanged()
            u67.viewportSizeChangedConn = v68:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 501 ]]
                --[[
                Upvalues:
                    [1] = u67
                --]]
                u67:OnViewportSizeChanged()
            end)
        end
    end
    if u67.cameraSubjectChangedConn then
        u67.cameraSubjectChangedConn:Disconnect()
        u67.cameraSubjectChangedConn = nil
    end
    local v69 = _G.internalCamera
    if v69 then
        u67.cameraSubjectChangedConn = v69:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 515 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            u67:OnNewCameraSubject()
        end)
        u67:OnNewCameraSubject()
    end
end
function u14.OnDynamicThumbstickEnabled(p70) --[[ Line: 522 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7.TouchEnabled then
        p70.isDynamicThumbstickEnabled = true
    end
end
function u14.OnDynamicThumbstickDisabled(p71) --[[ Line: 528 ]]
    p71.isDynamicThumbstickEnabled = false
end
function u14.OnGameSettingsTouchMovementModeChanged(p72) --[[ Line: 532 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    if u10.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        if u9.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or u9.TouchMovementMode == Enum.TouchMovementMode.Default then
            p72:OnDynamicThumbstickEnabled()
            return
        end
        p72:OnDynamicThumbstickDisabled()
    end
end
function u14.OnDevTouchMovementModeChanged(p73) --[[ Line: 543 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u10.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
        p73:OnDynamicThumbstickEnabled()
    else
        p73:OnGameSettingsTouchMovementModeChanged()
    end
end
function u14.OnPlayerCameraPropertyChange(p74) --[[ Line: 551 ]]
    p74:SetCameraToSubjectDistance(p74.currentSubjectDistance)
end
function u14.InputTranslationToCameraAngleChange(_, p75, p76) --[[ Line: 556 ]]
    return p75 * p76
end
function u14.GamepadZoomPress(p77) --[[ Line: 562 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u10
    --]]
    local v78 = p77:GetCameraToSubjectDistance()
    if not u13 then
        local v79 = u10.CameraMinZoomDistance
        local v80 = u10.CameraMaxZoomDistance
        local v81 = v79 <= 0.5 and 0 or v79
        local v82 = v81 + 10
        local v83 = v82 + 10
        if v80 < v83 then
            v82 = v81 + (v80 - v81) / 2
        else
            v80 = v83
        end
        if (v82 + v80) / 2 < v78 then
            p77:SetCameraToSubjectDistance(v82)
            return
        elseif (v81 + v82) / 2 < v78 then
            p77:SetCameraToSubjectDistance(v81)
        else
            p77:SetCameraToSubjectDistance(v80)
        end
    end
    local v84 = u10.CameraMaxZoomDistance
    for v85 = #p77.gamepadZoomLevels, 1, -1 do
        local v86 = p77.gamepadZoomLevels[v85]
        if v84 >= v86 then
            if v86 < u10.CameraMinZoomDistance then
                v86 = u10.CameraMinZoomDistance
            end
            if v84 == v86 then
                break
            end
            if v86 + (v84 - v86) / 2 < v78 then
                p77:SetCameraToSubjectDistance(v86)
                return
            end
            v84 = v86
        end
    end
    p77:SetCameraToSubjectDistance(p77.gamepadZoomLevels[#p77.gamepadZoomLevels])
end
function u14.Enable(u87, p88) --[[ Line: 629 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u10
    --]]
    if u87.enabled ~= p88 then
        u87.enabled = p88
        if u13 then
            u87:OnEnabledChanged()
            return
        end
        if u87.enabled then
            u4.setInputEnabled(true)
            u87.gamepadZoomPressConnection = u4.gamepadZoomPress:Connect(function() --[[ Line: 639 ]]
                --[[
                Upvalues:
                    [1] = u87
                --]]
                u87:GamepadZoomPress()
            end)
            if u10.CameraMode == Enum.CameraMode.LockFirstPerson then
                u87.currentSubjectDistance = 0.5
                if not u87.inFirstPerson then
                    u87:EnterFirstPerson()
                end
            end
        else
            u4.setInputEnabled(false)
            if u87.gamepadZoomPressConnection then
                u87.gamepadZoomPressConnection:Disconnect()
                u87.gamepadZoomPressConnection = nil
            end
            u87:Cleanup()
        end
        u87:OnEnabledChanged(p88)
    end
end
function u14.OnEnabledChanged(u89) --[[ Line: 664 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u10
    --]]
    if u13 then
        if u89.enabled then
            u4.setInputEnabled(true)
            u89.gamepadZoomPressConnection = u4.gamepadZoomPress:Connect(function() --[[ Line: 669 ]]
                --[[
                Upvalues:
                    [1] = u89
                --]]
                u89:GamepadZoomPress()
            end)
            if u10.CameraMode == Enum.CameraMode.LockFirstPerson then
                u89.currentSubjectDistance = 0.5
                if not u89.inFirstPerson then
                    u89:EnterFirstPerson()
                end
            end
            if u89.cameraChangedConn then
                u89.cameraChangedConn:Disconnect()
                u89.cameraChangedConn = nil
            end
            u89.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 681 ]]
                --[[
                Upvalues:
                    [1] = u89
                --]]
                u89:OnCurrentCameraChanged()
            end)
            u89:OnCurrentCameraChanged()
            return
        end
        u4.setInputEnabled(false)
        if u89.gamepadZoomPressConnection then
            u89.gamepadZoomPressConnection:Disconnect()
            u89.gamepadZoomPressConnection = nil
        end
        u89:Cleanup()
    end
end
function u14.GetEnabled(p90) --[[ Line: 698 ]]
    return p90.enabled
end
function u14.Cleanup(p91) --[[ Line: 702 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u1
    --]]
    if p91.subjectStateChangedConn then
        p91.subjectStateChangedConn:Disconnect()
        p91.subjectStateChangedConn = nil
    end
    if p91.viewportSizeChangedConn then
        p91.viewportSizeChangedConn:Disconnect()
        p91.viewportSizeChangedConn = nil
    end
    if u13 and p91.cameraChangedConn then
        p91.cameraChangedConn:Disconnect()
        p91.cameraChangedConn = nil
    end
    p91.lastCameraTransform = nil
    p91.lastSubjectCFrame = nil
    u1.restoreMouseBehavior()
end
function u14.UpdateMouseBehavior(p92) --[[ Line: 725 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u1
    --]]
    local v93 = u9.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
    if p92.isCameraToggle and v93 == false then
        u5.setCameraModeToastEnabled(true)
        u4.enableCameraToggleInput()
        u3(p92.inFirstPerson)
        return
    else
        u5.setCameraModeToastEnabled(false)
        u4.disableCameraToggleInput()
        if p92.inFirstPerson or p92.inMouseLockedMode then
            u1.setRotationTypeOverride(Enum.RotationType.CameraRelative)
            u1.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
            return
        else
            u1.restoreRotationType()
            if u4.getRotationActivated() then
                u1.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
            else
                u1.restoreMouseBehavior()
            end
        end
    end
end
function u14.UpdateForDistancePropertyChange(p94) --[[ Line: 753 ]]
    p94:SetCameraToSubjectDistance(p94.currentSubjectDistance)
end
function u14.SetCameraToSubjectDistance(p95, p96) --[[ Line: 759 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    local v97 = p95.currentSubjectDistance
    if u10.CameraMode == Enum.CameraMode.LockFirstPerson then
        p95.currentSubjectDistance = 0.5
        if not p95.inFirstPerson then
            p95:EnterFirstPerson()
        end
    else
        local v98 = u10.CameraMinZoomDistance
        local v99 = u10.CameraMaxZoomDistance
        local v100 = math.clamp(p96, v98, v99)
        if v100 < 1 then
            p95.currentSubjectDistance = 0.5
            if not p95.inFirstPerson then
                p95:EnterFirstPerson()
            end
        else
            p95.currentSubjectDistance = v100
            if p95.inFirstPerson then
                p95:LeaveFirstPerson()
            end
        end
    end
    local v101 = u2.SetZoomParameters
    local v102 = p95.currentSubjectDistance
    local v103 = p96 - v97
    v101(v102, (math.sign(v103)))
    return p95.currentSubjectDistance
end
function u14.SetCameraType(p104, p105) --[[ Line: 793 ]]
    p104.cameraType = p105
end
function u14.GetCameraType(p106) --[[ Line: 798 ]]
    return p106.cameraType
end
function u14.SetCameraMovementMode(p107, p108) --[[ Line: 803 ]]
    p107.cameraMovementMode = p108
end
function u14.GetCameraMovementMode(p109) --[[ Line: 807 ]]
    return p109.cameraMovementMode
end
function u14.SetIsMouseLocked(p110, p111) --[[ Line: 811 ]]
    p110.inMouseLockedMode = p111
end
function u14.GetIsMouseLocked(p112) --[[ Line: 815 ]]
    return p112.inMouseLockedMode
end
function u14.SetMouseLockOffset(p113, p114) --[[ Line: 819 ]]
    p113.mouseLockOffset = p114
end
function u14.GetMouseLockOffset(p115) --[[ Line: 823 ]]
    return p115.mouseLockOffset
end
function u14.InFirstPerson(p116) --[[ Line: 827 ]]
    return p116.inFirstPerson
end
function u14.EnterFirstPerson(p117) --[[ Line: 831 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13 then
        p117.inFirstPerson = true
        p117:UpdateMouseBehavior()
    end
end
function u14.LeaveFirstPerson(p118) --[[ Line: 838 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if u13 then
        p118.inFirstPerson = false
        p118:UpdateMouseBehavior()
    end
end
function u14.GetCameraToSubjectDistance(p119) --[[ Line: 846 ]]
    return p119.currentSubjectDistance
end
function u14.GetMeasuredDistanceToFocus(_) --[[ Line: 853 ]]
    local v120 = _G.internalCamera
    if v120 then
        return (v120.CoordinateFrame.p - v120.Focus.p).magnitude
    else
        return nil
    end
end
function u14.GetCameraLookVector(_) --[[ Line: 861 ]]
    return _G.internalCamera and _G.internalCamera.CFrame.LookVector or Vector3.new(0, 0, 1)
end
function u14.CalculateNewLookCFrameFromArg(p121, p122, p123) --[[ Line: 865 ]]
    local v124 = Vector2.new(p123.X, p123.Y * 80 / 90)
    local v125 = p122 or p121:GetCameraLookVector()
    local v126 = v125.Y
    local v127 = math.asin(v126)
    local v128 = v124.Y
    local v129 = v127 + -1.3962634015954636
    local v130 = v127 + 1.3962634015954636
    local v131 = math.clamp(v128, v129, v130)
    local v132 = Vector2.new(v124.X, v131)
    local v133 = CFrame.new(Vector3.new(0, 0, 0), v125)
    return CFrame.Angles(0, -v132.X, 0) * v133 * CFrame.Angles(-v132.Y, 0, 0)
end
function u14.CalculateNewLookVectorFromArg(p134, p135, p136) --[[ Line: 877 ]]
    return p134:CalculateNewLookCFrameFromArg(p135, p136).LookVector
end
function u14.CalculateNewLookVectorVRFromArg(p137, p138) --[[ Line: 882 ]]
    local v139 = ((p137:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1)).unit
    local v140 = Vector2.new(p138.X, 0)
    local v141 = CFrame.new(Vector3.new(0, 0, 0), v139)
    return ((CFrame.Angles(0, -v140.X, 0) * v141 * CFrame.Angles(-v140.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1)).unit
end
function u14.GetHumanoid(p142) --[[ Line: 892 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v143 = u10
    if v143 then
        v143 = u10.Character
    end
    if not v143 then
        return nil
    end
    local v144 = p142.humanoidCache[u10]
    if v144 and v144.Parent == v143 then
        return v144
    end
    p142.humanoidCache[u10] = nil
    local v145 = v143:FindFirstChildOfClass("Humanoid")
    if v145 then
        p142.humanoidCache[u10] = v145
    end
    return v145
end
function u14.GetHumanoidPartToFollow(_, p146, p147) --[[ Line: 910 ]]
    if p147 == Enum.HumanoidStateType.Dead then
        local v148 = p146.Parent
        if v148 then
            return v148:FindFirstChild("Head") or p146.Torso
        else
            return p146.Torso
        end
    else
        return p146.Torso
    end
end
function u14.OnNewCameraSubject(p149) --[[ Line: 924 ]]
    if p149.subjectStateChangedConn then
        p149.subjectStateChangedConn:Disconnect()
        p149.subjectStateChangedConn = nil
    end
end
function u14.IsInFirstPerson(p150) --[[ Line: 931 ]]
    return p150.inFirstPerson
end
function u14.Update(_, _) --[[ Line: 935 ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2)
end
function u14.GetCameraHeight(p151) --[[ Line: 939 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return (not u8.VREnabled or p151.inFirstPerson) and 0 or 0.25881904510252074 * p151.currentSubjectDistance
end
return u14