-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.258.ClientLight
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
if not script:IsDescendantOf(v1) then
    local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u3 = require(game.ReplicatedStorage.Libs.BlockState)
    local u4 = script.Parent
    local function v10() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
        --]]
        local v5 = u4:GetAttribute(u3.ATTRIBUTE)
        local v6 = u3.getBlockId(v5)
        local v7 = u3.getMetadata(v5) or {}
        local v8 = u2.getProperty(v6, v7.compressed, "lit")
        for _, v9 in u4.Hitbox:GetChildren() do
            if v9:IsA("Texture") then
                v9.Texture = v8 and "rbxassetid://17006176128" or "rbxassetid://17006171857"
            end
        end
        u4.PrimaryPart.PointLight.Enabled = v8
    end
    u4:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v10)
    v10()
end