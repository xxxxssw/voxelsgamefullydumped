-- Roblox script dump
-- ClassName: LocalScript
-- Path: Workspace.Characters.Nanopad45.Sneak
-- Source: decompile
-- Dumped: 2026-04-23 03:45:35

local u1 = game:GetService("RunService")
local u2 = game:GetService("Workspace")
game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = script.Parent
local u5 = v4:WaitForChild("Humanoid")
local u6 = v4:WaitForChild("HumanoidRootPart")
local u7 = Instance.new("ObjectValue")
local v8 = v3.Client.States.Sneaking
local u9 = v3.Assets.Miscs.SneakCage:Clone()
local u10 = RaycastParams.new()
u10.FilterType = Enum.RaycastFilterType.Include
u10.FilterDescendantsInstances = { u2.Map }
u10.RespectCanCollide = true
local u11 = nil
for _, v12 in ipairs(u2.Camera:GetChildren()) do
    if v12.Name == "SneakCage" then
        v12:Destroy()
    end
end
local u13 = nil
local function v24(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u2
    --]]
    if p14 then
        if u13 then
            u13:Disconnect()
        end
        u13 = p14.AncestryChanged:Connect(function(_, p15) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            if not p15 then
                u9.Parent = nil
            end
        end)
        u9.Parent = u2.Camera
        local v16 = p14:Clone()
        local v17 = Instance.new("Model")
        v16.Parent = v17
        local v18, v19 = v17:GetBoundingBox()
        v16:Destroy()
        local v20 = v18.Position + v19 * Vector3.new(0, 0.5, 0) + Vector3.new(0, 6, 0)
        local v21 = u9
        local v22 = v19.X + 4
        local v23 = v19.Z + 4
        v21.Size = Vector3.new(v22, 12, v23)
        u9.Position = v20
    end
end
u7.Changed:Connect(v24)
local function u29() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u5
        [4] = u10
        [5] = u7
    --]]
    local v25 = u2
    local v26 = u6.Position
    local v27 = -u5.HipHeight - 3
    local v28 = v25:Raycast(v26, Vector3.new(0, v27, 0), u10)
    if v28 and v28.Instance ~= nil then
        u7.Value = v28.Instance
    else
        u7.Value = nil
    end
end
v8.Changed:Connect(function(p30) --[[ Name: onSneakChanged, Line 64 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u11
        [4] = u1
        [5] = u29
    --]]
    u9.Parent = nil
    u7.Value = nil
    if u11 ~= nil then
        u11:Disconnect()
        u11 = nil
    end
    if p30 then
        u11 = u1.Heartbeat:Connect(u29)
    end
end)