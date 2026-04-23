-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRBaseCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1, v2 = pcall(function() --[[ Line: 17 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local v3 = v1 and v2
local v4, v5 = pcall(function() --[[ Line: 25 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera")
end)
if v4 then
    if not v5 then
        v3 = v5
    end
else
    v3 = v4
end
local u6 = v3
local u7 = game:GetService("VRService")
local u8 = require(script.Parent:WaitForChild("CameraInput"))
local u9 = require(script.Parent:WaitForChild("ZoomController"))
local u10 = game:GetService("Players").LocalPlayer
local u11 = game:GetService("Lighting")
local u12 = game:GetService("RunService")
local u13 = UserSettings():GetService("UserGameSettings")
local v14, v15 = pcall(function() --[[ Line: 47 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u16 = v14 and v15
local v17, v18 = pcall(function() --[[ Line: 54 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRRotationUpdate")
end)
local u19 = v17 and v18
local v20, v21 = pcall(function() --[[ Line: 61 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRFollowCamera2")
end)
local u22 = v20 and v21
local v23, v24 = pcall(function() --[[ Line: 68 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRRotationTweeks")
end)
local u25 = v23 and v24
local u26 = require(script.Parent:WaitForChild("BaseCamera"))
local u27 = setmetatable({}, u26)
u27.__index = u27
function u27.new() --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u27
        [3] = u16
        [4] = u10
        [5] = u22
        [6] = u19
    --]]
    local v28 = u26.new()
    local v29 = u27
    local v30 = setmetatable(v28, v29)
    if u16 then
        v30.gamepadZoomLevels = { 0, 7 }
        v30.headScale = 1
        v30:SetCameraToSubjectDistance(7)
    else
        v30.defaultDistance = 7
        local v31 = v30.defaultDistance
        local v32 = u10.CameraMinZoomDistance
        local v33 = u10.CameraMaxZoomDistance
        v30.defaultSubjectDistance = math.clamp(v31, v32, v33)
        local v34 = v30.defaultDistance
        local v35 = u10.CameraMinZoomDistance
        local v36 = u10.CameraMaxZoomDistance
        v30.currentSubjectDistance = math.clamp(v34, v35, v36)
    end
    v30.VRFadeResetTimer = 0
    v30.VREdgeBlurTimer = 0
    v30.gamepadResetConnection = nil
    v30.needsReset = true
    if u22 then
        v30.recentered = false
    end
    if u19 then
        v30:Reset()
    end
    return v30
end
function u27.Reset(p37) --[[ Line: 116 ]]
    p37.stepRotateTimeout = 0
end
function u27.GetModuleName(_) --[[ Line: 120 ]]
    return "VRBaseCamera"
end
function u27.GamepadZoomPress(p38) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
    --]]
    if u16 then
        u26.GamepadZoomPress(p38)
        p38:GamepadReset()
        p38:ResetZoom()
    else
        if p38:GetCameraToSubjectDistance() > 3.5 then
            p38:SetCameraToSubjectDistance(0)
            p38.currentSubjectDistance = 0
        else
            p38:SetCameraToSubjectDistance(7)
            p38.currentSubjectDistance = 7
        end
        p38:GamepadReset()
        p38:ResetZoom()
    end
end
function u27.GamepadReset(p39) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if u19 then
        p39.stepRotateTimeout = 0
    end
    p39.needsReset = true
end
function u27.ResetZoom(p40) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.SetZoomParameters(p40.currentSubjectDistance, 0)
    u9.ReleaseSpring()
end
function u27.OnEnabledChanged(u41, p42) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
        [3] = u8
        [4] = u22
        [5] = u7
        [6] = u6
        [7] = u10
        [8] = u11
    --]]
    if u16 then
        u26.OnEnabledChanged(u41)
        p42 = u41.enabled
    end
    if p42 then
        u41.gamepadResetConnection = u8.gamepadReset:Connect(function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41:GamepadReset()
        end)
        if u22 then
            u41.thirdPersonOptionChanged = u7:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u41
                --]]
                if u6 then
                    u41:Reset()
                elseif not u41:IsInFirstPerson() then
                    u41:Reset()
                end
            end)
            u41.vrRecentered = u7.UserCFrameChanged:Connect(function(p43, _) --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                if p43 == Enum.UserCFrame.Floor then
                    u41.recentered = true
                end
            end)
            return
        end
    else
        if u41.inFirstPerson then
            u41:GamepadZoomPress()
        end
        if u22 then
            if u41.thirdPersonOptionChanged then
                u41.thirdPersonOptionChanged:Disconnect()
                u41.thirdPersonOptionChanged = nil
            end
            if u41.vrRecentered then
                u41.vrRecentered:Disconnect()
                u41.vrRecentered = nil
            end
        end
        if u16 and u41.cameraHeadScaleChangedConn then
            u41.cameraHeadScaleChangedConn:Disconnect()
            u41.cameraHeadScaleChangedConn = nil
        end
        if u41.gamepadResetConnection then
            u41.gamepadResetConnection:Disconnect()
            u41.gamepadResetConnection = nil
        end
        u41.VREdgeBlurTimer = 0
        u41:UpdateEdgeBlur(u10, 1)
        local v44 = u11:FindFirstChild("VRFade")
        if v44 then
            v44.Brightness = 0
        end
    end
end
function u27.UpdateDefaultSubjectDistance(p45) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v46 = u10.CameraMinZoomDistance
    local v47 = u10.CameraMaxZoomDistance
    p45.defaultSubjectDistance = math.clamp(7, v46, v47)
end
function u27.GetCameraToSubjectDistance(p48) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
    --]]
    if u16 then
        return u26.GetCameraToSubjectDistance(p48)
    else
        return p48.currentSubjectDistance
    end
end
function u27.SetCameraToSubjectDistance(p49, p50) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
        [3] = u10
        [4] = u9
    --]]
    if u16 then
        return u26.SetCameraToSubjectDistance(p49, p50)
    end
    local v51 = p49.currentSubjectDistance
    local v52 = u10.CameraMaxZoomDistance
    local v53 = math.clamp(p50, 0, v52)
    if v53 < 1 then
        p49.currentSubjectDistance = 0.5
        if not p49.inFirstPerson then
            p49:EnterFirstPerson()
        end
    else
        p49.currentSubjectDistance = v53
        if p49.inFirstPerson then
            p49:LeaveFirstPerson()
        end
    end
    local v54 = u9.SetZoomParameters
    local v55 = p49.currentSubjectDistance
    local v56 = p50 - v51
    v54(v55, (math.sign(v56)))
    return p49.currentSubjectDistance
end
function u27.OnCurrentCameraChanged(u57) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u16
    --]]
    u26.OnCurrentCameraChanged(u57)
    if u16 then
        if u57.cameraHeadScaleChangedConn then
            u57.cameraHeadScaleChangedConn:Disconnect()
            u57.cameraHeadScaleChangedConn = nil
        end
        local v58 = _G.internalCamera
        if v58 then
            u57.cameraHeadScaleChangedConn = v58:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ Line: 286 ]]
                --[[
                Upvalues:
                    [1] = u57
                --]]
                u57:OnHeadScaleChanged()
            end)
            u57:OnHeadScaleChanged()
        end
    end
