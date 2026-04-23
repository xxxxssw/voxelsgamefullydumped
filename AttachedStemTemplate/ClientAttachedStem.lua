-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.AttachedStemTemplate.ClientAttachedStem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u5 = require(game.ReplicatedStorage.Systems.FarmingSystem)
v2:IsStudio()
if not script:IsDescendantOf(v1) then
    require(game.ReplicatedStorage.Assets.TextureProvider.TexturesLinker)
    require(game.ReplicatedStorage.Assets.TextureProvider)
    require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
    local u6 = script.Parent
    local _ = u6.Hitbox;
    ({}).attached_melon_stem = {
        ["size"] = 4,
        ["order"] = {
            0,
            0,
            1,
            1,
            2,
            2,
            2,
            3
        },
        ["color"] = Color3.fromRGB(97, 86, 12)
    }
    local function v12() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u4
        --]]
        local v7 = u6:GetAttribute(u3.ATTRIBUTE)
        local v8 = u3.getBlockId(v7)
        local v9 = u3.getMetadata(v7)
        local _ = u6.PrimaryPart.Position
        local v10 = u5.getTextureIdFromAttachedStemId(v8)
        u4.getPropertiesValuesTable(v8, v9.compressed)
        for _, v11 in ipairs(u6:GetDescendants()) do
            if v11:IsA("ImageLabel") then
                v11.Image = string.format("rbxassetid://%s", v10)
                v11.ImageColor3 = Color3.fromRGB(157, 139, 20)
            end
        end
    end
    u6:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v12)
    v12()
end