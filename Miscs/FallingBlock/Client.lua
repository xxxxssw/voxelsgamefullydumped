-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.FallingBlock.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("Workspace")
if script:IsDescendantOf(v1) then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local v2 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
    local v3 = script.Parent
    local v4 = v3:WaitForChild("Block")
    local v5 = v3:GetAttribute("blockId")
    v4.MaterialVariant = v2.getBlockNameFromBlockId(v5)
end