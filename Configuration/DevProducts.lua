-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.DevProducts
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = {
    [3422264573] = "DiamondSword",
    [3422264185] = "Diamonds_x5",
    [3422258078] = "NetheriteIngot_x5",
    [3422263547] = "Arrow",
    [3422263046] = "Bow",
    [3422259880] = "EnderChest",
    [3422261599] = "ShulkerBox"
}
local v2 = {
    [3567715668] = "DiamondSword",
    [3567716058] = "Diamonds_x5",
    [3567716671] = "NetheriteIngot_x5",
    [3567715250] = "Arrow",
    [3567715435] = "Bow",
    [3567716373] = "EnderChest",
    [3567717067] = "ShulkerBox"
}
if math.random() <= 0.75 then
    v2 = v1 or v2
end
return v2