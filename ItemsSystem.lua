-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("ReplicatedStorage")
local u1 = require(game.ReplicatedStorage.Libs.Utils)
local u2 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u3 = require(script.Enums.ItemType)
local u4 = require(script.Configuration.ItemsData)
local v5 = require(game.ReplicatedStorage.Configuration.Items.ItemsDataChanges)
local u6 = require(game.ReplicatedStorage.Assets.TextureProvider)
require(game.ReplicatedStorage.Systems.BlocksSystem)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockGeometry)
local u8 = require(game.ReplicatedStorage.Libs.BlockState)
local u9 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u10 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlocksFunctions)
require(game.ReplicatedStorage.Libs.BlockMetadata)
require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
v5.init()
local u27 = {
    ["RENDER_ITEM_REPLACE"] = {
        [u2.itemIdFromName("debug_setStructureCornerATool")] = u2.itemIdFromName("stick"),
        [u2.itemIdFromName("debug_setStructureCornerBTool")] = u2.itemIdFromName("stick"),
        [u2.itemIdFromName("debug_setStructureRootTool")] = u2.itemIdFromName("stick"),
        [u2.itemIdFromName("debug_editBlockMetadata")] = u2.itemIdFromName("stick"),
        [u2.itemIdFromName("debug_telemetryStick")] = u2.itemIdFromName("stick"),
        [u2.itemIdFromName("oak_door")] = u2.itemIdFromName("oak_door"),
        [u2.itemIdFromName("acacia_door")] = u2.itemIdFromName("acacia_door"),
        [u2.itemIdFromName("birch_door")] = u2.itemIdFromName("birch_door"),
        [u2.itemIdFromName("dark_oak_door")] = u2.itemIdFromName("dark_oak_door"),
        [u2.itemIdFromName("spruce_door")] = u2.itemIdFromName("spruce_door"),
        [u2.itemIdFromName("jungle_door")] = u2.itemIdFromName("jungle_door"),
        [u2.itemIdFromName("cooked_pizza_pepperoni")] = u2.itemIdFromName("cooked_pizza_pepperoni")
    },
    ["client_renderItemGui"] = function(p11) --[[ Name: client_renderItemGui, Line 53 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u2
            [3] = u4
            [4] = u3
            [5] = u9
            [6] = u7
            [7] = u8
            [8] = u10
            [9] = u6
        --]]
        local v12 = u27.RENDER_ITEM_REPLACE[p11] or p11
        local v13 = u2.getItemTypeFromItemId(v12)
        local v14 = u4[v12]
        if u27.RENDER_ITEM_REPLACE[v12] then
            v13 = u3.Object
        end
        local v15
        if v13 == u3.Block or u9.Viewport[v12] then
            v15 = Instance.new("ViewportFrame")
            v15.Size = UDim2.fromScale(1, 1)
            v15.BackgroundTransparency = 1
            v15.LightColor = Color3.fromRGB(255, 255, 255)
            v15.Ambient = Color3.fromRGB(188, 188, 188)
            v15.LightDirection = Vector3.new(0, -1, -0.5)
            local v16 = Instance.new("Camera")
            v16.Parent = v15
            v15.CurrentCamera = v16
            v16.CFrame = CFrame.lookAt(Vector3.new(26, 26, 26), (Vector3.new()))
            v16.FieldOfView = 8
            local v17 = u2.getBlockIdFromItemId(v12)
            local v18 = u7.create(v17)
            v18:PivotTo(CFrame.new())
            v18.Parent = v15
            local v19 = u8.create(v17, 63, nil)
            local v20 = u10.initializeMetadata(v19, nil)
            v18:SetAttribute(u8.ATTRIBUTE, v20 or v19)
            u7.client_doProcessing(v18, false, true, false)
        else
            v15 = Instance.new("ImageLabel")
            local v21 = u6.getImage2d(v14.name)
            if v21 == nil then
                local v22 = Instance.new("TextLabel")
                v22.Size = UDim2.fromScale(1, 1)
                v22.Text = "item"
                v22.TextScaled = true
                v22.Parent = v15
            else
                v15.ImageRectSize = Vector2.new(v21.rectSize, v21.rectSize)
                v15.Image = v21.imageId
                v15.ImageRectOffset = Vector2.new(v21.x * v21.rectSize, v21.y * v21.rectSize)
                v15.ResampleMode = Enum.ResamplerMode.Pixelated
            end
        end
        v15.Size = UDim2.fromScale(1, 1)
        v15.Position = UDim2.fromScale(0.5, 0.5)
        v15.AnchorPoint = Vector2.new(0.5, 0.5)
        v15.BackgroundTransparency = 1
        return v15
    end,
    ["client_renderTool"] = function(p23) --[[ Name: client_renderTool, Line 118 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u2
            [3] = u4
            [4] = u3
        --]]
        local v24 = u27.client_renderItemGeometry(p23)
        local v25 = u2.getItemTypeFromItemId(p23)
        local _ = u4[p23]
        if u27.RENDER_ITEM_REPLACE[p23] then
            v25 = u3.Object
        end
        if v25 == u3.Block and v24 then
            v24:ScaleTo(0.25)
            for _, v26 in ipairs(v24:GetChildren()) do
                if v26:IsA("Texture") then
                    v26.StudsPerTileU = v26.StudsPerTileU * 0.25
                    v26.StudsPerTileV = v26.StudsPerTileV * 0.25
                end
            end
            return v24
        elseif v25 == u3.Object then
            v24:ScaleTo(0.08)
            return v24
        else
            if v25 == u3.Tool then
                v24:ScaleTo(0.12)
            end
            return v24
        end
    end
}
local u28 = {}
function u27.client_renderItemGeometry(p29) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u2
        [3] = u4
        [4] = u3
        [5] = u7
        [6] = u8
        [7] = u10
        [8] = u1
        [9] = u28
        [10] = u6
        [11] = u9
    --]]
    local v30 = u27.RENDER_ITEM_REPLACE[p29] or p29
    local v31 = u2.getItemTypeFromItemId(v30)
    local v32 = u4[v30]
    if u27.RENDER_ITEM_REPLACE[p29] then
        v31 = u3.Object
    end
    if v31 == u3.Block then
        local v33 = u2.getBlockIdFromItemId(v30)
        local v34 = u7.create(v33)
        local v35 = Instance.new("Model")
        local v36 = Instance.new("Part")
        v36.Size = Vector3.new(1, 1, 1)
        v36.CanCollide = false
        v36.Parent = v35
        v36.Transparency = 1
        v36.Position = Vector3.new()
        if v34:IsA("Model") then
            v34.PrimaryPart.Anchored = false
            v34.PrimaryPart.CanCollide = false
            for _, v37 in ipairs(v34:GetDescendants()) do
                if v37:IsA("BasePart") or v37:IsA("PartOperation") then
                    v37.Anchored = false
                    v37.CanCollide = false
                end
            end
        else
            v34.Anchored = false
            v34.CanCollide = false
        end
        v36.CFrame = v35:GetBoundingBox()
        v35.PrimaryPart = v36
        v34.Name = "Geometry"
        local v38 = u8.create(v33, 63, nil)
        local v39 = u10.initializeMetadata(v38, Vector3.new(-100, -100, -100)) or v38
        v34:SetAttribute(u8.ATTRIBUTE, v39)
        u7.client_doProcessing(v34, true)
        v34.Parent = v35
        u1.weldModel(v35)
        for _, v40 in ipairs(v34:GetDescendants()) do
            if v40:IsA("Script") and v40.Name == "ClientWorkspace" then
                v40:Destroy()
            end
        end
        return v35
    end
    if v31 == u3.Object or v31 == u3.Tool then
        local v41 = script.Assets.Voxel:Clone()
        v41.Size = Vector3.new(1, 1, 1)
        v41.Name = "PrimaryPart"
        v41.Position = Vector3.new(0, 0, 15)
        v41.Rotation = Vector3.new(180, 135, 90)
        v41.Transparency = 1
        local v42
        if u28[p29] then
            v42 = u28[p29]:Clone()
        else
            local v43 = Instance.new("Model")
            v43.Name = v32.name
            local v44 = u6.get3dMatrixColor(v32.name)
            if v44 ~= nil then
                local v45 = {}
                for v46 = 0, 15 do
                    for v47 = 0, 15 do
                        local v48 = v44[v46][v47]
                        if v48 then
                            local v49 = script.Assets.Voxel:Clone()
                            v49.Size = Vector3.new(1, 1, 1)
                            v49.Color = v48
                            v49.Position = Vector3.new(v47, 0, v46)
                            v49.Parent = v43
                            if u9.RecolorGui[p29] then
                                v49.Color = u9.RecolorGui[p29]:Lerp(v48, 0.1)
                            end
                            table.insert(v45, v49)
                        end
                    end
                end
                local v50 = game:GetService("GeometryService"):UnionAsync(v45[1], v45)
                for _, v51 in ipairs(v50) do
                    v51.Parent = v43
                    v51.Transparency = 0
                end
                v41.Transparency = 1
                for _, v52 in ipairs(v45) do
                    v52:Destroy()
                end
            end
            u28[p29] = v43
            v42 = u28[p29]:Clone()
        end
        v41.Parent = v42
        v42.PrimaryPart = v41
        u1.weldModel(v42)
        return v42
    end
end
return u27