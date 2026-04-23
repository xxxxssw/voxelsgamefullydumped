-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.99.ClientPiston
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local u2 = game:GetService("TweenService")
if not script:IsDescendantOf(v1) then
    local u3 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u4 = require(game.ReplicatedStorage.Libs.BlockState)
    local u5 = script.Parent
    local v6 = u5.PrimaryPart.CFrame.LookVector
    local u7 = {}
    local v8 = {
        [u5.Pusher] = {
            ["CFrame"] = u5.Pusher.CFrame
        },
        [u5.Arm] = {
            ["CFrame"] = u5.Arm.CFrame,
            ["Size"] = u5.Arm.Size
        }
    }
    u7[false] = v8
    local v9 = {
        [u5.Pusher] = {
            ["CFrame"] = u5.Pusher.CFrame + v6 * 4
        },
        [u5.Arm] = {
            ["CFrame"] = u5.Arm.CFrame + v6 * 3.5,
            ["Size"] = u5.Arm.Size + Vector3.new(2.75, 0, 0)
        }
    }
    u7[true] = v9
    local function v19(p10) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
            [4] = u7
            [5] = u2
        --]]
        local v11 = u5:GetAttribute(u4.ATTRIBUTE)
        local v12 = u4.getBlockId(v11)
        local v13 = u4.getMetadata(v11) or {}
        local v14 = u3.getProperty(v12, v13.compressed, "extended")
        for v15, v16 in pairs(u7[v14 and true or false]) do
            if p10 then
                for v17, v18 in pairs(v16) do
                    v15[v17] = v18
                end
            else
                u2:Create(v15, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), v16):Play()
            end
        end
    end
    u5:GetAttributeChangedSignal(u4.ATTRIBUTE):Connect(v19)
    v19(true)
end