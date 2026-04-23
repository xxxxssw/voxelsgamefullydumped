-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.WorldSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("Workspace")
local v1 = game:GetService("RunService")
local u2 = game:GetService("Players")
local v3 = game:GetService("Lighting")
local u4 = game:GetService("HttpService")
local u5 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local u6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerData)
local u7 = require(game.ReplicatedStorage.Libs.DatastoreTokens)
local u8 = require(game.ReplicatedStorage.Systems.WorldSystem.Libs.DatastorePrefix)
local u9 = require(game.ReplicatedStorage.Configuration.MainConfiguration)
local u10 = require(v3.ClockSystem.TimeConfiguration)
local u11 = require(script.Libs.WorldUtils)
require(game.ReplicatedStorage.Configuration.StudioConfiguration)
local u12 = require(game.ReplicatedStorage.Libs.Utils)
local u13 = {
    ["MAX_WORLDS"] = 1,
    ["WORLD_DISPLAY_NAME_MAX_LENGTH"] = 20,
    ["WORLD_SETTINGS"] = {
        ["pvpDisabled"] = true
    }
}
local u14 = false
local u15 = u2.LocalPlayer
local u16 = Random.new()
if v1:IsServer() then
    script.ServerOwner.Value = game.PrivateServerOwnerId
end
local function u22(p17, p18, p19, p20) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
    --]]
    local v21 = p20 or u16:NextInteger(0, 1048576)
    return {
        ["displayName"] = nil,
        ["mapName"] = p17,
        ["createdAt"] = tick(),
        ["lastLoadedAt"] = 0,
        ["currentTick"] = u10.SERVER_INITIAL_HOUR * u10.HOUR_LENGTH,
        ["seed"] = v21,
        ["playersData"] = {},
        ["gameMode"] = p18,
        ["prefix"] = p19
    }
end
function u13.getOwnerId() --[[ Line: 69 ]]
    local v23 = script.ServerOwner.Value
    if v23 == "0" then
        return nil
    else
        return v23
    end
end
local function u27(_, p24) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u5
    --]]
    local v25 = u13.getOwnerId() ~= nil and script.WorldGuid.Value == "" and (not u14 and u5.readSessionData(u13.getOwnerId()))
    if v25 then
        local v26 = v25.privateServerWorlds[p24]
        if v26 ~= nil then
            script.CurrentTick.Value = v26.currentTick
            script.MapName.Value = v26.mapName
            script.WorldGuid.Value = p24
            script.Seed.Value = v26.seed
            script.RegionsDatastorePrefix.Value = v26.prefix
            script.GameMode.Value = v26.gameMode
            return true
        end
    end
    return false
end
local function u34(p28, p29) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u5
    --]]
    local v30 = p28.UserId
    local v31 = tostring(v30) == u13.getOwnerId() and script.WorldGuid.Value ~= p29 and (not u14 and u5.readSessionData(u13.getOwnerId()))
    if not v31 then
        return false
    end
    v31.privateServerWorlds[p29] = nil
    u14 = true
    local v32 = u5.server_savePlayerSessionAsync(u13.getOwnerId(), v31)
    u14 = false
    if v32 then
        local v33 = u5.readSessionData(u13.getOwnerId())
        v33.privateServerWorlds[p29] = nil
        u5.setSessionData(u13.getOwnerId(), v33)
    end
    return true
end
local function u44(p35, p36) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u5
        [4] = u11
        [5] = u22
        [6] = u8
        [7] = u4
    --]]
    local v37 = p35.UserId
    if tostring(v37) == u13.getOwnerId() and not u14 then
        local v38 = u5.readSessionData(u13.getOwnerId())
        if v38 then
            local v39 = 0
            for _ in pairs(v38.privateServerWorlds) do
                v39 = v39 + 1
            end
            if u13.MAX_WORLDS <= v39 then
                return false
            end
        end
        if v38 and (typeof(p36) == "table" and (u11.isValidMapName(p36.mapName) and u11.isValidGameMode(p36.gameMode))) then
            local v40 = u22(p36.mapName, p36.gameMode, u8.nextPrefix(v38))
            local v41 = u4:GenerateGUID(false)
            v38.privateServerWorlds[v41] = v40
            u14 = true
            local v42 = u5.server_savePlayerSessionAsync(u13.getOwnerId(), v38)
            u14 = false
            if v42 then
                local v43 = u5.readSessionData(u13.getOwnerId())
                v43.privateServerWorlds[v41] = v40
                u5.setSessionData(u13.getOwnerId(), v43)
            end
            return v42
        end
    end
    return false
