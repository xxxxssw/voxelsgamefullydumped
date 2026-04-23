-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = game:GetService("ReplicatedStorage")
local v2 = Instance.new("Camera")
v2.Name = "InternalCamera"
v2.Parent = nil
_G.internalCamera = v2
cameraFarAway = v1:WaitForChild("Client"):WaitForChild("States"):WaitForChild("SetCameraFarAway")
local u3 = {}
u3.__index = u3
local u4 = {
    "CameraMinZoomDistance",
    "CameraMaxZoomDistance",
    "CameraMode",
    "DevCameraOcclusionMode",
    "DevComputerCameraMode",
    "DevTouchCameraMode",
    "DevComputerMovementMode",
    "DevTouchMovementMode",
    "DevEnableMouseLock"
}
local u5 = {
    "ComputerCameraMovementMode",
    "ComputerMovementMode",
    "ControlMode",
    "GamepadCameraSensitivity",
    "MouseSensitivity",
    "RotationType",
    "TouchCameraMovementMode",
    "TouchMovementMode"
}
local u6 = game:GetService("Players")
local u7 = game:GetService("RunService")
local u8 = game:GetService("UserInputService")
local u9 = game:GetService("VRService")
local u10 = UserSettings():GetService("UserGameSettings")
local u11 = require(script:WaitForChild("CameraUtils"))
local u12 = require(script:WaitForChild("CameraInput"))
local u13 = require(script:WaitForChild("ClassicCamera", 20))
local u14 = require(script:WaitForChild("OrbitalCamera"))
local u15 = require(script:WaitForChild("LegacyCamera"))
local u16 = require(script:WaitForChild("VehicleCamera"))
local u17 = require(script:WaitForChild("VRCamera"))
local u18 = require(script:WaitForChild("VRVehicleCamera"))
local u19 = require(script:WaitForChild("Invisicam"))
local u20 = require(script:WaitForChild("Poppercam"))
local u21 = require(script:WaitForChild("TransparencyController"))
local u22 = require(script:WaitForChild("MouseLockController"))
local u23 = {}
local u24 = {}
local v25 = u6.LocalPlayer:WaitForChild("PlayerScripts")
v25:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
v25:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
v25:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
v25:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
v25:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
v25:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
v25:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
function u3.new() --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u21
        [4] = u8
        [5] = u22
        [6] = u7
        [7] = u4
        [8] = u5
        [9] = u10
    --]]
    local v26 = u3
    local u27 = setmetatable({}, v26)
    u27.activeCameraController = nil
    u27.activeOcclusionModule = nil
    u27.activeTransparencyController = nil
    u27.activeMouseLockController = nil
    u27.currentComputerCameraMovementMode = nil
    u27.cameraSubjectChangedConn = nil
    u27.cameraTypeChangedConn = nil
    for _, v28 in pairs(u6:GetPlayers()) do
        u27:OnPlayerAdded(v28)
    end
    u6.PlayerAdded:Connect(function(p29) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnPlayerAdded(p29)
    end)
    u27.activeTransparencyController = u21.new()
    u27.activeTransparencyController:Enable(true)
    if not u8.TouchEnabled then
        u27.activeMouseLockController = u22.new()
        local v30 = u27.activeMouseLockController:GetBindableToggleEvent()
        if v30 then
            v30:Connect(function() --[[ Line: 138 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:OnMouseLockToggled()
            end)
        end
    end
    u27:ActivateCameraController(u27:GetCameraControlChoice())
    u27:ActivateOcclusionModule(u6.LocalPlayer.DevCameraOcclusionMode)
    u27:OnCurrentCameraChanged()
    u7:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p31) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:Update(p31)
    end)
    for _, u32 in pairs(u4) do
        u6.LocalPlayer:GetPropertyChangedSignal(u32):Connect(function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u32
            --]]
            u27:OnLocalPlayerCameraPropertyChanged(u32)
        end)
    end
    for _, u33 in pairs(u5) do
        u10:GetPropertyChangedSignal(u33):Connect(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u33
            --]]
            u27:OnUserGameSettingsPropertyChanged(u33)
        end)
    end
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnCurrentCameraChanged()
    end)
    return u27
