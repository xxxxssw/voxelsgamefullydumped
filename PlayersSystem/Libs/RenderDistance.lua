-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.RenderDistance
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local u4 = v2:IsStudio() and 2 or 3
if v2:IsServer() then
    u1.Configuration.DefaultRenderDistance.Value = u4
end
local u5 = v2:IsStudio() and (1 / 0) or 6
local v6 = v3.LocalPlayer
local v7 = v2:IsServer()
local u8 = {}
if v6 ~= nil then
    u8.changed = v6:GetAttributeChangedSignal("RenderDistance")
end
function u8.getRenderDistance(p9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return p9:GetAttribute("RenderDistance") or u4
end
function u8.getUnRenderDistance(p10) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.getRenderDistance(p10) + 1
end
function u8.client_updateRenderDistance(p11) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u1
    --]]
    if p11 > 0 and p11 <= u5 then
        u1.Systems.PlayersSystem.Network.UpdateRenderDistance:FireServer(p11)
    end
end
function u8.server_onPlayerAdded(p12) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    p12:SetAttribute("RenderDistance", u4)
end
if v7 then
    u1.Systems.PlayersSystem.Network.UpdateRenderDistance.OnServerEvent:Connect(function(p13, p14) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        for v15 = 1, u5 do
            if p14 == v15 then
                v16 = true
                ::l5::
                if v16 then
                    p13:SetAttribute("RenderDistance", p14)
                end
                return
            end
        end
        local v16 = false
        goto l5
    end)
end
return u8