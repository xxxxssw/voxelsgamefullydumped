-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.152.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("Workspace")
local v1 = game:GetService("ReplicatedStorage")
if not script:IsDescendantOf(v1) then
    require(game.ReplicatedStorage.Assets.TextureProvider)
    require(game.ReplicatedStorage.Libs.Coordinates)
    local u2 = require(game.ReplicatedStorage.Libs.BlockState)
    local u3 = script.Parent
    local u4 = {
        ["side"] = "rbxassetid://18395119400",
        ["top"] = "rbxassetid://18395119566",
        ["front"] = "rbxassetid://18395119125",
        ["front_on"] = "rbxassetid://18395119253"
    }
    u3.Hitbox.Left.Texture = u4.side
    u3.Hitbox.Right.Texture = u4.side
    u3.Hitbox.Back.Texture = u4.side
    u3.Hitbox.Top.Texture = u4.top
    u3.Hitbox.Bottom.Texture = u4.top
    local function v6() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u4
        --]]
        local v5 = u2.getMetadata(u3:GetAttribute(u2.ATTRIBUTE))
        if v5 and (v5.fuelSecondsLeft and v5.fuelSecondsLeft > 0) then
            u3.Hitbox.SurfaceLight.Enabled = true
            u3.Hitbox.Front.Texture = u4.front_on
            u3.Particles.ParticleEmitter.Enabled = true
        else
            u3.Hitbox.SurfaceLight.Enabled = false
            u3.Hitbox.Front.Texture = u4.front
            u3.Particles.ParticleEmitter.Enabled = false
        end
    end
    u3:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v6)
    v6()
end