-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Assets.TextureProvider
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("HttpService")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("RunService")
require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
require(script.TexturesLinker)
local _ = v2.Assets.TexturePack
local v4 = {}
local u5 = require(v2.Assets.TexturePack.blocks)
local u6 = require(v2.Assets.TexturePack.items)
local u7 = v1:JSONDecode((require(v2.Assets.TexturePack.matrix)))
if u3:IsClient() then
    v2.Assets.TexturePack.matrix:Destroy()
end
function v4.getTextureId(p8) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5[p8] or ""
end
function v4.getImage2d(p9) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v10 = u6
    if v10 then
        if v10.data[p9] then
            return {
                ["imageId"] = v10.meta.image_id,
                ["rectSize"] = v10.meta.pixel,
                ["x"] = v10.data[p9].x,
                ["y"] = v10.data[p9].y
            }
        end
    end
end
local u11 = {}
function v4.get3dMatrixColor(p12) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u3
    --]]
    if u11[p12] then
        return u11[p12]
    end
    local v13 = u7[p12]
    if v13 then
        local v14 = v13.data:split(",")
        local v15 = v13.color
        local v16 = {}
        for v17, v18 in pairs(v15) do
            local v19, v20, v21, v22 = v17:match("(.+),(.+),(.+),(.+)")
            if tonumber(v22) ~= 0 then
                v16[tostring(v18)] = Color3.fromRGB(v19, v20, v21)
            end
        end
        local v23 = {}
        for v24 = 0, 15 do
            v23[v24] = {}
        end
        for v25 = 0, 15 do
            for v26 = 0, 15 do
                v23[v25][v26] = v16[v14[v26 + 1 + v25 * 16]]
            end
        end
        u11[p12] = v23
        return v23
    end
    if u3:IsStudio() then
        warn("item not found: " .. p12)
    end
end
return v4