end
function u3.GetCameraMovementModeFromSettings(_) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u8
        [4] = u10
    --]]
    if u6.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return u11.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
    else
        local v34, v35
        if u8.TouchEnabled then
            v34 = u11.ConvertCameraModeEnumToStandard(u6.LocalPlayer.DevTouchCameraMode)
            v35 = u11.ConvertCameraModeEnumToStandard(u10.TouchCameraMovementMode)
        else
            v34 = u11.ConvertCameraModeEnumToStandard(u6.LocalPlayer.DevComputerCameraMode)
            v35 = u11.ConvertCameraModeEnumToStandard(u10.ComputerCameraMovementMode)
        end
        if v34 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v35
        else
            return v34
        end
    end
end
function u3.ActivateOcclusionModule(p36, p37) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u19
        [3] = u24
        [4] = u6
    --]]
    local v38
    if p37 == Enum.DevCameraOcclusionMode.Zoom then
        v38 = u20
    else
        if p37 ~= Enum.DevCameraOcclusionMode.Invisicam then
            warn("CameraScript ActivateOcclusionModule called with unsupported mode")
            return
        end
        v38 = u19
    end
    p36.occlusionMode = p37
    if p36.activeOcclusionModule and p36.activeOcclusionModule:GetOcclusionMode() == p37 then
        if not p36.activeOcclusionModule:GetEnabled() then
            p36.activeOcclusionModule:Enable(true)
        end
    else
        local v39 = p36.activeOcclusionModule
        p36.activeOcclusionModule = u24[v38]
        if not p36.activeOcclusionModule then
            p36.activeOcclusionModule = v38.new()
            if p36.activeOcclusionModule then
                u24[v38] = p36.activeOcclusionModule
            end
        end
        if p36.activeOcclusionModule then
            if p36.activeOcclusionModule:GetOcclusionMode() ~= p37 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", p36.activeOcclusionModule:GetOcclusionMode(), "~=", p37)
            end
            if v39 then
                if v39 == p36.activeOcclusionModule then
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module")
                else
                    v39:Enable(false)
                end
            end
            if p37 == Enum.DevCameraOcclusionMode.Invisicam then
                if u6.LocalPlayer.Character then
                    p36.activeOcclusionModule:CharacterAdded(u6.LocalPlayer.Character, u6.LocalPlayer)
                end
            else
                for _, v40 in pairs(u6:GetPlayers()) do
                    if v40 and v40.Character then
                        p36.activeOcclusionModule:CharacterAdded(v40.Character, v40)
                    end
                end
                p36.activeOcclusionModule:OnCameraSubjectChanged(_G.internalCamera.CameraSubject)
            end
            p36.activeOcclusionModule:Enable(true)
        end
    end
end
function u3.ShouldUseVehicleCamera(p41) --[[ Line: 272 ]]
    local v42 = _G.internalCamera
    if not v42 then
        return false
    end
    local v43 = v42.CameraType
    local v44 = v42.CameraSubject
    local v45 = v43 == Enum.CameraType.Custom and true or v43 == Enum.CameraType.Follow
    local v46 = v44 and v44:IsA("VehicleSeat") or false
    local v47 = p41.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam
    if v46 then
        if not v45 then
            v47 = v45
        end
    else
        v47 = v46
    end
    return v47
end
function u3.ActivateCameraController(p48, p49, p50) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
        [3] = u17
        [4] = u13
        [5] = u14
        [6] = u18
        [7] = u16
        [8] = u23
    --]]
    local v51 = nil
    if p50 ~= nil then
        if p50 == Enum.CameraType.Scriptable then
            if p48.activeCameraController then
                p48.activeCameraController:Enable(false)
                p48.activeCameraController = nil
            end
            return
        end
        if p50 == Enum.CameraType.Custom then
            p49 = p48:GetCameraMovementModeFromSettings()
        elseif p50 == Enum.CameraType.Track then
            p49 = Enum.ComputerCameraMovementMode.Classic
        elseif p50 == Enum.CameraType.Follow then
            p49 = Enum.ComputerCameraMovementMode.Follow
        elseif p50 == Enum.CameraType.Orbital then
            p49 = Enum.ComputerCameraMovementMode.Orbital
        elseif p50 == Enum.CameraType.Attach or (p50 == Enum.CameraType.Watch or p50 == Enum.CameraType.Fixed) then
            v51 = u15
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", p50)
        end
    end
    if not v51 then
        if u9.VREnabled then
            v51 = u17
        elseif p49 == Enum.ComputerCameraMovementMode.Classic or (p49 == Enum.ComputerCameraMovementMode.Follow or (p49 == Enum.ComputerCameraMovementMode.Default or p49 == Enum.ComputerCameraMovementMode.CameraToggle)) then
            v51 = u13
        else
            if p49 ~= Enum.ComputerCameraMovementMode.Orbital then
                warn("ActivateCameraController did not select a module.")
                return
            end
            v51 = u14
        end
    end
    if p48:ShouldUseVehicleCamera() then
        if u9.VREnabled then
            v51 = u18
        else
            v51 = u16
        end
    end
    local v52
    if u23[v51] then
        v52 = u23[v51]
        if v52.Reset then
            v52:Reset()
        end
    else
        v52 = v51.new()
        u23[v51] = v52
    end
    if p48.activeCameraController then
        if p48.activeCameraController == v52 then
            if not p48.activeCameraController:GetEnabled() then
                p48.activeCameraController:Enable(true)
            end
        else
            p48.activeCameraController:Enable(false)
            p48.activeCameraController = v52
            p48.activeCameraController:Enable(true)
        end
    elseif v52 ~= nil then
        p48.activeCameraController = v52
        p48.activeCameraController:Enable(true)
    end
    if p48.activeCameraController then
        if p49 ~= nil then
            p48.activeCameraController:SetCameraMovementMode(p49)
            return
        end
        if p50 ~= nil then
            p48.activeCameraController:SetCameraType(p50)
        end
    end
