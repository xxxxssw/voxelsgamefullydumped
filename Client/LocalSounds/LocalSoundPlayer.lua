-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.LocalSounds.LocalSoundPlayer
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
local u5 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u6 = v2.LocalPlayer
local u7 = Random.new()
local u8 = {}
local function u11(p9) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p9:IsA("Sound") then
        p9:Play()
    elseif p9:IsA("Folder") then
        local v10 = p9:GetChildren()
        v10[u7:NextInteger(1, #v10)]:Play()
    end
end
function u8.play(p12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
        [3] = u11
    --]]
    if p12 == "LocalDamage" and u6.Character == nil then
        return
    else
        local v13 = u1.Client.LocalSounds:FindFirstChild(p12, true)
        if v13 == nil then
            warn("Could not find sound named " .. tostring(p12))
        else
            u11(v13)
        end
    end
end
local function u17(p14) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v15 = u4[p14]
    if v15 ~= nil then
        local v16 = v15.name
        return string.find(v16, "glass") and "glass" or (string.find(v16, "wool") and "wool" or (v16 == "grass_block" and "dirt" or (v16 == "sand" and "sand" or ((u5.Bed[p14] or (u5.Door[p14] or (u5.Trapdoor[p14] or (u5.WallMounted[p14] or (u5.FloorOrWallMounted[p14] or u5.Furnitures[p14]))))) and "furniture" or (v15.material or "")))))
    end
end
local u18 = u1.Client.LocalSounds.Placement
local u19 = u1.Client.LocalSounds.Breaking
local u20 = u1.Client.LocalSounds.Broken
function u8.onBlockPlaced(p21) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u11
    --]]
    u11(u18:FindFirstChild((u17(p21))) or u18.default)
end
function u8.onBlockMined(p22) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
        [3] = u11
    --]]
    u11(u19:FindFirstChild((u17(p22))) or u19.default)
end
function u8.onBlockBroken(p23) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u20
        [3] = u11
    --]]
    u11(u20:FindFirstChild((u17(p23))) or u20.default)
end
u1.Client.Events.Damaged.Event:Connect(function(...) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.play("LocalDamage")
end)
if v3:IsClient() then
    u1.Client.Events.PlaySound.OnClientEvent:Connect(u8.play)
end
return u8