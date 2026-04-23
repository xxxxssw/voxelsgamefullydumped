-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.StemTemplate.ClientStem
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
    local u8 = {}
    local v9 = {
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
        ["color"] = {
            Color3.fromRGB(0, 143, 0),
            Color3.fromRGB(0, 143, 0),
            Color3.fromRGB(77, 132, 9),
            Color3.fromRGB(77, 132, 9),
            Color3.fromRGB(121, 129, 15),
            Color3.fromRGB(121, 129, 15),
            Color3.fromRGB(121, 129, 15),
            Color3.fromRGB(157, 139, 20)
        }
    }
    u8[4] = v9
    local function v28() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u4
            [5] = u8
            [6] = u7
        --]]
        local v10 = u6:GetAttribute(u3.ATTRIBUTE)
        local v11 = u3.getBlockId(v10)
        local v12 = u3.getMetadata(v10)
        local v13 = u6.PrimaryPart.Position
        if v12 then
            local v14, v15 = u5.getTextureIdFromStemId(v11)
            local v16 = u4.getPropertiesValuesTable(v11, v12.compressed).age
            local v17 = u4.blockIdGetPropertyNumValues(v11, "age") - 1
            local v18 = u8[v15].order[v16 + 1]
            for _, v19 in ipairs(u6:GetDescendants()) do
                if v19.Name == "Sprite" then
                    local v20 = Vector3.new(1, 0, 1) * v19.Position
                    local v21 = Vector3.new(0, 1, 0) * (v13.Y - 4)
                    local v22 = v16 / v17 * Vector3.new(0, 1, 0) * 4
                    v19.Position = v20 + v21 + v22
                end
                if v19:IsA("ImageLabel") then
                    v19.Image = string.format("rbxassetid://%s", v14)
                    if u8[v15].color[v16 + 1] then
                        v19.ImageColor3 = u8[v15].color[v16 + 1]
                    end
                end
            end
            local v23 = u7
            local v24 = 0.75 + v18 * 1
            v23.Size = Vector3.new(3.5, v24, 3.5)
            local v25 = u7
            local v26 = u6.PrimaryPart.Position - Vector3.new(0, 2.25, 0)
            local v27 = (v18 + 1) * 0.5
            v25.Position = v26 + Vector3.new(0, v27, 0)
        end
    end
    u6:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v28)
    v28()
end