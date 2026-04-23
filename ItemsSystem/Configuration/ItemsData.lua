-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ItemsSystem.Configuration.ItemsData
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = {}
for _, v2 in game:GetService("HttpService"):JSONDecode(require(script.ItemsDataJson)) do
    v1[v2.id] = v2
end
for _, v3 in require(script.Custom) do
    v1[v3.id] = v3
end
v1[157].stackSize = 1
return v1