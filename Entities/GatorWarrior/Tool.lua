-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Entities.GatorWarrior.Tool
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("Workspace")
if script:IsDescendantOf(v1) then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local v2 = require(game.ReplicatedStorage.Systems.ItemsSystem)
    local v3 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems).itemIdFromName("khepesh")
    local v4 = script.Parent
    local v5 = v4:WaitForChild("FrontRightLeg", (1 / 0))
    local v6 = v5.RightGripAttachment
    local v7 = v2.client_renderItemGeometry(v3)
    if not v4:FindFirstChild("Sword") then
        v7:PivotTo(v6.WorldCFrame)
        v7:ScaleTo(0.18)
        v7.Name = "Sword"
        v7.Parent = v4
        local v8 = Instance.new("WeldConstraint")
        v8.Part0 = v7.PrimaryPart
        v8.Part1 = v5
        v8.Parent = v7
    end
else
    return
end