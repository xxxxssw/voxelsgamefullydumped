-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.Libs.GetBreakingTime
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("RunService")
local u2 = require(game.ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData)
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
require(game.ReplicatedStorage.Configuration.StudioConfiguration)
local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u5 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u6 = require(game.ReplicatedStorage.Configuration.StudioConfiguration).InstaBreakBlocks
local u7 = v1:IsClient()
local u8 = {
    ["wood"] = 2,
    ["wooden"] = 2,
    ["stone"] = 4,
    ["iron"] = 6,
    ["diamond"] = 8,
    ["netherite"] = 9,
    ["golden"] = 12,
    ["mythril"] = 9
}
local u9 = {
    ["shears"] = {
        ["default_multiplier"] = 2,
        ["_wool"] = 5,
        ["_leaves"] = 15
    }
}
local u10 = {
    ["dirt"] = "shovel",
    ["rock"] = "pickaxe",
    ["wood"] = "axe",
    ["plant"] = "shears",
    ["wool"] = "shears"
}
local u11 = {
    ["mythril"] = "mythril",
    ["netherite"] = "netherite"
}
local function u21(p12, p13) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u9
        [4] = u4
        [5] = u8
    --]]
    local v14 = p13 or 0
    local _ = u2[p12]
    local v15 = u5.getItemName(p12) or "air"
    if u9[v15] then
        local v16 = u4.getBlockNameFromBlockId(v14) or "air"
        for v17, v18 in u9[v15] do
            if string.find(v16, v17) then
                return v18
            end
        end
        return u9[v15].default_multiplier
    end
    local _ = u2[p12]
    local v19 = u5.getItemName(p12) or "air"
    if not u9[v19] then
        local v20 = string.split(v19, "_")[1]
        v19 = u8[v20] and v20 and v20 or "none"
    end
    return u8[v19] or 1
end
return function(p22, p23) --[[ Name: GetBreakingTime, Line 104 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
        [4] = u9
        [5] = u8
        [6] = u21
        [7] = u10
        [8] = u11
        [9] = u7
        [10] = u6
    --]]
    local _ = u2[p22]
    local v24 = u3[p23]
    if v24 == nil or (v24.liquid or not v24.diggable) then
        return (1 / 0)
    end
    local _ = u2[p22]
    local v25 = u5.getItemName(p22) or "air"
    if not u9[v25] then
        local v26 = string.split(v25, "_")[1]
        v25 = u8[v26] and v26 and v26 or "none"
    end
    local _ = u2[p22]
    local v27 = u5.getItemName(p22) or "air"
    local v28 = not u9[v27] and (string.split(v27, "_")[2] or "none") or v27
    local v29 = u21(p22, p23)
    local v30 = u3[p23]
    local v31 = u10[v30 and v30.material or "UNKNOWN_MATERIAL"]
    local v32 = v24.hardness
    local v33 = u11[v25] and true or (not v24.harvestTools and true or v24.harvestTools[tostring(p22)])
    local v34 = 1 * (v33 and 1.5 or 5) / ((not v33 or (v28 ~= v31 or not v29)) and 1 or v29) * v32
    local _ = u7 and game.Players.LocalPlayer.UserId == 123
    return v34, v33
end