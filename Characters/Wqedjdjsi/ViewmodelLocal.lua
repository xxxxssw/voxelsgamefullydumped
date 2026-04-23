-- Roblox script dump
-- ClassName: LocalScript
-- Path: Workspace.Characters.Wqedjdjsi.ViewmodelLocal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:16

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("Workspace")
local u4 = require(game.ReplicatedStorage.Systems.CameraSystem)
require(game.ReplicatedStorage.Client.States.HotbarState)
local u5 = require(game.ReplicatedStorage.Systems.ItemsSystem)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u7 = require(game.ReplicatedStorage.Systems.ItemsSystem.Enums.ItemType)
local u8 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u9 = v3.CurrentCamera
local u10 = script.Parent
local u11 = u10:WaitForChild("Humanoid")
local u12 = u10:WaitForChild("HumanoidRootPart")
local v13 = u10:WaitForChild("RightArm")
v13:WaitForChild("RightGripAttachment")
local v14 = u10:WaitForChild("SkinLoaded")
local u15 = v1.Assets.Miscs.Viewmodel:Clone()
local v16 = u15.AnimationController
u15.Parent = u10
u15:ScaleTo(0.3)
if not v14.Value then
    v14.Changed:Wait()
end
for _, v17 in ipairs(v13:GetChildren()) do
    v17:Clone().Parent = u15.RightArm
end
local u18 = v16:LoadAnimation(u15.ViewModelPunch)
local u19 = v16:LoadAnimation(u15.ViewModelEating)
v1.Client.Events.ArmAnimation.Event:Connect(function() --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18:Stop()
    u18:Play()
end)
v1.Client.States.CharacterEating.Changed:Connect(function(p20) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if p20 then
        u19:Play()
    else
        u19:Stop()
    end
end)
local u21 = 0
local u22 = Vector3.new()
local u23 = true
local function v42(p24) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u21
        [4] = u23
        [5] = u22
        [6] = u15
        [7] = u9
        [8] = u10
        [9] = u4
    --]]
    if u11:GetState() ~= Enum.HumanoidStateType.Dead then
        local v25 = (u12.AssemblyLinearVelocity.Magnitude * Vector3.new(1, 0, 1)).Magnitude / 17.268 * 0.4
        u21 = u21 + p24 * v25 * 12
        local v26 = u21
        local v27 = math.sin(v26) * v25 * 2
        local v28 = -math.abs(v27)
        local v29 = u21
        local v30 = math.sin(v29) * v25 * 2
        local v31 = Vector3.new(0, v28, v30) * 0.25
        local v32
        if u23 then
            u23 = false
            v32 = 1
        else
            v32 = 0.1
        end
        u22 = u22:lerp(v31, v32)
        if u15.PrimaryPart ~= nil then
            local v33 = u9.CFrame.LookVector * u22.X + u9.CFrame.UpVector * u22.Y + u9.CFrame.RightVector * u22.Z
            u15:SetPrimaryPartCFrame(u9.CFrame + v33 * 0.3)
        end
        local v34
        if u11:GetState() == Enum.HumanoidStateType.Dead then
            v34 = false
        else
            local v35 = u10:GetAttribute("EquippedItemId")
            if v35 == nil or v35 <= 0 then
                v34 = u4.currentModeValue.Value == u4.modes.firstPerson
            else
                v34 = false
            end
        end
        u15.RightArm.LocalTransparencyModifier = 1
        for _, v36 in ipairs(u15.RightArm:GetChildren()) do
            if v36:IsA("SurfaceGui") then
                v36.Enabled = v34
            end
        end
        local v37 = u15:FindFirstChild("Tool")
        if v37 ~= nil then
            local v38
            if u11:GetState() == Enum.HumanoidStateType.Dead then
                v38 = false
            else
                v38 = u4.currentModeValue.Value == u4.modes.firstPerson
            end
            for _, v39 in ipairs(v37:GetDescendants()) do
                if v39:IsA("BasePart") or v39:IsA("PartOperation") then
                    v39.LocalTransparencyModifier = v38 and 0 or 1
                elseif v39:isA("Texture") then
                    local v40 = v39:GetAttribute("OriginalTransparency") or 0
                    v39.Transparency = v38 and v40 and v40 or 1
                elseif v39:IsA("SurfaceGui") then
                    v39.Enabled = v38
                elseif v39:IsA("Decal") then
                    v39.Transparency = v38 and 0 or 1
                end
            end
        end
        for _, v41 in ipairs(u15:GetDescendants()) do
            if v41:IsA("BasePart") or v41:IsA("PartOperation") then
                v41.CastShadow = false
            end
        end
    end
end
local u43 = -1
local function u58(p44) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u15
        [3] = u8
        [4] = u5
        [5] = u6
        [6] = u7
    --]]
    local v45 = tick()
    u43 = v45
    for _ = 1, 3 do
        local v46 = u15:FindFirstChild("Tool")
        if v46 ~= nil then
            v46:Destroy()
        end
    end
    local v47 = u15.RightArm:FindFirstChild("HeldItem")
    if v47 then
        v47:Destroy()
    end
    if p44 ~= nil and p44 ~= 0 then
        if u8.Handglider[p44] then
            return
        end
        local v48 = u5.client_renderTool(p44)
        if u43 ~= v45 then
            return
        end
        v48:ScaleTo(v48:GetScale() * 0.3)
        if v48 then
            local v49 = u6.getItemTypeFromItemId(p44)
            if u5.RENDER_ITEM_REPLACE[p44] then
                v49 = u7.Object
            end
            local v50
            if v49 == u7.Tool or v49 == u7.Object then
                v50 = u15.ItemArm.ToolAttachment
            else
                v50 = u15.ItemArm.BlockAttachment
            end
            local v51 = CFrame.fromOrientation
            local v52 = v50.WorldOrientation.X
            local v53 = math.rad(v52)
            local v54 = v50.WorldOrientation.Y
            local v55 = math.rad(v54)
            local v56 = v50.WorldOrientation.Z
            v48:PivotTo(v51(v53, v55, (math.rad(v56))) + v50.WorldPosition)
            local v57 = Instance.new("WeldConstraint")
            v57.Part0 = v48.PrimaryPart
            v57.Part1 = u15.ItemArm
            v57.Parent = v48
            v48.Name = "Tool"
            v48.Parent = u15
        end
    end
end
v2.PreRender:Connect(v42)
u10:GetAttributeChangedSignal("EquippedItemId"):Connect(function() --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u58
        [2] = u10
    --]]
    u58(u10:GetAttribute("EquippedItemId"))
end)
u58(u10:GetAttribute("EquippedItemId"))