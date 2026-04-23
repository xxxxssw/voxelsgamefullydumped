-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.RecipesData
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(script.RecipesDataWithoutFilter)
local v2 = require(game.ReplicatedStorage.Configuration.Items.ItemsWhitelist)
local v3 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v4 = require(script.Utils)
local v5 = {}
for v6, v7 in v1 do
    local v8 = {}
    local v9 = {}
    for _, v10 in v7 do
        if v10.ingredients then
            local v11 = true
            for _, v12 in v10.ingredients do
                if not v2[v12] then
                    v11 = false
                end
            end
            if not v2[v10.result.id] then
                v11 = false
            end
            if v11 then
                table.insert(v8, v10)
            end
        elseif v10.inShape then
            local v13 = true
            for _, v14 in v10.inShape do
                for _, v15 in v14 do
                    if not v2[v15] then
                        v13 = false
                    end
                end
            end
            if not v2[v10.result.id] then
                v13 = false
            end
            if v13 then
                table.insert(v9, v10)
            end
        else
            warn("problem:" .. v10)
        end
    end
    if #v9 + #v8 > 0 then
        for v16 = 1, #v9 do
            v8[#v8 + 1] = v9[v16]
        end
        v1[v6] = v8
    else
        table.insert(v5, v6)
    end
end
for v17 in v4.Dye do
    for v18 in v4.Bed do
        if v18 ~= v3.itemIdFromName("white_bed") then
            local v19 = v3.getItemName(v17)
            local v20 = string.match(v19, "(.*)_dye")
            local v21 = string.format("%s_bed", v20)
            local v22 = v3.itemIdFromName(v21)
            if v18 ~= v22 then
                local v23 = v1[v22]
                table.insert(v23, {
                    ["ingredients"] = { v18, v17 },
                    ["result"] = {
                        ["count"] = 1,
                        ["id"] = v22
                    }
                })
            end
        end
    end
end
for _, v24 in v5 do
    v1[v24] = nil
end
return v1