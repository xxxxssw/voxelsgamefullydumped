-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.Arrow.ClientArrow
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
local v2 = script.Parent
local v3 = v2:WaitForChild("PrimaryPart", (1 / 0))
local v4 = v1.CurrentCamera
local v5 = v2:WaitForChild("AnchoredCFrame", (1 / 0))
if (v3.Position - v4.CFrame.Position).Magnitude > 300 then
    v2:Destroy()
else
    if v5.Value == CFrame.new() then
        v5.Changed:Wait()
    end
    task.wait(0.15)
    v2:PivotTo(v5.Value)
end