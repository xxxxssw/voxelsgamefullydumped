-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1045.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = game:GetService("TweenService")
local v2 = game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u3 = game:GetService("RunService")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if script:IsDescendantOf(v2) then
    local u4 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
    local v5 = require(game.ReplicatedStorage.Libs.Coordinates)
    local u6 = script.Parent
    local u7 = u6.State
    TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local u8 = Instance.new("NumberValue")
    u8.Parent = script
    local u9 = Instance.new("NumberValue")
    u9.Parent = script
    local u10 = Instance.new("NumberValue")
    u10.Parent = script
    local function v14() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u10
            [4] = u9
        --]]
        u6.Handle.Weld.C1 = CFrame.new(0, u8.Value + u10.Value, 0)
        local v11 = u6.Handle.Weld
        local v12 = CFrame.Angles
        local v13 = u9.Value
        v11.C0 = v12(0, math.rad(v13), 0) + u6.Handle.Weld.C0.Position
    end
    u8.Changed:Connect(v14)
    u9.Changed:Connect(v14)
    local u15 = nil
    local u16 = 0
    local function u24(p17) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u15
            [3] = u7
            [4] = u6
            [5] = u10
            [6] = u1
            [7] = u9
            [8] = u3
            [9] = u8
        --]]
        local u18 = tick()
        u16 = u18
        if u15 then
            u15:Disconnect()
            u15 = nil
        end
        if u7.Value then
            local u19 = 0
            local u20 = 0
            u6.Body.SurfaceGui.Enabled = true
            u6.Body.SurfaceGui.ImageLabel.ImageRectOffset = Vector2.new(0, u20 * 11, 0)
            u10.Value = 0
            u1:Create(u9, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                ["Value"] = 180
            }):Play()
            u6.Hitbox.Smoke:Emit(6)
            task.delay(0.5, function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u18
                    [3] = u15
                    [4] = u3
                    [5] = u9
                    [6] = u10
                    [7] = u19
                    [8] = u20
                    [9] = u6
                --]]
                if u16 == u18 then
                    u15 = u3.RenderStepped:Connect(function(p21) --[[ Line: 68 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u10
                            [3] = u19
                            [4] = u20
                            [5] = u6
                        --]]
                        u9.Value = (u9.Value + p21 * 15) % 360
                        local v22 = u10
                        local v23 = (u9.Value + 0.25) * 0.25
                        v22.Value = math.sin(v23) * 0.15
                        if tick() - u19 > 0.2 then
                            u19 = tick()
                            u20 = u20 + 1
                            if u20 == 23 then
                                u20 = 0
                            end
                            u6.Body.SurfaceGui.ImageLabel.ImageRectOffset = Vector2.new(0, u20 * 11)
                        end
                    end)
                end
            end)
            u1:Create(u8, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                ["Value"] = 2
            }):Play()
            if p17 then
                u6.Hitbox.On:Play()
            end
        else
            u6.Body.SurfaceGui.Enabled = false
            u1:Create(u8, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                ["Value"] = 0
            }):Play()
            u1:Create(u9, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                ["Value"] = 0
            }):Play()
            u1:Create(u10, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                ["Value"] = 0
            }):Play()
            if p17 then
                u6.Hitbox.Off:Play()
            end
        end
    end
    u7.Changed:Connect(function() --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24(true)
    end)
    u24()
    local u25 = v5.fromBlockInstance(u6)
    u7.Value = u4.isContainerOpenAtCoordinates(u25)
    u4.containerOpenedOrClosed:Connect(function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u25
        --]]
        u7.Value = u4.isContainerOpenAtCoordinates(u25)
    end)
    task.wait(0.5)
    intialized = true
end