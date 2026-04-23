-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.DevProducts
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

game:GetService("PolicyService")
game:GetService("Players")
local u1 = game:GetService("MarketplaceService")
game:GetService("SocialService")
local u2 = game.Players.LocalPlayer
local function u4() --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    local v3 = u2:GetAttribute("LastProductPromptTime") or tick()
    if tick() - v3 >= 60 then
        u1:PromptProductPurchase(u2, 3567715668)
        u2:SetAttribute("LastProductPromptTime", tick())
    end
end
u2.CharacterAdded:Connect(function() --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    if u2:GetAttribute("LastProductPromptTime") == nil then
        u2:SetAttribute("LastProductPromptTime", tick())
    end
    u4()
end)