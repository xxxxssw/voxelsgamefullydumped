-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.172.PressurePlateClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v1) then
    local u2 = require(game.ReplicatedStorage.Libs.BlockState)
    local u3 = script.Parent.Hitbox.Position
    local u4 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u5 = script.Parent
    local u6 = u5.Hitbox
    local function v11(p7) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u4
            [4] = u6
            [5] = u3
        --]]
        local v8 = u5:GetAttribute(u2.ATTRIBUTE)
        local v9 = u2.getBlockId(v8)
        local v10 = u2.getMetadata(v8) or {}
        if u4.getProperty(v9, v10.compressed, "powered") then
            u6.Position = u3 - Vector3.new(0, 0.2, 0)
        else
            u6.Position = u3
        end
        if not p7 then
            u5.PrimaryPart.Sound:Play()
        end
    end
    u5:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v11)
    v11(true)
end