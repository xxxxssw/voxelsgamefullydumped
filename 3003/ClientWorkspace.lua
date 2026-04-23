-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.3003.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Libs.BlockMetadata)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
if not script:IsDescendantOf(v1) then
    local _ = game.ReplicatedStorage.Assets.Entities
    Color3.fromRGB(8, 255, 82)
    Color3.fromRGB(255, 0, 4)
    Color3.fromRGB(255, 234, 3)
    local u3 = script.Parent
    local function v9() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v4 = u3:GetAttribute(u2.ATTRIBUTE)
        u2.getBlockId(v4)
        local v5 = u2.getMetadata(v4) or {}
        if v5.transparency then
            for _, v6 in u3:GetDescendants() do
                if v6:IsA("BasePart") then
                    local v7 = v5.transparency
                    v6.Transparency = tonumber(v7)
                    local v8 = v5.transparency
                    if tonumber(v8) > 0 then
                        v6.CanCollide = false
                    else
                        v6.CanCollide = true
                    end
                end
            end
        end
    end
    u3:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v9)
    v9()
end