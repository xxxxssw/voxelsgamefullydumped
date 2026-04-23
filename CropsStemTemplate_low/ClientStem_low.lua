-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.CropsStemTemplate_low.ClientStem_low
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u5 = v2:IsStudio()
if not script:IsDescendantOf(v1) then
    local u6 = require(game.ReplicatedStorage.Assets.TextureProvider.TexturesLinker)
    local u7 = require(game.ReplicatedStorage.Assets.TextureProvider)
    local u8 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
    local u9 = script.Parent
    local u10 = u9.Hitbox
    local u11 = {
        ["melon_stem"] = {
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
            ["color"] = { Color3.fromRGB(12, 255, 81), Color3.fromRGB(80, 40, 0) }
        }
    }
    for v12, v13 in u11 do
        if v12 ~= "fire" then
            local v14 = #v13.order == 8
            assert(v14)
            local v15 = 0
            for _, v16 in ipairs(v13.order) do
                local v17 = v16 < v13.size
                assert(v17)
                local v18 = v15 <= v16
                assert(v18)
                v15 = v16
            end
        end
    end
    local function v34() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u8
            [4] = u6
            [5] = u7
            [6] = u4
            [7] = u11
            [8] = u5
            [9] = u10
        --]]
        local v19 = u9:GetAttribute(u3.ATTRIBUTE)
        local v20 = u3.getBlockId(v19)
        local v21 = u3.getMetadata(v19)
        if v21 then
            local v22 = u8.getBlockNameFromBlockId(v20)
            local v23 = u6[v22]
            if v23 then
                v23 = u6[v22].Default
            end
            local v24 = u7.getTextureId(v23)
            local v25 = u4.getPropertiesValuesTable(v20, v21.compressed).age
            u4.blockIdGetPropertyNumValues(v20, "age")
            if u11[v22] then
                local v26 = u11[v22].order[v25 + 1]
                local v27 = u11[v22].size
                for _, v28 in ipairs(u9:GetDescendants()) do
                    if v28:IsA("Texture") then
                        v28.StudsPerTileU = 4
                        v28.StudsPerTileV = 4
                        v28.OffsetStudsV = 4 * (v27 - 1) - v26 * v27 + 0.1
                        v28.Texture = string.format("rbxassetid://%s", v24)
                    end
                end
                local v29 = u10
                local v30 = 0.75 + v26 * 1
                v29.Size = Vector3.new(3.5, v30, 3.5)
                local v31 = u10
                local v32 = u9.PrimaryPart.Position - Vector3.new(0, 2.25, 0)
                local v33 = (v26 + 1) * 0.5
                v31.Position = v32 + Vector3.new(0, v33, 0)
            elseif u5 then
                warn(v22)
            end
        else
            return
        end
    end
    u9:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v34)
    v34()
end