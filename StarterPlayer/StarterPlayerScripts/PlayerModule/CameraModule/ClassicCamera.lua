-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ClassicCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1, v2 = pcall(function() --[[ Line: 14 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u3 = v1 and v2
Vector2.new(0, 0)
local u4 = 0
local u5 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local u6 = game:GetService("Players")
local u7 = game:GetService("VRService")
local u8 = require(script.Parent:WaitForChild("CameraInput"))
local u9 = require(script.Parent:WaitForChild("CameraUtils"))
local u10 = require(script.Parent:WaitForChild("BaseCamera"))
local u11 = setmetatable({}, u10)
u11.__index = u11
function u11.new() --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u9
    --]]
    local v12 = u10.new()
    local v13 = u11
    local v14 = setmetatable(v12, v13)
    v14.isFollowCamera = false
    v14.isCameraToggle = false
    v14.lastUpdate = tick()
    v14.cameraToggleSpring = u9.Spring.new(5, 0)
    return v14
end
function u11.GetCameraToggleOffset(p15, p16) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
    --]]
    if not p15.isCameraToggle then
        return Vector3.new()
    end
    local v17 = p15.currentSubjectDistance
    if u8.getTogglePan() then
        local v18 = p15.cameraToggleSpring
        local v19 = u9.map(v17, 0.5, p15.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1)
        v18.goal = math.clamp(v19, 0, 1)
    else
        p15.cameraToggleSpring.goal = 0
    end
    local v20 = u9.map(v17, 0.5, 64, 0, 1)
    local v21 = math.clamp(v20, 0, 1) + 1
    local v22 = p15.cameraToggleSpring:step(p16) * v21
    return Vector3.new(0, v22, 0)
end
function u11.SetCameraMovementMode(p23, p24) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.SetCameraMovementMode(p23, p24)
    p23.isFollowCamera = p24 == Enum.ComputerCameraMovementMode.Follow
    p23.isCameraToggle = p24 == Enum.ComputerCameraMovementMode.CameraToggle
