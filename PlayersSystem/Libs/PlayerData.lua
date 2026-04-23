-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerData
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("HttpService")
local u2 = game:GetService("Players")
local u3 = game:GetService("ReplicatedStorage")
local u4 = nil
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem.Formats.Player)
local u6 = require(game.ReplicatedStorage.Libs.Coordinates)
local u7 = require(game.ReplicatedStorage.Systems.CombatSystem.Configuration)
local u8 = u3.Systems.WorldSystem.ServerOwner
local u16 = {
    ["PLAYERS_CFRAMES"] = {},
    ["server_createInitialData"] = function() --[[ Name: server_createInitialData, Line 18 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
        --]]
        return {
            ["inventory"] = u5.createEmpty(),
            ["health"] = u7.PLAYER_MAX_HEALTH,
            ["lastPlayed"] = tick(),
            ["bedCoordinates"] = nil
        }
    end,
    ["server_onPlayerDataLoaded"] = function(p9) --[[ Name: server_onPlayerDataLoaded, Line 30 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u8
            [3] = u3
            [4] = u4
        --]]
        local v10 = u16.server_readPlayerData(p9)
        if v10 == nil then
            local v11 = u8.Value
            if v11 ~= "0" and v11 ~= "" then
                local v12 = u3.Systems.WorldSystem.WorldGuid.Value
                local v13 = u4.readSessionData(v11)
                local v14 = v13.privateServerWorlds[v12].playersData
                local v15 = p9.UserId
                v14[tostring(v15)] = u16.server_createInitialData()
                u4.setSessionData(v11, v13)
                return
            end
            v10.publicServerPlayerData = u16.server_createInitialData()
            warn("Weird thing happened?")
        end
    end
}
local function u21(p17) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u16
        [3] = u6
    --]]
    local v18 = {
        ["inventory"] = u1:JSONDecode(p17:GetAttribute("inventory")),
        ["health"] = p17:GetAttribute("health"),
        ["lastPlayed"] = tick()
    }
    if u16.PLAYERS_CFRAMES[p17] ~= nil then
        local v19 = u6.coordinatesFromWorkspaceVector3(u16.PLAYERS_CFRAMES[p17].Position)
        v18.coordinates = {
            ["x"] = v19.X,
            ["y"] = v19.Y,
            ["z"] = v19.Z
        }
    end
    if p17:GetAttribute("bedCoordinates") ~= nil then
        local v20 = p17:GetAttribute("bedCoordinates")
        v18.bedCoordinates = {
            ["x"] = v20.X,
            ["y"] = v20.Y,
            ["z"] = v20.Z
        }
    end
    return v18
end
function u16.server_readPlayerData(p22) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u4
    --]]
    local v23 = u8.Value
    if v23 == "0" or v23 == "" then
        local v24 = u4.readSessionData
        local v25 = p22.UserId
        local v26 = v24((tostring(v25)))
        if v26 then
            return v26.publicServerPlayerData
        end
        error("Player data is not set?")
    else
        local v27 = u3.Systems.WorldSystem.WorldGuid.Value
        local v28 = u4.readSessionData(v23)
        if v27 ~= "" and (v28 ~= nil and v28.privateServerWorlds[v27] ~= nil) then
            local v29 = v28.privateServerWorlds[v27].playersData
            local v30 = p22.UserId
            return v29[tostring(v30)]
        end
        error("Server owner data is not set?")
    end
end
function u16.server_update(p31) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u4
        [4] = u21
    --]]
    local v32 = u8.Value
    if v32 == "0" or v32 == "" then
        local v33 = u4.readSessionData
        local v34 = p31.UserId
        local v35 = v33((tostring(v34)))
        if v35 ~= nil then
            v35.publicServerPlayerData = u21(p31, v35.publicServerPlayerData)
            local v36 = u4.setSessionData
            local v37 = p31.UserId
            v36(tostring(v37), v35)
        end
    else
        local v38 = u3.Systems.WorldSystem.WorldGuid.Value
        local v39 = u4.readSessionData(v32)
        if v38 ~= "" and (v39 ~= nil and (v39.privateServerWorlds[v38] ~= nil and p31:GetAttribute("inventory"))) then
            local v40 = v39.privateServerWorlds[v38]
            local v41 = v40.playersData
            local v42 = p31.UserId
            local v43 = tostring(v42)
            local v44 = u21
            local v45 = v40.playersData
            local v46 = p31.UserId
            v41[v43] = v44(p31, v45[tostring(v46)])
            u4.setSessionData(v32, v39)
            return
        end
    end
end
function u16.server_onOwnerSessionAutoSave() --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u4
        [4] = u2
        [5] = u21
    --]]
    local v47 = u8.Value
    local v48 = u3.Systems.WorldSystem.WorldGuid.Value
    local v49 = u4.readSessionData(v47)
    local v50 = v49.privateServerWorlds[v48]
    for v51, _ in pairs(v50.playersData) do
        local v52 = u2:GetPlayerByUserId((tonumber(v51)))
        if v52 ~= nil then
            v50.playersData[v51] = u21(v52)
        end
    end
    v49.privateServerWorlds[v48].currentTick = u3.Systems.WorldSystem.CurrentTick.Value
    v49.privateServerWorlds[v48].lastLoadedAt = tick()
    u4.setSessionData(v47, v49)
end
function u16.server_init() --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u16
    --]]
    u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs:FindFirstChild("PlayerSessionSystem"))
    u2.PlayerRemoving:Connect(function(p53) --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        task.wait(5)
        u16.PLAYERS_CFRAMES[p53] = nil
    end)
end
return u16