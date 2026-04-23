-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.EdibleSliceBlock.EdibleBlock
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
game:GetService("Debris")
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Libs.BlockMetadata)
v2:IsStudio()
if not script:IsDescendantOf(v1) then
    local u5 = require(game.ReplicatedStorage.Assets.TextureProvider.TexturesLinker)
    local u6 = require(game.ReplicatedStorage.Assets.TextureProvider)
    local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
    local u8 = script.Parent
    local _ = u8.Hitbox
    local function v18() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u7
            [4] = u5
            [5] = u6
            [6] = u4
        --]]
        local v9 = u8:GetAttribute(u3.ATTRIBUTE)
        local v10 = u3.getBlockId(v9)
        local v11 = u3.getMetadata(v9)
        local _ = u8.PrimaryPart.Position
        if v11 then
            local v12 = u7.getBlockNameFromBlockId(v10)
            local v13 = u5[v12]
            if v13 then
                v13 = u5[v12].Default
            end
            u6.getTextureId(v13)
            local v14 = u4.getPropertiesValuesTable(v10, v11.compressed)
            if v14.bites then
                for v15 = 1, v14.bites do
                    local v16 = u8:FindFirstChild((string.format("slice_%i", v15)))
                    if v16 then
                        v16:Destroy()
                    end
                end
            end
            for _, v17 in ipairs(u8:GetDescendants()) do
                if not v17:IsA("ImageLabel") then
                    v17:IsA("Texture")
                end
            end
        end
    end
    u8:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v18)
    v18()
end