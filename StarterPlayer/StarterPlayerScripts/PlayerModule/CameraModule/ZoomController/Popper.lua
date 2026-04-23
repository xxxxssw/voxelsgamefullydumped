-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = game:GetService("Players")
local u2 = workspace.CurrentCamera
local u3 = math.min
local u4 = math.tan
local u5 = math.rad
local u6 = Ray.new
local u7 = nil
local u8 = nil
local u9 = workspace.CurrentCamera
local function v13() --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u8
        [4] = u4
        [5] = u7
    --]]
    local v10 = u5(u9.FieldOfView)
    local v11 = u9.ViewportSize
    local v12 = v11.X / v11.Y
    u8 = u4(v10 / 2) * 2
    u7 = v12 * u8
end
u9:GetPropertyChangedSignal("FieldOfView"):Connect(v13)
u9:GetPropertyChangedSignal("ViewportSize"):Connect(v13)
local v14 = u5(u9.FieldOfView)
local v15 = u9.ViewportSize
local v16 = v15.X / v15.Y
u8 = u4(v14 / 2) * 2
u7 = v16 * u8
local u17 = u9.NearPlaneZ
u9:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
    --]]
    u17 = u9.NearPlaneZ
end)
local u18 = {}
local u19 = {}
local function v30(u20) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
    --]]
    local function v24(p21) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u18
        --]]
        u19[u20] = p21
        local v22 = 1
        u18 = {}
        for _, v23 in pairs(u19) do
            u18[v22] = v23
            v22 = v22 + 1
        end
    end
    local function v27() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u18
        --]]
        u19[u20] = nil
        local v25 = 1
        u18 = {}
        for _, v26 in pairs(u19) do
            u18[v25] = v26
            v25 = v25 + 1
        end
    end
    u20.CharacterAdded:Connect(v24)
    u20.CharacterRemoving:Connect(v27)
    if u20.Character then
        u19[u20] = u20.Character
        local v28 = 1
        u18 = {}
        for _, v29 in pairs(u19) do
            u18[v28] = v29
            v28 = v28 + 1
        end
    end
end
local function v34(p31) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
    --]]
    u19[p31] = nil
    local v32 = 1
    u18 = {}
    for _, v33 in pairs(u19) do
        u18[v32] = v33
        v32 = v32 + 1
    end
end
v1.PlayerAdded:Connect(v30)
v1.PlayerRemoving:Connect(v34)
local u35 = u8
local u36 = u7
local u37 = u17
for _, v38 in ipairs(v1:GetPlayers()) do
    v30(v38)
end
local v39 = 1
u18 = {}
local u40 = u18
for _, v41 in pairs(u19) do
    u40[v39] = v41
    v39 = v39 + 1
end
local u42 = nil
local u43 = nil
u2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u43
    --]]
    local v44 = u2.CameraSubject
    if v44:IsA("Humanoid") then
        u43 = v44.RootPart
        return
    elseif v44:IsA("BasePart") then
        u43 = v44
    else
        u43 = nil
    end
