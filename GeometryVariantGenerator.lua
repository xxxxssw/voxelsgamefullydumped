-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Assets.GeometryVariantGenerator
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Assets.TextureProvider)
local u3 = require(game.ReplicatedStorage.Configuration.Colors)
local u4 = require(game.ReplicatedStorage.Assets.AssetsConfiguration)
local u5 = v1.Assets.Geometry.Blocks
local u6 = {
    ["oak"] = "oak_planks",
    ["spruce"] = "spruce_planks",
    ["birch"] = "birch_planks",
    ["dark_oak"] = "dark_oak_planks",
    ["acacia"] = "acacia_planks",
    ["jungle"] = "jungle_planks",
    ["cobblestone"] = "cobblestone",
    ["sandstone"] = "sandstone",
    ["stone_brick"] = "stone_bricks",
    ["prismarine_brick"] = "prismarine_bricks",
    ["nether_brick"] = "nether_bricks",
    ["stone"] = "stone",
    ["diorite"] = "diorite",
    ["brick"] = "bricks"
}
return {
    ["server_createVariants"] = function() --[[ Name: server_createVariants, Line 34 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u6
            [4] = u3
            [5] = u2
        --]]
        local v7 = {
            [u5._slab] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle",
                "cobblestone",
                "stone",
                "diorite",
                "red_sandstone",
                "sandstone",
                "stone_brick",
                "prismarine_brick",
                "nether_brick",
                "polished_andesite",
                "polished_diorite",
                "polished_granite",
                "brick",
                "smooth_sandstone"
            },
            [u5._stairs] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle",
                "cobblestone",
                "stone",
                "diorite",
                "red_sandstone",
                "sandstone",
                "stone_brick",
                "prismarine_brick",
                "nether_brick",
                "polished_andesite",
                "polished_diorite",
                "polished_granite",
                "brick",
                "smooth_sandstone"
            },
            [u5._fence] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle",
                "nether_brick"
            },
            [u5._fence_gate] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle"
            },
            [u5._pressure_plate] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle"
            },
            [u5._button] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle",
                "stone"
            },
            [u5._stool] = {
                "oak",
                "spruce",
                "birch",
                "dark_oak",
                "acacia",
                "jungle"
            }
        }
        for v8, v9 in pairs(v7) do
            v8.Parent = nil
            for _, v10 in ipairs(v9) do
                local v11 = v8:Clone()
                v11.Name = v10 .. v8.Name
                if u4.WOOD_ESSENCES[v10] ~= nil then
                    for _, v12 in ipairs(v11:GetDescendants()) do
                        local _ = (v12:IsA("BasePart") or v12:IsA("UnionOperation")) and v12.Name == "Accent"
                    end
                end
                v11.Parent = u5
                v11:SetAttribute("BlockNameTexture", u6[v10] or v10)
            end
        end
        local v13 = u5._bed
        v13.Parent = nil
        for v14, v15 in pairs(u3) do
            local v16 = v13:Clone()
            v16.Name = v14 .. v13.Name
            v16.Couverture.Color = v15
            v16.Couverture2.Color = v15:Lerp(Color3.fromRGB(0, 0, 0), 0.25)
            v16.Parent = u5
        end
        local v17 = u5._carpet
        v17.Parent = nil
        for v18, v19 in pairs(u3) do
            local v20 = v17:Clone()
            v20.Name = v18 .. v17.Name
            v20.Geometry.Color = v19
            v20.Geometry.Material = Enum.Material.Fabric
            v20.Geometry.MaterialVariant = string.format("default_wool")
            v20.Parent = u5
        end
        local v21 = u5.glass
        for _, v22 in ipairs(Enum.NormalId:GetEnumItems()) do
            local v23 = Instance.new("Decal")
            v23.Face = v22
            v23.Texture = "rbxassetid://" .. u2.getTextureId("glass")
            v23.Parent = v21.PrimaryPart
        end
        for v24, v25 in pairs(u3) do
            local v26 = v21:Clone()
            v26.Name = v24 .. "_stained_glass"
            v26.PrimaryPart.Color = v25
            v26.PrimaryPart.Transparency = 0.75
            for _, v27 in ipairs(v26.PrimaryPart:GetChildren()) do
                v27.Color3 = v25
            end
            v26.Parent = u5
        end
        local v28 = u5.glass_pane
        for _, v29 in ipairs(Enum.NormalId:GetEnumItems()) do
            local v30 = Instance.new("Decal")
            v30.Face = v29
            v30.Texture = "rbxassetid://" .. u2.getTextureId("glass")
            v30.Parent = v28.Side.Geometry
        end
        for v31, v32 in pairs(u3) do
            local v33 = v28:Clone()
            v33.Name = v31 .. "_stained_glass_pane"
            v33.Side.Geometry.Color = v32
            v33.Side.Geometry.Transparency = 0.75
            for _, v34 in ipairs(v33.PrimaryPart:GetChildren()) do
                v34.Color3 = v32
            end
            v33.Parent = u5
        end
        local v35 = u5.door
        v35.Parent = nil
        local v36 = u5.trapdoor
        v36.Parent = nil
        for v37, v38 in pairs(u4.WOOD_ESSENCES) do
            local v39 = v35:Clone()
            v39.Name = v37 .. "_door"
            v39.Hitbox.Color = v38
            v39.Hitbox.Front.Door.ImageColor3 = v38
            v39.Hitbox.Back.Door.ImageColor3 = v38
            v39.Parent = u5
            local v40 = v36:Clone()
            v40.Name = v37 .. "_trapdoor"
            v40.Hitbox.Color = v38
            for _, v41 in ipairs(v40.Hitbox:GetChildren()) do
                v41.Color3 = v38:Lerp(Color3.fromRGB(0, 0, 0), 0.25)
            end
            v40.Parent = u5
        end
        local v42 = u5._wall_flag
        v42.Parent = nil
        for v43, v44 in pairs(u3) do
            local v45 = v42:Clone()
            v45.Name = v43 .. v42.Name
            for _, v46 in ipairs(v45:GetChildren()) do
                if v46.Name == "Stripe" then
                    v46.Color = v44:Lerp(Color3.fromRGB(0, 0, 0), 0.1)
                elseif v46.Name == "Cloth" then
                    v46.Color = v44
                end
            end
            v45.Parent = u5
        end
    end
}