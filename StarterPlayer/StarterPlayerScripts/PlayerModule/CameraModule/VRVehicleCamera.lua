-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1, v2 = pcall(function() --[[ Line: 9 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRPlayerScriptsMisc")
end)
local u3 = v1 and v2
local v5, v5 = pcall(function() --[[ Line: 17 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera")
end)
if v5 then
    if v5 then
        v5 = u3
    end
end
local u6 = v5
local u7 = { 0, 30 }
local u8 = UserSettings():GetService("UserGameSettings")
local u9 = require(script.Parent:WaitForChild("VRBaseCamera"))
local u10 = require(script.Parent:WaitForChild("CameraInput"))
local u11 = require(script.Parent:WaitForChild("CameraUtils"))
local u12 = require(script.Parent:WaitForChild("ZoomController"))
require(script.Parent:WaitForChild("VehicleCamera"))
local u13 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"))
local u14 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"))
local v15 = game:GetService("Players")
local u16 = game:GetService("RunService")
local u17 = game:GetService("VRService")
local u18 = v15.LocalPlayer
local u19 = u11.Spring
local u20 = u11.mapClamp
local u21 = u11.sanitizeAngle
local u22 = 0.016666666666666666
local u23 = setmetatable({}, u9)
u23.__index = u23
function u23.new() --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u23
        [3] = u16
        [4] = u22
    --]]
    local v24 = u9.new()
    local v25 = u23
    local v26 = setmetatable(v24, v25)
    v26:Reset()
    u16.Stepped:Connect(function(_, p27) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22 = p27
    end)
    return v26
end
function u23.Reset(p28) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u19
        [4] = u14
        [5] = u11
        [6] = u3
        [7] = u7
    --]]
    p28.vehicleCameraCore = u13.new(p28:GetSubjectCFrame())
    if u6 then
        p28.pitchSpring = u19.new(0, 0)
    else
        local v29 = u19.new
        local v30 = u14.pitchBaseAngle
        p28.pitchSpring = v29(0, -math.rad(v30))
    end
    p28.yawSpring = u19.new(0, 0)
    if u6 then
        p28.lastPanTick = 0
        p28.currentDriftAngle = 0
        p28.needsReset = true
    end
    local v31 = _G.internalCamera
    local v32
    if v31 then
        v32 = v31.CameraSubject
    else
        v32 = v31
    end
    assert(v31, "VRVehicleCamera initialization error")
    assert(v32)
    assert(v32:IsA("VehicleSeat"))
    local v33 = v32:GetConnectedParts(true)
    local v34, v35 = u11.getLooseBoundingSphere(v33)
    local v36
    if u3 then
        v36 = math.max(v35, 5)
    else
        v36 = math.max(v35, 0.001)
    end
    p28.assemblyRadius = v36
    p28.assemblyOffset = v32.CFrame:Inverse() * v34
    if u3 then
        p28.gamepadZoomLevels = {}
        for _, v37 in u7 do
            local v38 = p28.gamepadZoomLevels
            local v39 = v37 * p28.headScale * p28.assemblyRadius / 10
            table.insert(v38, v39)
        end
        p28.lastCameraFocus = nil
        p28:SetCameraToSubjectDistance(p28.gamepadZoomLevels[#p28.gamepadZoomLevels])
    else
        p28.lastCameraFocus = nil
        p28:_StepInitialZoom()
    end
end
function u23._StepInitialZoom(p40) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    local v41 = u12.GetZoomRadius()
    local v42 = p40.assemblyRadius * u14.initialZoomRadiusMul
    p40:SetCameraToSubjectDistance((math.max(v41, v42)))
end
function u23._StepRotation(p43, p44, p45) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u10
        [3] = u14
        [4] = u20
    --]]
    local v46 = p43.yawSpring
    local v47 = p43.pitchSpring
    local v48 = -p43:getRotation(p44)
    v46.pos = u21(v46.pos + v48)
    local v49 = u21
    local v50 = v47.pos
    v47.pos = v49((math.clamp(v50, -1.3962634015954636, 1.3962634015954636)))
    if u10.getRotationActivated() then
        p43.lastPanTick = os.clock()
    end
    local v51 = u14.pitchDeadzoneAngle
    local v52 = math.rad(v51)
    if os.clock() - p43.lastPanTick > u14.autocorrectDelay then
        local v53 = u20(p45, u14.autocorrectMinCarSpeed, u14.autocorrectMaxCarSpeed, 0, u14.autocorrectResponse)
        v46.freq = v53
        v47.freq = v53
        if v46.freq < 0.001 then
            v46.vel = 0
        end
        if v47.freq < 0.001 then
            v47.vel = 0
        end
        local v54 = u21(0 - v47.pos)
        if math.abs(v54) <= v52 then
            v47.goal = v47.pos
        else
            v47.goal = 0
        end
    else
        v46.freq = 0
        v46.vel = 0
        v47.freq = 0
        v47.vel = 0
        v47.goal = 0
    end
    return CFrame.fromEulerAnglesYXZ(v47:step(p44), v46:step(p44), 0)
