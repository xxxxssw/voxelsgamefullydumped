-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Characters.SkinTest.CharacterClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

local v1 = game:GetService("Workspace")
game:GetService("Players")
game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("TweenService")
if script:IsDescendantOf(v1) then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local v2 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem)
    local v3 = script:FindFirstAncestorOfClass("Model")
    task.wait(1)
    local v4 = v3:GetAttribute(v2.SKIN_NAME_ATTRIBUTE)
    v2.client_drawCharacterSkinTest(v3, v4)
    local v5 = v3:WaitForChild("HumanoidRootPart")
    v3:WaitForChild("RightArm")
    local v6 = v5:WaitForChild("NameTag")
    local v7 = v3:GetAttribute("CharacterTagContent")
    v6.Frame.Username.Text = v7
end