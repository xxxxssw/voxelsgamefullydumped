-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.150.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u3 = script.Parent
    local u4 = u3.Hitbox
    local function v12() --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u4
        --]]
        local v5 = u2.getMetadata(u3:GetAttribute(u2.ATTRIBUTE))
        if v5 and v5.stage then
            for _, v6 in ipairs(u3:GetDescendants()) do
                if v6:IsA("Texture") then
                    v6.OffsetStudsV = 12.1 - (v5.stage - 1) * 4
                end
            end
            local v7 = u4
            local v8 = 0.75 + (v5.stage - 1) * 1
            v7.Size = Vector3.new(3.5, v8, 3.5)
            local v9 = u4
            local v10 = u3.PrimaryPart.Position - Vector3.new(0, 2.25, 0)
            local v11 = v5.stage * 0.5
            v9.Position = v10 + Vector3.new(0, v11, 0)
        end
    end
    u3:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v12)
    v12()
end