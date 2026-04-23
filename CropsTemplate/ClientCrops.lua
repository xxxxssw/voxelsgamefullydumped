-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.CropsTemplate.ClientCrops
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
    local u7 = u6.Hitbox
    local u8 = {
        [4] = {
            ["order"] = {
                0,
                0,
                1,
                1,
                2,
                2,
                2,
                3
            }
        }
    }
    local function v22() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u4
            [4] = u5
            [5] = u8
            [6] = u7
        --]]
        local v9 = u6:GetAttribute(u3.ATTRIBUTE)
        local v10 = u3.getBlockId(v9)
        local v11 = u3.getMetadata(v9)
        if v11 then
            local v12 = u4.getPropertiesValuesTable(v10, v11.compressed).age
            u4.blockIdGetPropertyNumValues(v10, "age")
            local v13, v14 = u5.getTextureIdFromCropId(v10)
            local v15 = u8[v14].order[v12 + 1]
            for _, v16 in ipairs(u6:GetDescendants()) do
                if v16:IsA("Texture") then
                    v16.StudsPerTileU = 4
                    v16.StudsPerTileV = 4 * v14
                    v16.OffsetStudsV = 4 * (v14 - 1) - v15 * v14 + 0.1
                    v16.Texture = string.format("rbxassetid://%s", v13)
                end
            end
            local v17 = u7
            local v18 = 0.75 + v15 * 1
            v17.Size = Vector3.new(3.5, v18, 3.5)
            local v19 = u7
            local v20 = u6.PrimaryPart.Position - Vector3.new(0, 2.25, 0)
            local v21 = (v15 + 1) * 0.5
            v19.Position = v20 + Vector3.new(0, v21, 0)
        end
    end
    u6:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v22)
    v22()
end