end
function u23._GetThirdPersonLocalOffset(p55) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v56 = p55.assemblyOffset
    local v57 = p55.assemblyRadius * u14.verticalCenterOffset
    return v56 + Vector3.new(0, v57, 0)
end
function u23._GetFirstPersonLocalOffset(p58, p59) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v60 = u18.Character
    if v60 and v60.Parent then
        local v61 = v60:FindFirstChild("Head")
        if v61 and v61:IsA("BasePart") then
            return p59:Inverse() * v61.Position
        end
    end
    return p58:_GetThirdPersonLocalOffset()
end
function u23.Update(p62) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
        [3] = u18
        [4] = u17
    --]]
    if u6 then
        local v63 = u22
        u22 = 0
        p62:UpdateFadeFromBlack(u22)
        p62:UpdateEdgeBlur(u18, u22)
        if u17.ThirdPersonFollowCamEnabled then
            local v64, v65 = p62:UpdateStepRotation(v63)
            return v64, v65
        else
            local v66, v67 = p62:UpdateComfortCamera(v63)
            return v66, v67
        end
    else
        return p62:UpdateComfortCamera()
    end
end
function u23.addDrift(p68, p69, p70) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
    --]]
    local v71 = _G.internalCamera
    local v72 = p68:GetCameraToSubjectDistance()
    local v73 = p68:GetSubjectVelocity()
    local v74 = p68:GetSubjectCFrame()
    require(u18:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
    if v73.Magnitude > 0.1 then
        local v75 = u17:GetUserCFrame(Enum.UserCFrame.Head)
        local v76 = v75.Rotation + v75.Position * v71.HeadScale
        local v77 = v71.CFrame * v76
        local _, v78, _ = v77:ToEulerAnglesYXZ()
        local _, v79, _ = v74:ToEulerAnglesYXZ()
        local v80 = (v78 - p68.currentDriftAngle + 12.566370614359172) % 6.283185307179586
        if v80 > 3.141592653589793 then
            v80 = v80 - 6.283185307179586
        end
        local v81 = (v79 - p68.currentDriftAngle + 12.566370614359172) % 6.283185307179586
        if v81 > 3.141592653589793 then
            v81 = v81 - 6.283185307179586
        end
        local v82 = math.min(v81, v80)
        local v83 = math.max(v81, v80)
        local v84 = 0
        if v82 > 0 then
            v83 = v82
        elseif v83 >= 0 then
            v83 = v84
        end
        p68.currentDriftAngle = v83 + p68.currentDriftAngle
        local v85 = CFrame.fromEulerAnglesYXZ(0, p68.currentDriftAngle, 0).LookVector
        local v86 = v85.X
        local v87 = v85.Z
        local v88 = Vector3.new(v86, 0, v87).Unit * v72
        local v89 = p70.Position - v88
        p69 = p69:Lerp(CFrame.new(v71.CFrame.Position + v89 - v77.Position) * v71.CFrame.Rotation, 0.01)
    end
    return p69, p70
end
function u23.UpdateRotationCamera(p90, p91) --[[ Line: 303 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u18
    --]]
    local v92 = _G.internalCamera
    local v93
    if v92 then
        v93 = v92.CameraSubject
    else
        v93 = v92
    end
    local v94 = p90.vehicleCameraCore
    assert(v92)
    assert(v93)
    assert(v93:IsA("VehicleSeat"))
    local v95 = p90:GetSubjectCFrame()
    local v96 = p90:GetSubjectVelocity()
    local v97 = p90:GetSubjectRotVelocity()
    local v98 = v96:Dot(v95.ZVector)
    local v99 = math.abs(v98)
    local v100 = v95.YVector:Dot(v97)
    local v101 = math.abs(v100)
    local v102 = v95.XVector:Dot(v97)
    local v103 = math.abs(v102)
    local v104 = p90:GetCameraToSubjectDistance()
    local v105 = u20(v104, 0.5, p90.assemblyRadius, 1, 0)
    local v106 = p90:_GetThirdPersonLocalOffset():Lerp(p90:_GetFirstPersonLocalOffset(v95), v105)
    v94:setTransform(v95)
    local v107 = v94:step(p91, v103, v101, v105)
    local v108 = p90:_StepRotation(p91, v99)
    local v109 = p90:GetVRFocus(v95 * v106, p91) * v107 * v108
    local v110 = v109 * CFrame.new(0, 0, v104)
    if v96.Magnitude > 0.1 then
        p90:StartVREdgeBlur(u18)
    end
    return v110, v109
end
function u23.UpdateStepRotation(p111, p112) --[[ Line: 350 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u8
        [3] = u17
        [4] = u18
    --]]
    local v113 = _G.internalCamera
    local v114 = p111.lastSubjectCFrame
    local v115 = p111:GetSubjectCFrame()
    local v116 = p111:GetSubjectVelocity()
    local v117 = p111:GetCameraToSubjectDistance()
    local v118 = u20(v117, 0.5, p111.assemblyRadius, 1, 0)
    local v119 = p111:_GetThirdPersonLocalOffset():Lerp(p111:_GetFirstPersonLocalOffset(v115), v118)
    local v120 = p111:GetVRFocus(v115 * v119, p112)
    local v121, v122 = p111:addDrift(v120:ToWorldSpace(p111:GetVRFocus(v114 * v119, p112):ToObjectSpace(v113.CFrame)), v120)
    local v123 = p111:getRotation(p112)
    local v124
    if math.abs(v123) > 0 then
        local v125 = v122:ToObjectSpace(v121)
        v124 = v122 * CFrame.Angles(0, -v123, 0) * v125
        if not u8.VRSmoothRotationEnabled then
            local v126 = u17:GetUserCFrame(Enum.UserCFrame.Head)
            local v127 = v126.Rotation + v126.Position * v113.HeadScale
            local v128 = v122 * v115.Rotation
            local v129 = v128:ToObjectSpace(v121 * v127)
            local v130 = v129.X
            local v131 = v129.Z
            local v132 = Vector3.new(v130, 0, v131).Unit:Dot(Vector3.new(0, 0, 1))
            local v133 = math.acos(v132)
            local v134 = v128:ToObjectSpace(v124 * v127)
            local v135 = v134.X
            local v136 = v134.Z
            local v137 = Vector3.new(v135, 0, v136).Unit:Dot(Vector3.new(0, 0, 1))
            if math.acos(v137) < v133 then
                if v123 < 0 then
                    v133 = v133 * -1
                end
                v124 = v122 * CFrame.Angles(0, -v133, 0) * v125
            end
        end
    else
        v124 = v121
    end
    if v116.Magnitude > 0.1 then
        p111:StartVREdgeBlur(u18)
    end
    if p111.needsReset then
        p111.needsReset = false
        u17:RecenterUserHeadCFrame()
        p111:StartFadeFromBlack()
        p111:ResetZoom()
    end
    if p111.recentered then
        v124 = v122 * v115.Rotation * CFrame.new(0, 0, v117)
        p111.recentered = false
    end
    return v124, v124 * CFrame.new(0, 0, -v117)
end
function u23.UpdateComfortCamera(p138, p139) --[[ Line: 436 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
        [3] = u20
        [4] = u3
        [5] = u18
    --]]
    local v140 = _G.internalCamera
    local v141
    if v140 then
        v141 = v140.CameraSubject
    else
        v141 = v140
    end
    local v142 = p138.vehicleCameraCore
    assert(v140)
    assert(v141)
    assert(v141:IsA("VehicleSeat"))
    if not u6 then
        p139 = u22
        u22 = 0
    end
    local v143 = p138:GetSubjectCFrame()
    local v144 = p138:GetSubjectVelocity()
    local v145 = p138:GetSubjectRotVelocity()
    local v146 = v144:Dot(v143.ZVector)
    math.abs(v146)
    local v147 = v143.YVector:Dot(v145)
    local v148 = math.abs(v147)
    local v149 = v143.XVector:Dot(v145)
    local v150 = math.abs(v149)
    local v151 = p138:StepZoom()
    local v152 = u20(v151, 0.5, p138.assemblyRadius, 1, 0)
    local v153 = p138:_GetThirdPersonLocalOffset():Lerp(p138:_GetFirstPersonLocalOffset(v143), v152)
    v142:setTransform(v143)
    local v154 = v142:step(p139, v150, v148, v152)
    if not u6 then
        p138:UpdateFadeFromBlack(p139)
    end
    local v155, v156
    if p138:IsInFirstPerson() then
        local v157 = v154.LookVector.X
        local v158 = v154.LookVector.Z
        local v159 = Vector3.new(v157, 0, v158).Unit
        local v160 = CFrame.new(v154.Position, v159)
        v155 = CFrame.new(v143 * v153) * v160
        v156 = v155 * CFrame.new(0, 0, v151)
        if u6 then
            if v144.Magnitude > 0.1 then
                p138:StartVREdgeBlur(u18)
            end
        else
            p138:StartVREdgeBlur(u18)
        end
    else
        v155 = CFrame.new(v143 * v153) * v154
        v156 = v155 * CFrame.new(0, 0, v151)
        if not p138.lastCameraFocus then
            p138.lastCameraFocus = v155
            p138.needsReset = true
        end
        local v161 = v155.Position - v140.CFrame.Position
        local v162 = v161.magnitude
        if v161.Unit:Dot(v140.CFrame.LookVector) > 0.56 and (v162 < 200 and not p138.needsReset) then
            v155 = p138.lastCameraFocus
            local v163 = v155.p
            local v164 = p138:GetCameraLookVector()
            local v165 = v164.X
            local v166 = v164.Z
            local v167 = p138:CalculateNewLookVectorFromArg(Vector3.new(v165, 0, v166).Unit, Vector2.new(0, 0))
            v156 = CFrame.new(v163 - v151 * v167, v163)
        else
            if not u3 then
                p138.currentSubjectDistance = 16
            end
            p138.lastCameraFocus = p138:GetVRFocus(v143.Position, p139)
            p138.needsReset = false
            p138:StartFadeFromBlack()
            p138:ResetZoom()
        end
        if not u6 then
            p138:UpdateEdgeBlur(u18, p139)
        end
    end
    return v156, v155
end
function u23.EnterFirstPerson(p168) --[[ Line: 544 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
    --]]
    if u3 then
        u9.EnterFirstPerson(p168)
    else
        p168.inFirstPerson = true
        p168:UpdateMouseBehavior()
    end
end
function u23.LeaveFirstPerson(p169) --[[ Line: 553 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
    --]]
    if u3 then
        u9.LeaveFirstPerson(p169)
    else
        p169.inFirstPerson = false
        p169:UpdateMouseBehavior()
    end
end
return u23