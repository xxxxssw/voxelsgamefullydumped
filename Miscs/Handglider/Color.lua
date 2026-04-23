-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.Handglider.Color
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("Workspace")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if script:IsDescendantOf(v1) then
    local v2 = require(game.ReplicatedStorage.Configuration.Colors)
    local v3 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
    local v4 = script.Parent
    local v5 = v4:GetAttribute("ItemId")
    for _, v6 in ipairs(v4:GetChildren()) do
        if v6:IsA("BasePart") and v6.Name == "Wool" then
            v6.Color = v2[v3.Handglider[v5]]
        end
    end
end