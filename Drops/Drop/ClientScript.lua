-- Roblox script dump
-- ClassName: Script
-- Path: Workspace.Drops.Drop.ClientScript
-- Source: decompile
-- Dumped: 2026-04-23 03:45:35

game:GetService("Players")
local u1 = game:GetService("RunService")
game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local u2 = game:GetService("HttpService")
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockGeometry)
local u4 = require(game.ReplicatedStorage.Libs.BlockState)
local u5 = require(game.ReplicatedStorage.Systems.ItemsSystem)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u7 = require(game.ReplicatedStorage.Systems.ItemsSystem.Enums.ItemType)
local u8 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
local u9 = script.Parent
local u10 = u9:WaitForChild("PrimaryPart", (1 / 0))
local u11 = 0
local u12 = nil
local function u20(p13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u10
    --]]
    u11 = u11 + p13
    local v14 = u9:FindFirstChild("ClientGeometry")
    if v14 then
        local v15 = u10.Position
        local v16 = 2.0943951023931953 * tick()
        local v17 = math.sin(v16) * 0.3 + 1
        local v18 = v15 + Vector3.new(0, v17, 0)
        local v19 = CFrame.Angles(0, u11 * 3.141592653589793 * 2 / 6, 0)
        v14:PivotTo(CFrame.new(v18) * v19)
    end
end
local function v39() --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u2
        [4] = u6
        [5] = u7
        [6] = u3
        [7] = u4
        [8] = u8
        [9] = u5
        [10] = u1
        [11] = u20
    --]]
    if u12 then
        u12:Disconnect()
        u12 = nil
    end
    local v21 = u9:FindFirstChild("ClientGeometry")
    if v21 then
        v21:Destroy()
    end
    if u9:GetAttribute("rendered") == false then
        return
    else
        local v22 = u2:JSONDecode((u9:GetAttribute("dropString")))
        local v23 = v22.id
        local v24 = v22.qty
        if v23 and (v23 ~= 0 and (v24 and v24 ~= 0)) then
            local v25 = Instance.new("Model")
            v25.Name = "ClientGeometry"
            local v26 = Instance.new("Part")
            v26.Name = "geometryPrimaryPart"
            v26.Size = Vector3.new()
            v26.CFrame = CFrame.new(u9.PrimaryPart.CFrame.Position)
            v26.CanCollide = false
            v26.CanTouch = false
            v26.Transparency = 1
            v26.Anchored = true
            if u6.getItemTypeFromItemId(v23) == u7.Block then
                local v27 = u6.getBlockIdFromItemId(v23)
                if v24 > 1 then
                    local v28 = u3.create(v27, 0.25)
                    local v29 = u3.create(v27, 0.25)
                    local v30 = u4.create(v27, 63, nil)
                    local v31 = u8.initializeMetadata(v30, Vector3.new(-100, -100, -100)) or v30
                    v28:SetAttribute(u4.ATTRIBUTE, v31)
                    v29:SetAttribute(u4.ATTRIBUTE, v31)
                    u3.move(v28, u9.PrimaryPart.Position)
                    u3.move(v29, u9.PrimaryPart.Position + Vector3.new(0.0625, 0.0625, 0.0625))
                    u3.client_doProcessing(v28, false, false, true)
                    u3.client_doProcessing(v29, false, false, true)
                    v28.Parent = v25
                    v29.Parent = v25
                else
                    local v32 = u3.create(v27, 0.25)
                    local v33 = u4.create(v27, 63, nil)
                    local v34 = u8.initializeMetadata(v33, Vector3.new(-100, -100, -100)) or v33
                    v32:SetAttribute(u4.ATTRIBUTE, v34)
                    u3.client_doProcessing(v32, false, false, true)
                    v32.Parent = v25
                end
            elseif v24 > 1 then
                local v35 = u5.client_renderItemGeometry(v23)
                local v36 = u5.client_renderItemGeometry(v23)
                v35:ScaleTo(0.11)
                v36:ScaleTo(0.11)
                v35.PrimaryPart.Orientation = Vector3.new(-90, 0, 0)
                v36.PrimaryPart.Orientation = Vector3.new(-90, 0, 0)
                v35:PivotTo(CFrame.new())
                v36:PivotTo(CFrame.new(Vector3.new(0.25, 0.25, 0.25)))
                v35.Parent = v25
                v36.Parent = v25
            else
                local v37 = u5.client_renderItemGeometry(v23)
                v37:ScaleTo(0.11)
                v37.PrimaryPart.Orientation = Vector3.new(-90, 0, 0)
                v37:PivotTo(CFrame.new())
                v37.Parent = v25
            end
            for _, v38 in ipairs(v25:GetDescendants()) do
                if v38:IsA("BasePart") or v38:IsA("PartOperation") then
                    v38.Anchored = true
                    v38.CanCollide = false
                    v38.CanTouch = false
                    v38.CanQuery = false
                    v38.CastShadow = false
                elseif v38:IsA("BaseScript") and v38.Name == "ClientWorkspace" then
                    v38:Destroy()
                end
            end
            v26.CFrame = v25:GetBoundingBox()
            v26.CFrame = CFrame.new(v26.CFrame.Position)
            v26.Parent = v25
            v25.PrimaryPart = v26
            v25.Parent = u9
            u12 = u1.RenderStepped:Connect(u20)
        end
    end
end
v39()
u9:GetAttributeChangedSignal("dropString"):Connect(v39)
u9:GetAttributeChangedSignal("rendered"):Connect(v39)