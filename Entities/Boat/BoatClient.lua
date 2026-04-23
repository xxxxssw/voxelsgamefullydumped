-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Entities.Boat.BoatClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("RunService")
local v2 = game:GetService("Players")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u3 = require(game.ReplicatedStorage.Systems.LiquidsSystem.Libs.InWater)
local v4 = require(game.ReplicatedStorage.Systems.CameraSystem)
local u5 = require(game.ReplicatedStorage.Libs.Coordinates)
local u6 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local u7 = require(game.ReplicatedStorage.Configuration.Colors)
local u8 = v4.getControls()
local u9 = v2.LocalPlayer
local u10 = script.Parent
u10:WaitForChild("VehicleHitbox", (1 / 0))
local u11 = u10:WaitForChild("DriverSeat", (1 / 0))
local u12 = u10:WaitForChild("PrimaryPart", (1 / 0))
local u13 = u12:WaitForChild("AlignPosition", (1 / 0))
local u14 = u12:WaitForChild("DriveForce", (1 / 0))
u12:WaitForChild("SteerOrientation", (1 / 0))
local u15 = u12:WaitForChild("Steer", (1 / 0))
local u16 = u10:WaitForChild("Sail", (1 / 0))
local u17 = u10:WaitForChild("Mast")
local u18 = nil
local u19 = false
local function v27() --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u19
        [4] = u18
        [5] = u1
        [6] = u3
        [7] = u12
        [8] = u13
        [9] = u5
        [10] = u8
        [11] = u14
        [12] = u10
        [13] = u15
        [14] = u16
        [15] = u17
    --]]
    local v20 = u11.Occupant
    if u9.Character and (v20 ~= nil and v20.Parent == u9.Character) then
        u19 = true
        u18 = u1.Heartbeat:Connect(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u12
                [3] = u13
                [4] = u5
                [5] = u8
                [6] = u14
                [7] = u10
                [8] = u15
            --]]
            if u3(u12.Position) then
                if u12.Velocity.Y < 0 then
                    local v21 = u12
                    v21.Velocity = v21.Velocity + Vector3.new(0, 1, 0)
                end
                u13.Position = (u5.coordinatesFromWorkspaceVector3(u12.Position) + Vector3.new(0, 1, 0)) * 4 - Vector3.new(0, 1.5, 0)
                u13.Enabled = true
                local v22 = u12
                v22.AssemblyAngularVelocity = v22.AssemblyAngularVelocity * Vector3.new(0.95, 0.95, 0.95)
            else
                u13.Enabled = false
                u13.Position = u12.Position - Vector3.new(0, 1, 0)
            end
            if u12.AssemblyLinearVelocity.Magnitude > 50 then
                u12.AssemblyLinearVelocity = u12.AssemblyLinearVelocity.Unit * 50
            end
            Vector3.new()
            if u8.activeController then
                local v23 = u8.activeController.moveVector
                local v24 = false
                if v23.X == 0 then
                    if v23.Z == -1 then
                        u14.Enabled = true
                        u14.Force = Vector3.new(1600, 0, 0)
                    elseif v23.Z == 1 then
                        u14.Enabled = true
                        u14.Force = Vector3.new(-1600, 0, 0)
                    else
                        u14.Force = Vector3.new()
                        v24 = true
                    end
                else
                    u14.Enabled = false
                    u14.Force = Vector3.new()
                end
                if v23.X == -1 then
                    u10:PivotTo(u10:GetPivot() * CFrame.Angles(0, 0.017453292519943295, 0))
                    v24 = true
                elseif v23.X == 1 then
                    u10:PivotTo(u10:GetPivot() * CFrame.Angles(0, -0.017453292519943295, 0))
                    v24 = true
                else
                    u15.AngularVelocity = Vector3.new()
                end
                if v24 then
                    local v25 = u12
                    v25.AssemblyLinearVelocity = v25.AssemblyLinearVelocity * Vector3.new(0.65, 1, 0.65)
                    local v26 = u12
                    v26.AssemblyAngularVelocity = v26.AssemblyAngularVelocity * Vector3.new(0.65, 1, 0.65)
                end
            end
        end)
        u16.Transparency = 0.75
        u17.Transparency = 0.75
    else
        u16.Transparency = 0
        u17.Transparency = 0
        if u19 == true then
            u19 = false
            if u18 ~= nil then
                u18:Disconnect()
                u18 = nil
            end
            u14.Enabled = false
            u14.Force = Vector3.new()
        end
    end
end
u11:GetPropertyChangedSignal("Occupant"):Connect(v27)
u10:GetAttributeChangedSignal("EntityData"):Connect(function() --[[ Name: onEntityDataChanged, Line 132 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u16
        [4] = u7
    --]]
    local v28 = u6.readEntityData(u10)
    if v28 then
        v28 = v28.color
    end
    u16.Color = u7[v28 or "white"]
end)
local v29 = u6.readEntityData(u10)
if v29 then
    v29 = v29.color
end
u16.Color = u7[v29 or "white"]