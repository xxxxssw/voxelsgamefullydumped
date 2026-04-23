-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.VariablesConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("RunService"):IsStudio()
local v2 = {
    ["wireCircuitEnabled"] = v1 and true
}
local v3 = 3
v2.onCheckAmountBlockPerSection = v3
local v4 = 2
v2.boneMealIncreaseCropAge = v4
v2.addSkinPackTestFolders = v1 and false
return v2