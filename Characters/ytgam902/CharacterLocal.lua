-- Roblox script dump
-- ClassName: LocalScript
-- Path: Workspace.Characters.ytgam902.CharacterLocal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:16

local v1 = game:GetService("Players")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Workspace")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("RunService")
local v6 = game:GetService("ContextActionService")
local u7 = game:GetService("ReplicatedStorage")
local v8 = require(game.ReplicatedStorage.Client.Libs.CameraTilt)
local u9 = require(game.ReplicatedStorage.Systems.CameraSystem)
require(game.ReplicatedStorage.Libs.Cursor)
local v10 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u11 = require(game.ReplicatedStorage.Client.ControlsEnabled)
local u12 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u13 = require(game.ReplicatedStorage.Systems.CombatSystem.Libs.GetFallDamage)
local u14 = require(game.ReplicatedStorage.Systems.CombatSystem)
local v15 = require(game.ReplicatedStorage.Client.Touchscreen)
local u16 = require(game.ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater)
local u17 = require(game.ReplicatedStorage.Client.States.GameState)
local u18 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
local u19 = require(game.ReplicatedStorage.Libs.Coordinates)
local u20 = require(game.ReplicatedStorage.Systems.HumanoidModifiersSystem)
local u21 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u22 = v1.LocalPlayer
local u23 = script.Parent
local u24 = u3.CurrentCamera
u23:WaitForChild("RightArm")
local u25 = u23:WaitForChild("Humanoid")
local u26 = u23:WaitForChild("HumanoidRootPart")
local u27 = u7.Client.States.Sprinting
local u28 = u7.Client.States.Sneaking
u23:WaitForChild("Interacting")
local v29 = u23:WaitForChild("Animations")
local u30 = u23:WaitForChild("Network")
local u31 = u7.Client.States.Sleeping
local u32 = u7.Client.States.PhotoMode
u25:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
u25:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
local u33 = 0
u28.Value = false
u27.Value = false
u7.Client.States.Zooming.Value = false
u7.Client.States.CharacterEating.Value = false
u31.Value = false
u25.Died:Connect(function() --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u31
        [3] = u17
    --]]
    u7.Client.States.Zooming.Value = false
    u31.Value = false
    u17.onHumanoidDeath()
end)
local u34 = u25:LoadAnimation(v29.Punch)
local u35 = u25:LoadAnimation(v29.Eating)
local u36 = u25:LoadAnimation(v29.Sleep)
u7.Client.Events.ArmAnimation.Event:Connect(function() --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    u34:Play()
end)
u7.Client.States.CharacterEating.Changed:Connect(function(p37) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    if p37 then
        u35:Play()
    else
        u35:Stop()
    end
end)
u25:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u31
        [3] = u36
    --]]
    if u25.SeatPart == nil or u25.SeatPart.Name ~= "BedSeat" then
        u31.Value = false
        u36:Stop()
    else
        u31.Value = true
        u36:Play()
    end
end)
local function v43() --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u27
        [3] = u2
        [4] = u3
        [5] = u25
        [6] = u28
        [7] = u20
        [8] = u22
    --]]
    local v38 = u7.Client.States.BaseFov
    local v39 = u27.Value and v38.Value + 10 or v38.Value
    local v40 = u7.Client.States.Zooming.Value and 30 or v39
    u2:Create(u3.CurrentCamera, TweenInfo.new(u27.Value and 0.3 or 0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["FieldOfView"] = v40
    }):Play()
    if u27.Value then
        u25.WalkSpeed = 22.45
    else
        u25.WalkSpeed = 17.268
    end
    if u28.Value then
        u25.WalkSpeed = 5.2
        u25.CameraOffset = Vector3.new(0, -0.8, 0)
    else
        u25.CameraOffset = Vector3.new(0, 1, 0)
        if u20.playerHasModifier(u22, u20.MODIFIERS.SpeedBoost) then
            local v41 = u25
            v41.WalkSpeed = v41.WalkSpeed + 3
        end
    end
    if u7.Client.States.CharacterEating.Value then
        u27.Value = false
        local v42 = u25
        v42.WalkSpeed = v42.WalkSpeed * 0.5
    end
