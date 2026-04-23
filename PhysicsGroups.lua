-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Assets.PhysicsGroups
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("PhysicsService")
local u2 = game:GetService("ReplicatedStorage")
return {
    ["server_init"] = function() --[[ Name: server_init, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u2
        --]]
        u1:RegisterCollisionGroup("DropSystemCollector")
        u1:RegisterCollisionGroup("FallingBlocks")
        u1:RegisterCollisionGroup("Pushers")
        u1:RegisterCollisionGroup("Particles")
        u1:RegisterCollisionGroup("FencesCollision")
        u1:RegisterCollisionGroup("Vehicles")
        u1:CollisionGroupSetCollidable("DropSystemCollector", "DropSystemCollector", true)
        u1:CollisionGroupSetCollidable("DropSystemCollector", "Default", false)
        u1:CollisionGroupSetCollidable("DropSystemCollector", "Pushers", false)
        u1:CollisionGroupSetCollidable("DropSystemCollector", "Vehicles", false)
        u1:CollisionGroupSetCollidable("FencesCollision", "Default", false)
        u1:CollisionGroupSetCollidable("FencesCollision", "Characters", true)
        u1:CollisionGroupSetCollidable("Pushers", "Default", false)
        u1:CollisionGroupSetCollidable("Pushers", "Characters", true)
        u1:CollisionGroupSetCollidable("Pushers", "Pushers", false)
        u1:CollisionGroupSetCollidable("Pushers", "Drops", false)
        u1:CollisionGroupSetCollidable("Pushers", "Vehicles", false)
        u1:CollisionGroupSetCollidable("Drops", "Vehicles", false)
        u1:CollisionGroupSetCollidable("Particles", "Vehicles", false)
        u1:CollisionGroupSetCollidable("FallingBlocks", "Vehicles", false)
        u1:CollisionGroupSetCollidable("Characters", "Vehicles", false)
        u1:CollisionGroupSetCollidable("Liquids", "Vehicles", false)
        u1:CollisionGroupSetCollidable("FallingBlocks", "FallingBlocks", false)
        u1:CollisionGroupSetCollidable("FallingBlocks", "Characters", false)
        u1:CollisionGroupSetCollidable("FallingBlocks", "Pushers", false)
        u1:CollisionGroupSetCollidable("FallingBlocks", "DropSystemCollector", false)
        u1:CollisionGroupSetCollidable("Particles", "Particles", false)
        u1:CollisionGroupSetCollidable("Particles", "FallingBlocks", false)
        u1:CollisionGroupSetCollidable("Particles", "Pushers", false)
        u1:CollisionGroupSetCollidable("Particles", "Characters", false)
        u1:CollisionGroupSetCollidable("Particles", "DropSystemCollector", false)
        u2.Systems.DropsSystem.Drop.Hitbox.CollisionGroup = "DropSystemCollector"
        u2.Client.Pusher.CollisionGroup = "Pushers"
        u2.Assets.Miscs.FallingBlock.Block.CollisionGroup = "FallingBlocks"
        u2.Client.Libs.BlockDust.Assets.Particle.CollisionGroup = "Particles"
        for _, v3 in ipairs(u2.Assets.Entities:GetDescendants()) do
            if v3:IsA("BasePart") or v3:IsA("MeshPart") then
                if v3.Name == "VehicleHitbox" then
                    v3.CollisionGroup = "Vehicles"
                else
                    v3.CollisionGroup = "Characters"
                end
            end
        end
    end,
    ["server_initPlayerCharacter"] = function(p4) --[[ Name: server_initPlayerCharacter, Line 70 ]]
        for _, v5 in ipairs(p4:GetDescendants()) do
            if v5:IsA("BasePart") and (v5.CanCollide and v5.Name ~= "DropSystemCollector") then
                v5.CollisionGroup = "Characters"
            end
        end
    end
}