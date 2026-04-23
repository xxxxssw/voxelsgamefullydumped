-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.151.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v1) then
    local v2 = require(game.ReplicatedStorage.Assets.TextureProvider)
    local u3 = require(game.ReplicatedStorage.Libs.BlockState)
    local u4 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u5 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks).getBlockIdFromName("farmland")
    local u6 = script.Parent
    local u7 = {
        ["side"] = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt"),
        ["top"] = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("farmland"),
        ["moist"] = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("farmland_moist")
    }
    local u8 = Color3.fromRGB(132, 132, 132)
    local u9 = Color3.fromRGB(255, 255, 255)
    local function v12() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u4
            [4] = u5
            [5] = u7
            [6] = u9
            [7] = u8
        --]]
        local v10 = u3.getMetadata(u6:GetAttribute(u3.ATTRIBUTE))
        local v11 = u4.getProperty(u5, v10.compressed, "moisture")
        u6.Top.Texture = v11 == 0 and u7.top or u7.moist
        u6.Top.Color3 = v11 == 0 and u9 or u8
    end
    u6:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v12)
    v12()
end