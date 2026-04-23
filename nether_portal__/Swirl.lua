-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.nether_portal__.Swirl
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("RunService")
local u2 = game:GetService("Workspace")
local v3 = game:GetService("ReplicatedStorage")
local u4 = script.Parent.Part.SwirlsSurfaceGuiTop.SwirlsImage
local u5 = script.Parent.Part.SwirlsSurfaceGuiBottom.SwirlsImage
if shared._InitialServerTime == nil then
    shared._InitialServerTime = u2:GetServerTimeNow()
end
local u6 = shared._InitialServerTime
if not script:IsDescendantOf(v3) then
    v1.RenderStepped:Connect(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u4
            [4] = u5
        --]]
        local v7 = (u2:GetServerTimeNow() - u6) * 3
        local v8 = math.floor(v7)
        u4.Rotation = v8 * 90
        u5.Rotation = v8 * 90
    end)
end