-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("HttpService")
local v3 = game:GetService("Players")
local v4 = game:GetService("RunService")
local u5 = v3.LocalPlayer
local u6 = v1.Systems.PlayersSystem.PlayerSessions
local v7 = not v4:IsServer() and {} or require(game.ServerScriptService.Systems.PlayerSessionSystem)
function v7.client_waitLocalPlayerSession() --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local v8 = u6:WaitForChild(u5.UserId)
    if v8.Value == "" then
        v8.Changed:Wait()
    end
    return v8
end
function v7.readSessionData(p9) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    local v10 = u6:FindFirstChild(p9)
    if v10 and v10.Value ~= "" then
        return u2:JSONDecode(v10.Value)
    end
end
function v7.setSessionData(p11, p12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    local v13 = u6:FindFirstChild(p11)
    local v14 = u2:JSONEncode(p12)
    if v13 and v13.Value ~= v14 then
        v13.Value = v14
        v13:SetAttribute("UnsavedChanges", true)
    end
end
function v7.isPlayerSessionLoaded(p15) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v16 = u6:FindFirstChild((tostring(p15)))
    if v16 then
        return v16.Value ~= ""
    else
        return false
    end
end
return v7