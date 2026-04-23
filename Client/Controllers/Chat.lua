-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.Controllers.Chat
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("ContextActionService")
local u2 = game:GetService("StarterGui")
local v3 = game:GetService("TextChatService")
local v4 = game:GetService("UserInputService")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if v4.TouchEnabled then
    v3.ChatWindowConfiguration.VerticalAlignment = Enum.VerticalAlignment.Top
    v3.ChatWindowConfiguration.WidthScale = 0.8
    v3.ChatWindowConfiguration.HeightScale = 0.75
end
v1:BindAction("captureFocus", function(_, p5, _) --[[ Name: captureGameFocus, Line 16 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if p5 ~= Enum.UserInputState.Begin or u2:GetCore("ChatBarDisabled") ~= false then
        return Enum.ContextActionResult.Pass
    end
    u2:SetCore("ChatBarDisabled", false)
    return Enum.ContextActionResult.Sink
end, false, Enum.UserInputType.MouseButton1)