-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.268.ClientWorkspace
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.BlockMetadata)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
if not script:IsDescendantOf(v1) then
    local u4 = script.Parent
    local u5 = {
        ["inner"] = "outer",
        ["outer"] = "inner",
        ["left"] = "right",
        ["right"] = "left"
    }
    local u6 = {
        ["inner_left"] = "inner_left",
        ["inner_right"] = "inner_right",
        ["outer_left"] = "outer_right",
        ["outer_right"] = "outer_left"
    }
    local function v20() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
            [4] = u6
            [5] = u5
        --]]
        local v7 = u4:GetAttribute(u3.ATTRIBUTE)
        local v8 = u3.getBlockId(v7)
        local v9 = u3.getMetadata(v7) or {}
        local v10 = u2.getPropertiesValuesTable(v8, v9.compressed)
        local v11 = v10.half == "bottom"
        for _, v12 in {
            "inner_left",
            "inner_right",
            "outer_left",
            "outer_right"
        } do
            local v13 = u4:FindFirstChild(v12)
            if string.find(v12, v11 and "inner" or "outer") then
                v13.Transparency = 1
                v13.CanCollide = false
            else
                v13.Transparency = 0
                v13.CanCollide = true
            end
        end
        if v10.shape ~= "straight" then
            local v14 = u6[v10.shape]
            if not (v11 and v14) then
                local v15 = string.split(v14, "_")
                local v16 = u5[v15[1]]
                local _ = u5[v15[2]]
                v14 = string.format("%s_%s", v16, v15[2])
            end
            local v17, v18
            if v11 then
                if string.find(v14, "inner") then
                    v17 = 0
                    v18 = true
                else
                    v17 = 1
                    v18 = false
                end
            elseif string.find(v14, "outer") then
                v17 = 0
                v18 = true
            else
                v17 = 1
                v18 = false
            end
            local v19 = u4:FindFirstChild(v14)
            v19.Transparency = v17
            v19.CanCollide = v18
        end
    end
    u4:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v20)
    v20()
end