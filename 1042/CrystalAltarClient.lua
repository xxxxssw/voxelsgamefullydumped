-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.1042.CrystalAltarClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local v1 = game:GetService("RunService")
local v2 = game:GetService("Workspace")
if script:IsDescendantOf(v2) then
    if not script:IsDescendantOf(v2.Characters) then
        local _ = script.Parent
        local u3 = {}
        for _, v4 in script.Parent.Crystals:GetChildren() do
            if v4.Name == "Crystal" then
                u3[v4] = v4.Position
            end
        end
        local u5 = script.Parent.Crystals
        local u6 = u5.PrimaryPart.Position
        local _ = u5.PrimaryPart.CFrame
        local u7 = game.Players.LocalPlayer
        local u8 = 0
        v1.Heartbeat:Connect(function(p9) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u7
                [3] = u6
                [4] = u8
                [5] = u5
            --]]
            for v10, v11 in u3 do
                local v12 = v10.Position * Vector3.new(1, 0, 1) + v11.Y * Vector3.new(0, 1, 0)
                local v13 = 1.5707963267948966 * tick()
                v10.Position = v12 + Vector3.new(0, 1, 0) * math.sin(v13) * 1 / 2
                v10.CFrame = v10.CFrame * CFrame.Angles(0, p9, 0)
            end
            if u7 and (u7.Character and u7.Character.PrimaryPart) then
                local v14 = (game.Players.LocalPlayer.Character.PrimaryPart.Position - u6) * Vector3.new(1, 0, 1)
                u8 = u8 + p9
                u5:PivotTo(CFrame.lookAt(u6, u6 - v14))
            end
        end)
    end
else
    return
end