-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem.Libs.CellReference.UtilsCellReference
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u1 = game.ReplicatedStorage.Systems.InventorySystem.Formats.Player
require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
require(game.ReplicatedStorage.Systems.BlocksSystem)
local v2 = {}
local function u6(p3) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    for _, v4 in ipairs(u1:GetChildren()) do
        local v5 = require(v4)
        if p3[v5.key] == nil then
            p3[v5.key] = v5.createEmpty()
        end
    end
end
function v2.client_getTableFromCellRef(p7, p8) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v9 = p8.container
    if type(v9) == "vector" then
        return p7.predictedInventories.Block
    end
    local v10 = p8.key
    if not v10 then
        return p7.predictedInventories.Player
    end
    u6(p7.predictedInventories.Player)
    return p7.predictedInventories.Player[v10]
end
function v2.server_getTableFromCellRef(p11, p12) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v13 = p11.key
    if not v13 then
        return p12
    end
    u6(p12)
    return p12[v13]
end
function v2.getTableFromCellRef(p14, p15) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v16 = p14.key
    if not v16 then
        return p15
    end
    u6(p15)
    return p15[v16]
end
return v2