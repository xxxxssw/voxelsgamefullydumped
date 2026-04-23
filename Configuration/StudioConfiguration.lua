-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.StudioConfiguration
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("RunService")
if #game.Players:GetPlayers() == 1 then
    local _ = game.Players:GetPlayers()[1].UserId == 123
end
return not v1:IsStudio() and {
    ["DisableFallDamage"] = false,
    ["InstaBreakBlocks"] = false,
    ["BapMockStudioPublicServer"] = false,
    ["BapMockPublicServer"] = false,
    ["UseBlockStateOptimization"] = false
} or {
    ["DebugStructure"] = false,
    ["DisableFallDamage"] = true,
    ["InstaBreakBlocks"] = true,
    ["BapMockStudioPublicServer"] = false,
    ["BapMockPublicServer"] = false,
    ["UseBlockStateOptimization"] = false
}