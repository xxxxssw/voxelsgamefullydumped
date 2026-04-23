-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.MouseLockController
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = Enum.ContextActionPriority.Medium.Value
local u2 = game:GetService("Players")
local u3 = game:GetService("ContextActionService")
local u4 = UserSettings().GameSettings
local u5 = require(script.Parent:WaitForChild("CameraUtils"))
local u6 = {}
u6.__index = u6
function u6.new() --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u2
    --]]
    local v7 = u6
    local u8 = setmetatable({}, v7)
    u8.isMouseLocked = false
    u8.savedMouseCursor = nil
    u8.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift }
    u8.mouseLockToggledEvent = Instance.new("BindableEvent")
    local v9 = script:FindFirstChild("BoundKeys")
    if not (v9 and v9:IsA("StringValue")) then
        if v9 then
            v9:Destroy()
        end
        v9 = Instance.new("StringValue")
        assert(v9, "")
        v9.Name = "BoundKeys"
        v9.Value = "LeftShift,RightShift"
        v9.Parent = script
    end
    if v9 then
        v9.Changed:Connect(function(p10) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8:OnBoundKeysObjectChanged(p10)
        end)
        u8:OnBoundKeysObjectChanged(v9.Value)
    end
    u4.Changed:Connect(function(p11) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if p11 == "ControlMode" or p11 == "ComputerMovementMode" then
            u8:UpdateMouseLockAvailability()
        end
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:UpdateMouseLockAvailability()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:UpdateMouseLockAvailability()
    end)
    u8:UpdateMouseLockAvailability()
    return u8
end
function u6.GetIsMouseLocked(p12) --[[ Line: 79 ]]
    return p12.isMouseLocked
end
function u6.GetBindableToggleEvent(p13) --[[ Line: 83 ]]
    return p13.mouseLockToggledEvent.Event
end
function u6.GetMouseLockOffset(_) --[[ Line: 87 ]]
    local v14 = script:FindFirstChild("CameraOffset")
    if v14 and v14:IsA("Vector3Value") then
        return v14.Value
    end
    if v14 then
        v14:Destroy()
    end
    local v15 = Instance.new("Vector3Value")
    assert(v15, "")
    v15.Name = "CameraOffset"
    v15.Value = Vector3.new(1.75, 0, 0)
    v15.Parent = script
    return not (v15 and v15.Value) and Vector3.new(1.75, 0, 0) or v15.Value
end
function u6.UpdateMouseLockAvailability(p16) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v17 = u2.LocalPlayer.DevEnableMouseLock
    local v18 = u2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
    local v19 = v17 and (u4.ControlMode == Enum.ControlMode.MouseLockSwitch and u4.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove)
    if v19 then
        v19 = not v18
    end
    if v19 ~= p16.enabled then
        p16:EnableMouseLock(v19)
    end
end
function u6.OnBoundKeysObjectChanged(p20, p21) --[[ Line: 122 ]]
    p20.boundKeys = {}
    for v22 in string.gmatch(p21, "[^%s,]+") do
        for _, v23 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v22 == v23.Name then
                p20.boundKeys[#p20.boundKeys + 1] = v23
                break
            end
        end
    end
    p20:UnbindContextActions()
    p20:BindContextActions()
end
function u6.OnMouseLockToggled(p24) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    p24.isMouseLocked = not p24.isMouseLocked
    if p24.isMouseLocked then
        local v25 = script:FindFirstChild("CursorImage")
        if v25 and (v25:IsA("StringValue") and v25.Value) then
            u5.setMouseIconOverride(v25.Value)
        else
            if v25 then
                v25:Destroy()
            end
            local v26 = Instance.new("StringValue")
            assert(v26, "")
            v26.Name = "CursorImage"
            v26.Value = "rbxasset://textures/MouseLockedCursor.png"
            v26.Parent = script
            u5.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
        end
    else
        u5.restoreMouseIcon()
    end
    p24.mouseLockToggledEvent:Fire()
end
function u6.DoMouseLockSwitch(p27, _, p28, _) --[[ Line: 162 ]]
    if p28 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass
    end
    p27:OnMouseLockToggled()
    return Enum.ContextActionResult.Sink
end
function u6.BindContextActions(u29) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v30 = u3
    local v31 = u1
    local v32 = u29.boundKeys
    v30:BindActionAtPriority("MouseLockSwitchAction", function(p33, p34, p35) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        return u29:DoMouseLockSwitch(p33, p34, p35)
    end, false, v31, unpack(v32))
end
function u6.UnbindContextActions(_) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3:UnbindAction("MouseLockSwitchAction")
end
function u6.IsMouseLocked(p36) --[[ Line: 180 ]]
    local v37 = p36.enabled
    if v37 then
        v37 = p36.isMouseLocked
    end
    return v37
end
function u6.EnableMouseLock(p38, p39) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p39 ~= p38.enabled then
        p38.enabled = p39
        if p38.enabled then
            p38:BindContextActions()
            return
        end
        u5.restoreMouseIcon()
        p38:UnbindContextActions()
        if p38.isMouseLocked then
            p38.mouseLockToggledEvent:Fire()
        end
        p38.isMouseLocked = false
    end
end
return u6