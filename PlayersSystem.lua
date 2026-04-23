-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Players")
local u2 = game:GetService("Workspace")
local u3 = game:GetService("ReplicatedStorage")
local u4 = game:GetService("RunService")
local u5 = game:GetService("StarterGui")
local u6 = game:GetService("TextChatService")
local u7 = game:GetService("MarketplaceService")
local u8 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities)
local u9 = require(game.ReplicatedStorage.Libs.GetSpawnCFrameFromCoordinates.HighestAltitude)
local u10 = require(script.Libs.LoadSpawnLocationAsync)
local u11 = require(game.ReplicatedStorage.Assets.PhysicsGroups)
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerBreakingReplicator)
local u12 = require(game.ReplicatedStorage.Client.States.GameState)
local u13 = require(game.ReplicatedStorage.Systems.CombatSystem)
require(game.ReplicatedStorage.Systems.InventorySystem)
local u14 = require(game.ReplicatedStorage.Systems.WorldSystem)
local u15 = require(game.ReplicatedStorage.Configuration.Worlds.Maps)
local u16 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerData)
local u17 = require(script.Heartbeat)
local u18 = require(game.ReplicatedStorage.Configuration.Gamepasses)
local u19 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u20 = require(game.ReplicatedStorage.Libs.Coordinates)
local u21 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Libs.PortalsSystem)
local u22 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng)
local u23 = require(game.ReplicatedStorage.Systems.ChunksSystem.Libs.SharedWait)
local u24 = {}
local u25 = {}
local u26 = u1.LocalPlayer
local u27 = u3.Assets.Characters.Player
local function u47(p28) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u25
        [3] = u14
        [4] = u15
        [5] = u3
        [6] = u9
    --]]
    local v29 = u16.server_readPlayerData(p28)
    if p28:GetAttribute("health") == 0 then
        local v30 = p28:GetAttribute("bedCoordinates")
        if v30 ~= nil then
            return v30, 0, nil, false
        end
    end
    if u25[p28] then
        local v31 = u25[p28].coordinates
        local v32 = u25[p28].fromPortalDimension
        u25[p28] = nil
        return v31, 0, v32, false
    end
    if u14.getOwnerId() ~= nil and (p28:GetAttribute("health") > 0 and v29.coordinates ~= nil) then
        local v33 = v29.coordinates.x
        local v34 = v29.coordinates.y
        local v35 = v29.coordinates.z
        return Vector3.new(v33, v34, v35), v29.coordinates.rotation or 0, nil, false
    end
    local v36 = u15[u3.Systems.WorldSystem.MapName.Value]
    local v37 = Random.new(u3.Systems.WorldSystem.Seed.Value):NextInteger(1, #v36.spawns)
    local v38 = v36.spawns[v37]
    local v39 = v38.x
    local v40 = u9.TOKEN
    local v41 = v38.z
    local v42 = Vector3.new(v39, v40, v41)
    local v43 = Random.new()
    local v44
    if u14.getOwnerId() == nil then
        local v45 = v43:NextInteger(-48, 48)
        v44 = v42 + Vector3.new(v45, 0, v43:NextInteger(-48, 48))
    else
        local v46 = v43:NextInteger(-16, 16)
        v44 = v42 + Vector3.new(v46, 0, v43:NextInteger(-16, 16))
    end
    return v44, 0, nil, true
end
function u24.client_sendRespawnRequest() --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.setLoadingInfos({
        ["message"] = "Sending spawn request to server..",
        ["progress"] = 0
    })
    script.Network.SpawnRequest:FireServer()
end
function u24.server_teleportPlayer(p48, p49, p50) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u24
    --]]
    u25[p48] = {
        ["coordinates"] = p49,
        ["fromPortalDimension"] = p50
    }
    if p48.Character then
        p48.Character:Destroy()
        p48.Character = nil
        u24.server_spawnPlayer(p48)
    end
