-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.LoadTextures
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Workspace")
local v3 = game:GetService("Players")
local u4 = game:GetService("Lighting")
local u5 = game:GetService("MaterialService")
local u6 = game:GetService("RunService")
local u7 = game:GetService("UserInputService")
local u8 = u2.CurrentCamera
local u9 = v3.LocalPlayer
return {
    ["allowed"] = function(_, _) --[[ Name: allowed, Line 14 ]]
        return true
    end,
    ["clientLoadTextures"] = function() --[[ Name: clientLoadTextures, Line 18 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u4
            [4] = u5
            [5] = u2
            [6] = u1
            [7] = u6
            [8] = u7
        --]]
        local v10 = {}
        for _, v11 in ipairs(u9.PlayerGui:GetChildren()) do
            v10[v11] = v11.Enabled
            v11.Enabled = false
        end
        u8.CameraType = Enum.CameraType.Scriptable
        u4.Blur.Enabled = false
        local v12 = u5.CompiledMaterials:GetChildren()
        local v13 = Instance.new("Folder")
        v13.Name = "Textures"
        v13.Parent = u2
        Random.new()
        local v14 = 1
        for v15 = 1, 30 do
            for v16 = 1, 30 do
                local v17 = u1.Assets.Voxel:Clone()
                v14 = v14 + 1
                if v12[v14] ~= nil then
                    v17.MaterialVariant = v12[v14].Name
                    local v18 = v15 * 4
                    local v19 = v16 * 4
                    v17.Position = Vector3.new(v18, 4, v19)
                    v17.Parent = v13
                end
            end
        end
        for v20, v21 in ipairs(u1.Assets.Entities:GetChildren()) do
            local v22 = v21:Clone()
            v22.PrimaryPart.Anchored = true
            local v23 = CFrame.new
            local v24 = v20 * 4
            v22:PivotTo(v23((Vector3.new(v24, 8, 0))))
            v22.Parent = v13
        end
        local v25 = u6.RenderStepped:Connect(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.CFrame = CFrame.lookAt(Vector3.new(-40, 40, -40), (Vector3.new()))
        end)
        local u26 = Instance.new("BindableEvent")
        local v28 = u7.InputBegan:Connect(function(p27, _) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            if p27.KeyCode == Enum.KeyCode.E then
                u26:Fire()
            end
        end)
        u26.Event:Wait()
        v25:Disconnect()
        v28:Disconnect()
        u26:Destroy()
        v13:Destroy()
        print("resuming")
        for v29, v30 in pairs(v10) do
            v29.Enabled = v30
        end
    end,
    ["run"] = function(p31, p32, _) --[[ Name: run, Line 83 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        p32("Press E to quit")
        u1.Systems.PlayersSystem.Network.Command_LoadTextures:FireClient(p31)
    end
}