-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.BedSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Players")
local u3 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerData)
local u5 = require(game.ReplicatedStorage.Systems.WorldSystem)
local u6 = require(game.Lighting.ClockSystem)
local u7 = require(game.ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.Day)
local u8 = {}
local u9 = u1.Systems.PlayersSystem.Network.SystemChat
local u10 = Instance.new("BindableEvent")
local v11 = {
    ["triggerChange"] = function() --[[ Name: triggerChange, Line 23 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:Fire()
    end
}
local function u14(p12, p13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9:FireAllClients(p12, p13)
end
local function u18() --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v15 = 0
    for _, v16 in ipairs(u2:GetPlayers()) do
        if v16.Character ~= nil then
            local v17 = v16.Character:FindFirstChild("Humanoid")
            if v17 ~= nil and v17:GetState() ~= Enum.HumanoidStateType.Dead then
                v15 = v15 + 1
            end
        end
    end
    return (v15 == 0 or (v15 == 1 or v15 == 2)) and 1 or ((v15 == 3 or (v15 == 4 or (v15 == 5 or v15 == 6))) and 2 or (v15 < 13 and 3 or 4))
end
u10.Event:Connect(function() --[[ Name: server_onChangeOccured, Line 52 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
        [3] = u2
        [4] = u7
        [5] = u14
    --]]
    if u6.getDaySection() == "DAY" then
        script.SleepingStatus.Value = "It\'s daytime!"
    else
        local v19 = u18()
        local v20 = 0
        local u21 = {}
        for _, v22 in ipairs(u2:GetPlayers()) do
            if v22.Character ~= nil then
                local v23 = v22.Character:FindFirstChild("Humanoid")
                if v23 ~= nil and (v23:GetState() ~= Enum.HumanoidStateType.Dead and (v23.SeatPart ~= nil and v23.SeatPart.Name == "BedSeat")) then
                    v20 = v20 + 1
                    table.insert(u21, v23)
                end
            end
        end
        script.SleepingStatus.Value = tostring(v20) .. "/" .. tostring(v19) .. " player(s) are sleeping"
        if v20 > 0 and v19 <= v20 then
            task.delay(2, function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u7
                    [3] = u14
                    [4] = u21
                --]]
                if u6.getDaySection() ~= "DAY" then
                    u7.run(nil, u14, nil)
                end
                for _, v24 in ipairs(u21) do
                    v24.Sit = false
                end
            end)
            return
        end
    end
end)
function v11.server_onPlayerAdded(p25) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u8
    --]]
    local v26 = u4.server_readPlayerData(p25)
    if u5.getOwnerId() == nil then
        p25:SetAttribute("bedCoordinates", u8[p25.UserId])
    elseif v26.bedCoordinates ~= nil then
        local v27 = v26.bedCoordinates
        local v28 = v27.x
        local v29 = v27.y
        local v30 = v27.z
        p25:SetAttribute("bedCoordinates", (Vector3.new(v28, v29, v30)))
        return
    end
end
function v11.server_onBedUsed(p31, p32) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u1
        [4] = u9
        [5] = u8
    --]]
    local v33 = u4.server_readPlayerData(p31)
    if u5.getOwnerId() == nil then
        if u8[p31.UserId] ~= p32 then
            p31:SetAttribute("bedCoordinates", p32)
            u8[p31.UserId] = p32
            u9:FireClient(p31, "Respawn point set", Color3.fromRGB(170, 255, 127))
            u1.Client.Events.NetworkNotification:FireClient(p31, "Respawn point set")
            return
        end
        u1.Client.Events.NetworkNotification:FireClient(p31, "This is already your respawn point")
    elseif v33 ~= nil then
        if p31:GetAttribute("bedCoordinates") == p32 then
            u1.Client.Events.NetworkNotification:FireClient(p31, "This is already your respawn point")
        else
            p31:SetAttribute("bedCoordinates", p32)
            v33.bedCoordinates = {
                ["x"] = p32.X,
                ["y"] = p32.Y,
                ["z"] = p32.Z
            }
            u4.server_update(p31)
            u9:FireClient(p31, "Respawn point set", Color3.fromRGB(170, 255, 127))
            u1.Client.Events.NetworkNotification:FireClient(p31, "Respawn point set")
        end
    end
end
function v11.server_onBedDestroyed(p34) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u1
        [4] = u2
        [5] = u9
        [6] = u8
    --]]
    local v35 = u5.getOwnerId()
    if v35 == nil then
        for v36, v37 in pairs(u8) do
            if v37 == p34 then
                u8[v36] = nil
                local v38 = u2:GetPlayerByUserId(v36)
                if v38 ~= nil then
                    v38:SetAttribute("bedCoordinates", nil)
                    u9:FireClient(v38, "Your respawn point has been destroyed", Color3.fromRGB(255, 0, 0))
                    u1.Client.Events.NetworkNotification:FireClient(v38, "Your respawn point has been destroyed")
                end
            end
        end
    else
        local v39 = u3.readSessionData(v35)
        local v40 = u1.Systems.WorldSystem.WorldGuid.Value
        local v41 = v39.privateServerWorlds[v40]
        local v42 = false
        for v43, v44 in pairs(v41.playersData) do
            if v44.bedCoordinates ~= nil then
                local v45 = v44.bedCoordinates.x
                local v46 = v44.bedCoordinates.y
                local v47 = v44.bedCoordinates.z
                if Vector3.new(v45, v46, v47) == p34 then
                    v42 = true
                    v44.bedCoordinates = nil
                    local v48 = u2:GetPlayerByUserId(v43)
                    if v48 ~= nil then
                        v48:SetAttribute("bedCoordinates", nil)
                        u9:FireClient(v48, "Your respawn point has been destroyed", Color3.fromRGB(255, 0, 0))
                        u1.Client.Events.NetworkNotification:FireClient(v48, "Your respawn point has been destroyed")
                    end
                end
            end
        end
        if v42 then
            u3.setSessionData(v35, v39)
            return
        end
    end
end
return v11