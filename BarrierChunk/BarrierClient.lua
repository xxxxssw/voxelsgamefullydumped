-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.BarrierChunk.BarrierClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

local v1 = game:GetService("RunService")
local u2 = game:GetService("Workspace")
local u3 = require(game.ReplicatedStorage.Libs.Coordinates)
if script:IsDescendantOf(u2) then
    local u4 = u2.Map
    local u5 = {
        ["Front"] = script.Parent:WaitForChild("Front"),
        ["Right"] = script.Parent:WaitForChild("Right"),
        ["Left"] = script.Parent:WaitForChild("Left"),
        ["Back"] = script.Parent:WaitForChild("Back")
    }
    v1.RenderStepped:Connect(function(_) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
        --]]
        for _, v6 in pairs(u5) do
            v6.OffsetStudsV = tick() - u2:GetAttribute("ClientStart")
        end
    end)
    local u7 = {
        [Vector2.new(0, -1)] = "Front",
        [Vector2.new(0, 1)] = "Back",
        [Vector2.new(-1, 0)] = "Left",
        [Vector2.new(1, 0)] = "Right"
    }
    local u8 = u3.coordinatesFromWorkspaceVector3(script.Parent.Position)
    local function v23() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u8
            [4] = u4
            [5] = u5
        --]]
        for v9, v10 in pairs(u7) do
            local v11 = u3.regionNameFromCoordinates
            local v12 = u8
            local v13 = u3.Chunk
            local v14 = v9.X
            local v15 = v9.Y
            local v16 = v11(v12 + v13 * Vector3.new(v14, 0, v15))
            local v17 = u3.chunkNameFromCoordinates
            local v18 = u8
            local v19 = u3.Chunk
            local v20 = v9.X
            local v21 = v9.Y
            local v22 = u4:FindFirstChild(v16 .. "_" .. v17(v18 + v19 * Vector3.new(v20, 0, v21)))
            if v22 and v22:GetAttribute("Empty") == false then
                u5[v10].Transparency = 0.5
            else
                u5[v10].Transparency = 1
            end
        end
    end
    u4.ChildRemoved:Connect(v23)
    u4.ChildAdded:Connect(v23)
    v23()
else
    u2:SetAttribute("ClientStart", tick())
end