end
function u27.OnHeadScaleChanged(p59) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v60 = u16
    assert(v60)
    local v61 = _G.internalCamera.HeadScale
    for v62, v63 in p59.gamepadZoomLevels do
        p59.gamepadZoomLevels[v62] = v63 * v61 / p59.headScale
    end
    p59:SetCameraToSubjectDistance(p59:GetCameraToSubjectDistance() * v61 / p59.headScale)
    p59.headScale = v61
end
function u27.GetVRFocus(p64, p65, p66) --[[ Line: 309 ]]
    local v67 = p64.lastCameraFocus or p65
    local v68 = p64.cameraTranslationConstraints.x
    local v69 = p64.cameraTranslationConstraints.y + p66
    local v70 = math.min(1, v69)
    local v71 = p64.cameraTranslationConstraints.z
    p64.cameraTranslationConstraints = Vector3.new(v68, v70, v71)
    local v72 = p64:GetCameraHeight()
    local v73 = Vector3.new(0, v72, 0)
    local v74 = CFrame.new
    local v75 = p65.x
    local v76 = v67.y
    local v77 = p65.z
    return v74(Vector3.new(v75, v76, v77):Lerp(p65 + v73, p64.cameraTranslationConstraints.y))
end
function u27.StartFadeFromBlack(p78) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
    --]]
    if u13.VignetteEnabled ~= false then
        local v79 = u11:FindFirstChild("VRFade")
        if not v79 then
            v79 = Instance.new("ColorCorrectionEffect")
            v79.Name = "VRFade"
            v79.Parent = u11
        end
        v79.Brightness = -1
        p78.VRFadeResetTimer = 0.1
    end