end)
local u45 = {
    Vector2.new(0.4, 0),
    Vector2.new(-0.4, 0),
    Vector2.new(0, -0.4),
    Vector2.new(0, 0.4),
    Vector2.new(0, 0.2)
}
local function u55(p46, p47) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u6
    --]]
    local v48 = #u40
    while true do
        local v49, v50 = workspace:FindPartOnRayWithIgnoreList(u6(p46, p47), u40, false, true)
        if v49 then
            if v49.CanCollide then
                local v51 = u40
                for v52 = #v51, v48 + 1, -1 do
                    v51[v52] = nil
                end
                return v50, true
            end
            u40[#u40 + 1] = v49
        end
        if not v49 then
            local v53 = u40
            for v54 = #v53, v48 + 1, -1 do
                v53[v54] = nil
            end
            return p46 + p47, false
        end
    end
end
local function u77(p56, p57, p58, p59) --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u37
        [3] = u6
        [4] = u42
    --]]
    debug.profilebegin("queryPoint")
    local v60 = #u40
    local v61 = p58 + u37
    local v62 = p56 + p57 * v61
    local v63 = p56
    local v64 = 0
    local v65 = (1 / 0)
    local v66 = (1 / 0)
    while true do
        local v67, v68 = workspace:FindPartOnRayWithIgnoreList(u6(p56, v62 - p56), u40, false, true)
        v64 = v64 + 1
        local v69
        if v67 then
            local v70 = v64 >= 64
            local v71 = v67.Name ~= "BarrierChunk" and (1 - (1 - v67.Transparency) * (1 - v67.LocalTransparencyModifier) < 0.25 and v67.CanCollide)
            if v71 then
                if u42 == (v67:GetRootPart() or v67) then
                    v71 = false
                else
                    v71 = not v67:IsA("TrussPart")
                end
            end
            if v71 or v70 then
                local v72 = { v67 }
                local v73 = workspace:FindPartOnRayWithWhitelist(u6(v62, v68 - v62), v72, true)
                v69 = (v68 - v63).Magnitude
                if v73 and not v70 then
                    local v74
                    if p59 then
                        v74 = workspace:FindPartOnRayWithWhitelist(u6(p59, v62 - p59), v72, true) or workspace:FindPartOnRayWithWhitelist(u6(v62, p59 - v62), v72, true)
                    else
                        v74 = false
                    end
                    if v74 then
                        v65 = v69
                        v69 = v66
                    elseif v61 >= v66 then
                        v69 = v66
                    end
                else
                    v65 = v69
                    v69 = v66
                end
            else
                v69 = v66
            end
            u40[#u40 + 1] = v67
            p56 = v68 - p57 * 0.001
        else
            v69 = v66
        end
        if v65 < (1 / 0) or not v67 then
            local v75 = u40
            for v76 = #v75, v60 + 1, -1 do
                v75[v76] = nil
            end
            debug.profileend()
            return v69 - u37, v65 - u37
        end
        v66 = v69
    end
end
local function u92(p78, p79) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u36
        [3] = u35
        [4] = u37
        [5] = u77
    --]]
    debug.profilebegin("queryViewport")
    local v80 = p78.p
    local v81 = p78.rightVector
    local v82 = p78.upVector
    local v83 = -p78.lookVector
    local v84 = u2.ViewportSize
    local v85 = (1 / 0)
    local v86 = (1 / 0)
    for v87 = 0, 1 do
        local v88 = v81 * ((v87 - 0.5) * u36)
        for v89 = 0, 1 do
            local v90, v91 = u77(v80 + u37 * (v88 + v82 * ((v89 - 0.5) * u35)), v83, p79, u2:ViewportPointToRay(v84.x * v87, v84.y * v89).Origin)
            if v91 >= v85 then
                v91 = v85
            end
            if v90 < v86 then
                v86 = v90
                v85 = v91
            else
                v85 = v91
            end
        end
    end
    debug.profileend()
    return v86, v85
end
local function u106(p93, p94, p95) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u55
        [2] = u3
        [3] = u77
        [4] = u45
    --]]
    debug.profilebegin("testPromotion")
    local v96 = p93.p
    local v97 = p93.rightVector
    local v98 = p93.upVector
    local v99 = -p93.lookVector
    debug.profilebegin("extrapolate")
    local v100 = (u55(v96, p95.posVelocity * 1.25) - v96).Magnitude
    local v101 = p95.posVelocity.magnitude
    for v102 = 0, u3(1.25, p95.rotVelocity.magnitude + v100 / v101), 0.0625 do
        local v103 = p95.extrapolate(v102)
        if p94 <= u77(v103.p, -v103.lookVector, p94) then
            return false
        end
    end
    debug.profileend()
    debug.profilebegin("testOffsets")
    for _, v104 in ipairs(u45) do
        local v105 = u55(v96, v97 * v104.x + v98 * v104.y)
        if u77(v105, (v96 + v99 * p94 - v105).Unit, p94) == (1 / 0) then
            return false
        end
    end
    debug.profileend()
    debug.profileend()
    return true
end
return function(p107, p108, p109) --[[ Name: Popper, Line 329 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u43
        [3] = u92
        [4] = u106
    --]]
    debug.profilebegin("popper")
    u42 = u43 and u43:GetRootPart() or u43
    local v110, v111 = u92(p107, p108)
    if v111 >= p108 then
        v111 = p108
    end
    if v110 < v111 then
        if not u106(p107, p108, p109) then
            v110 = v111
        end
    else
        v110 = v111
    end
    u42 = nil
    debug.profileend()
    return v110
end