end
function u11.Update(p25) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u8
        [4] = u4
        [5] = u9
        [6] = u7
    --]]
    local v26 = tick()
    local v27 = v26 - p25.lastUpdate
    local v28 = _G.internalCamera
    local v29 = v28.CFrame
    local v30 = v28.Focus
    local v31
    if p25.resetCameraAngle then
        local v32 = p25:GetHumanoidRootPart()
        if v32 then
            v31 = (v32.CFrame * u5).lookVector
        else
            v31 = u5.lookVector
        end
        p25.resetCameraAngle = false
    else
        v31 = nil
    end
    local v33 = u6.LocalPlayer
    local v34 = p25:GetHumanoid()
    local v35 = v28.CameraSubject
    local v36
    if v35 then
        v36 = v35:IsA("VehicleSeat")
    else
        v36 = v35
    end
    local v37
    if v35 then
        v37 = v35:IsA("SkateboardPlatform")
    else
        v37 = v35
    end
    local v38
    if v34 then
        v38 = v34:GetState() == Enum.HumanoidStateType.Climbing
    else
        v38 = v34
    end
    if p25.lastUpdate == nil or v27 > 1 then
        p25.lastCameraTransform = nil
    end
    local v39 = u8.getRotation()
    p25:StepZoom()
    local v40 = p25:GetCameraHeight()
    if u8.getRotation() ~= Vector2.new() then
        u4 = 0
        p25.lastUserPanCamera = tick()
    end
    local v41 = v26 - p25.lastUserPanCamera < 2
    local v42 = p25:GetSubjectPosition()
    if v42 and (v33 and v28) then
        local v43 = p25:GetCameraToSubjectDistance()
        local v44 = v43 < 0.5 and 0.5 or v43
        if p25:GetIsMouseLocked() and not p25:IsInFirstPerson() then
            local v45 = p25:CalculateNewLookCFrameFromArg(v31, v39)
            local v46 = p25:GetMouseLockOffset()
            local v47 = v46.X * v45.RightVector + v46.Y * v45.UpVector + v46.Z * v45.LookVector
            if u9.IsFiniteVector3(v47) then
                v42 = v42 + v47
            end
        elseif u8.getRotation() == Vector2.new() and p25.lastCameraTransform then
            local v48 = p25:IsInFirstPerson()
            if (v36 or (v37 or p25.isFollowCamera and v38)) and (p25.lastUpdate and (v34 and v34.Torso)) then
                if v48 then
                    if p25.lastSubjectCFrame and (v36 or v37) and v35:IsA("BasePart") then
                        local v49 = -u9.GetAngleBetweenXZVectors(p25.lastSubjectCFrame.lookVector, v35.CFrame.lookVector)
                        if u9.IsFinite(v49) then
                            v39 = v39 + Vector2.new(v49, 0)
                        end
                        u4 = 0
                    end
                elseif not v41 then
                    local v50 = v34.Torso.CFrame.lookVector
                    local v51 = u4 + 3.839724354387525 * v27
                    u4 = math.clamp(v51, 0, 4.363323129985824)
                    local v52 = u4 * v27
                    local v53 = math.clamp(v52, 0, 1)
                    local v54 = p25:IsInFirstPerson() and not (p25.isFollowCamera and p25.isClimbing) and 1 or v53
                    local v55 = u9.GetAngleBetweenXZVectors(v50, p25:GetCameraLookVector())
                    if u9.IsFinite(v55) and math.abs(v55) > 0.0001 then
                        v39 = v39 + Vector2.new(v55 * v54, 0)
                    end
                end
            elseif p25.isFollowCamera and not (v48 or (v41 or u7.VREnabled)) then
                local v56 = -(p25.lastCameraTransform.p - v42)
                local v57 = u9.GetAngleBetweenXZVectors(v56, p25:GetCameraLookVector())
                if u9.IsFinite(v57) and (math.abs(v57) > 0.0001 and math.abs(v57) > 0.4 * v27) then
                    v39 = v39 + Vector2.new(v57, 0)
                end
            end
        end
        local v58
        if p25.isFollowCamera then
            local v59 = p25:CalculateNewLookVectorFromArg(v31, v39)
            if u7.VREnabled then
                v58 = p25:GetVRFocus(v42, v27)
            else
                v58 = CFrame.new(v42)
            end
            v29 = CFrame.new(v58.p - v44 * v59, v58.p) + Vector3.new(0, v40, 0)
        else
            local v60 = u7.VREnabled
            if v60 then
                v58 = p25:GetVRFocus(v42, v27)
            else
                v58 = CFrame.new(v42)
            end
            local v61 = v58.p
            if v60 and not p25:IsInFirstPerson() then
                local v62 = (v42 - v28.CFrame.p).magnitude
                if v44 < v62 or v39.x ~= 0 then
                    local v63 = math.min(v62, v44)
                    local v64 = p25:CalculateNewLookVectorFromArg(nil, v39) * v63
                    local v65 = v61 - v64
                    local v66 = v28.CFrame.lookVector
                    if v39.x == 0 then
                        v64 = v66
                    end
                    local v67 = v65.x + v64.x
                    local v68 = v65.y
                    local v69 = v65.z + v64.z
                    local v70 = Vector3.new(v67, v68, v69)
                    v29 = CFrame.new(v65, v70) + Vector3.new(0, v40, 0)
                end
            else
                local v71 = p25:CalculateNewLookVectorFromArg(v31, v39)
                v29 = CFrame.new(v61 - v44 * v71, v61)
            end
        end
        local v72 = p25:GetCameraToggleOffset(v27)
        v30 = v58 + v72
        v29 = v29 + v72
        p25.lastCameraTransform = v29
        p25.lastCameraFocus = v30
        if (v36 or v37) and v35:IsA("BasePart") then
            p25.lastSubjectCFrame = v35.CFrame
        else
            p25.lastSubjectCFrame = nil
        end
    end
    p25.lastUpdate = v26
    return v29, v30
end
function u11.EnterFirstPerson(p73) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
    --]]
    if u3 then
        u10.EnterFirstPerson(p73)
    else
        p73.inFirstPerson = true
        p73:UpdateMouseBehavior()
    end
end
function u11.LeaveFirstPerson(p74) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
    --]]
    if u3 then
        u10.LeaveFirstPerson(p74)
    else
        p74.inFirstPerson = false
        p74:UpdateMouseBehavior()
    end
end
return u11