-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1, v2 = pcall(function() --[[ Line: 10 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u3 = v1 and v2
local u4 = game:GetService("Players")
local u5 = game:GetService("VRService")
local u6 = UserSettings():GetService("UserGameSettings")
local u7 = require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local v8, v9 = pcall(function() --[[ Line: 30 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRRotationUpdate")
end)
local u10 = v8 and v9
local v11, v12 = pcall(function() --[[ Line: 37 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRFollowCamera2")
end)
local u13 = v11 and v12
local v14, v15 = pcall(function() --[[ Line: 44 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRRotationTweeks")
end)
local u16 = v14 and v15
local v17, v18 = pcall(function() --[[ Line: 51 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRTorsoEstimation")
end)
local u19 = v17 and v18
local u20 = require(script.Parent:WaitForChild("VRBaseCamera"))
local u21 = setmetatable({}, u20)
u21.__index = u21
function u21.new() --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u21
        [3] = u13
    --]]
    local v22 = u20.new()
    local v23 = u21
    local v24 = setmetatable(v22, v23)
    v24.lastUpdate = tick()
    if u13 then
        v24.focusOffset = CFrame.new()
    end
    v24:Reset()
    return v24
end
function u21.Reset(p25) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u20
    --]]
    p25.needsReset = true
    p25.needsBlackout = true
    p25.motionDetTime = 0
    p25.blackOutTimer = 0
    p25.lastCameraResetPosition = nil
    if u10 then
        u20.Reset(p25)
    else
        p25.stepRotateTimeout = 0
        p25.cameraOffsetRotation = 0
        p25.cameraOffsetRotationDiscrete = 0
    end
end
function u21.Update(p26, p27) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u5
    --]]
    local v28 = _G.internalCamera
    local v29 = v28.CFrame
    local v30 = v28.Focus
    local v31 = u4.LocalPlayer
    p26:GetHumanoid()
    local _ = v28.CameraSubject
    if p26.lastUpdate == nil or p27 > 1 then
        p26.lastCameraTransform = nil
    end
    p26:UpdateFadeFromBlack(p27)
    p26:UpdateEdgeBlur(v31, p27)
    local v32 = p26.lastSubjectPosition
    local v33 = p26:GetSubjectPosition()
    if p26.needsBlackout then
        p26:StartFadeFromBlack()
        local v34 = math.clamp(p27, 0.0001, 0.1)
        p26.blackOutTimer = p26.blackOutTimer + v34
        if p26.blackOutTimer > 0.1 and game:IsLoaded() then
            p26.needsBlackout = false
            p26.needsReset = true
        end
    end
    if v33 and (v31 and v28) then
        local v35 = p26:GetVRFocus(v33, p27)
        if p26:IsInFirstPerson() then
            v29, v30 = p26:UpdateFirstPersonTransform(p27, v29, v35, v32, v33)
        elseif u13 then
            if u5.ThirdPersonFollowCamEnabled then
                v29, v30 = p26:UpdateThirdPersonFollowTransform(p27, v29, v35, v32, v33)
            else
                v29, v30 = p26:UpdateThirdPersonComfortTransform(p27, v29, v35, v32, v33)
            end
        else
            v29, v30 = p26:UpdateThirdPersonComfortTransform(p27, v29, v35, v32, v33)
        end
        p26.lastCameraTransform = v29
        p26.lastCameraFocus = v30
    end
    p26.lastUpdate = tick()
    return v29, v30
end
function u21.GetAvatarFeetWorldYValue(_) --[[ Line: 153 ]]
    local v36 = _G.internalCamera.CameraSubject
    if not v36 then
        return nil
    end
    if not (v36:IsA("Humanoid") and v36.RootPart) then
        return nil
    end
    local v37 = v36.RootPart
    return v37.Position.Y - v37.Size.Y / 2 - v36.HipHeight
end
function u21.UpdateFirstPersonTransform(p38, p39, _, p40, p41, p42) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u7
        [4] = u6
    --]]
    if p38.needsReset then
        p38:StartFadeFromBlack()
        p38.needsReset = false
        if not u10 then
            p38.stepRotateTimeout = 0.25
            p38.VRCameraFocusFrozen = true
            p38.cameraOffsetRotation = 0
            p38.cameraOffsetRotationDiscrete = 0
        end
    end
    local v43 = u4.LocalPlayer
    if (p41 - p42).magnitude > 0.01 then
        p38:StartVREdgeBlur(v43)
    end
    local v44 = p40.p
    local v45 = p38:GetCameraLookVector()
    local v46 = v45.X
    local v47 = v45.Z
    local v48 = Vector3.new(v46, 0, v47).Unit
    local v49
    if u10 then
        v49 = p38:getRotation(p39)
    else
        if p38.stepRotateTimeout > 0 then
            p38.stepRotateTimeout = p38.stepRotateTimeout - p39
        end
        local v50 = u7.getRotation()
        v49 = 0
        if u6.VRSmoothRotationEnabled then
            v49 = v50.X
        elseif p38.stepRotateTimeout <= 0 then
            local v51 = v50.X
            if math.abs(v51) > 0.03 then
                v49 = v50.X < 0 and -0.5 or 0.5
                p38.needsReset = true
            end
        end
    end
    local v52 = p38:CalculateNewLookVectorFromArg(v48, Vector2.new(v49, 0))
    return CFrame.new(v44 - 0.5 * v52, v44), p40
end
function u21.UpdateThirdPersonComfortTransform(p53, p54, p55, p56, p57, p58) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u16
        [4] = u5
        [5] = u7
        [6] = u6
    --]]
    local v59 = p53:GetCameraToSubjectDistance()
    local v60 = v59 < 0.5 and 0.5 or v59
    if p57 ~= nil and p53.lastCameraFocus ~= nil then
        local v61 = u4.LocalPlayer
        local v62 = p57 - p58
        local v63 = require(v61:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector()
        local v64 = v62.magnitude > 0.01 and true or v63.magnitude > 0.01
        if v64 then
            p53.motionDetTime = 0.1
        end
        p53.motionDetTime = p53.motionDetTime - p54
        if (p53.motionDetTime > 0 and true or v64) and not p53.needsReset then
            local v65 = p53.lastCameraFocus
            p53.VRCameraFocusFrozen = true
            return p55, v65
        end
        local v66 = p53.lastCameraResetPosition == nil and true or (p58 - p53.lastCameraResetPosition).Magnitude > 1
        if u10 then
            local v67 = p53:getRotation(p54)
            if math.abs(v67) > 0 then
                local v68 = p56:ToObjectSpace(p55)
                local v69
                if u16 then
                    v69 = p56 * CFrame.Angles(0, -v67, 0)
                else
                    v69 = p56 * CFrame.Angles(0, v67, 0)
                end
                p55 = v69 * v68
            end
            if p53.VRCameraFocusFrozen and v66 or p53.needsReset then
                u5:RecenterUserHeadCFrame()
                p53.VRCameraFocusFrozen = false
                p53.needsReset = false
                p53.lastCameraResetPosition = p58
                p53:ResetZoom()
                p53:StartFadeFromBlack()
                local v70 = p53:GetHumanoid()
                local v71 = v70.Torso and v70.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
                local v72 = v71.X
                local v73 = v71.Z
                local v74 = Vector3.new(v72, 0, v73)
                local v75 = p56.Position - v74 * v60
                local v76 = p56.Position.X
                local v77 = v75.Y
                local v78 = p56.Position.Z
                local v79 = Vector3.new(v76, v77, v78)
                return CFrame.new(v75, v79), p56
            end
        else
            local v80 = u7.getRotation()
            local v81 = false
            if v80 ~= Vector2.new() and v80.X ~= 0 then
                local v82 = p53.cameraOffsetRotation + v80.X
                if v82 < -3.141592653589793 then
                    v82 = 3.141592653589793 - (v82 + 3.141592653589793)
                elseif v82 > 3.141592653589793 then
                    v82 = -3.141592653589793 + (v82 - 3.141592653589793)
                end
                p53.cameraOffsetRotation = math.clamp(v82, -3.141592653589793, 3.141592653589793)
                if u6.VRSmoothRotationEnabled then
                    p53.cameraOffsetRotationDiscrete = p53.cameraOffsetRotation
                    local v83 = p53:GetHumanoid()
                    local v84 = v83.Torso and v83.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
                    local v85 = v84.X
                    local v86 = v84.Z
                    local v87 = Vector3.new(v85, 0, v86)
                    local v88 = p56.Position - v87 * v60
                    local v89 = p56.Position.X
                    local v90 = v88.Y
                    local v91 = p56.Position.Z
                    local v92 = Vector3.new(v89, v90, v91)
                    local v93 = v92 - (CFrame.new(v88, v92) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p53.cameraOffsetRotationDiscrete)).LookVector * (v92 - v88).Magnitude
                    p55 = CFrame.new(v93, v92)
                else
                    local v94 = p53.cameraOffsetRotation * 12 / 12
                    local v95 = math.floor(v94)
                    if v95 ~= p53.cameraOffsetRotationDiscrete then
                        p53.cameraOffsetRotationDiscrete = v95
                        v81 = true
                    end
                end
            end
            if p53.VRCameraFocusFrozen and v66 or (p53.needsReset or v81) then
                if not v81 then
                    p53.cameraOffsetRotationDiscrete = 0
                    p53.cameraOffsetRotation = 0
                end
                u5:RecenterUserHeadCFrame()
                p53.VRCameraFocusFrozen = false
                p53.needsReset = false
                p53.lastCameraResetPosition = p58
                p53:ResetZoom()
                p53:StartFadeFromBlack()
                local v96 = p53:GetHumanoid()
                local v97 = v96.Torso and v96.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
                local v98 = v97.X
                local v99 = v97.Z
                local v100 = Vector3.new(v98, 0, v99)
                local v101 = p56.Position - v100 * v60
                local v102 = p56.Position.X
                local v103 = v101.Y
                local v104 = p56.Position.Z
                local v105 = Vector3.new(v102, v103, v104)
                if p53.cameraOffsetRotation ~= 0 then
                    v101 = v105 - (CFrame.new(v101, v105) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p53.cameraOffsetRotationDiscrete)).LookVector * (v105 - v101).Magnitude
                end
                p55 = CFrame.new(v101, v105)
            end
        end
    end
    return p55, p56