end
function u27.UpdateFadeFromBlack(p80, p81) --[[ Line: 340 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v82 = u11:FindFirstChild("VRFade")
    if p80.VRFadeResetTimer > 0 then
        local v83 = p80.VRFadeResetTimer - p81
        p80.VRFadeResetTimer = math.max(v83, 0)
        local v84 = u11:FindFirstChild("VRFade")
        if v84 and v84.Brightness < 0 then
            local v85 = v84.Brightness + p81 * 10
            v84.Brightness = math.min(v85, 0)
            return
        end
    elseif v82 then
        v82.Brightness = 0
    end
end
function u27.StartVREdgeBlur(p86, p87) --[[ Line: 356 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u7
    --]]
    if u13.VignetteEnabled ~= false then
        local v88 = _G.internalCamera:FindFirstChild("VRBlurPart")
        if not v88 then
            local u89 = Instance.new("Part")
            u89.Name = "VRBlurPart"
            u89.Parent = _G.internalCamera
            u89.CanTouch = false
            u89.CanCollide = false
            u89.CanQuery = false
            u89.Anchored = true
            u89.Size = Vector3.new(0.44, 0.47, 1)
            u89.Transparency = 1
            u89.CastShadow = false
            u12.RenderStepped:Connect(function(_) --[[ Line: 376 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u89
                --]]
                local v90 = u7:GetUserCFrame(Enum.UserCFrame.Head)
                local v91 = _G.internalCamera.CFrame * (CFrame.new(v90.p * _G.internalCamera.HeadScale) * (v90 - v90.p))
                u89.CFrame = v91 * CFrame.Angles(0, 3.141592653589793, 0) + v91.LookVector * (1.05 * _G.internalCamera.HeadScale)
                u89.Size = Vector3.new(0.44, 0.47, 1) * _G.internalCamera.HeadScale
            end)
            v88 = u89
        end
        local v92 = p87.PlayerGui:FindFirstChild("VRBlurScreen")
        local v93
        if v92 then
            v93 = v92:FindFirstChild("VRBlur")
        else
            v93 = nil
        end
        if not v93 then
            local v94 = v92 or (Instance.new("SurfaceGui") or Instance.new("ScreenGui"))
            v94.Name = "VRBlurScreen"
            v94.Parent = p87.PlayerGui
            v94.Adornee = v88
            v93 = Instance.new("ImageLabel")
            v93.Name = "VRBlur"
            v93.Parent = v94
            v93.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
            v93.AnchorPoint = Vector2.new(0.5, 0.5)
            v93.Position = UDim2.new(0.5, 0, 0.5, 0)
            local v95 = _G.internalCamera.ViewportSize.X * 2.3 / 512
            local v96 = _G.internalCamera.ViewportSize.Y * 2.3 / 512
            v93.Size = UDim2.fromScale(v95, v96)
            v93.BackgroundTransparency = 1
            v93.Active = true
            v93.ScaleType = Enum.ScaleType.Stretch
        end
        v93.Visible = true
        v93.ImageTransparency = 0
        p86.VREdgeBlurTimer = 0.14
    end
end
function u27.UpdateEdgeBlur(p97, p98, p99) --[[ Line: 425 ]]
    local v100 = p98.PlayerGui:FindFirstChild("VRBlurScreen")
    local v101
    if v100 then
        v101 = v100:FindFirstChild("VRBlur")
    else
        v101 = nil
    end
    if v101 then
        if p97.VREdgeBlurTimer > 0 then
            p97.VREdgeBlurTimer = p97.VREdgeBlurTimer - p99
            local v102 = p98.PlayerGui:FindFirstChild("VRBlurScreen")
            local v103 = v102 and v102:FindFirstChild("VRBlur")
            if v103 then
                local v104 = p97.VREdgeBlurTimer
                v103.ImageTransparency = 1 - math.clamp(v104, 0.01, 0.14) * 7.142857142857142
                return
            end
        else
            v101.Visible = false
        end
    end
end
function u27.GetCameraHeight(p105) --[[ Line: 450 ]]
    return p105.inFirstPerson and 0 or 0.25881904510252074 * p105.currentSubjectDistance
end
function u27.GetSubjectCFrame(p106) --[[ Line: 457 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v107 = u26.GetSubjectCFrame(p106)
    local v108 = _G.internalCamera
    if v108 then
        v108 = v108.CameraSubject
    end
    if not v108 then
        return v107
    end
    if v108:IsA("Humanoid") and (v108:GetState() == Enum.HumanoidStateType.Dead and v108 == p106.lastSubject) then
        v107 = p106.lastSubjectCFrame
    end
    if v107 then
        p106.lastSubjectCFrame = v107
    end
    return v107
end
function u27.GetSubjectPosition(p109) --[[ Line: 483 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v110 = u26.GetSubjectPosition(p109)
    local v111 = _G.internalCamera
    if v111 then
        v111 = v111.CameraSubject
    end
    if not v111 then
        return nil
    end
    if v111:IsA("Humanoid") then
        if v111:GetState() == Enum.HumanoidStateType.Dead and v111 == p109.lastSubject then
            v110 = p109.lastSubjectPosition
        end
    elseif v111:IsA("VehicleSeat") then
        v110 = v111.CFrame.p + v111.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
    end
    p109.lastSubjectPosition = v110
    return v110
end
function u27.getRotation(p112, p113) --[[ Line: 512 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u25
    --]]
    local v114 = u8.getRotation()
    local v115 = 0
    if u13.VRSmoothRotationEnabled then
        return v114.X * 40 * p113
    end
    local v116 = v114.X
    if math.abs(v116) > 0.03 then
        if p112.stepRotateTimeout > 0 then
            p112.stepRotateTimeout = p112.stepRotateTimeout - p113
        end
        if p112.stepRotateTimeout <= 0 then
            local v117 = v114.X < 0 and -1 or 1
            local v118
            if u25 then
                v118 = v117 * 0.5235987755982988
            else
                v118 = v117 * 1.0471975511965976
            end
            p112:StartFadeFromBlack()
            p112.stepRotateTimeout = 0.25
            return v118
        end
    else
        local v119 = v114.X
        if math.abs(v119) < 0.02 then
            p112.stepRotateTimeout = 0
        end
    end
    return v115
end
return u27