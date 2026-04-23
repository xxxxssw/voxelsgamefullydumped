-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("RunService")
local u1 = game:GetService("Players")
local v2 = {}
local u3 = {}
local u4 = nil
function v2.server_onPlayerAdded(p5) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3[p5] = p5.UserId
end
function v2.server_onPlayerRemoved(p6) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3[p6] = nil
end
function v2.server_reconcile(p7) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    script.Reconcile:FireClient(p7, u3[p7])
end
function v2.server_getRng(p8) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v9 = Random.new(u3[p8])
    local v10 = u3
    v10[p8] = v10[p8] + 1
    return v9
end
function v2.client_getRng() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v11 = Random.new(u4)
    u4 = u4 + 1
    return v11
end
function v2.client_init() --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    u4 = u1.LocalPlayer.UserId
    script.Reconcile.OnClientEvent:Connect(function(p12) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4 = p12
    end)
end
return v2