end
function u21.UpdateThirdPersonFollowTransform(p106, p107, _, _, p108, p109) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u19
        [4] = u16
    --]]
    local v110 = _G.internalCamera
    local v111 = p106:GetCameraToSubjectDistance()
    local v112 = p106:GetVRFocus(p109, p107)
    if p106.needsReset then
        p106.needsReset = false
        u5:RecenterUserHeadCFrame()
        p106:ResetZoom()
        p106:StartFadeFromBlack()
    end
    if p106.recentered then
        local v113 = p106:GetSubjectCFrame()
        if not v113 then
            return v110.CFrame, v110.Focus
        end
        local v114 = v112 * v113.Rotation * CFrame.new(0, 0, v111)
        p106.focusOffset = v112:ToObjectSpace(v114)
        p106.recentered = false
        return v114, v112
    end
    local v115 = v112:ToWorldSpace(p106.focusOffset)
    local v116 = u4.LocalPlayer
    local v117 = p108 - p109
    local v118 = require(v116:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
    local v119 = v118:GetMoveVector()
    if v117.magnitude > 0.01 or v119.magnitude > 0 then
        local v120 = u5:GetUserCFrame(Enum.UserCFrame.Head)
        if u19 then
            v120 = v118:GetEstimatedVRTorsoFrame()
        end
        local v121 = v120.Rotation + v120.Position * v110.HeadScale
        local v122 = v110.CFrame * v121
        local v123 = v122.LookVector
        local v124 = v123.X
        local v125 = v123.Z
        local v126 = Vector3.new(v124, 0, v125).Unit * v111
        local v127 = v112.Position - v126
        v115 = v115:Lerp(CFrame.new(v110.CFrame.Position + v127 - v122.Position) * v115.Rotation, 0.01)
    end
    local v128 = p106:getRotation(p107)
    if math.abs(v128) > 0 then
        local v129 = v112:ToObjectSpace(v115)
        local v130
        if u16 then
            v130 = v112 * CFrame.Angles(0, -v128, 0)
        else
            v130 = v112 * CFrame.Angles(0, v128, 0)
        end
        v115 = v130 * v129
    end
    p106.focusOffset = v112:ToObjectSpace(v115)
    local v131 = v115 * CFrame.new(0, 0, -v111)
    if (v131.Position - v110.Focus.Position).Magnitude > 0.01 then
        p106:StartVREdgeBlur(u4.LocalPlayer)
    end
    return v115, v131
end
function u21.EnterFirstPerson(p132) --[[ Line: 457 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u20
    --]]
    if u3 then
        u20.EnterFirstPerson(p132)
    else
        p132.inFirstPerson = true
        p132:UpdateMouseBehavior()
    end
end
function u21.LeaveFirstPerson(p133) --[[ Line: 466 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u20
    --]]
    if u3 then
        u20.LeaveFirstPerson(p133)
        p133.needsReset = true
        if p133.VRBlur then
            p133.VRBlur.Visible = false
            return
        end
    else
        p133.inFirstPerson = false
        p133.needsReset = true
        p133:UpdateMouseBehavior()
        if p133.VRBlur then
            p133.VRBlur.Visible = false
        end
    end
end
return u21