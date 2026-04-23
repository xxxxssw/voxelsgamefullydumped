-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.143.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("Workspace")
local u2 = game:GetService("RunService")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if script:IsDescendantOf(v1) then
    local v3 = v1.CurrentCamera
    local u4 = script.Parent
    local v5 = u4:WaitForChild("Hitbox")
    local v6 = Instance.new("BoolValue")
    local u7 = nil
    local u8 = u4.RuneCircle:GetPivot()
    local u9 = 0
    local function v19(p10) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u4
            [4] = u8
            [5] = u9
        --]]
        if u7 ~= nil then
            u7:Disconnect()
            u7 = nil
        end
        if p10 then
            u7 = u2.Stepped:Connect(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u8
                    [3] = u9
                --]]
                local v11 = u4.RuneCircle
                local v12 = u8
                local v13 = CFrame.Angles
                local v14 = u9
                local v15 = math.rad(v14)
                local v16 = u9 * 8
                local v17 = math.rad(v16)
                local v18 = u9 * 2
                v11:PivotTo(v12 * v13(v15, v17, (math.rad(v18))))
                u9 = u9 + 1
            end)
        end
    end
    v6.Value = (v5.Position - v3.CFrame.Position).Magnitude < 360
    v6.Changed:Connect(v19)
    local v20 = v6.Value
    if u7 ~= nil then
        u7:Disconnect()
        u7 = nil
    end
    if v20 then
        u7 = u2.Stepped:Connect(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u8
                [3] = u9
            --]]
            local v21 = u4.RuneCircle
            local v22 = u8
            local v23 = CFrame.Angles
            local v24 = u9
            local v25 = math.rad(v24)
            local v26 = u9 * 8
            local v27 = math.rad(v26)
            local v28 = u9 * 2
            v21:PivotTo(v22 * v23(v25, v27, (math.rad(v28))))
            u9 = u9 + 1
        end)
    end
    while task.wait(3) do
        v6.Value = (v5.Position - v3.CFrame.Position).Magnitude < 360
    end
end