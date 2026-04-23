-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.InventorySystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("HttpService")
local v2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local v4 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
require(game.ReplicatedStorage.Systems.InventorySystem.Libs.InventoryTransactions)
require(game.ReplicatedStorage.Systems.RegionsSystem)
require(game.ReplicatedStorage.Systems.BlocksSystem)
require(game.ReplicatedStorage.Libs.Coordinates)
require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v5 = require(game.ReplicatedStorage.Systems.InventorySystem.Libs.PlayerContainerReplicator)
require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local u6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerData)
local u7 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng)
local v8 = game.ReplicatedStorage.Systems.InventorySystem.Formats
local _ = v2.LocalPlayer
local u9 = {
    ["Formats"] = {
        ["Player"] = require(v8.Player),
        ["Chest"] = require(v8.Chest),
        ["VoidChest"] = require(v8.VoidChest),
        ["Furnace"] = require(v8.Furnace),
        ["Altar"] = require(v8.Altar)
    },
    ["NoItemSymbol"] = v4.NoItemSymbol
}
for _, v10 in ipairs(v8:GetDescendants()) do
    u9.Formats[v10.Name] = require(v10)
end
function u9.server_onPlayerAdded(p11) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
    --]]
    p11:SetAttribute("inventory", u1:JSONEncode(u6.server_readPlayerData(p11).inventory))
    script.Network.Reconcile:FireClient(p11, "player")
end
function u9.server_setPlayerInventory(p12, p13, p14) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u7
    --]]
    p12:SetAttribute("inventory", u1:JSONEncode(p13))
    if p14 == true then
        u7.server_reconcile(p12)
        script.Network.Reconcile:FireClient(p12, "player")
    end
end
function u9.server_getPlayerInventory(p15) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1:JSONDecode(p15:GetAttribute("inventory"))
end
function u9.server_init() --[[ Line: 58 ]] end
v5.init()
if v3:IsServer() and v3:IsStudio() then
    local u16 = require(game.ReplicatedStorage.Systems.EnchantmentsSystem)
    script.Network.STUDIO_test.OnServerEvent:Connect(function(p17, p18, p19) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u16
        --]]
        local v20 = u9.server_getPlayerInventory(p17)
        u16.upgrade(p17, v20, p18, p19)
    end)
end
return u9