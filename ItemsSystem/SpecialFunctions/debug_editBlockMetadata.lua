-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.SpecialFunctions.debug_editBlockMetadata
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

game:GetService("Workspace")
game:GetService("ReplicatedStorage")
local u1 = game:GetService("HttpService")
local u2 = game:GetService("Players")
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u4 = require(game.ReplicatedStorage.Libs.Cursor)
local u5 = require(game.ReplicatedStorage.Libs.BlockState)
local u6 = require(game.ReplicatedStorage.Client.States.JsonEditorState)
local u7 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local v8 = {}
local u9 = nil
local u10 = nil
function v8.client_getNetworkParams() --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    return {
        ["coordinates"] = u10,
        ["jsonMetadata"] = u9
    }
end
function v8.client_onUse() --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u4
        [4] = u3
        [5] = u5
        [6] = u6
        [7] = u9
        [8] = u10
    --]]
    if not u7.hasDebugTools(u2.LocalPlayer) then
        return false
    end
    local v11 = u4.coordinatesFromHoveredBlock()
    if v11 == nil then
        return false
    end
    local v12 = u3.getBlockState(v11)
    local v13 = u5.getMetadata(v12) or {}
    u6.open(v11, v13)
    u9 = u6.editorClosed:Wait()
    if u9 == nil then
        return false
    end
    u10 = v11
    return true
end
function v8.server_onUse(p14, _, p15) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u5
        [4] = u1
    --]]
    if u7.hasDebugTools(p14) then
        local v16 = u3.getBlockState(p15.coordinates)
        local v17 = u5.setMetadata(v16, u1:JSONDecode(p15.jsonMetadata))
        u3.server_setBlockState(p15.coordinates, v17, nil)
    end
end
return v8