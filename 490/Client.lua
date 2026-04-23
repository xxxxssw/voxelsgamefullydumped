-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.490.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v1) then
    local v2 = require(game.ReplicatedStorage.Assets.TextureProvider)
    local v3 = script.Parent
    v3.Part.Left.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt_path_side")
    v3.Part.Right.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt_path_side")
    v3.Part.Back.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt_path_side")
    v3.Part.Front.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt_path_side")
    v3.Part.Top.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt_path_top")
    v3.Part.Bottom.Texture = "http://www.roblox.com/asset/?id=" .. v2.getTextureId("dirt")
end