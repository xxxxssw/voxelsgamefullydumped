-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.DestroyedSpawnerParticles.Script
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("Workspace")
if script:IsDescendantOf(v1) then
    local v2 = v1.CurrentCamera
    local v3 = script.Parent:WaitForChild("Explosion")
    local v4 = script.Parent:WaitForChild("ParticleEmitter")
    if (v2.CFrame.Position - script.Parent.Position).Magnitude < 128 then
        v3:Play()
        v4:Emit(50)
    end
end