end
local function u64(p45, p46) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u14
        [4] = u12
    --]]
    local v47 = script.WorldGuid.Value
    local v48 = u5.readSessionData(u13.getOwnerId())
    local v49 = p45.UserId
    if tostring(v49) == u13.getOwnerId() and (v48.privateServerWorlds[v47] ~= nil and not u14) then
        local v50 = typeof(p46) == "table"
        assert(v50)
        u14 = true
        local v51
        if p46.displayName then
            local v52 = p46.displayName
            local v53 = typeof(v52) == "string"
            assert(v53)
            local v54 = p46.displayName
            local v55 = string.len(v54) <= u13.WORLD_DISPLAY_NAME_MAX_LENGTH
            assert(v55)
            local v56 = p46.displayName
            p46.displayName = nil
            if v56 == "Untitled world" then
                v51 = "Untitled world"
            else
                local v57, v58 = u12.filterStringAsync(p45, v56)
                v51 = not v57 and "[Failed to filter name]" or v58
            end
        else
            v51 = nil
        end
        for v59, v60 in pairs(p46) do
            if v59 ~= "displayName" then
                if u13.WORLD_SETTINGS[v59] == nil then
                    p46[v59] = nil
                elseif typeof(v60) ~= "boolean" then
                    if v60 ~= nil then
                        p46[v59] = nil
                    end
                end
            end
        end
        if v51 then
            v48.privateServerWorlds[v47].displayName = v51
        end
        for v61, v62 in pairs(p46) do
            v48.privateServerWorlds[v47][v61] = v62
        end
        local v63 = u5.server_savePlayerSessionAsync(u13.getOwnerId(), v48)
        u14 = false
        if v63 then
            u5.setSessionData(u13.getOwnerId(), v48)
        end
    end
end
local function u68() --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u6
    --]]
    local v65 = script.WorldGuid.Value
    local v66 = u5.readSessionData(u13.getOwnerId())
    if v65 ~= "" and (v66 ~= nil and v66.privateServerWorlds[v65] ~= nil) then
        u6.server_onOwnerSessionAutoSave()
        local v67 = u5.readSessionData(u13.getOwnerId())
        u5.server_savePlayerSessionAsync(u13.getOwnerId(), v67)
    end
end
function u13.server_initAsync() --[[ Line: 242 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u27
        [3] = u34
        [4] = u64
        [5] = u13
        [6] = u22
        [7] = u9
        [8] = u5
        [9] = u7
        [10] = u2
        [11] = u6
        [12] = u68
    --]]
    script.Network.CreateWorld.OnServerInvoke = u44
    script.Network.LoadWorld.OnServerInvoke = u27
    script.Network.DeleteWorld.OnServerInvoke = u34
    script.Network.EditWorld.OnServerInvoke = u64
    local u69 = u13.getOwnerId()
    if u69 == nil then
        local v70 = u22(u9.PUBLIC_SERVER_MAP_NAME, u9.PUBLIC_SERVER_GAMEMODE, nil, u9.PUBLIC_SERVER_FIXED_SEED)
        script.MapName.Value = v70.mapName
        script.GameMode.Value = v70.gameMode
        script.CurrentTick.Value = v70.currentTick
        script.Seed.Value = v70.seed
    else
        while u5.server_loadPlayerDataAsync(u69) == nil do
            print("Failed to fetch owner\'s session, retrying in 15s.")
            task.wait(15)
        end
        local u71 = u7.new("owner")
        u7.shuttingDown:Connect(function() --[[ Line: 270 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u69
                [3] = u6
                [4] = u68
                [5] = u71
            --]]
            local v72 = u2:GetPlayerByUserId(u69)
            if v72 ~= nil then
                u6.server_update(v72)
            end
            u68()
            u71:Destroy()
        end)
        if script.WorldGuid.Value == "" then
            script.WorldGuid.Changed:Wait()
        end
    end
end
function u13.client_init() --[[ Line: 287 ]]
    if script.ServerOwner.Value == "" then
        script.ServerOwner.Changed:Wait()
    end
end
function u13.client_createWorld(p73) --[[ Line: 294 ]]
    return script.Network.CreateWorld:InvokeServer(p73)
end
function u13.client_loadWorld(p74) --[[ Line: 298 ]]
    return script.Network.LoadWorld:InvokeServer(p74)
end
function u13.client_deleteWorld(p75) --[[ Line: 302 ]]
    return script.Network.DeleteWorld:InvokeServer(p75)
end
function u13.client_waitWorldLoaded() --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    while not u15:GetAttribute("ServerReady") do
        task.wait()
    end
    if script.MapName.Value == "" then
        script.MapName.Changed:Wait()
    end
end
return u13