-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.BlockState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = game:GetService("HttpService")
local u2 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local v3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs:FindFirstChild("UtilsBlocks"))
local u4 = require(game.ReplicatedStorage.Libs.Utils)
local v5 = require(game.ReplicatedStorage.Configuration:FindFirstChild("StudioConfiguration"))
local u6 = nil
local u7 = nil
local v8
if #game.Players:GetPlayers() == 1 then
    v8 = game.Players:GetPlayers()[1].UserId == 123
else
    v8 = false
end
local u9 = {}
local u10 = {
    ["ATTRIBUTE"] = "b",
    ["ID_ATTRIBUTE"] = "i"
}
local u11 = ";"
local u12 = {
    ["BlockId"] = 1,
    ["NeighborsSum"] = 2,
    ["Metadata"] = 3,
    ["ClientPredicted"] = 4
}
for v13 = 0, 675 do
    u9[v13] = v13 .. ";;"
end
function u10.init() --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    u6 = require(game.ReplicatedStorage.Libs:FindFirstChild("BlockMetadata"))
    u7 = require(game.ReplicatedStorage.Systems:FindFirstChild("ChunksSystem"))
end
function u10.create(p14, p15, p16) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u1
    --]]
    if not (p15 or p16) then
        return u9[p14]
    end
    if p15 == 0 then
        p15 = nil
    end
    local v17 = tostring(p14) .. ";" .. tostring(p15 or "") .. ";"
    if p16 ~= nil then
        u4.sortTable(p16)
        v17 = v17 .. u1:JSONEncode(p16)
    end
    return v17
end
if v5.UseBlockStateOptimization then
    function u10.create(p18, p19, p20, p21, p22) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u1
        --]]
        local v23 = tonumber(p20) or 0
        local v24 = v23 < 0 and 0 or v23
        local v25 = tonumber(p21) or 0
        local v26 = v25 < 0 and 0 or v25
        local v27 = p22 or {}
        local v28 = v27.compressed
        local v29 = tonumber(v28) or 0
        local v30 = u7.getBlockEncode(p18, p19, v24)
        local v31 = string.format("%s%s%s", string.char(v30), string.char(v26), (string.char(v29)))
        v27.compressed = nil
        if next(v27) == nil then
            v27 = nil
        end
        local v32 = string.format("%s", v27 and u1:JSONEncode(v27) or "")
        return string.format("%s;%s)", v31, v32)
    end
end
function u10.getBlockId(p33) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    local v34 = string.split(p33, u11)[u12.BlockId]
    return tonumber(v34)
end
function u10.getNeighborsSum(p35) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    local v36 = string.split(p35, u11)[u12.NeighborsSum]
    return tonumber(v36)
end
function u10.getMetadata(p37) --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u1
    --]]
    local v38 = string.split(p37, u11)[u12.Metadata]
    return (v38 == nil or v38 == "") and {} or u1:JSONDecode(v38)
end
function u10.setNeighborsSum(p39, p40) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10.create(u10.getBlockId(p39), p40, u10.getMetadata(p39))
end
function u10.setMetadata(p41, p42) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
    --]]
    local v43 = u10.getBlockId(p41)
    local v44 = u6.getDefaultValue(v43)
    local v45 = p42.compressed
    if tonumber(v45) == tonumber(v44) then
        p42.compressed = nil
    end
    return u10.create(u10.getBlockId(p41), u10.getNeighborsSum(p41), p42)
end
function u10.setClientPredicted(p46) --[[ Line: 226 ]]
    return p46 .. ";clientPredictedFlag"
end
function u10.isClientPredicted(p47) --[[ Line: 234 ]]
    return #string.split(p47, ";") == 4
end
local u48 = v3.getBlockIdFromName("crafting_table")
local u49 = v3.getBlockIdFromName("water")
function u10.areStatesGeometryDifferent(p50, p51) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u49
        [3] = u2
        [4] = u48
    --]]
    if u10.getBlockId(p50) == u10.getBlockId(p51) then
        local v52 = u10.getBlockId(p50)
        local _ = v52 == u49
        if u2.Bed[v52] or (u2.StorageBlocks[v52] or (u2.CrossedSprites[v52] or v52 == u48)) then
            return false
        end
        if u2.Trapdoor[v52] or u2.Door[v52] then
            return false
        end
        if u2.FencesOrWalls[v52] then
            return false
        end
        if u2.Signs[v52] then
            return false
        end
        if u10.getNeighborsSum(p50) == u10.getNeighborsSum(p51) then
            return false
        end
    end
    return true
end
return u10