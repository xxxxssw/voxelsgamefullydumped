-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.Friends
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

game:GetService("PolicyService")
game:GetService("Players")
game:GetService("MarketplaceService")
local u1 = game:GetService("SocialService")
local u2 = game.Players.LocalPlayer
if u2:GetAttribute("Friends") == nil then
    u2:SetAttribute("Friends", tick())
end
u2.CharacterAdded:Connect(function() --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    Instance.new("ExperienceInviteOptions").PromptMessage = "Invite a friend and win 1 diamond!"
    local u3 = u2
    local v4, v5 = pcall(function() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
        --]]
        return u1:CanSendGameInviteAsync(u3)
    end)
    if v4 and v5 then
        u1:PromptGameInvite(u2)
    end
end)