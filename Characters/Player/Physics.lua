-- Roblox script dump
-- ClassName: LocalScript
-- Path: ReplicatedStorage.Assets.Characters.Player.Physics
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

local v1 = game:GetService("RunService")
local u2 = game:GetService("Workspace")
local u3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("Lighting")
local v5 = game:GetService("Players")
local u6 = game:GetService("UserInputService")
local u7 = require(game.ReplicatedStorage.Systems.ActionsSystem)
local u8 = require(game.ReplicatedStorage.Systems.CameraSystem)
local u9 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u10 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u11 = require(game.ReplicatedStorage.Libs.Coordinates)
local u12 = require(game.ReplicatedStorage.Libs.BlockState)
local u13 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
local u14 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u15 = require(game.ReplicatedStorage.Systems.CombatSystem.Configuration)
local u16 = require(game.ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater)
local u17 = require(game.ReplicatedStorage.Client.LocalSounds.LocalSoundPlayer)
local u18 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u19 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration.DimensionsData)
local u20 = script.Parent
local u21 = u20:WaitForChild("HumanoidRootPart")
local u22 = u3.Client.Events.Damaged
local u23 = u3.Client.States.CurrentBiomeId
local u24 = v5.LocalPlayer
local u25 = u20:WaitForChild("Humanoid")
local u26 = u3.Client.States.Sprinting
local u27 = u3.Client.States.Oxygen
u27.Value = 10
local u28 = not v1:IsStudio()
local v29 = u2.CurrentCamera:FindFirstChild("Pusher")
if v29 then
    v29:Destroy()
end
local u30 = u3.Client.Pusher:Clone()
u30.CFrame = u21.CFrame
local v31 = Instance.new("Attachment")
v31.Name = "PusherAttachment"
v31.CFrame = v31.CFrame - Vector3.new(0, 0.75, 0)
v31.Parent = u21
u30.AlignPosition.Attachment1 = v31
u30.Parent = u20
local function v34(p32) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    if p32:IsA("BasePart") and p32.CanCollide then
        local v33 = Instance.new("NoCollisionConstraint")
        v33.Part0 = p32
        v33.Part1 = u30
        v33.Parent = u30
    end
end
for _, v35 in ipairs(u20:GetDescendants()) do
    if v35:IsA("BasePart") and v35.CanCollide then
        local v36 = Instance.new("NoCollisionConstraint")
        v36.Part0 = v35
        v36.Part1 = u30
        v36.Parent = u30
    end
end
u20.DescendantAdded:Connect(v34)
u3.Client.Events.Damaged.Event:Connect(function(p37, p38) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u21
        [3] = u3
        [4] = u18
        [5] = u25
        [6] = u30
        [7] = u15
    --]]
    if p37 == u24 and (typeof(p38) == "Instance" and (p38:IsA("Model") and p38.PrimaryPart ~= nil)) then
        local v39 = CFrame.lookAt(p38.PrimaryPart.Position * Vector3.new(1, 0, 1), u21.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 1, 0))
        local v40 = 1
        local v41 = u3.Systems.EntitiesSystem.Behaviors:FindFirstChild(p38.Name)
        if v41 then
            local v42 = require(v41)
            if v42.KnockbackMultiplier then
                v40 = v42.KnockbackMultiplier
            end
        end
        if p38:GetAttribute("ReplicatedEquippedItemId") ~= nil and u18.KnockbackMultiplied[p38:GetAttribute("ReplicatedEquippedItemId")] then
            v40 = u18.KnockbackMultiplied[p38:GetAttribute("ReplicatedEquippedItemId")]
        end
        if u25.FloorMaterial == Enum.Material.Air then
            u30:ApplyImpulse(v39.LookVector * u15.PLAYER_KNOCKBACK_FORCE * 0.25 * v40)
            return
        end
        u30:ApplyImpulse(v39.LookVector * u15.PLAYER_KNOCKBACK_FORCE * v40)
    end
end)
u3.Client.Events.ServerKnockback.OnClientEvent:Connect(function(p43, p44) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u30
        [3] = u15
    --]]
    if u25.FloorMaterial == Enum.Material.Air then
        u30:ApplyImpulse(p43 * u15.PLAYER_KNOCKBACK_FORCE * 0.25 * p44)
    else
        u30:ApplyImpulse(p43 * u15.PLAYER_KNOCKBACK_FORCE * p44)
    end
end)
local u45 = v4:FindFirstChild("SuffocatingColorCorrection")
if u45 == nil then
    u45 = Instance.new("ColorCorrectionEffect")
    u45.Brightness = -1
    u45.Enabled = false
    u45.Parent = v4
end
local u46 = u3.Client.States.Suffocating
local u47 = 0
local u48 = tick()
u46.Changed:Connect(function(p49) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u45
        [3] = u22
        [4] = u47
        [5] = u48
        [6] = u20
        [7] = u30
        [8] = u15
    --]]
    u21.Anchored = p49
    u45.Enabled = p49
    u22:Fire()
    u47 = u47 + 1
    u48 = tick()
    if u47 == 20 then
        u47 = 0
        u20:PivotTo(u20:GetPivot() + Vector3.new(0, 24, 0))
        u30:ApplyImpulse(u20.PrimaryPart.CFrame.LookVector * u15.PLAYER_KNOCKBACK_FORCE + Vector3.new(0, 100, 0))
    end