end
function u3.OnCameraSubjectChanged(p53) --[[ Line: 395 ]]
    local v54 = _G.internalCamera
    local v55
    if v54 then
        v55 = v54.CameraSubject
    else
        v55 = v54
    end
    if p53.activeTransparencyController then
        p53.activeTransparencyController:SetSubject(v55)
    end
    if p53.activeOcclusionModule then
        p53.activeOcclusionModule:OnCameraSubjectChanged(v55)
    end
    p53:ActivateCameraController(nil, v54.CameraType)
end
function u3.OnCameraTypeChanged(p56, p57) --[[ Line: 410 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
    --]]
    if p57 == Enum.CameraType.Scriptable and u8.MouseBehavior == Enum.MouseBehavior.LockCenter then
        u11.restoreMouseBehavior()
    end
    p56:ActivateCameraController(nil, p57)
end
function u3.OnCurrentCameraChanged(u58) --[[ Line: 422 ]]
    local u59 = _G.internalCamera
    if u59 then
        if u58.cameraSubjectChangedConn then
            u58.cameraSubjectChangedConn:Disconnect()
        end
        if u58.cameraTypeChangedConn then
            u58.cameraTypeChangedConn:Disconnect()
        end
        u58.cameraSubjectChangedConn = u59:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 434 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u59
            --]]
            u58:OnCameraSubjectChanged(u59.CameraSubject)
        end)
        u58.cameraTypeChangedConn = u59:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 438 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u59
            --]]
            u58:OnCameraTypeChanged(u59.CameraType)
        end)
        u58:OnCameraSubjectChanged(u59.CameraSubject)
        u58:OnCameraTypeChanged(u59.CameraType)
    end
