-- Roblox script dump
-- ClassName: Script
-- Path: Workspace.Camera.LowQualityClouds.CloudsGui.CloudsImage.Updater
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = game:GetService("RunService")
game:GetService("Workspace")
local u2 = nil
local u3 = script:FindFirstAncestorOfClass("Part")
local function v5() --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u1
    --]]
    if u2 then
        u2:Disconnect()
        u2 = nil
    end
    if u3:GetAttribute("Enabled") then
        local u4 = 0
        u2 = u1.Stepped:Connect(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4 = u4 + 0.01
            if u4 >= 128 then
                u4 = 0
            end
            script.Parent.ImageRectOffset = Vector2.new(0, u4)
        end)
    end
end
u3:GetAttributeChangedSignal("Enabled"):Connect(v5)
if u2 then
    u2:Disconnect()
    u2 = nil
end
if u3:GetAttribute("Enabled") then
    local u6 = 0
    u2 = u1.Stepped:Connect(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6 = u6 + 0.01
        if u6 >= 128 then
            u6 = 0
        end
        script.Parent.ImageRectOffset = Vector2.new(0, u6)
    end)
end