end
function u24.server_spawnPlayer(u51) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u47
        [3] = u13
        [4] = u20
        [5] = u23
        [6] = u8
        [7] = u19
        [8] = u21
        [9] = u27
        [10] = u11
        [11] = u2
    --]]
    if u51:IsDescendantOf(u1) and (u51.Character == nil and u51:GetAttribute("ServerReady")) then
        if u51:GetAttribute("Spawning") then
            return
        end
        u51:SetAttribute("Spawning", true)
        local u52, u53, v54, v55 = u47(u51)
        if u51:GetAttribute("health") <= 0 then
            u13.server_resetHealth(u51)
        end
        local u56 = u20.regionNameFromCoordinates(u52)
        local u57 = u20.chunkNameFromCoordinates(u52)
        local u58 = u23.server_addPrioritizedChunk(u56, u57)
        u8.server_setPlayerCoordinates(u51, u52)
        task.defer(function() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u56
                [3] = u57
                [4] = u51
                [5] = u1
                [6] = u58
            --]]
            while u19.readChunkStatus(u56, u57) ~= u19.ChunkStatus.Rendered do
                task.wait()
                if not u51:IsDescendantOf(u1) then
                    u58:Destroy()
                    return
                end
            end
            u58:Destroy()
        end)
        local u59 = nil
        local v60, _ = pcall(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u51
                [3] = u52
                [4] = u53
            --]]
            u59 = script.Network.WaitClient:InvokeClient(u51, u52, u53)
        end)
        while u58.Parent ~= nil do
            task.wait()
            if not u51:IsDescendantOf(u1) then
                u58:Destroy()
                return
            end
        end
        if v60 and u51:IsDescendantOf(u1) then
            if v54 then
                if not u51:IsDescendantOf(u1) then
                    return
                end
                local v61 = u21.server_findOrGeneratePortal(u56, u57, v54, u52)
                u59 = CFrame.new((v61 + Vector3.new(0, 1.5, 0)) * 4)
            end
            local v62 = u27:Clone()
            v62.Name = u51.Name
            v62:SetAttribute("NaturalSpawn", v55)
            v62:AddPersistentPlayer(u51)
            u11.server_initPlayerCharacter(v62)
            v62:PivotTo(u59)
            u51.Character = v62
            v62.Parent = u2.Characters
            task.wait(0.5)
            u51:SetAttribute("Spawning", nil)
        end
    end
end
function u24.init() --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
        [4] = u24
        [5] = u7
        [6] = u1
        [7] = u25
        [8] = u22
        [9] = u6
        [10] = u26
        [11] = u10
        [12] = u17
    --]]
    if u4:IsServer() then
        u5.MasterScreenGui.Parent = u3.Client
        u5.exe.Parent = u3.Client
        script.Network.SpawnRequest.OnServerEvent:Connect(u24.server_spawnPlayer)
        script.ServerReady.Value = true
        u7.PromptGamePassPurchaseFinished:Connect(server_onGamepassPurchaseFinished)
        u1.PlayerRemoving:Connect(function(p63) --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u22
            --]]
            u25[p63] = nil
            u22.server_onPlayerRemoved(p63)
        end)
        script.Network.HideMyMarker.OnServerEvent:Connect(function(p64, p65) --[[ Line: 212 ]]
            p64:SetAttribute("PlayerMarkerHidden", p65 and true or false)
        end)
    else
        script.Network.SystemChat.OnClientEvent:Connect(function(p66, p67) --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p67 ~= nil then
                local v68 = p67.R * 255
                local v69 = math.floor(v68)
                local v70 = p67.G * 255
                local v71 = math.floor(v70)
                local v72 = p67.B * 255
                p66 = "<font color=\"rgb(" .. v69 .. "," .. v71 .. "," .. math.floor(v72) .. ")\">" .. p66 .. "</font>"
            end
            u6.TextChannels.RBXSystem:DisplaySystemMessage(p66)
        end)
        u3.Client:WaitForChild("MasterScreenGui").Parent = u26.PlayerGui
        u3.Client:WaitForChild("exe").Parent = u26.PlayerGui
        script.Network.WaitClient.OnClientInvoke = u10
        if not script.ServerReady.Value then
            script.ServerReady.Changed:Wait()
        end
        local v73 = require(u3.Systems.PlayersSystem.ChatCommands.Callbacks.Memory)
        local v74 = require(u3.Systems.PlayersSystem.ChatCommands.Callbacks.LoadTextures)
        u3.Systems.PlayersSystem.Network.Command_Memory.OnClientEvent:Connect(v73.dump)
        u3.Systems.PlayersSystem.Network.Command_LoadTextures.OnClientEvent:Connect(v74.clientLoadTextures)
    end
    task.spawn(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        while task.wait(0.4) do
            u17()
        end
    end)
end
function u24.server_fetchGamepasses(u75) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u1
    --]]
    for u76, u77 in pairs(u18) do
        if u76 < 0 then
            u75:SetAttribute(u77, true)
        else
            task.defer(function() --[[ Line: 258 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u75
                    [3] = u76
                    [4] = u1
                    [5] = u77
                --]]
                local u78 = nil
                while not pcall(function() --[[ Line: 260 ]]
                    --[[
                    Upvalues:
                        [1] = u78
                        [2] = u7
                        [3] = u75
                        [4] = u76
                    --]]
                    u78 = u7:UserOwnsGamePassAsync(u75.UserId, u76)
                end) do
                    task.wait(10)
                    if u75.Parent ~= u1 then
                        return
                    end
                end
                u75:SetAttribute(u77, u78)
            end)
        end
    end
end
function server_onGamepassPurchaseFinished(p79, p80, p81)
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p81 then
        local v82 = u18[p80]
        local v83 = "Gamepass" .. tostring(p80) .. "does not have a matching gamepassKey"
        assert(v82, v83)
        p79:SetAttribute(v82, true)
    end
end
return u24