-- Roblox script dump
-- ClassName: Script
-- Path: Workspace.Characters.ytgam902.CharacterClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:35

local u1 = game:GetService("Workspace")
local v2 = game:GetService("Players")
local u3 = game:GetService("ReplicatedStorage")
local u4 = game:GetService("RunService")
local u5 = game:GetService("TweenService")
if script:IsDescendantOf(u1) then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local v6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem)
    local u7 = require(game.ReplicatedStorage.Systems.CameraSystem)
    local u8 = require(game.ReplicatedStorage.Systems.ItemsSystem)
    local u9 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
    local u10 = require(game.ReplicatedStorage.Systems.ItemsSystem.Enums.ItemType)
    local u11 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
    local u12 = require(game.ReplicatedStorage.Client.Libs.Particles)
    local u13 = require(game.ReplicatedStorage.Systems.CombatSystem.Libs.HurtAnimation)
    local u14 = require(game.ReplicatedStorage.Client.Libs.CharactersDrawDistance)
    local u15 = require(game.ReplicatedStorage.Client.Libs.ArmorRenderer)
    local u16 = require(game.ReplicatedStorage.Libs.Utils)
    local u17 = require(game.ReplicatedStorage.Systems.HumanoidModifiersSystem)
    local u18 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
    local v19 = u1.CurrentCamera
    local u20 = v2.LocalPlayer
    local u21 = script:FindFirstAncestorOfClass("Model")
    local u22 = u21:WaitForChild("Humanoid")
    local u23 = u21:WaitForChild("HumanoidRootPart")
    local u24 = u21:WaitForChild("RightArm")
    local u25 = u23:WaitForChild("NameTag")
    local u26 = u21:WaitForChild("Network")
    local u27 = u21:WaitForChild("Interacting")
    local v28 = u21:WaitForChild("SkinLoaded")
    local u29 = u3.Client.States.Sneaking
    local u30 = v2:GetPlayerFromCharacter(u21)
    while u30 == nil do
        u4.Heartbeat:Wait()
        u30 = v2:GetPlayerFromCharacter(u21)
    end
    local _ = u23.CFrame
    local u31 = 0
    local u32 = 0
    local u33 = 0
    local u34 = 0
    local u35 = 0
    local u36 = {
        [u9.itemIdFromName("bow")] = Vector3.new(0, -1.25, 0),
        [u9.itemIdFromName("mythril_bow")] = Vector3.new(0, -1.25, 0)
    }
    local function u40(p37) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u30
        --]]
        for v38, v39 in u18.Roles do
            if table.find(v39.users_id, p37) then
                return v38
            end
        end
        if u30:GetAttribute("VIP") == true then
            return "VIP"
        end
    end
    local u41 = u30 == u20 and "EquippedItemId" or "ReplicatedEquippedItemId"
    v6.client_drawCharacterSkin(u21)
    v28.Value = true
    local u42 = {
        ["LL"] = u21.TorsoPart.LeftLeg,
        ["RL"] = u21.TorsoPart.RightLeg,
        ["LA"] = u21.VisibleTorso.LeftArm,
        ["RA"] = u21.VisibleTorso.RightArm,
        ["T"] = u21.HumanoidRootPart.TorsoPart,
        ["N"] = u21.HumanoidRootPart.Neck,
        ["VisibleTorso"] = u21.TorsoPart.VisibleTorso
    }
    local u43 = {
        ["LL"] = u42.LL.C0,
        ["RL"] = u42.RL.C0,
        ["LA"] = u42.LA.C0,
        ["RA"] = u42.RA.C0,
        ["T"] = u42.T.C0,
        ["N"] = u42.N.C0
    }
    u22.Died:Connect(function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u22
            [3] = u21
            [4] = u5
            [5] = u13
            [6] = u12
            [7] = u23
        --]]
        local v44 = u42.T.C1 * CFrame.Angles(0, 0, 1.5707963267948966)
        local v45 = v44 + v44.RightVector * -4
        u22.HipHeight = 0
        if u21:FindFirstChild("TorsoPart") then
            u42.N.Part0 = u21.TorsoPart
            u42.N.Parent = u21.TorsoPart
        end
        u5:Create(u42.T, TweenInfo.new(0.35), {
            ["C1"] = v45
        }):Play()
        task.spawn(function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u21
            --]]
            u13(u21, true)
        end)
        task.wait(0.25)
        u12.smoke(u23.Position - Vector3.new(0, 2, 0))
    end)
    local u46 = -1
    local function u56() --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u24
            [3] = u21
            [4] = u41
            [5] = u11
            [6] = u3
            [7] = u23
            [8] = u8
            [9] = u9
            [10] = u10
            [11] = u36
            [12] = u16
        --]]
        local v47 = tick()
        u46 = v47
        for _ = 1, 4 do
            local v48 = u24:FindFirstChild("HeldItem")
            if v48 then
                v48:Destroy()
            end
        end
        if u21:GetAttribute("Rendered") then
            local v49 = u21:GetAttribute(u41)
            if v49 ~= nil and v49 ~= 0 then
                if u11.Handglider[v49] then
                    local v50 = u3.Assets.Miscs.Handglider:Clone()
                    v50:PivotTo(u23.CFrame)
                    v50:SetAttribute("ItemId", v49)
                    local v51 = Instance.new("WeldConstraint")
                    v51.Part0 = v50.PrimaryPart
                    v51.Part1 = u23
                    v51.Parent = v50
                    v50.Name = "HeldItem"
                    v50.Parent = u24
                    return
                end
                local v52 = u8.client_renderTool(v49)
                if u46 ~= v47 then
                    return
                end
                if v52 then
                    local v53 = u9.getItemTypeFromItemId(v49)
                    if u8.RENDER_ITEM_REPLACE[v49] then
                        v53 = u10.Object
                    end
                    if v53 == u10.Block then
                        local v54 = v52:FindFirstChild("Geometry")
                        if v54 then
                            if v54:IsA("Model") then
                                v54:PivotTo(CFrame.new())
                            else
                                v54.CFrame = CFrame.new()
                            end
                        end
                        v52.PrimaryPart.CFrame = CFrame.new()
                        v52:PivotTo(u24.RightGripAttachmentBlock.WorldCFrame)
                    else
                        if v53 == u10.Tool then
                            v52:ScaleTo(0.16)
                        end
                        if u36[v49] == nil then
                            v52:PivotTo(u24.RightGripAttachment.WorldCFrame)
                        else
                            v52:PivotTo(u24.RightGripAttachment.WorldCFrame + u16.align(u36[v49], u24.RightGripAttachment.WorldCFrame))
                        end
                    end
                    local v55 = Instance.new("WeldConstraint")
                    v55.Part0 = v52.PrimaryPart
                    v55.Part1 = u24
                    v55.Parent = v52
                    v52.Name = "HeldItem"
                    v52.Parent = u24
                end
            end
        end
    end
    local u57 = v2:GetPlayerFromCharacter(u21)
    if u57 == v2.LocalPlayer then
        u25:Destroy()
        u25 = nil
    else
        for _, v58 in ipairs(u21:GetDescendants()) do
            if v58:IsA("BasePart") or v58:IsA("PartOperation") then
                v58.CanCollide = false
            end
        end
        local function v62() --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u40
                [3] = u57
                [4] = u18
                [5] = u14
            --]]
            local v59 = u21:GetAttribute("CharacterTagContent")
            local v60 = u40(u57.UserId)
            if v60 then
                v59 = string.format("[%s] %s", u18.Roles[v60].text, v59)
                u21.HumanoidRootPart.NameTag.Frame.Username.TextColor3 = u18.Roles[v60].color
            end
            u21.HumanoidRootPart.NameTag.MaxDistance = u14.getDistance()
            u21.HumanoidRootPart.NameTag.Frame.Username.Text = v59
            u21.HumanoidRootPart.NameTag.Frame.Size = UDim2.fromScale(string.len(v59) * 0.03 + 0.05, 1)
            for _, v61 in ipairs(u21:GetDescendants()) do
                if v61.Name == "SkinLayer" then
                    v61.MaxDistance = u21.HumanoidRootPart.NameTag.MaxDistance
                end
            end
        end
        u21:SetAttribute("CharacterTagContent", u57.DisplayName)
        u21:GetAttributeChangedSignal("CharacterTagContent"):Connect(v62)
        u21:GetAttributeChangedSignal("VIP"):Connect(v62)
        v62()
        u14.changed:Connect(v62)
    end
    local u63 = CFrame.Angles(-1.5707963267948966, 0, 0)
    local u64 = CFrame.Angles(0, 0, 0)
    local u65 = CFrame.Angles(0, 0, 0)
    local function u118(p66) --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u30
            [3] = u29
            [4] = u21
            [5] = u25
            [6] = u22
            [7] = u17
            [8] = u24
            [9] = u11
            [10] = u41
            [11] = u31
            [12] = u23
            [13] = u1
            [14] = u7
            [15] = u35
            [16] = u63
            [17] = u43
            [18] = u64
            [19] = u65
            [20] = u32
            [21] = u42
            [22] = u27
            [23] = u34
            [24] = u33
            [25] = u26
        --]]
        local v67
        if u20 == u30 then
            v67 = u29.Value
        else
            v67 = u21:GetAttribute("ReplicatedSneaking")
        end
        if u25 then
            if u22:FindFirstChild(u17.MODIFIERS.FightProtection) then
                u25.Frame.BackgroundColor3 = Color3.fromRGB(83, 177, 115)
            else
                u25.Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            end
            u25.Enabled = not v67
        end
        local v68 = {
            ["LL"] = nil,
            ["RL"] = nil,
            ["LA"] = nil,
            ["RA"] = nil,
            ["T"] = nil,
            ["N"] = nil
        }
        local v69 = u24:FindFirstChild("HeldItem")
        local v70 = u11.Handglider[u21:GetAttribute(u41) or 0] ~= nil
        if u22.Sit then
            v67 = false
        end
        u31 = (u23.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
        local v71 = u31 / 20
        local v72 = u22.FloorMaterial == Enum.Material.Air
        local v73
        if u21 == u20.Character then
            local v74, _, _ = u1.CurrentCamera.CFrame:ToEulerAnglesYXZ()
            if u7.currentModeValue.Value == u7.modes.thirdPersonF then
                v74 = v74 * -1
            end
            local v75 = v74 + 1.5707963267948966
            v73 = math.clamp(v75, 0.5, 2.5)
            local v76 = u35 - v73
            local _ = 0.1 < math.abs(v76)
        else
            v73 = u21:GetAttribute("NeckAngle") or 0
        end
        u63 = u63:lerp(CFrame.Angles(v73 - 1.5707963267948966, 0, 0), 0.25)
        v68.N = u63 + u43.N.Position
        if v67 then
            v68.N = v68.N + Vector3.new(0, -0.756, 0)
        end
        local v77 = v71 * 65
        if v70 and u22.FloorMaterial == Enum.Material.Air then
            v68.LL = u64:lerp(u43.LL, 0.25)
            v68.RL = u65:lerp(u43.RL, 0.25)
        else
            local v78 = u43.LL
            local v79 = CFrame.Angles
            local v80 = u32
            local v81 = v77 * math.sin(v80)
            u64 = v78 * v79(math.rad(v81), 0, 0)
            v68.LL = u64:lerp(u64, 0.25)
            local v82 = u43.RL
            local v83 = CFrame.Angles
            local v84 = u32
            local v85 = v77 * math.sin(v84) * -1
            u65 = v82 * v83(math.rad(v85), 0, 0)
            v68.RL = u65:lerp(u65, 0.25)
        end
        if v67 then
            v68.LL = v68.LL + Vector3.new(0, 0, 1.2)
            v68.RL = v68.RL + Vector3.new(0, 0, 1.2)
        end
        local v86 = u43.LA
        local v87 = CFrame.Angles
        local v88 = u32
        local v89 = v77 * math.sin(v88) * -1
        local v90 = v86 * v87(math.rad(v89), 0, -0.08726646259971647)
        v68.LA = u42.LA.C0:lerp(v90, 0.25) + Vector3.new(-0.01, 0.015, 0)
        if u27.Value then
            v68.RA = u43.RA * CFrame.Angles(v73 - 1.2217304763960306, 0, 0)
        elseif v70 then
            v68.RA = u42.RA.C0:lerp(u43.RA * CFrame.Angles(0, 0, 2.8797932657906435), 0.25)
            v68.LA = u42.LA.C0:lerp(u43.LA * CFrame.Angles(0, 0, 3.4033920413889427), 0.25)
        else
            local v91 = v69 == nil and 0 or 0.4363323129985824
            local v92 = u43.RA
            local v93 = CFrame.Angles
            local v94 = u32
            local v95 = v77 * math.sin(v94)
            local v96 = v92 * v93(v91 + math.rad(v95), 0, 0.08726646259971647)
            v68.RA = u42.RA.C0:lerp(v96, 0.25) + Vector3.new(0.01, 0.015, 0)
        end
        local v97 = v68.LA
        local v98 = CFrame.Angles
        local v99 = tick()
        local v100 = math.sin(v99)
        local v101 = math.rad(v100)
        local v102 = tick()
        local v103 = math.sin(v102)
        v68.LA = v97 * v98(v101, 0, (math.rad(v103)))
        local v104 = v68.RA
        local v105 = CFrame.Angles
        local v106 = tick()
        local v107 = math.cos(v106)
        local v108 = math.rad(v107)
        local v109 = tick()
        local v110 = math.sin(v109)
        v68.RA = v104 * v105(v108, 0, -math.rad(v110))
        if v72 then
            p66 = p66 * 0.15
        end
        local v111 = (u23.CFrame - u23.CFrame.Position):Inverse()
        local v112 = (u23.Orientation.Y - u34 + 180) % 360 - 180
        if v112 > 40 then
            u33 = u23.Orientation.Y - ((u23.Orientation.Y - u34 + 180) % 360 - 180)
            u33 = u33 + 1
            if v112 > 90 then
                u33 = u33 + 90
            elseif v112 > 10 then
                u33 = u33 + 10
            end
        end
        if v112 < -40 then
            u33 = u23.Orientation.Y - ((u23.Orientation.Y - u34 + 180) % 360 - 180)
            u33 = u33 - 1
            if v112 < -90 then
                u33 = u33 - 90
            elseif v112 < -10 then
                u33 = u33 - 10
            end
        end
        local v113
        if v71 > 0.5 then
            u33 = u23.Orientation.Y
            v113 = u43.T
        else
            local v114 = u33
            v113 = v111 * CFrame.Angles(0, math.rad(v114), 0)
        end
        local v115 = u42.T.C0
        if u21:FindFirstChild("TorsoPart") ~= nil then
            u34 = u21.TorsoPart.Orientation.Y
            v68.T = v113
            v68.T = v115:lerp(v113, 0.5)
            if u22.Sit then
                v68.T = u43.T
                v68.N = u43.N
                if u22.SeatPart ~= nil and u22.SeatPart.Name ~= "BedSeat" then
                    v68.LL = u43.LL * CFrame.Angles(1.3962634015954636, 0, -0.4363323129985824)
                    v68.RL = u43.RL * CFrame.Angles(1.3962634015954636, 0, 0.4363323129985824)
                    v68.LA = u43.LA * CFrame.Angles(0.5235987755982988, 0, -0.4363323129985824)
                    v68.RA = u43.RA * CFrame.Angles(0.5235987755982988, 0, 0.4363323129985824)
                end
            end
            u32 = u32 + p66 * v71 * 12
            if v67 then
                local v116 = CFrame.fromOrientation(-0.5235987755982988, 0, 0) + Vector3.new(0, -0.43, 0.6)
                u42.VisibleTorso.C0 = v116
            else
                u42.VisibleTorso.C0 = CFrame.new()
            end
            if u22:GetState() == Enum.HumanoidStateType.Dead then
                u22.AutoRotate = false
                u42.N.C0 = u43.N
                u42.LL.C0 = u43.LL
                u42.RL.C0 = u43.RL
                u42.LA.C0 = u43.LA
                u42.RA.C0 = u43.RA
                u42.T.C0 = u42.T.C0:Lerp(u43.T - Vector3.new(0, 2, 0), 0.05)
            else
                u42.N.C0 = v68.N
                u42.LL.C0 = v68.LL
                u42.RL.C0 = v68.RL
                u42.LA.C0 = v68.LA
                u42.RA.C0 = v68.RA
                u42.T.C0 = v68.T
            end
            if u21 == u20.Character then
                local v117 = u35 - v73
                if math.abs(v117) > 0.1 then
                    u35 = v73
                    u26:FireServer("neck", v73)
                end
            end
        end
    end
    if u21:GetAttribute(u41) then
        u56()
    end
    u15.reset(u21)
    for _, u119 in ipairs(u15.slots) do
        local u120 = "ReplicatedItemId" .. u119
        local u121 = false
        local function v124() --[[ Line: 462 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u20
                [3] = u121
                [4] = u120
                [5] = u15
                [6] = u119
            --]]
            local v122 = u21 == u20.Character and u121 and true or false
            local v123 = u21:GetAttribute(u120)
            if v123 == nil or v123 <= 0 then
                u15.clear(u21, u119, v122)
            else
                u15.render(u21, v123, v122)
            end
        end
        u21:GetAttributeChangedSignal(u120):Connect(v124)
        v124()
        u121 = true
    end
    if u30 == u20 then
        u21:SetAttribute("Rendered", true)
        u21:GetAttributeChangedSignal(u41):Connect(u56)
        u4.Heartbeat:Connect(u118)
    else
        local u125 = nil
        local u126 = nil
        local function v129() --[[ Line: 486 ]]
            --[[
            Upvalues:
                [1] = u126
                [2] = u125
                [3] = u21
                [4] = u41
                [5] = u56
                [6] = u4
                [7] = u118
            --]]
            if u126 then
                u126:Disconnect()
                u126 = nil
            end
            if u125 then
                u125:Disconnect()
                u125 = nil
            end
            local v127 = u21:GetAttribute("Rendered")
            for _, v128 in ipairs(u21:GetDescendants()) do
                if v128:IsA("BasePart") or v128:IsA("PartOperation") then
                    v128.LocalTransparencyModifier = v127 and 0 or 1
                elseif v128:IsA("SurfaceGui") then
                    v128.Enabled = v127
                end
            end
            if v127 then
                u126 = u21:GetAttributeChangedSignal(u41):Connect(u56)
                u125 = u4.Heartbeat:Connect(u118)
            end
            u56()
        end
        u21:GetAttributeChangedSignal("Rendered"):Connect(v129)
        v129()
        while task.wait() do
            u21:SetAttribute("Rendered", (u23.Position - v19.CFrame.Position).Magnitude < u14.getDistance())
        end
    end
end