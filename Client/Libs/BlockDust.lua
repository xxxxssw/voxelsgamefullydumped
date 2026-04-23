-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.BlockDust
-- Source: decompile
-- Dumped: 2026-04-23 03:45:35

local v1 = game:GetService("Workspace")
local u2 = require(game.ReplicatedStorage.Assets.AssetsConfiguration)
local u3 = require(script.Configuration.Configuration)
local u4 = require(game.ReplicatedStorage.Assets.TextureProvider)
local u5 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u6 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u7 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockGeometry.applyColor)
local v8 = {}
local u9 = Instance.new("Folder")
u9.Name = "BlockDust"
u9.Parent = v1.CurrentCamera
function v8.getParticleDebounce() --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Particle.Debounce
end
function v8.createParticles(p10, p11, p12) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
        [4] = u2
        [5] = u6
        [6] = u7
        [7] = u9
    --]]
    local v13 = Vector3.new(1, 1, 1) - p11 * p11
    local u14 = script.Assets.Particle:Clone()
    local v15 = p10 + 2 * p11 + p11 * u14.Size * 0.5
    local v16 = math.random() - 0.5
    local v17 = math.random() - 0.5
    local v18 = math.random() - 0.5
    local v19 = v15 + v13 * (Vector3.new(v16, v17, v18) * 4)
    local v20 = math.random() * 0.1 + -0.05
    local v21 = math.random() * 0.1 + -0.05
    local _ = math.random() * 0.1 + -0.05
    local v22 = Vector3.new(v20, 0.2, v21)
    local v23 = u3.Particle.Overwrite[p12] or p12
    local v24 = u5.getBlockNameFromBlockId(v23)
    if string.find(v24, "_log") then
        v24 = string.format("%s_log_side", string.find(v24, "birch") and "birch" or "default")
    end
    local v25 = u4.getTextureId(v24)
    if v25 ~= nil then
        if u2.BLOCKS_COLOR_OVERRIDE[v23] then
            u14.BillboardGui.Texture.ImageColor3 = u2.BLOCKS_COLOR_OVERRIDE[v23]
        elseif u6.Leaves[v23] then
            u14.BillboardGui.Texture.ImageColor3 = Color3.fromRGB(85, 170, 127)
        end
        local v26 = math.random() * 3 + -1.5
        local v27 = math.random() * 3 + -1.5
        local v28 = UDim2.fromScale(0.5 + v26, 0.5 + v27)
        u7(u14, v23, { 1 })
        u14.BillboardGui.Texture.Position = v28
        u14.BillboardGui.Texture.Image = "rbxassetid://" .. v25
        u14.Position = v19
        u14.Parent = u9
        u14:ApplyImpulse(v22)
        task.delay(1, function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14:Destroy()
        end)
    end
end
function v8.createParticlesBlockBreak(p29, p30) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
        [4] = u2
        [5] = u6
        [6] = u7
        [7] = u9
    --]]
    for _ = 1, u3.Particle.BlockBreak.AmountParticles do
        local u31 = script.Assets.Particle:Clone()
        local v32 = math.random() * 0.1 + -0.05
        local v33 = math.random() * 0.1 + -0.05
        local v34 = math.random() * 0.1 + -0.05
        local v35 = Vector3.new(v32, v33, v34)
        local v36 = u3.Particle.Overwrite[p30] or p30
        local v37 = u5.getBlockNameFromBlockId(v36)
        if string.find(v37, "_log") then
            v37 = string.format("%s_log_side", string.find(v37, "birch") and "birch" or "default")
        end
        local v38 = u4.getTextureId(v37)
        if v38 == nil then
            return
        end
        if u2.BLOCKS_COLOR_OVERRIDE[v36] then
            u31.BillboardGui.Texture.ImageColor3 = u2.BLOCKS_COLOR_OVERRIDE[v36]
        elseif u6.Leaves[v36] then
            u31.BillboardGui.Texture.ImageColor3 = Color3.fromRGB(85, 170, 127)
        end
        local v39 = math.random() * 3 + -1.5
        local v40 = math.random() * 3 + -1.5
        local v41 = UDim2.fromScale(0.5 + v39, 0.5 + v40)
        u7(u31, v36, { 1 })
        u31.BillboardGui.Texture.Position = v41
        u31.BillboardGui.Texture.Image = "rbxassetid://" .. v38
        u31.Position = p29
        u31.Parent = u9
        u31:ApplyImpulse(v35)
        task.delay(0.5, function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:Destroy()
        end)
    end
end
return v8