end
v4.InputBegan:Connect(function(p44) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u28
        [3] = u27
        [4] = u33
        [5] = u32
    --]]
    if p44.KeyCode == Enum.KeyCode.ButtonL3 and (u11() and not u28.Value) then
        u27.Value = not u27.Value
    end
    if p44.KeyCode == Enum.KeyCode.W and u11() then
        if tick() - u33 < 0.2 and not u28.Value then
            u27.Value = true
        end
        u33 = tick()
        return
    elseif p44.KeyCode == Enum.KeyCode.LeftControl and u11() then
        u27.Value = true
        return
    elseif p44.KeyCode == Enum.KeyCode.F2 and u11() then
        u32.Value = not u32.Value
    elseif p44.KeyCode == Enum.KeyCode.ButtonR3 and u11() then
        u28.Value = not u28.Value
    end
end)
v4.InputEnded:Connect(function(p45) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    if p45.KeyCode == Enum.KeyCode.W and u27.Value then
        u27.Value = false
    end
end)
u28.Changed:Connect(function(p46) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u30
        [3] = u28
    --]]
    if p46 == true and u25.Sit then
        u25.Sit = false
    end
    u30:FireServer("sneaking", u28.Value)
end)
local u47 = {}
u32.Changed:Connect(function(p48) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u47
    --]]
    local v49 = u22.PlayerGui
    if v49 then
        if p48 then
            for _, v50 in v49:GetChildren() do
                if v50:IsA("ScreenGui") then
                    u47[v50] = v50.Enabled
                    v50.Enabled = false
                end
            end
        else
            for v51, v52 in u47 do
                v51.Enabled = v52
            end
            u47 = {}
        end
    else
        return
    end
end)
v6:BindAction("zooming", function(_, p53, _) --[[ Name: zoomInputHandler, Line 180 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p53 == Enum.UserInputState.Begin then
        u7.Client.States.Zooming.Value = true
    elseif p53 == Enum.UserInputState.End then
        u7.Client.States.Zooming.Value = false
    end
end, false, Enum.KeyCode.Z, Enum.KeyCode.DPadLeft)
u7.Client.States.Zooming.Changed:Connect(v43)
u7.Client.States.BaseFov.Changed:Connect(v43)
u27.Changed:Connect(v43)
u28.Changed:Connect(v43)
u7.Client.States.CharacterEating.Changed:Connect(v43)
u20.localChange:Connect(v43)
v43()
v4.InputEnded:Connect(function(p54, _) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    if p54.KeyCode == Enum.KeyCode.LeftShift then
        u28.Value = false
    end
end)
v6:BindAction("sneakToggle", function(_, p55, _) --[[ Name: sneakToggleHandler, Line 198 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u28
    --]]
    if u11() then
        if p55 == Enum.UserInputState.Begin then
            u28.Value = true
            return
        end
        if p55 == Enum.UserInputState.End then
            u28.Value = false
        end
    end
end, false, Enum.KeyCode.LeftShift)
v15.getInputBeganSignal():Connect(function(p56, _) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u27
        [3] = u28
    --]]
    if u11() then
        if p56 == "sprint" then
            if u27.Value == true then
                u27.Value = false
                return
            end
            if not u28.Value then
                u27.Value = true
                return
            end
        elseif p56 == "sneak" then
            u28.Value = not u28.Value
            if u28.Value then
                u27.Value = false
            end
        end
    end
end)
v15.setLayer("Gameplay")
local function v57() --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u12
        [3] = u30
    --]]
    u23:SetAttribute("EquippedItemId", u12.getCurrentlyHeldItemId())
    u30:FireServer("hotbarSlot", u12.getCurrentHotbarSlot())
end
u12.stateChanged:Connect(v57)
v10.stateChanged:Connect(v57)
u23:SetAttribute("EquippedItemId", u12.getCurrentlyHeldItemId())
u30:FireServer("hotbarSlot", u12.getCurrentHotbarSlot())
local u58 = { "HumanoidRootPart", "Capsule", "DropSystemCollector" }
local u59 = 0
local function v66() --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u59
        [3] = u27
        [4] = u9
        [5] = u23
        [6] = u58
    --]]
    if (u26.Velocity * Vector3.new(1, 0, 1)).Magnitude < 0.25 then
        u59 = u59 + 1
    else
        u59 = 0
    end
    if u59 > 6 then
        u27.Value = false
    end
    local v60
    if u9.currentModeValue.Value == u9.modes.firstPerson then
        v60 = false
    else
        v60 = u9.currentModeValue.Value ~= u9.modes.freeCam
    end
    local v61 = u23:GetChildren()
    for _, v62 in ipairs(u23:GetChildren()) do
        for _, v63 in ipairs(v62:GetChildren()) do
            table.insert(v61, v63)
        end
    end
    for _, v64 in ipairs(v61) do
        if not v64:FindFirstAncestor("Viewmodel") then
            if v64:IsA("SurfaceGui") then
                v64.Enabled = v60
            elseif v64:IsA("Texture") then
                local v65 = v64:GetAttribute("OriginalTransparency") or 0
                v64.Transparency = v60 and v65 and v65 or 1
            elseif (v64:IsA("BasePart") or v64:IsA("PartOperation")) and not table.find(u58, v64.Name) then
                v64.LocalTransparencyModifier = v60 and 0 or 1
            end
        end
    end
