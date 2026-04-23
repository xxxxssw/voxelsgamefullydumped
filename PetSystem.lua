-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PetSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local u1 = game:GetService("Workspace")
local u2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local u4 = game:GetService("Players")
local u5 = require(game.ReplicatedStorage.Systems.EntitiesSystem)
local u6 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local u7 = require(game.ReplicatedStorage.Libs.Coordinates)
local u8 = require(game.ReplicatedStorage.Systems.PetSystem.PetsData)
require(game.ReplicatedStorage.Libs.Utils)
local u25 = {
    ["PET_RESPAWN_COOLDOWN"] = v3:IsStudio() and 15 or 45,
    ["ACCENT_COLORS"] = {
        "transparent",
        Color3.fromRGB(239, 184, 56),
        Color3.fromRGB(170, 85, 0),
        Color3.fromRGB(170, 0, 0),
        Color3.fromRGB(89, 34, 89),
        Color3.fromRGB(180, 128, 255),
        Color3.fromRGB(0, 85, 255),
        Color3.fromRGB(18, 238, 212),
        Color3.fromRGB(85, 255, 127)
    },
    ["PET_NAME_MAX_LENGTH"] = 17,
    ["client_selectPet"] = function(p9) --[[ Name: client_selectPet, Line 28 ]]
        script.Network.SelectPet:FireServer(p9)
    end,
    ["client_selectColor"] = function(p10) --[[ Name: client_selectColor, Line 32 ]]
        script.Network.SelectAccentColor:FireServer(p10)
    end,
    ["client_namePet"] = function(p11) --[[ Name: client_namePet, Line 36 ]]
        script.Network.NamePet:FireServer(p11)
    end,
    ["getAvailablePets"] = function(p12) --[[ Name: getAvailablePets, Line 40 ]]
        local v13 = {}
        if p12:GetAttribute("pets_pack_firepuppy_kitsune_raccoon") == true then
            table.insert(v13, "Firepuppy")
            table.insert(v13, "Kitsune")
            table.insert(v13, "Raccoon")
        end
        return v13
    end,
    ["getPlayerPetEntity"] = function(p14) --[[ Name: getPlayerPetEntity, Line 61 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u8
            [3] = u5
        --]]
        local v15 = u1.Entities:GetChildren()
        for _, v16 in ipairs(v15) do
            if u8[v16.Name] then
                local v17 = u5.readEntityData(v16)
                if v17 ~= nil and v17.ownerId == p14.UserId then
                    return v16
                end
            end
        end
        return nil
    end,
    ["server_onPlayerAdded"] = function(p18) --[[ Name: server_onPlayerAdded, Line 74 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v19 = u6.readSessionData(p18.UserId)
        p18:SetAttribute("SelectedPet", v19.selectedPet)
        p18:SetAttribute("PetAccentColor", v19.petAccentColor or 1)
        p18:SetAttribute("PetCustomName", v19.petCustomName or p18.DisplayName .. "\'s pet")
        p18:SetAttribute("PetRespawn", -1)
    end,
    ["server_attemptToSpawnPet"] = function(p20) --[[ Name: server_attemptToSpawnPet, Line 82 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u8
            [3] = u25
            [4] = u7
            [5] = u2
            [6] = u5
        --]]
        if u1:GetServerTimeNow() >= p20:GetAttribute("PetRespawn") then
            local v21 = p20:GetAttribute("SelectedPet")
            if v21 ~= nil and (u8[v21] ~= nil and (p20.Character and p20.Character.PrimaryPart)) then
                local v22 = u25.getPlayerPetEntity(p20)
                if v22 and v22.Name == v21 then
                    return
                end
                if v22 then
                    v22:Destroy()
                end
                local v23 = u7.coordinatesFromWorkspaceVector3(p20.character.PrimaryPart.Position + p20.character.PrimaryPart.CFrame.LookVector * -6)
                local v24 = require(u2.Systems.EntitiesSystem.Behaviors:FindFirstChild(v21)).initializeData()
                v24.ownerId = p20.UserId
                u5.server_spawn(v21, v23, v24)
            end
        end
    end
}
local function u27(u26) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u25
        [3] = u4
    --]]
    u26:SetAttribute("PetRespawn", u1:GetServerTimeNow() + u25.PET_RESPAWN_COOLDOWN)
    if u26.Character ~= nil then
        task.delay(u25.PET_RESPAWN_COOLDOWN + 1, function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u4
                [3] = u25
            --]]
            if u26.Parent == u4 then
                u25.server_attemptToSpawnPet(u26)
            end
        end)
    end
end
local function u31(p28, p29) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u25
    --]]
    local v30 = u6.readSessionData(p28.UserId)
    if v30 ~= nil and (typeof(p29) == "number" and u25.ACCENT_COLORS[p29]) then
        v30.petAccentColor = p29
        p28:SetAttribute("PetAccentColor", p29)
        u6.setSessionData(p28.UserId, v30)
    end
end
local function u35(p32, p33) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u25
    --]]
    if p33 == nil or p33 == "" then
        p33 = p32.DisplayName .. "\'s pet"
    end
    local v34 = u6.readSessionData(p32.UserId)
    if v34 ~= nil and (typeof(p33) == "string" and string.len(p33) <= u25.PET_NAME_MAX_LENGTH) then
        v34.petCustomName = p33
        p32:SetAttribute("PetCustomName", p33)
        u6.setSessionData(p32.UserId, v34)
    end
end
local function u42(p36, p37) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u6
        [3] = u1
    --]]
    local v38 = u25.getPlayerPetEntity(p36)
    local v39 = u6.readSessionData(p36.UserId)
    if v39 ~= nil then
        if typeof(p37) == "string" then
            local v40 = u25.getAvailablePets(p36)
            for _, v41 in ipairs(v40) do
                if v41 == p37 then
                    break
                end
            end
            v39.selectedPet = p37
            p36:SetAttribute("SelectedPet", p37)
            u6.setSessionData(p36.UserId, v39)
            if v38 and v38.Name ~= p37 then
                v38:Destroy()
                v38 = nil
            end
            if u1:GetServerTimeNow() > p36:GetAttribute("PetRespawn") and v38 == nil then
                u25.server_attemptToSpawnPet(p36)
                return
            end
        else
            v39.selectedPet = nil
            p36:SetAttribute("SelectedPet", nil)
            u6.setSessionData(p36.UserId, v39)
            if v38 then
                v38:Destroy()
            end
        end
    end
end
function u25.server_init() --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u31
        [3] = u35
        [4] = u27
    --]]
    script.Network.SelectPet.OnServerEvent:Connect(u42)
    script.Network.SelectAccentColor.OnServerEvent:Connect(u31)
    script.Network.NamePet.OnServerEvent:Connect(u35)
    script.PetDeath.Event:Connect(u27)
end
return u25