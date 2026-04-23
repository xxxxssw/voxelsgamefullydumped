-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.302.ButtonClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v1) then
    local u2 = require(game.ReplicatedStorage.Libs.BlockState)
    local v3 = script.Parent.Hitbox
    local _ = v3.Position
    local u4 = v3.CFrame
    local u5 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u6 = script.Parent
    local u7 = u6.Hitbox
    local u8 = 0
    local function v12(_) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u5
            [4] = u7
            [5] = u4
            [6] = u8
        --]]
        local v9 = u6:GetAttribute(u2.ATTRIBUTE)
        local v10 = u2.getBlockId(v9)
        local v11 = u2.getMetadata(v9) or {}
        if u5.getProperty(v10, v11.compressed, "powered") then
            u7.Position = u4.Position - u4.UpVector * 0.2
        else
            u7.Position = u4.Position
        end
        if u8 > 1 then
            u6.PrimaryPart.Sound:Play()
        end
        u8 = u8 + 1
    end
    u6:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v12)
    v12(true)
end