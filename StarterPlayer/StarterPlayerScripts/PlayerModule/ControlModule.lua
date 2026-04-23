-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = {}
u1.__index = u1
local u2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local u4 = game:GetService("UserInputService")
local u5 = game:GetService("GuiService")
local u6 = game:GetService("Workspace")
local u7 = UserSettings():GetService("UserGameSettings")
local u8 = game:GetService("VRService")
local u9 = require(script:WaitForChild("Keyboard"))
local u10 = require(script:WaitForChild("Gamepad"))
local u11 = require(script:WaitForChild("DynamicThumbstick"))
local v12, v13 = pcall(function() --[[ Line: 42 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local u14 = v12 and v13
local v15, v16 = pcall(function() --[[ Line: 49 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixVRSwimming")
end)
local u17 = v15 and v16
local v18, v19 = pcall(function() --[[ Line: 56 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRSwimmingUsesThumbstick")
end)
local u20 = v18 and v19
local v21, v22 = pcall(function() --[[ Line: 63 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRFollowCamera2")
end)
local u23 = v21 and v22
local v24, v25 = pcall(function() --[[ Line: 70 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRTorsoEstimation")
end)
local u26 = v24 and v25
local u27 = require(script:WaitForChild("TouchThumbstick"))
local u28 = require(script:WaitForChild("ClickToMoveController"))
local u29 = require(script:WaitForChild("TouchJump"))
local u30 = require(script:WaitForChild("VehicleController"))
local u31 = Enum.ContextActionPriority.Medium.Value
local u32 = {
    [Enum.TouchMovementMode.DPad] = u11,
    [Enum.DevTouchMovementMode.DPad] = u11,
    [Enum.TouchMovementMode.Thumbpad] = u11,
    [Enum.DevTouchMovementMode.Thumbpad] = u11,
    [Enum.TouchMovementMode.Thumbstick] = u27,
    [Enum.DevTouchMovementMode.Thumbstick] = u27,
    [Enum.TouchMovementMode.DynamicThumbstick] = u11,
    [Enum.DevTouchMovementMode.DynamicThumbstick] = u11,
    [Enum.TouchMovementMode.ClickToMove] = u28,
    [Enum.DevTouchMovementMode.ClickToMove] = u28,
    [Enum.TouchMovementMode.Default] = u11,
    [Enum.ComputerMovementMode.Default] = u9,
    [Enum.ComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.Scriptable] = nil,
    [Enum.ComputerMovementMode.ClickToMove] = u28,
    [Enum.DevComputerMovementMode.ClickToMove] = u28
}
local u33 = {
    [Enum.UserInputType.Keyboard] = u9,
    [Enum.UserInputType.MouseButton1] = u9,
    [Enum.UserInputType.MouseButton2] = u9,
    [Enum.UserInputType.MouseButton3] = u9,
    [Enum.UserInputType.MouseWheel] = u9,
    [Enum.UserInputType.MouseMovement] = u9,
    [Enum.UserInputType.Gamepad1] = u10,
    [Enum.UserInputType.Gamepad2] = u10,
    [Enum.UserInputType.Gamepad3] = u10,
    [Enum.UserInputType.Gamepad4] = u10
}
local u34 = nil
function u1.new() --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u30
        [4] = u31
        [5] = u3
        [6] = u4
        [7] = u7
        [8] = u5
    --]]
    local v35 = u1
    local u36 = setmetatable({}, v35)
    u36.controllers = {}
    u36.activeControlModule = nil
    u36.activeController = nil
    u36.touchJumpController = nil
    u36.moveFunction = u2.LocalPlayer.Move
    u36.humanoid = nil
    u36.lastInputType = Enum.UserInputType.None
    u36.controlsEnabled = true
    u36.humanoidSeatedConn = nil
    u36.vehicleController = nil
    u36.touchControlFrame = nil
    u36.currentTorsoAngle = 0
    u36.vehicleController = u30.new(u31)
    u2.LocalPlayer.CharacterAdded:Connect(function(p37) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnCharacterAdded(p37)
    end)
    u2.LocalPlayer.CharacterRemoving:Connect(function(p38) --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnCharacterRemoving(p38)
    end)
    if u2.LocalPlayer.Character then
        u36:OnCharacterAdded(u2.LocalPlayer.Character)
    end
    u3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p39) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnRenderStepped(p39)
    end)
    u4.LastInputTypeChanged:Connect(function(p40) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnLastInputTypeChanged(p40)
    end)
    u7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnTouchMovementModeChange()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnTouchMovementModeChange()
    end)
    u7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnComputerMovementModeChange()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:OnComputerMovementModeChange()
    end)
    u36.playerGui = nil
    u36.touchGui = nil
    u36.playerGuiAddedConn = nil
    u5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 199 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:UpdateTouchGuiVisibility()
        u36:UpdateActiveControlModuleEnabled()
    end)
    if not u4.TouchEnabled then
        u36:OnLastInputTypeChanged(u4:GetLastInputType())
        return u36
    end
    u36.playerGui = u2.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not u36.playerGui then
        u36.playerGuiAddedConn = u2.LocalPlayer.ChildAdded:Connect(function(p41) --[[ Line: 210 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u4
            --]]
            if p41:IsA("PlayerGui") then
                u36.playerGui = p41
                u36:CreateTouchGuiContainer()
                u36.playerGuiAddedConn:Disconnect()
                u36.playerGuiAddedConn = nil
                u36:OnLastInputTypeChanged(u4:GetLastInputType())
            end
        end)
        return u36
    end
    u36:CreateTouchGuiContainer()
    u36:OnLastInputTypeChanged(u4:GetLastInputType())
    return u36
end
function u1.GetMoveVector(p42) --[[ Line: 230 ]]
    return not p42.activeController and Vector3.new(0, 0, 0) or p42.activeController:GetMoveVector()
end
function u1.GetEstimatedVRTorsoFrame(p43) --[[ Line: 250 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v44 = u8:GetUserCFrame(Enum.UserCFrame.Head)
    local _, v45, _ = v44:ToEulerAnglesYXZ()
    local v46 = -v45
    if u8:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and u8:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        local v47 = u8:GetUserCFrame(Enum.UserCFrame.LeftHand)
        local v48 = u8:GetUserCFrame(Enum.UserCFrame.RightHand)
        local v49 = v44.Position - v47.Position
        local v50 = v44.Position - v48.Position
        local v51 = v49.X
        local v52 = v49.Z
        local v53 = -math.atan2(v51, v52)
        local v54 = v50.X
        local v55 = v50.Z
        local v56 = (-math.atan2(v54, v55) - v53 + 12.566370614359172) % 6.283185307179586
        if v56 > 3.141592653589793 then
            v56 = v56 - 6.283185307179586
        end
        local v57 = (v53 + v56 / 2 + 12.566370614359172) % 6.283185307179586
        if v57 > 3.141592653589793 then
            v57 = v57 - 6.283185307179586
        end
        local v58 = (v46 - p43.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v58 > 3.141592653589793 then
            v58 = v58 - 6.283185307179586
        end
        local v59 = (v57 - p43.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v59 > 3.141592653589793 then
            v59 = v59 - 6.283185307179586
        end
        local v60
        if v59 > -1.5707963267948966 then
            v60 = v59 < 1.5707963267948966
        else
            v60 = false
        end
        if not v60 then
            v59 = v58
        end
        local v61 = math.min(v59, v58)
        local v62 = math.max(v59, v58)
        local v63 = 0
        if v61 > 0 then
            v62 = v61
        elseif v62 >= 0 then
            v62 = v63
        end
        p43.currentTorsoAngle = v62 + p43.currentTorsoAngle
    else
        p43.currentTorsoAngle = v46
    end
    return CFrame.new(v44.Position) * CFrame.fromEulerAnglesYXZ(0, -p43.currentTorsoAngle, 0)
end
function u1.GetActiveController(p64) --[[ Line: 294 ]]
    return p64.activeController
end
function u1.UpdateActiveControlModuleEnabled(u65) --[[ Line: 299 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u28
        [3] = u5
        [4] = u4
        [5] = u27
        [6] = u11
    --]]
    local function v66() --[[ Line: 309 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u28
            [3] = u2
        --]]
        if u65.activeControlModule == u28 then
            u65.activeController:Enable(true, u2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, u65.touchJumpController)
            return
        elseif u65.touchControlFrame then
            u65.activeController:Enable(true, u65.touchControlFrame)
        else
            u65.activeController:Enable(true)
        end
    end
    if u65.activeController then
        if u65.controlsEnabled then
            if u5.TouchControlsEnabled or (not u4.TouchEnabled or u65.activeControlModule ~= u28 and (u65.activeControlModule ~= u27 and u65.activeControlModule ~= u11)) then
                v66()
            else
                u65.activeController:Enable(false)
                if u65.moveFunction then
                    u65.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
                end
            end
        else
            u65.activeController:Enable(false)
            if u65.moveFunction then
                u65.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
            end
            return
        end
    else
        return
    end
end
function u1.Enable(p67, p68) --[[ Line: 349 ]]
    p67.controlsEnabled = p68 == nil and true or p68
    if p67.activeController then
        p67:UpdateActiveControlModuleEnabled()
    end
end
function u1.Disable(p69) --[[ Line: 363 ]]
    p69.controlsEnabled = false
    p69:UpdateActiveControlModuleEnabled()
end
function u1.SelectComputerMovementModule(_) --[[ Line: 371 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u33
        [4] = u34
        [5] = u7
        [6] = u9
        [7] = u28
        [8] = u32
    --]]
    if u4.KeyboardEnabled or u4.GamepadEnabled then
        local v70 = u2.LocalPlayer.DevComputerMovementMode
        local v71
        if v70 == Enum.DevComputerMovementMode.UserChoice then
            v71 = u33[u34]
            if u7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v71 == u9 then
                v71 = u28
            end
        else
            local _ = u32[v70]
            v71 = u33[u34]
            if not v71 and v70 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", v70)
            end
        end
        if v71 then
            return v71, true
        elseif v70 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true
        else
            return nil, false
        end
    else
        return nil, false
    end
end
function u1.SelectTouchModule(_) --[[ Line: 411 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u32
        [4] = u7
    --]]
    if not u4.TouchEnabled then
        return nil, false
    end
    local v72 = u2.LocalPlayer.DevTouchMovementMode
    local v73
    if v72 == Enum.DevTouchMovementMode.UserChoice then
        v73 = u32[u7.TouchMovementMode]
    else
        if v72 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true
        end
        v73 = u32[v72]
    end
    return v73, true
end
local function u76() --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v74 = u4:GetGamepadState(Enum.UserInputType.Gamepad1)
    for _, v75 in pairs(v74) do
        if v75.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v75.Position
        end
    end
    return Vector3.new(0, 0, 0)
end
function u1.calculateRawMoveVector(p77, p78, p79) --[[ Line: 437 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u17
        [3] = u8
        [4] = u23
        [5] = u26
        [6] = u20
        [7] = u76
    --]]
    local v80 = u6.CurrentCamera
    if not v80 then
        return p79
    end
    if not u17 and p78:GetState() == Enum.HumanoidStateType.Swimming then
        return v80.CFrame:VectorToWorldSpace(p79)
    end
    local v81 = v80.CFrame
    if u8.VREnabled and p78.RootPart then
        if u23 then
            local v82 = u8:GetUserCFrame(Enum.UserCFrame.Head)
            if u26 then
                v82 = p77:GetEstimatedVRTorsoFrame()
            end
            if (v80.Focus.Position - v81.Position).Magnitude < 3 then
                v81 = v81 * v82
            else
                v81 = v80.CFrame * (v82.Rotation + v82.Position * v80.HeadScale)
            end
        elseif (p78.RootPart.CFrame.Position - v81.Position).Magnitude < 3 then
            v81 = v81 * u8:GetUserCFrame(Enum.UserCFrame.Head)
        end
    end
    if not u17 or p78:GetState() ~= Enum.HumanoidStateType.Swimming then
        local _, _, _, v87, v84, v85, _, _, v86, _, _, v87 = v81:GetComponents()
        if v86 >= 1 or v86 <= -1 then
            v85 = -v84 * math.sign(v86)
        end
        local v88 = v87 * v87 + v85 * v85
        local v89 = math.sqrt(v88)
        local v90 = (v87 * p79.X + v85 * p79.Z) / v89
        local v91 = (v87 * p79.Z - v85 * p79.X) / v89
        return Vector3.new(v90, 0, v91)
    end
    if not (u20 and u8.VREnabled) then
        return v81:VectorToWorldSpace(p79)
    end
    local v92 = p79.X
    local v93 = p79.Z
    local v94 = Vector3.new(v92, 0, v93)
    if v94.Magnitude < 0.01 then
        return Vector3.new(0, 0, 0)
    end
    local v95 = -u76().Y * 1.3962634015954636
    local v96 = -v94.X
    local v97 = -v94.Z
    local v98 = math.atan2(v96, v97)
    local _, v99, _ = v81:ToEulerAnglesYXZ()
    local v100 = v98 + v99
    return CFrame.fromEulerAnglesYXZ(v95, v100, 0).LookVector
end
function u1.OnRenderStepped(p101, p102) --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    if p101.activeController and (p101.activeController.enabled and p101.humanoid) then
        p101.activeController:OnRenderStepped(p102)
        local v103 = p101.activeController:GetMoveVector()
        local v104 = p101.activeController:IsMoveVectorCameraRelative()
        local v105 = p101:GetClickToMoveController()
        if p101.activeController ~= v105 then
            if v103.magnitude > 0 then
                v105:CleanupPath()
            else
                v105:OnRenderStepped(p102)
                v103 = v105:GetMoveVector()
                v104 = v105:IsMoveVectorCameraRelative()
            end
        end
        if p101.vehicleController then
            local v106
            v103, v106 = p101.vehicleController:Update(v103, v104, p101.activeControlModule == u10)
        end
        if v104 then
            v103 = p101:calculateRawMoveVector(p101.humanoid, v103)
        end
        p101.moveFunction(u2.LocalPlayer, v103, false)
        local v107 = p101.humanoid
        local v108 = not p101.activeController:GetIsJumping() and p101.touchJumpController
        if v108 then
            v108 = p101.touchJumpController:GetIsJumping()
        end
        v107.Jump = v108
    end
end
function u1.OnHumanoidSeated(p109, p110, p111) --[[ Line: 559 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if p110 then
        if p111 and p111:IsA("VehicleSeat") then
            if not p109.vehicleController then
                p109.vehicleController = p109.vehicleController.new(u31)
            end
            p109.vehicleController:Enable(true, p111)
            return
        end
    elseif p109.vehicleController then
        p109.vehicleController:Enable(false, p111)
    end
end
function u1.OnCharacterAdded(u112, p113) --[[ Line: 574 ]]
    u112.humanoid = p113:FindFirstChildOfClass("Humanoid")
    while not u112.humanoid do
        p113.ChildAdded:wait()
        u112.humanoid = p113:FindFirstChildOfClass("Humanoid")
    end
    u112:UpdateTouchGuiVisibility()
    if u112.humanoidSeatedConn then
        u112.humanoidSeatedConn:Disconnect()
        u112.humanoidSeatedConn = nil
    end
    u112.humanoidSeatedConn = u112.humanoid.Seated:Connect(function(p114, p115) --[[ Line: 587 ]]
        --[[
        Upvalues:
            [1] = u112
        --]]
        u112:OnHumanoidSeated(p114, p115)
    end)
end
function u1.OnCharacterRemoving(p116, _) --[[ Line: 592 ]]
    p116.humanoid = nil
    p116:UpdateTouchGuiVisibility()
end
function u1.UpdateTouchGuiVisibility(p117) --[[ Line: 598 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p117.touchGui then
        local v118 = p117.humanoid
        if v118 then
            v118 = u5.TouchControlsEnabled
        end
        p117.touchGui.Enabled = v118 and true or false
    end
end
function u1.SwitchToController(p119, p120) --[[ Line: 612 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u28
        [3] = u27
        [4] = u11
        [5] = u29
    --]]
    if p120 then
        if not p119.controllers[p120] then
            p119.controllers[p120] = p120.new(u31)
        end
        if p119.activeController ~= p119.controllers[p120] then
            if p119.activeController then
                p119.activeController:Enable(false)
            end
            p119.activeController = p119.controllers[p120]
            p119.activeControlModule = p120
            if p119.touchControlFrame and (p119.activeControlModule == u28 or (p119.activeControlModule == u27 or p119.activeControlModule == u11)) then
                if not p119.controllers[u29] then
                    p119.controllers[u29] = u29.new()
                end
                p119.touchJumpController = p119.controllers[u29]
                p119.touchJumpController:Enable(true, p119.touchControlFrame)
            elseif p119.touchJumpController then
                p119.touchJumpController:Enable(false)
            end
            p119:UpdateActiveControlModuleEnabled()
        end
    else
        if p119.activeController then
            p119.activeController:Enable(false)
        end
        p119.activeController = nil
        p119.activeControlModule = nil
    end
end
function u1.OnLastInputTypeChanged(p121, p122) --[[ Line: 655 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u33
    --]]
    if u34 == p122 then
        warn("LastInputType Change listener called with current type.")
    end
    u34 = p122
    if u34 == Enum.UserInputType.Touch then
        local v123, v124 = p121:SelectTouchModule()
        if v124 then
            while not p121.touchControlFrame do
                wait()
            end
            p121:SwitchToController(v123)
        end
    elseif u33[u34] ~= nil then
        local v125 = p121:SelectComputerMovementModule()
        if v125 then
            p121:SwitchToController(v125)
        end
    end
    p121:UpdateTouchGuiVisibility()
end
function u1.OnComputerMovementModeChange(p126) --[[ Line: 682 ]]
    local v127, v128 = p126:SelectComputerMovementModule()
    if v128 then
        p126:SwitchToController(v127)
    end
end
function u1.OnTouchMovementModeChange(p129) --[[ Line: 689 ]]
    local v130, v131 = p129:SelectTouchModule()
    if v131 then
        while not p129.touchControlFrame do
            wait()
        end
        p129:SwitchToController(v130)
    end
end
function u1.CreateTouchGuiContainer(p132) --[[ Line: 699 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p132.touchGui then
        p132.touchGui:Destroy()
    end
    p132.touchGui = Instance.new("ScreenGui")
    p132.touchGui.Name = "TouchGui"
    p132.touchGui.ResetOnSpawn = false
    p132.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    p132:UpdateTouchGuiVisibility()
    if u14 then
        p132.touchGui.ClipToDeviceSafeArea = false
    end
    p132.touchControlFrame = Instance.new("Frame")
    p132.touchControlFrame.Name = "TouchControlFrame"
    p132.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
    p132.touchControlFrame.BackgroundTransparency = 1
    p132.touchControlFrame.Parent = p132.touchGui
    p132.touchGui.Parent = p132.playerGui
end
function u1.GetClickToMoveController(p133) --[[ Line: 722 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u31
    --]]
    if not p133.controllers[u28] then
        p133.controllers[u28] = u28.new(u31)
    end
    return p133.controllers[u28]
end
return u1.new()