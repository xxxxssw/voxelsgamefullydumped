-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.structure_creation_block.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockState)
require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
if not script:IsDescendantOf(v1) then
    local u4 = game.ReplicatedStorage.Assets.Entities
    local u5 = Color3.fromRGB(8, 255, 82)
    local u6 = Color3.fromRGB(255, 0, 4)
    Color3.fromRGB(255, 234, 3)
    local u7 = script.Parent
    local function v18() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u3
            [4] = u4
            [5] = u5
            [6] = u6
        --]]
        local v8 = u7:GetAttribute(u2.ATTRIBUTE)
        local v9 = u2.getBlockId(v8)
        local v10 = u2.getMetadata(v8) or {}
        for _, v11 in u7:GetDescendants() do
            if v11:IsA("SurfaceGui") then
                v11.PixelsPerStud = 500
            end
        end
        if v9 == u3.getBlockIdFromName("structure_entity_block") then
            for _, v12 in u7:GetDescendants() do
                if v12:IsA("TextLabel") then
                    v12.Text = v10.entityName or ""
                end
            end
            if v10 and (v10.entityName and u4:FindFirstChild(v10.entityName)) then
                u7.Geometry.Color = u5
            else
                u7.Geometry.Color = u6
            end
        else
            if v9 == u3.getBlockIdFromName("structure_random_block") then
                local v13 = string.format("%s\nto %s\n%s", v10.defaultBlock or "", v10.mutationBlock or "", v10.mutationProbability or "")
                for _, v14 in u7:GetDescendants() do
                    if v14:IsA("TextLabel") then
                        v14.Text = v13
                    end
                end
                local v15 = v10.defaultBlock
                if v15 then
                    v15 = u3.getBlockIdFromName(v10.defaultBlock)
                end
                local v16 = v10.defaultBlock
                if v16 then
                    v16 = u3.getBlockIdFromName(v10.mutationBlock)
                end
                local v17 = v10.mutationProbability or -1
                if v15 and (v16 and (v17 >= 0 and v17 <= 1)) then
                    u7.Geometry.Color = u5
                    return
                end
                u7.Geometry.Color = u6
            end
            return
        end
    end
    u7:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v18)
    v18()
end