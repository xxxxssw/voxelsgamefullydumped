-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.ItemsSpecialFunctions
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData)
local u3 = require(game.ReplicatedStorage.Client.States.HotbarState)
local u4 = require(game.ReplicatedStorage.Client.States.InventoryState)
local u5 = require(game.ReplicatedStorage.Systems.ActionsSystem)
local u6 = require(game.ReplicatedStorage.Systems.InventorySystem)
local u7 = require(game.ReplicatedStorage.Configuration.Colors)
local u8 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
local u9 = v1.Systems.ItemsSystem.SpecialFunctions
local u21 = {
    ["getSpecialFunctions"] = function(p10) --[[ Name: getSpecialFunctions, Line 20 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u8
        --]]
        local v11 = u2[p10]
        if v11 then
            local v12 = u9:FindFirstChild(v11.name)
            if v12 ~= nil then
                return require(v12)
            end
            for v13, v14 in u8 do
                if v14[p10] then
                    local v15 = u9:FindFirstChild(v13)
                    if v15 ~= nil then
                        return require(v15)
                    end
                end
            end
        end
    end,
    ["client_useSpecialItem"] = function(p16) --[[ Name: client_useSpecialItem, Line 41 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u3
            [3] = u4
        --]]
        local v17 = u21.getSpecialFunctions(p16)
        assert(v17, "Invalid ItemId?")
        if not v17.client_onUse() then
            return false
        end
        local u18 = v17.client_getNetworkParams()
        local u19 = nil
        local _, v20 = pcall(function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u3
                [3] = u18
            --]]
            u19 = script.Network:InvokeServer(u3.getCurrentHotbarSlot(), u18)
        end)
        if u19 == true and v20 == nil then
            return true
        end
        u4.reconcile()
        if v20 ~= nil then
            warn("client_useSpecialItem error: " .. v20)
        end
        return false
    end
}
function server_onItemFunctionRequest(p22, p23, ...)
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u21
    --]]
    if u5.canPlayerDoAction(p22) then
        local v24 = u6.server_getPlayerInventory(p22)[tostring(p23)]
        if v24 == nil or v24 == u6.NoItemSymbol then
            return false
        else
            local v25 = v24.id
            local v26 = u21.getSpecialFunctions(v25)
            if v26 then
                return v26.server_onUse(p22, p23, ...)
            else
                return false
            end
        end
    else
        return false
    end
end
function u21.client_init() --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    for _, v27 in ipairs(u9:GetChildren()) do
        local v28 = require(v27)
        local v29 = v28.client_init
        if typeof(v29) == "function" then
            v28.client_init()
        end
    end
end
function u21.server_init() --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
    --]]
    script.Network.OnServerInvoke = server_onItemFunctionRequest
    for v30 in pairs(u7) do
        local v31 = u9.boat:Clone()
        v31.Name = v30 .. "_boat"
        v31.Parent = u9
        local v32 = u9.dye:Clone()
        v32.Name = v30 .. "_dye"
        v32.Parent = u9
    end
    u9.boat:Destroy()
    u9.dye:Destroy()
end
return u21