-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local u3 = u1.LocalPlayer
local u4 = Instance.new("BindableEvent")
return {
    ["containerOpenedOrClosed"] = u4.Event,
    ["isContainerOpenAtCoordinates"] = function(p5) --[[ Name: isContainerOpenAtCoordinates, Line 18 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u1
        --]]
        if u3:GetAttribute("localContainerCoordinates") == p5 then
            return true
        end
        for _, v6 in ipairs(u1:GetPlayers()) do
            if v6:GetAttribute("containerCoordinates") == p5 then
                return true
            end
        end
        return false
    end,
    ["server_getPlayersWithOpenedContainer"] = function(p7) --[[ Name: server_getPlayersWithOpenedContainer, Line 30 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v8 = {}
        for _, v9 in ipairs(u1:GetPlayers()) do
            if v9:GetAttribute("containerCoordinates") == p7 then
                table.insert(v8, v9)
            end
        end
        return v8
    end,
    ["client_setOpenedContainer"] = function(p10) --[[ Name: client_setOpenedContainer, Line 40 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
        --]]
        u3:SetAttribute("localContainerCoordinates", p10)
        u4:Fire()
        script.Network:FireServer(p10)
    end,
    ["init"] = function() --[[ Name: init, Line 46 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u1
        --]]
        if u2:IsServer() then
            script.Network.OnServerEvent:Connect(function(p11, p12) --[[ Line: 48 ]]
                p11:SetAttribute("containerCoordinates", p12)
            end)
        else
            local function v14(p13) --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u4
                --]]
                p13:GetAttributeChangedSignal("containerCoordinates"):Connect(function() --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                    --]]
                    u4:Fire()
                end)
            end
            u1.PlayerAdded:Connect(v14)
            for _, v15 in ipairs(u1:GetPlayers()) do
                v15:GetAttributeChangedSignal("containerCoordinates"):Connect(function() --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                    --]]
                    u4:Fire()
                end)
            end
        end
    end
}