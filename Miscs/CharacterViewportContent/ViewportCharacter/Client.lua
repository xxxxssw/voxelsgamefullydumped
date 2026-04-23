-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.CharacterViewportContent.ViewportCharacter.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v2) then
    local v3 = v1.LocalPlayer
    local v4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem)
    local v5 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
    local u6 = require(game.ReplicatedStorage.Client.Libs.ArmorRenderer)
    local u7 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
    local u8 = require(game.ReplicatedStorage.Client.States.InventoryState)
    local u9 = require(game.ReplicatedStorage.Systems.InventorySystem)
    local u10 = script.Parent
    u10:WaitForChild("HumanoidRootPart")
    u10:WaitForChild("Humanoid")
    v5.client_waitLocalPlayerSession()
    while not v3:GetAttribute(v4.SKIN_NAME_ATTRIBUTE) do
        task.wait()
    end
    if u10:FindFirstAncestorOfClass("ViewportFrame") then
        v4.client_drawViewportCharacterSkin(u10, v4.client_getLocalPlayerSkinName())
        if script:FindFirstAncestor("InventoryOnly") then
            for _, u11 in ipairs(u6.slots) do
                local u12 = "ReplicatedItemId" .. u11
                u10:GetAttributeChangedSignal(u12):Connect(function() --[[ Name: render, Line 40 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u12
                        [3] = u6
                        [4] = u11
                    --]]
                    local v13 = u10:GetAttribute(u12)
                    if v13 == nil or v13 <= 0 then
                        u6.clear(u10, u11)
                    else
                        u6.render(u10, v13)
                    end
                end)
                local v14 = u10:GetAttribute(u12)
                if v14 == nil or v14 <= 0 then
                    u6.clear(u10, u11)
                else
                    u6.render(u10, v14)
                end
            end
            local function v19() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u6
                    [3] = u7
                    [4] = u9
                    [5] = u10
                --]]
                local v15 = u8.getState().predictedInventories.Player
                for _, v16 in ipairs(u6.slots) do
                    local v17 = "ReplicatedItemId" .. v16
                    local v18 = v15[u7.specialSlots[v16]]
                    if v18 == nil or v18 == u9.NoItemSymbol then
                        u10:SetAttribute(v17, 0)
                    else
                        u10:SetAttribute(v17, v18.id)
                    end
                end
            end
            u8.stateChanged:Connect(v19)
            v19()
        end
    end
end