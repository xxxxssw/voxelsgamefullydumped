-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks._fence_old.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Workspace")
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Libs.Utils)
local u5 = require(game.ReplicatedStorage.Libs.BlockMetadata)
if script:IsDescendantOf(v1) then
    return
else
    local u6 = script.Parent
    local u7 = u6:FindFirstChild("Side")
    if u7 ~= nil then
        u7.Parent = nil
        local u8 = u6:GetChildren()
        for _, v9 in ipairs(u6:GetChildren()) do
            if v9:IsA("Script") then
                v9.Archivable = false
            end
        end
        script:IsDescendantOf(u2.Map)
        local function v23() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u8
                [4] = u5
                [5] = u7
                [6] = u2
                [7] = u4
            --]]
            local v10 = u6:GetAttribute(u3.ATTRIBUTE)
            u3.getMetadata(v10)
            for _, v11 in ipairs(u6:GetChildren()) do
                if not (v11:IsA("Script") or table.find(u8, v11)) then
                    v11:Destroy()
                end
            end
            local v12 = {
                ["north"] = CFrame.Angles(0, 0, 0),
                ["south"] = CFrame.Angles(0, 3.141592653589793, 0),
                ["east"] = CFrame.Angles(0, -1.5707963267948966, 0),
                ["west"] = CFrame.Angles(0, 1.5707963267948966, 0),
                ["up"] = CFrame.Angles(90, 0, 0),
                ["down"] = CFrame.Angles(-90, 0, 0)
            }
            local v13 = u3.getBlockId(v10)
            local v14 = u3.getMetadata(v10) or {}
            for _, v15 in {
                "east",
                "west",
                "north",
                "south"
            } do
                if u5.getProperty(v13, v14.compressed, v15) then
                    local v16 = u7:Clone()
                    local v17 = v12[v15]
                    v16:SetPrimaryPartCFrame(u7:GetPrimaryPartCFrame() * v17)
                    for _, v18 in ipairs(v16:GetChildren()) do
                        v18.Parent = u6
                    end
                    if script:IsDescendantOf(u2.Characters) then
                        u4.weldModel(u6)
                    end
                end
            end
            local v19 = u6:Clone()
            for _, v20 in ipairs(v19:GetDescendants()) do
                if v20.Name == "FenceCollision" or v20:IsA("Script") then
                    v20:Destroy()
                end
            end
            v19.PrimaryPart:Destroy()
            local v21, v22 = v19:GetBoundingBox()
            v19:Destroy()
            u6.Hitbox.CFrame = v21
            u6.Hitbox.Size = v22
        end
        u6:GetAttributeChangedSignal(u3.ATTRIBUTE):Connect(v23)
        v23()
    end
end