-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.357.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Workspace")
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Libs.Utils)
local u5 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u6 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockOrientation.UtilsOrientation)
if script:IsDescendantOf(v1) then
    return
else
    local u7 = script.Parent
    local u8 = u7:FindFirstChild("Side")
    if u8 ~= nil then
        u8.Parent = nil
        local u9 = u7:GetChildren()
        for _, v10 in ipairs(u7:GetChildren()) do
            if v10:IsA("Script") then
                v10.Archivable = false
            end
        end
        script:IsDescendantOf(u2.Map)
        local function v20() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u3
                [3] = u9
                [4] = u5
                [5] = u8
                [6] = u6
                [7] = u2
                [8] = u4
            --]]
            local v11 = u7:GetAttribute(u3.ATTRIBUTE)
            u3.getMetadata(v11)
            for _, v12 in ipairs(u7:GetChildren()) do
                if not (v12:IsA("Script") or table.find(u9, v12)) then
                    v12:Destroy()
                end
            end
            local v13 = u3.getBlockId(v11)
            local v14 = u3.getMetadata(v11) or {}
            local v15 = 0
            for _, v16 in {
                "east",
                "west",
                "north",
                "south"
            } do
                if u5.getProperty(v13, v14.compressed, v16) then
                    v15 = v15 + 1
                    local v17 = u8:Clone()
                    local v18 = u6.FacingCFrames[v16]
                    v17:SetPrimaryPartCFrame(u8:GetPrimaryPartCFrame() * v18)
                    for _, v19 in ipairs(v17:GetChildren()) do
                        v19.Parent = u7
                    end
                    if script:IsDescendantOf(u2.Characters) then
                        u4.weldModel(u7)
                    end
                end
            end
        end
        u7:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v20)
        v20()
    end
end