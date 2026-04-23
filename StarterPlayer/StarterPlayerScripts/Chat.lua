-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.Chat
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = game:GetService("TextChatService")
local u2 = game:GetService("Players")
function v1.OnIncomingMessage(p3) --[[ Line: 4 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v4 = Instance.new("TextChatMessageProperties")
    if p3.TextSource and u2:GetPlayerByUserId(p3.TextSource.UserId):GetAttribute("VIP") == true then
        v4.PrefixText = "<font color=\'#d9c80b\'>[VIP]</font> " .. p3.PrefixText
    end
    return v4
end