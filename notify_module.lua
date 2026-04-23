-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.notify_module
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("RunService")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Players")
local v4 = game:GetService("Lighting")
local v5 = game:GetService("ReplicatedStorage")
local u6 = TweenInfo.new(1, Enum.EasingStyle.Exponential)
local u7 = Instance.new("BlurEffect")
u7.Size = 0
u7.Name = "exe_admin_extra_blur"
u7.Parent = v4
local v8 = v5.exe_storage
require(v8.transparency_module)
return {
    ["notify"] = function(_, p9, p10, p11, p12) --[[ Name: notify, Line 19 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
            [3] = u2
            [4] = u6
        --]]
        if u1:IsClient() then
            local v13 = u3.LocalPlayer.PlayerGui:WaitForChild("exe", 9999)
            local v14 = v13.notification:Clone()
            v14.Position = UDim2.new(0.5, 0, -2, 0)
            v14.Visible = true
            v14.description.Text = p9
            v14:SetAttribute("duration", p10)
            if p11 then
                v14.icon.Image = p11
            else
                v14.icon:Destroy()
                v14.description.Position = UDim2.fromOffset(0, 0)
            end
            v14.Parent = v13.storage
            u2:Create(v14, u6, {
                ["Position"] = UDim2.new(0.5, 0, 0, 30)
            }):Play()
        elseif u1:IsServer() then
            script.notify:FireClient(p12, p9, p10, p11)
        end
    end,
    ["announce"] = function(_, p15, p16, p17, p18) --[[ Name: announce, Line 54 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u6
            [4] = u7
        --]]
        local v19 = u3.LocalPlayer
        local v20 = u3:GetUserThumbnailAsync(p15.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        local v21 = v19.PlayerGui:WaitForChild("exe", 9999).announcement
        v21.Visible = true
        v21.container.BackgroundTransparency = 1
        v21.container.ImageTransparency = 1
        v21.container.padding.PaddingTop = UDim.new(2, 0)
        v21.container.label.Text = p16
        v21.container.label.gradient.Offset = Vector2.new(-1, 0)
        v21.container.announcer.profile.Image = v20
        v21.container.announcer.icon.Image = p17
        u2:Create(v21.container, u6, {
            ["BackgroundTransparency"] = 0.8,
            ["ImageTransparency"] = 0
        }):Play()
        u2:Create(v21.container.padding, u6, {
            ["PaddingTop"] = UDim.new(0, 0)
        }):Play()
        u2:Create(u7, u6, {
            ["Size"] = 20
        }):Play()
        task.wait(0.5)
        u2:Create(v21.container.label.gradient, u6, {
            ["Offset"] = Vector2.new(1, 0)
        }):Play()
        task.wait(p18)
        u2:Create(v21.container.label.gradient, u6, {
            ["Offset"] = Vector2.new(-1, 0)
        }):Play()
        task.wait(0.5)
        u2:Create(v21.container, u6, {
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(v21.container.padding, u6, {
            ["PaddingTop"] = UDim.new(2, 0)
        }):Play()
        u2:Create(u7, u6, {
            ["Size"] = 0
        }):Play()
        task.wait(1)
        v21.Visible = false
    end
}