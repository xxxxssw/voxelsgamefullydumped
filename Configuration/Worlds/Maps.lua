-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Worlds.Maps
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("RunService")
local u2 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Libs.UtilsDimension)
local _ = v1:IsStudio()
local v3 = {
    ["spawns"] = {
        {
            ["x"] = 68,
            ["z"] = 68
        }
    },
    ["enabled"] = false
}
local v4 = {}
local function v12(p5) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v6 = u2.getDimensionData(u2.getDimensionIdFromDimensionName("overworld"))
    for _, v7 in p5 do
        local v8 = v7.x
        local v9 = v7.z
        local v10
        if v6.boundaries.Min.X + 512 < v8 then
            v10 = v8 < v6.boundaries.Max.X - 512
        else
            v10 = false
        end
        assert(v10)
        local v11
        if v6.boundaries.Min.Y + 512 < v9 then
            v11 = v8 < v6.boundaries.Max.Y - 512
        else
            v11 = false
        end
        assert(v11)
    end
end
local v13 = { "Superflat", "voxel_map_8" }
if game:GetService("RunService"):IsStudio() then
    for _, v14 in script:GetChildren() do
        local v15 = v14.Name
        table.insert(v13, v15)
    end
end
for _, v16 in ipairs(script:GetChildren()) do
    if table.find(v13, v16.Name) then
        local v17 = require(v16)
        local v18 = v17.mapName or v16.Name
        local v19 = v17.displayName or v16.Name
        local v20 = v17.server_uniqueMapKey or v16.Name
        local v21 = v4[v18] == nil
        assert(v21, v18)
        v4[v18] = v17
        v4[v18].moduleName = v16.Name
        v4[v18].mapName = v18
        v4[v18].displayName = v19
        v4[v18].server_uniqueMapKey = v20
        for v22, v23 in pairs(v3) do
            if v4[v18][v22] == nil then
                v4[v18][v22] = v23
            end
        end
        v12(v4[v18].spawns)
    end
end
return v4