end
v5.RenderStepped:Connect(v66)
v8.reset()
local u67 = 0
local u68 = true
local u69 = false
if u25.FloorMaterial == Enum.Material.Air then
    task.spawn(function() --[[ Line: 308 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        while u25.FloorMaterial == Enum.Material.Air do
            task.wait()
        end
        task.wait(5)
    end)
    u68 = false
else
    task.delay(15, function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u68
        --]]
        u68 = false
    end)
end
u9.modeChanged:Connect(function(p70, p71) --[[ Line: 318 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u69
    --]]
    if p70 == u9.modes.freeCam or p71 == u9.modes.freeCam then
        u69 = true
    end
end)
local u72 = RaycastParams.new()
u72.FilterType = Enum.RaycastFilterType.Include
u72.FilterDescendantsInstances = { u3.Terrain }
local u73 = 0
local u74 = tick()
v5.Heartbeat:Connect(function() --[[ Line: 336 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u26
        [3] = u72
        [4] = u19
        [5] = u18
        [6] = u73
        [7] = u14
        [8] = u20
        [9] = u22
        [10] = u25
        [11] = u16
        [12] = u21
        [13] = u23
        [14] = u67
        [15] = u69
        [16] = u68
        [17] = u9
        [18] = u7
        [19] = u13
        [20] = u24
        [21] = u74
    --]]
    local v75 = u3:Raycast(u26.Position + Vector3.new(0, 2, 0), Vector3.new(0, -6, 0), u72)
    local v76 = u19.coordinatesFromWorkspaceVector3(u26.Position)
    local v77 = u19.getDimensionId(v76)
    if v75 and v75.Material == Enum.Material.Water then
        if u18[v77].waterDisplay == "Lava" then
            if u73 == 0 then
                u73 = 30
                u14.client_enteredLava()
            else
                u73 = u73 - 1
            end
        elseif u20.playerHasModifier(u22, u20.MODIFIERS.OnFire) then
            u14.client_extinguish()
        end
    else
        u73 = 0
    end
    if u25:GetState() == Enum.HumanoidStateType.Climbing or (u16(u26.Position) or u16(u26.Position - Vector3.new(0, 4, 0))) or u21.Handglider[u23:GetAttribute("EquippedItemId") or 0] ~= nil then
        u67 = u26.Position.Y
    end
    if u25.FloorMaterial == Enum.Material.Air then
        local v78 = u26.Position.Y
        local v79 = u67
        u67 = math.max(v78, v79)
    else
        if u67 > 0 and u69 == false then
            local v80 = u67 - u26.Position.Y
            if v80 > 0 and (u68 == false and (u26:IsDescendantOf(u3) and u9.currentModeValue.Value ~= u9.modes.freeCam)) then
                u7.Systems.CombatSystem.Network.FallDamage:FireServer(v80)
                if u13(u23, v80) > 0 then
                    u14.client_onCharacterDamaged(u23, "clientFall", 1)
                end
            end
        end
        u69 = false
        u67 = 0
    end
    local v81 = u25.SeatPart
    if v81 ~= nil and (v81.Name == "Seat" and v81:GetAttribute("OriginalCFrame")) then
        local v82 = u9.currentModeValue.Value == u9.modes.thirdPersonF and -1 or 1
        v81.CFrame = CFrame.lookAt(Vector3.new(), u24.CFrame.LookVector * Vector3.new(1, 0, 1) * v82) + v81:GetAttribute("OriginalCFrame").Position
        local v83 = v81:FindFirstChild("Network", true)
        if v83 and tick() - u74 > 0.2 then
            u74 = tick()
            v83:FireServer(v81.CFrame)
        end
    end
end)