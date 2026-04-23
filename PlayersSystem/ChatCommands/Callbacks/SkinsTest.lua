-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.ChatCommands.Callbacks.SkinsTest
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

require(game.ServerScriptService.Systems.StructuresSystem)
require(game.ServerScriptService.Systems.StructuresSystem.Libs.StructuresEncoder)
require(game.ReplicatedStorage.Systems.BlocksSystem)
require(game.ReplicatedStorage.Libs.BlockState)
local v1 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
require(game.ReplicatedStorage.Systems.BlocksSystem.BlocksFunctions.structure_generator)
local u2 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.Permissions)
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem)
local u5 = game.ReplicatedStorage.Assets.Sprites.SkinsPacks
v1.getBlockIdFromName("structure_generator")
local v7 = {
    ["allowed"] = function(p6, _) --[[ Name: allowed, Line 18 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.hasDebugTools(p6)
    end
}
local function u10(p8) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    for _, v9 in ipairs(u5:GetChildren()) do
        if v9.Name:lower() == p8:lower() then
            return v9
        end
    end
end
local function u21(p11, p12, p13, p14, p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if not p12 then
        p11("/skinstest FolderName ", Color3.fromRGB(255, 0, 0))
    end
    local v16 = 0
    local v17 = p15 or Vector3.new(0, 0, 0)
    for v18, v19 in p12:GetChildren() do
        v16 = v16 + 1
        local v20 = game.ReplicatedStorage.Assets.Characters.SkinTest:Clone()
        v20.PrimaryPart.Anchored = true
        v20:SetPrimaryPartCFrame(p13 + p14 * v18 * 5 + v17)
        v20:SetAttribute(u4.SKIN_NAME_ATTRIBUTE, v19.Name)
        v20:SetAttribute("CharacterTagContent", v19.Name)
        v19:SetAttribute("id", require(v19).id)
        v20.Parent = workspace
    end
end
function v7.run(p22, p23, p24) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u21
        [4] = u10
    --]]
    local v25 = string.split(p24, " ")
    if #v25 == 2 or #v25 == 3 then
        local v26
        if #v25 == 3 then
            v26 = game.ReplicatedStorage.Assets.Sprites.Old
        else
            v26 = u5
        end
        local v27 = p22.Character
        local v28 = v27.HumanoidRootPart
        u3.coordinatesFromWorkspaceVector3(v27.HumanoidRootPart.Position)
        local v29 = v27.PrimaryPart.CFrame
        local v30 = v28.CFrame.LookVector
        local v31 = v30:Cross(Vector3.new(0, 1, 0))
        if v25[2] == "all" then
            for v32, v33 in ipairs(v26:GetChildren()) do
                u21(p23, v33, v29, v31, v30 * v32 * 16)
            end
        else
            u21(p23, u10(v25[2]), v29, v31)
        end
    else
        p23("/fill block1 block2 (region made by block1 is fill of block2", Color3.fromRGB(255, 0, 0))
        return
    end
end
return v7