end
function u3.OnLocalPlayerCameraPropertyChanged(p60, p61) --[[ Line: 446 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    if p61 == "CameraMode" then
        if u6.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
            if u6.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
                local v62 = p60:GetCameraMovementModeFromSettings()
                p60:ActivateCameraController(u11.ConvertCameraModeEnumToStandard(v62))
            else
                warn("Unhandled value for property player.CameraMode: ", u6.LocalPlayer.CameraMode)
            end
        end
        if not p60.activeCameraController or p60.activeCameraController:GetModuleName() ~= "ClassicCamera" then
            p60:ActivateCameraController(u11.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic))
        end
        if p60.activeCameraController then
            p60.activeCameraController:UpdateForDistancePropertyChange()
            return
        end
    else
        if p61 == "DevComputerCameraMode" or p61 == "DevTouchCameraMode" then
            local v63 = p60:GetCameraMovementModeFromSettings()
            p60:ActivateCameraController(u11.ConvertCameraModeEnumToStandard(v63))
            return
        end
        if p61 == "DevCameraOcclusionMode" then
            p60:ActivateOcclusionModule(u6.LocalPlayer.DevCameraOcclusionMode)
            return
        end
        if p61 == "CameraMinZoomDistance" or p61 == "CameraMaxZoomDistance" then
            if p60.activeCameraController then
                p60.activeCameraController:UpdateForDistancePropertyChange()
                return
            end
        else
            if p61 == "DevTouchMovementMode" then
                return
            end
            if p61 == "DevComputerMovementMode" then
                return
            end
            local _ = p61 == "DevEnableMouseLock"
        end
    end
end
function u3.OnUserGameSettingsPropertyChanged(p64, p65) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p65 == "ComputerCameraMovementMode" then
        local v66 = p64:GetCameraMovementModeFromSettings()
        p64:ActivateCameraController(u11.ConvertCameraModeEnumToStandard(v66))
    end
end
function u3.Update(p67, p68) --[[ Line: 503 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p67.activeCameraController then
        p67.activeCameraController:UpdateMouseBehavior()
        local v69, v70 = p67.activeCameraController:Update(p68)
        if p67.activeOcclusionModule then
            v69, v70 = p67.activeOcclusionModule:Update(p68, v69, v70)
        end
        local v71 = _G.internalCamera
        v71.CFrame = v69
        v71.Focus = v70
        v71.CameraSubject = workspace.CurrentCamera.CameraSubject
        v71.CameraType = workspace.CurrentCamera.CameraType
        local v72, v73, v74 = CFrame.lookAt(Vector3.new(), v71.CFrame.LookVector * Vector3.new(1, 1, 1)):ToEulerAnglesYXZ()
        local v75 = CFrame.new()
        local v76 = game.ReplicatedStorage:FindFirstChild("Client")
        if v76 then
            local v77 = v76:FindFirstChild("Libs")
            if v77 ~= nil then
                local v78 = v77:FindFirstChild("Tilt", true)
                if v78 then
                    v75 = v78.Value
                end
            end
        end
        local v79 = CFrame.fromEulerAnglesYXZ(v72 * 1.1125, v73, v74)
        workspace.CurrentCamera.CFrame = CFrame.new(v71.CFrame.Position) * v79 * v75
        workspace.CurrentCamera.Focus = v71.Focus
        if cameraFarAway.Value then
            workspace.CurrentCamera.CFrame = CFrame.new(Vector3.new(0, 100000, 0))
        end
        if p67.activeTransparencyController then
            p67.activeTransparencyController:Update(p68)
        end
        if u12.getInputEnabled() then
            u12.resetInputForFrameEnd()
        end
    end
end
function u3.GetCameraControlChoice(_) --[[ Line: 559 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u11
        [4] = u10
    --]]
    local v80 = u6.LocalPlayer
    if v80 then
        if u8:GetLastInputType() == Enum.UserInputType.Touch or u8.TouchEnabled then
            if v80.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                return u11.ConvertCameraModeEnumToStandard(u10.TouchCameraMovementMode)
            else
                return u11.ConvertCameraModeEnumToStandard(v80.DevTouchCameraMode)
            end
        else
            if v80.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
                return u11.ConvertCameraModeEnumToStandard(v80.DevComputerCameraMode)
            end
            local v81 = u11.ConvertCameraModeEnumToStandard(u10.ComputerCameraMovementMode)
            return u11.ConvertCameraModeEnumToStandard(v81)
        end
    else
        return
    end
end
function u3.OnCharacterAdded(p82, p83, p84) --[[ Line: 582 ]]
    if p82.activeOcclusionModule then
        p82.activeOcclusionModule:CharacterAdded(p83, p84)
    end
end
function u3.OnCharacterRemoving(p85, p86, p87) --[[ Line: 588 ]]
    if p85.activeOcclusionModule then
        p85.activeOcclusionModule:CharacterRemoving(p86, p87)
    end
end
function u3.OnPlayerAdded(u88, u89) --[[ Line: 594 ]]
    u89.CharacterAdded:Connect(function(p90) --[[ Line: 595 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u89
        --]]
        u88:OnCharacterAdded(p90, u89)
    end)
    u89.CharacterRemoving:Connect(function(p91) --[[ Line: 598 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u89
        --]]
        u88:OnCharacterRemoving(p91, u89)
    end)
end
function u3.OnMouseLockToggled(p92) --[[ Line: 603 ]]
    if p92.activeMouseLockController then
        local v93 = p92.activeMouseLockController:GetIsMouseLocked()
        local v94 = p92.activeMouseLockController:GetMouseLockOffset()
        if p92.activeCameraController then
            p92.activeCameraController:SetIsMouseLocked(v93)
            p92.activeCameraController:SetMouseLockOffset(v94)
        end
    end
end
return u3.new()