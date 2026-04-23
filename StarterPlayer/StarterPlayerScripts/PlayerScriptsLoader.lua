-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = game:GetService("StarterGui")
local v2 = game:GetService("GuiService")
local v3 = require(game.ReplicatedStorage:WaitForChild("Client"):WaitForChild("Libs"):WaitForChild("Telemetry"))
v3.client_addData("PlayerScriptsLoader begin")
local v4 = script.Parent:WaitForChild("PlayerModule")
local v5 = script:WaitForChild("CameraInjector")
require(v5)
local v6 = require(v4)
local v7 = v6:GetCameras()
local v8 = v6:GetControls()
v3.client_addData("PlayerScriptsLoader cameras ~= nil", v7 ~= nil)
v3.client_addData("PlayerScriptsLoader controls ~= nil", v8 ~= nil)
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local v9 = require(game.ReplicatedStorage.Systems.WorldSystem)
local v10 = require(game.ReplicatedStorage.Systems.CameraSystem)
local v11 = require(game.ReplicatedStorage.Systems.RegionsSystem)
local v12 = require(game.ReplicatedStorage.Systems.ChunksSystem)
local v13 = require(game.ReplicatedStorage.Systems.DropsSystem)
local v14 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local v15 = require(game.ReplicatedStorage.Systems.MutationsSystem)
local v16 = require(game.ReplicatedStorage.Systems.PlayersSystem)
local v17 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local v18 = require(game.ReplicatedStorage.Systems.CombatSystem)
local v19 = require(game.ReplicatedStorage.Libs.Cursor)
local v20 = require(game.Lighting.ClockSystem)
local v21 = require(game.ReplicatedStorage.Systems.GreedyMeshingSystem)
local v22 = require(game.ReplicatedStorage.Client.Libs.MarkerSystem)
local v23 = require(game.ReplicatedStorage.Systems.ItemsSystem.ItemsSpecialFunctions)
local v24 = require(game.ReplicatedStorage.Systems.HorizonSystem)
local v25 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local v26 = require(game.ReplicatedStorage.Libs.BlockState)
local v27 = require(game.ReplicatedStorage.Systems.DimensionsSystem)
local v28 = require(game.ReplicatedStorage.Systems.CraftingSystem)
local v29 = require(game.ReplicatedStorage.Systems.HumanoidModifiersSystem)
require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local v30 = require(game.ReplicatedStorage.Libs.Coordinates)
local v31 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PredictableRng)
local v32 = require(game.ReplicatedStorage.Systems.EnchantmentsSystem)
local v33 = require(game.ReplicatedStorage.Systems.EnchantmentsSystem.Libs.UtilsEnchantments)
local v34 = require(game.ReplicatedStorage.Systems.LiquidsSystem)
local u35 = Enum.CoreGuiType.Backpack
local u36 = false
task.spawn(function() --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u35
        [3] = u36
    --]]
    while not pcall(u1.SetCoreGuiEnabled, u1, u35, u36) do
        task.wait(1)
    end
end)
local u37 = Enum.CoreGuiType.Health
local u38 = false
task.spawn(function() --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u37
        [3] = u38
    --]]
    while not pcall(u1.SetCoreGuiEnabled, u1, u37, u38) do
        task.wait(1)
    end
end)
v2:SetGameplayPausedNotificationEnabled(false)
v30.init()
v28.init()
v26.init()
v25.init()
v10.init(v7, v8)
v11.client_init()
v12.init()
v15.init()
v14.init()
v13.client_init()
v19.init()
v16.init()
v9.client_init()
v21.init()
v22.init()
v18.client_init()
v23.client_init()
v24.client_init()
v27.client_init()
v29.client_init()
v31.client_init()
v33.init()
v32.init()
v34.client_init()
v9.client_waitWorldLoaded()
v17.client_waitLocalPlayerSession()
v20.client_init()