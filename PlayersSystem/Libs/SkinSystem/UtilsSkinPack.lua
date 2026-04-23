-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem.UtilsSkinPack
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = {}
local v2 = game:GetService("RunService")
local u3 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem.SkinsPacksData)
local u4 = require(game.ReplicatedStorage.Libs.Utils)
local u5 = game.ReplicatedStorage.Assets.Sprites.SkinsPacks
local v6 = require(game.ReplicatedStorage.Configuration.VariablesConfiguration)
local u7 = v2:IsStudio()
local u8 = false
local u9 = v6.addSkinPackTestFolders
function u1.getSkinsPack() --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u9
        [4] = u8
        [5] = u5
    --]]
    local v10 = u3.Packs
    if u7 and (u9 and not u8) then
        local v11 = 0
        u8 = true
        for _, v12 in u5:GetChildren() do
            if v12:IsA("Folder") and string.find(v12.Name, "_test_") then
                v11 = v11 + #v12:GetChildren()
                local v13 = v12.Name:gsub("_test_", "")
                local v14 = {
                    ["folder"] = v12,
                    ["name"] = v13:lower(),
                    ["displayName"] = "[TEST]" .. v13:gsub("^%l", string.upper)
                }
                table.insert(v10, v14)
            end
        end
        warn(v11, "skins test added.")
    end
    return v10
end
function u1.getPackDisplayName(p15) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Packs[p15].displayName
end
function u1.getPackDisplayColor(p16) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Packs[p16].color
end
function u1.getPackName(p17) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Packs[p17].name
end
function u1.getPackGamepassId(p18) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    local v19 = u1.getSkinsPack()[p18].gamepass_key
    local v20 = u4.getGamepassIdFromGamepassKey(v19)
    assert(v20)
    return v20
end
function u1.getPackGamepassKey(p21) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Packs[p21].gamepass_key
end
function u1.getPackSkins(p22) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v23 = u3.Packs[p22].folder
    assert(v23)
    local v24 = u3.Packs[p22].folder:GetChildren()
    table.sort(v24, function(p25, p26) --[[ Line: 78 ]]
        return p25.Name < p26.Name
    end)
    return v24
end
function u1.getSkinDisplayName(p27) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Overwite[p27.Name] and u3.Overwite[p27.Name].displayName or p27.Name
end
function u1.getSkinPackIdFromSkinName(p28) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if not p28 then
        return nil
    end
    for v29, _ in u1.getSkinsPack() do
        for _, v30 in u1.getPackSkins(v29) do
            if v30.Name == p28 then
                return v29
            end
        end
    end
    return nil
end
u1.skinNameExists = u1.getSkinPackIdFromSkinName
function u1.getSkinUUID(p31) --[[ Line: 103 ]]
    return require(p31).id or nil
end
function u1.getSkinData(p32) --[[ Line: 110 ]]
    local v33 = require(p32)
    return v33.skin_data or v33
end
return u1