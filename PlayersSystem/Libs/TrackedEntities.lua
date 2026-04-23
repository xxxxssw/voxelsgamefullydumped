-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.TrackedEntities
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("SharedTableRegistry")
local u1 = game:GetService("RunService")
local u2 = game:GetService("Players")
require(game.ReplicatedStorage.Systems.ChunksSystem)
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
local v4 = {}
local u5 = {}
local u6 = u2.LocalPlayer
local u7 = nil
function v4.client_setLocalPlayerCoordinates(p8) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    if p8 == nil then
        u7 = nil
    else
        local v9 = u6.Character == nil
        assert(v9)
        u7 = {
            ["coordinates"] = p8,
            ["player"] = u6
        }
    end
end
function v4.server_setPlayerCoordinates(p10, p11) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v12 = p10.Character == nil
    assert(v12)
    local v13 = u5
    local v14 = p10.UserId
    if v13[tostring(v14)] == nil then
        warn("Attempt to set playerCoordinates on a nil tracker?")
    else
        local v15 = u5
        local v16 = p10.UserId
        v15[tostring(v16)].coordinates = p11
    end
end
function v4.update() --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u5
        [4] = u3
        [5] = u6
        [6] = u7
    --]]
    if u1:IsServer() then
        for _, v17 in ipairs(u2:GetPlayers()) do
            local v18 = u5
            local v19 = v17.UserId
            if not v18[tostring(v19)] then
                local v20 = u5
                local v21 = v17.UserId
                local v22 = tostring(v21)
                local v23 = {}
                local v24
                if v17 == nil then
                    v24 = nil
                else
                    local v25 = v17.Character
                    if v25 then
                        v25 = v17.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if v25 then
                        v24 = u3.coordinatesFromWorkspaceVector3(v25.Position)
                    else
                        v24 = nil
                    end
                end
                v23.coordinates = v24
                v23.player = v17
                v20[v22] = v23
            end
        end
        for v26, v27 in u5 do
            local v28 = u2:GetPlayerByUserId(v26)
            if v28 then
                local v29
                if v28 == nil then
                    v29 = nil
                else
                    local v30 = v28.Character
                    if v30 then
                        v30 = v28.Character:FindFirstChild("HumanoidRootPart")
                    end
                    if v30 then
                        v29 = u3.coordinatesFromWorkspaceVector3(v30.Position)
                    else
                        v29 = nil
                    end
                end
                if v29 and v29 ~= v27.coordinates then
                    u5[v26].coordinates = v29
                end
            else
                u5[v26].coordinates = nil
            end
        end
    else
        local v31 = u6
        local v32
        if v31 == nil then
            v32 = nil
        else
            local v33 = v31.Character
            if v33 then
                v33 = v31.Character:FindFirstChild("HumanoidRootPart")
            end
            if v33 then
                v32 = u3.coordinatesFromWorkspaceVector3(v33.Position)
            else
                v32 = nil
            end
        end
        if v32 then
            u7.coordinates = v32
        end
    end
end
function v4.getTrackers() --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u7
    --]]
    return not u1:IsServer() and { u7 } or u5
end
return v4