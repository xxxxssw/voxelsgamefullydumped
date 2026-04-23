-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1001.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem)
if not script:IsDescendantOf(v1) then
    local u5 = script.Parent
    local u6 = Color3.fromRGB(83, 45, 33)
    local u7 = Color3.fromRGB(255, 201, 157)
    local u8 = script.Parent.Floor
    local u9 = script.Parent.Sides
    local u10 = {}
    for _, v11 in u8:GetChildren() do
        table.insert(u10, v11)
    end
    for _, v12 in u9:GetChildren() do
        table.insert(u10, v12)
    end
    local function v26() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
            [4] = u10
            [5] = u8
            [6] = u9
            [7] = u6
            [8] = u7
            [9] = u4
        --]]
        local v13 = u5:GetAttribute(u3.ATTRIBUTE)
        local v14 = u3.getBlockId(v13)
        local v15 = u3.getMetadata(v13) or {}
        local v16 = u2.getProperty(v14, v15.compressed, "power")
        local v17 = u2.getPropertiesValuesTable(v14, v15.compressed)
        for _, v18 in u10 do
            v18.Transparency = 1
        end
        u8.none.Transparency = 0
        for _, v19 in {
            "east",
            "north",
            "south",
            "west"
        } do
            local v20 = v17[v19]
            if v20 ~= "none" then
                u8[v19].Transparency = 0
                if v20 == "up" then
                    u9[v19].Transparency = 0
                end
            end
        end
        local v21
        if v16 == 0 then
            v21 = u6
        else
            local v22 = u6
            local v23 = u7
            local v24 = u4.MAX_POWER_CIRCUIT - 2
            v21 = v22:Lerp(v23, math.min(v24, v16) / (u4.MAX_POWER_CIRCUIT - 2))
        end
        for _, v25 in u10 do
            v25.Color = v21
        end
    end
    u5:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v26)
    v26()
end