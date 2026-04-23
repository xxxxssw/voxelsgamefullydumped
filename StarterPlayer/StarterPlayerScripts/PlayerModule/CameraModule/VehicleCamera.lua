-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1, v2 = pcall(function() --[[ Line: 6 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u3 = v1 and v2
local u4 = { 0, 15, 30 }
local v5 = game:GetService("Players")
local v6 = game:GetService("RunService")
local u7 = require(script.Parent:WaitForChild("BaseCamera"))
local u8 = require(script.Parent:WaitForChild("CameraInput"))
local u9 = require(script.Parent:WaitForChild("CameraUtils"))
local u10 = require(script.Parent:WaitForChild("ZoomController"))
local u11 = require(script:WaitForChild("VehicleCameraCore"))
local u12 = require(script:WaitForChild("VehicleCameraConfig"))
local u13 = v5.LocalPlayer
local _ = u9.map
local u14 = u9.Spring
local u15 = u9.mapClamp
local u16 = u9.sanitizeAngle
local u17 = 0.016666666666666666
v6.Stepped:Connect(function(_, p18) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17 = p18
end)
local u19 = setmetatable({}, u7)
u19.__index = u19
function u19.new() --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u19
    --]]
    local v20 = u7.new()
    local v21 = u19
    local v22 = setmetatable(v20, v21)
    v22:Reset()
    return v22
end
function u19.Reset(p23) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u12
        [4] = u9
        [5] = u3
        [6] = u4
    --]]
    p23.vehicleCameraCore = u11.new(p23:GetSubjectCFrame())
    local v24 = u14.new
    local v25 = u12.pitchBaseAngle
    p23.pitchSpring = v24(0, -math.rad(v25))
    p23.yawSpring = u14.new(0, 0)
    p23.lastPanTick = 0
    local v26 = workspace.CurrentCamera
    local v27
    if v26 then
        v27 = v26.CameraSubject
    else
        v27 = v26
    end
    assert(v26)
    assert(v27)
    assert(v27:IsA("VehicleSeat"))
    local v28 = v27:GetConnectedParts(true)
    local v29, v30 = u9.getLooseBoundingSphere(v28)
    local v31
    if u3 then
        v31 = math.max(v30, 5)
    else
        v31 = math.max(v30, 0.001)
    end
    p23.assemblyRadius = v31
    p23.assemblyOffset = v27.CFrame:Inverse() * v29
    if u3 then
        p23.gamepadZoomLevels = {}
        for _, v32 in u4 do
            local v33 = p23.gamepadZoomLevels
            local v34 = v32 * p23.assemblyRadius / 10
            table.insert(v33, v34)
        end
        p23:SetCameraToSubjectDistance(p23.gamepadZoomLevels[#p23.gamepadZoomLevels])
    else
        p23:_StepInitialZoom()
    end
end
function u19._StepInitialZoom(p35) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    local v36 = u10.GetZoomRadius()
    local v37 = p35.assemblyRadius * u12.initialZoomRadiusMul
    p35:SetCameraToSubjectDistance((math.max(v36, v37)))
end
function u19._StepRotation(p38, p39, p40) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u12
        [4] = u15
    --]]
    local v41 = p38.yawSpring
    local v42 = p38.pitchSpring
    local v43 = u8.getRotation(true)
    local v44 = -v43.X
    local v45 = -v43.Y
    v41.pos = u16(v41.pos + v44)
    local v46 = u16
    local v47 = v42.pos + v45
    v42.pos = v46((math.clamp(v47, -1.3962634015954636, 1.3962634015954636)))
    if u8.getRotationActivated() then
        p38.lastPanTick = os.clock()
    end
    local v48 = u12.pitchBaseAngle
    local v49 = -math.rad(v48)
    local v50 = u12.pitchDeadzoneAngle
    local v51 = math.rad(v50)
    if os.clock() - p38.lastPanTick > u12.autocorrectDelay then
        local v52 = u15(p40, u12.autocorrectMinCarSpeed, u12.autocorrectMaxCarSpeed, 0, u12.autocorrectResponse)
        v41.freq = v52
        v42.freq = v52
        if v41.freq < 0.001 then
            v41.vel = 0
        end
        if v42.freq < 0.001 then
            v42.vel = 0
        end
        local v53 = u16(v49 - v42.pos)
        if math.abs(v53) <= v51 then
            v42.goal = v42.pos
        else
            v42.goal = v49
        end
    else
        v41.freq = 0
        v41.vel = 0
        v42.freq = 0
        v42.vel = 0
        v42.goal = v49
    end
    return CFrame.fromEulerAnglesYXZ(v42:step(p39), v41:step(p39), 0)
end
function u19._GetThirdPersonLocalOffset(p54) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v55 = p54.assemblyOffset
    local v56 = p54.assemblyRadius * u12.verticalCenterOffset
    return v55 + Vector3.new(0, v56, 0)
end
function u19._GetFirstPersonLocalOffset(p57, p58) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v59 = u13.Character
    if v59 and v59.Parent then
        local v60 = v59:FindFirstChild("Head")
        if v60 and v60:IsA("BasePart") then
            return p58:Inverse() * v60.Position
        end
    end
    return p57:_GetThirdPersonLocalOffset()
end
function u19.Update(p61) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u15
    --]]
    local v62 = workspace.CurrentCamera
    local v63
    if v62 then
        v63 = v62.CameraSubject
    else
        v63 = v62
    end
    local v64 = p61.vehicleCameraCore
    assert(v62)
    assert(v63)
    assert(v63:IsA("VehicleSeat"))
    local v65 = u17
    u17 = 0
    local v66 = p61:GetSubjectCFrame()
    local v67 = p61:GetSubjectVelocity()
    local v68 = p61:GetSubjectRotVelocity()
    local v69 = v67:Dot(v66.ZVector)
    local v70 = math.abs(v69)
    local v71 = v66.YVector:Dot(v68)
    local v72 = math.abs(v71)
    local v73 = v66.XVector:Dot(v68)
    local v74 = math.abs(v73)
    local v75 = p61:StepZoom()
    local v76 = p61:_StepRotation(v65, v70)
    local v77 = u15(v75, 0.5, p61.assemblyRadius, 1, 0)
    local v78 = p61:_GetThirdPersonLocalOffset():Lerp(p61:_GetFirstPersonLocalOffset(v66), v77)
    v64:setTransform(v66)
    local v79 = v64:step(v65, v74, v72, v77)
    local v80 = CFrame.new(v66 * v78) * v79 * v76
    return v80 * CFrame.new(0, 0, v75), v80
end
function u19.ApplyVRTransform(_) --[[ Line: 236 ]] end
function u19.EnterFirstPerson(p81) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
    --]]
    if u3 then
        u7.EnterFirstPerson(p81)
    else
        p81.inFirstPerson = true
        p81:UpdateMouseBehavior()
    end
end
function u19.LeaveFirstPerson(p82) --[[ Line: 250 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
    --]]
    if u3 then
        u7.LeaveFirstPerson(p82)
    else
        p82.inFirstPerson = false
        p82:UpdateMouseBehavior()
    end
end
return u19