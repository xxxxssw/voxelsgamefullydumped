-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PetSystem.PetEntityFunctions
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local u1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("HttpService")
local u3 = game:GetService("Players")
local u4 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local u5 = require(game.ReplicatedStorage.Systems.InventorySystem.Configuration)
local u6 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u7 = require(game.ReplicatedStorage.Configuration.Items.ItemTags)
return {
    ["server_interacted"] = function(p8, p9, u10) --[[ Name: server_interacted, Line 17 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
            [4] = u5
            [5] = u6
            [6] = u7
            [7] = u1
        --]]
        local v11 = u4.readEntityData(p9)
        if p8 ~= u3:GetPlayerByUserId(u2:JSONDecode(p9:GetAttribute("EntityData")).ownerId) then
            return false
        end
        if u10 ~= u5.NoItemSymbol then
            u6.getItemName(u10.id)
            if u7.PetConsumable[u10.id] then
                local u12 = require(u1.Systems.EntitiesSystem.Behaviors:FindFirstChild(p9.Name)).initializeData().health
                if v11.health < u12 then
                    u4.server_updateEntityData(p9, function(p13) --[[ Line: 35 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u10
                            [3] = u12
                        --]]
                        local v14 = p13.health + u7.PetConsumable[u10.id]
                        local v15 = u12
                        p13.health = math.min(v14, v15)
                        return p13
                    end)
                    u1.Systems.PetSystem.Petted:Fire(p9)
                    return true, "consume"
                end
                return
            end
        end
        local v16 = p9:FindFirstChild("HumanoidRootPart")
        if v16 and v16:FindFirstChild("HeartParticles") == nil then
            local u17 = u1.Assets.Miscs.ParticlesEmitters.HeartParticles:Clone()
            u17.Parent = v16
            u17:Emit(5)
            task.delay(1.5, function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17.Enabled = false
                task.wait(1)
                u17:Destroy()
            end)
            u1.Systems.PetSystem.Petted:Fire(p9)
        end
        return false
    end
}