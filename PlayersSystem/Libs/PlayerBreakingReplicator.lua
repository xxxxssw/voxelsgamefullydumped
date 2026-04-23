-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerBreakingReplicator
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local u4 = game:GetService("Workspace")
local u5 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.Libs.GetBreakingTime)
local u7 = require(game.ReplicatedStorage.Libs.BlockState)
local u8 = require(game.ReplicatedStorage.Assets.Sprites.Cracks)
local u9 = require(game.ReplicatedStorage.Libs.Coordinates)
local u10 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u11 = require(game.ReplicatedStorage.Systems.GreedyMeshingSystem.Configuration.Configuration)
local u12 = u4.CurrentCamera
local v19 = {
    ["getPlayerTarget"] = function(p13) --[[ Name: getPlayerTarget, Line 34 ]]
        return p13:GetAttribute("PlayerTarget") or ""
    end,
    ["client_updatePlayerTarget"] = function(p14, p15, p16, p17) --[[ Name: client_updatePlayerTarget, Line 38 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1.Systems.PlayersSystem.Network.UpdatePlayerTarget:FireServer(p14, p15, p16, p17)
    end,
    ["server_onPlayerAdded"] = function(p18) --[[ Name: server_onPlayerAdded, Line 42 ]]
        p18:SetAttribute("PlayerTarget", "")
    end
}
if u2:IsServer() then
    u1.Systems.PlayersSystem.Network.UpdatePlayerTarget.OnServerEvent:Connect(function(p20, p21, p22, p23, _) --[[ Line: 47 ]]
        if p21 then
            p20:SetAttribute("PlayerTarget", (string.format("%s_%s_%s", p21, p22, p23)))
        else
            p20:SetAttribute("PlayerTarget", "")
        end
    end)
end
local function u26(p24) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v25 = nil
    if p24:IsA("BasePart") then
        v25 = p24.Position
    elseif p24:IsA("Model") then
        v25 = p24:FindFirstChild("Hitbox")
        if v25 then
            v25 = p24.Hitbox.Position
        end
    end
    if v25 then
        return (u12.CFrame.Position - v25).Magnitude <= 100
    else
        return false
    end
end
if u2:IsClient() then
    local u27 = Instance.new("Texture")
    u27.StudsPerTileU = 4
    u27.StudsPerTileV = 4
    u27.Transparency = 0.15
    local u28 = {}
    local u29 = {}
    local function u50(u30) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u27
            [3] = u29
            [4] = u28
            [5] = u5
            [6] = u9
            [7] = u10
            [8] = u7
            [9] = u11
            [10] = u4
            [11] = u26
            [12] = u6
            [13] = u2
            [14] = u8
        --]]
        local u31 = u1.Libs.Cursor.OutlinesPart:Clone()
        u31:ClearAllChildren()
        for _, v32 in ipairs(Enum.NormalId:GetEnumItems()) do
            local v33 = u27:Clone()
            v33.Face = v32
            v33.Parent = u31
        end
        u29[u30] = u31
        u30:GetAttributeChangedSignal("PlayerTarget"):Connect(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u28
                [3] = u5
                [4] = u9
                [5] = u10
                [6] = u7
                [7] = u11
                [8] = u31
                [9] = u4
                [10] = u26
                [11] = u6
                [12] = u2
                [13] = u8
            --]]
            local u34 = u30:GetAttribute("PlayerTarget")
            if u28[u30.UserId] then
                u28[u30.UserId]:Disconnect()
                u28[u30.UserId] = nil
            end
            if u34 and u34 ~= "" then
                local v35, v36, v37 = string.match(u34, "(.+)_(.+)_(.+)")
                local u38 = u5.getBlockInstance(v35, v36, v37)
                local v39 = u9.coordinatesOffsetFromRegionName(v35) + u9.coordinatesOffsetFromChunkName(v36) + u9.coordinatesOffsetFromBlockName(v37)
                local v40 = u10.getBlockState(v39)
                local v41 = u7.getBlockId(v40)
                if v41 and u11.Blocks.Whitelist[tonumber(v41)] then
                    u31.Parent = u4.CurrentCamera
                    u31.Size = Vector3.new(4.01, 4.01, 4.01)
                    u31.Position = v39 * 4
                elseif u38 and u26(u38) then
                    u31.Parent = u4.CurrentCamera
                    if u38:IsA("Model") then
                        u31.Size = u38.Hitbox.Size + Vector3.new(0.01, 0.01, 0.01)
                        u31.CFrame = u38.Hitbox.CFrame
                    else
                        u31.Size = Vector3.new(4.01, 4.01, 4.01)
                        u31.CFrame = u38.CFrame
                    end
                end
                if u31.Parent then
                    local v42 = u30:GetAttribute("ReplicatedEquippedItemId")
                    if u38 then
                        v40 = u38:GetAttribute(u7.ATTRIBUTE) or v40
                    end
                    local u43 = u6(v42, (u7.getBlockId(v40)))
                    local u44 = tick()
                    local v49 = u2.Heartbeat:Connect(function() --[[ Line: 146 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                            [2] = u4
                            [3] = u31
                            [4] = u30
                            [5] = u34
                            [6] = u44
                            [7] = u43
                            [8] = u8
                            [9] = u2
                        --]]
                        if u38 then
                            if not u38:IsDescendantOf(u4) then
                                u31.Parent = nil
                            end
                        elseif u30.Parent == nil or u30:GetAttribute("PlayerTarget") ~= u34 then
                            u31.Parent = nil
                            return
                        end
                        if u38 == nil or u38:IsDescendantOf(u4) then
                            if u43 >= tick() - u44 then
                                local v45 = (tick() - u44) / u43
                                local v46 = math.clamp(v45, 0, 1) * 10
                                local v47 = math.floor(v46)
                                for _, v48 in ipairs(u31:GetChildren()) do
                                    v48.Texture = u8[v47 + 1]
                                end
                                u2.Heartbeat:Wait()
                            end
                        else
                            return
                        end
                    end)
                    u28[u30.UserId] = v49
                    return
                end
            end
            u31.Parent = nil
        end)
    end
    v3.PlayerAdded:Connect(u50)
    v3.PlayerRemoving:Connect(function(p51) --[[ Name: onPlayerRemoving, Line 180 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u29
        --]]
        if u28[p51.UserId] then
            u28[p51.UserId]:Disconnect()
            u28[p51.UserId] = nil
        end
        if u29[p51] then
            u29[p51]:Destroy()
            u29[p51] = nil
        end
    end)
    for _, u52 in v3:GetPlayers() do
        if u52 ~= v3.LocalPlayer then
            task.spawn(function() --[[ Line: 196 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u52
                --]]
                u50(u52)
            end)
        end
    end
end
return v19