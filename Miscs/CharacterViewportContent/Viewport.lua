-- Roblox script dump
-- ClassName: LocalScript
-- Path: ReplicatedStorage.Assets.Miscs.CharacterViewportContent.Viewport
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u1 = game:GetService("RunService")
local u2 = game:GetService("UserInputService")
local u3 = workspace.CurrentCamera
local u4 = script.Parent.Parent
local v5 = Instance.new("Camera")
v5.FieldOfView = 50
v5.Parent = u4
u4.CurrentCamera = v5
local u6 = script.Parent.ViewportCharacter
u6:PivotTo(CFrame.new((Vector3.new())))
local v7 = u6:WaitForChild("HumanoidRootPart").Position
local u8 = u6.Head:GetPivot()
v5.CFrame = CFrame.lookAt(v7 - Vector3.new(0, 0, 10), v7)
if u4:FindFirstAncestor("TitleScreen") then
    v5.CFrame = v5.CFrame - Vector3.new(0, 0, 4)
end
local u9 = Vector2.new()
local u10 = Instance.new("BindableEvent")
local function v24(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u3
        [4] = u6
        [5] = u8
    --]]
    local v11 = u4.AbsolutePosition + u4.AbsoluteSize * 0.5
    local v12 = (v11.X - u9.X) / (u3.ViewportSize.X * 0.5)
    local v13 = (v11.Y - u9.Y) / (u3.ViewportSize.Y * 0.5)
    local v14 = u6
    local v15 = CFrame.lookAt
    local v16 = Vector3.new()
    local v17 = v12 * 10
    local v18 = v13 * 3
    v14:PivotTo(v15(v16, (Vector3.new(v17, v18, -20))))
    local v19 = CFrame.lookAt
    local v20 = Vector3.new()
    local v21 = v12 * 10
    local v22 = v13 * 10
    local v23 = v19(v20, (Vector3.new(v21, v22, -10)))
    u6.Head:PivotTo(u6:GetPivot() * u8 * v23)
end
u10.Event:Connect(v24)
local u25 = u4.Parent
local u26 = nil
local u27 = false
local function v29() --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u2
        [3] = u26
        [4] = u1
        [5] = u27
        [6] = u9
        [7] = u10
    --]]
    if u25.Visible then
        if u2.TouchEnabled == false then
            u26 = u1.RenderStepped:Connect(function() --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u2
                    [3] = u9
                    [4] = u10
                --]]
                u27 = not u27
                if u27 then
                    local v28 = u2:GetMouseLocation()
                    if v28 ~= u9 then
                        u9 = v28
                        u10:Fire()
                    end
                end
            end)
            return
        end
    elseif u26 then
        u26:Disconnect()
        u26 = nil
    end
end
u25:GetPropertyChangedSignal("Visible"):Connect(v29)
if u25.Visible then
    if u2.TouchEnabled == false then
        u26 = u1.RenderStepped:Connect(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u2
                [3] = u9
                [4] = u10
            --]]
            u27 = not u27
            if u27 then
                local v30 = u2:GetMouseLocation()
                if v30 ~= u9 then
                    u9 = v30
                    u10:Fire()
                end
            end
        end)
    end
elseif u26 then
    u26:Disconnect()
    u26 = nil
end