end)
local u50 = Instance.new("BoolValue")
local u51 = 0
local u52 = 0
local u53 = 0
v1.PreSimulation:Connect(function() --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u50
        [2] = u16
        [3] = u21
        [4] = u48
        [5] = u30
        [6] = u20
        [7] = u2
        [8] = u26
        [9] = u52
        [10] = u27
        [11] = u28
        [12] = u3
        [13] = u18
        [14] = u25
        [15] = u53
        [16] = u7
        [17] = u46
        [18] = u8
        [19] = u11
        [20] = u10
        [21] = u23
        [22] = u19
        [23] = u9
        [24] = u12
        [25] = u13
        [26] = u14
        [27] = u6
        [28] = u51
    --]]
    u50.Value = u16(u21.Position)
    if tick() - u48 > 0.15 then
        u48 = 0
    end
    for _, v54 in ipairs(u30:GetTouchingParts()) do
        if not (v54:IsDescendantOf(u20) or v54:IsDescendantOf(u2.Drops)) then
            u30:ApplyImpulse(CFrame.lookAt(u30.Position * Vector3.new(1, 0, 1), v54.Position * Vector3.new(1, 0, 1)).LookVector * -300)
            break
        end
    end
    if u50.Value then
        u26.Value = false
        if u21.Velocity.Y < 0 then
            u21.Velocity = u21.Velocity * Vector3.new(1, 0, 1) - Vector3.new(0, 5, 0)
        end
        if tick() - u52 > 1 then
            u52 = tick()
            local v55 = u27
            local v56 = u27.Value - 1
            v55.Value = math.max(0, v56)
            if u27.Value == 0 and u28 then
                u3.Systems.CombatSystem.Network.DrownDamage:FireServer()
            end
        end
    else
        if u21.Velocity.Y < -60 then
            u21.Velocity = u21.Velocity * Vector3.new(1, 0, 1) - Vector3.new(0, 60, 0)
        end
        if u18.Handglider[u20:GetAttribute("EquippedItemId") or 0] ~= nil and u21.Velocity.Y < -7 then
            u21.Velocity = u21.Velocity * Vector3.new(1, 0, 1) - Vector3.new(0, 7, 0)
            if u25.FloorMaterial ~= Enum.Material.Air then
                u53 = 0
            end
            if u25.FloorMaterial == Enum.Material.Air and (u21.Velocity * Vector3.new(1, 0, 1)).Magnitude < 40 then
                local v57 = u21
                v57.Velocity = v57.Velocity * Vector3.new(1.2, 1, 1.2)
                if tick() - u53 > 3 then
                    u53 = tick()
                    u7.client_useHandglider()
                end
            end
        else
            u53 = 0
        end
        u52 = tick()
        local v58 = u27
        local v59 = u27.Value + 1
        v58.Value = math.min(10, v59)
    end
    if u46.Value and u20.PrimaryPart then
        u20:PivotTo(u20:GetPivot() + Vector3.new(0, 1, 0))
    end
    if u21:IsDescendantOf(u2) and u8.currentModeValue.Value ~= u8.modes.freeCam then
        local v60 = u11.coordinatesFromWorkspaceVector3(u21.Position + Vector3.new(0, 2, 0))
        local v61 = u11.regionNameFromCoordinates(v60)
        local v62 = u11.chunkNameFromCoordinates(v60)
        local v63 = u10.getChunkFolder(v61, v62)
        if v63 ~= nil then
            u23.Value = v63:GetAttribute("AverageBiomeId") or 0
        end
        local v64 = u11.getDimensionId(v60)
        if u19[v64].roofHeight ~= nil and v60.Y > u19[v64].roofHeight then
            u46.Value = true
            print("Dimension roof reached, teleporting..")
            u20:PivotTo(CFrame.new(v60 * Vector3.new(1, 0, 1) * 4 + Vector3.new(0, 8, 0)))
        end
        local v65 = u9.getBlockState(v60)
        if v65 and (v60.Y < 250 and v60.Y > 1) then
            local v66 = u12.getBlockId(v65)
            local v67 = u13[v66]
            if v67 and (v67.transparent == false or u14.Leaves[v66]) and not u14.CrossedSprites[v66] then
                u46.Value = true
                return
            end
        end
    end
    u46.Value = false
    if u50.Value and ((u6:IsKeyDown(Enum.KeyCode.Space) or u3.Client.States.JumpButtonHeld.Value) and tick() - u51 > 0.25) then
        u21.Velocity = u21.Velocity * Vector3.new(1, 0, 1) + Vector3.new(0, 20, 0)
    end
end)
u50.Changed:Connect(function(p68) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u51
        [2] = u17
    --]]
    if p68 then
        u51 = tick()
        u17.play("Splash")
    end
end)