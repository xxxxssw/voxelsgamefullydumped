-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.HumanoidModifiersSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Players")
local u2 = game:GetService("HttpService")
local u3 = game:GetService("Workspace")
local u4 = nil
local u5 = {}
local u6 = Instance.new("BindableEvent")
local u7 = Instance.new("BindableEvent")
local u8 = {
    ["MODIFIERS"] = {
        ["FightProtection"] = "FightProtection",
        ["InCombat"] = "InCombat",
        ["Channeling"] = "Channeling",
        ["HealthRegen"] = "HealthRegen",
        ["DamageBoost"] = "DamageBoost",
        ["ArmorBoost"] = "ArmorBoost",
        ["OlmecBlessing"] = "OlmecBlessing",
        ["OnFire"] = "OnFire",
        ["FireResistance"] = "FireResistance",
        ["SpeedBoost"] = "SpeedBoost"
    },
    ["localChange"] = u6.Event,
    ["ICONS"] = {
        ["FightProtection"] = "rbxassetid://17009073876",
        ["InCombat"] = "rbxassetid://17019583761",
        ["Channeling"] = "rbxassetid://17019586172",
        ["HealthRegen"] = "rbxassetid://17009073727",
        ["DamageBoost"] = "rbxassetid://17020994076",
        ["ArmorBoost"] = "rbxassetid://17020996175",
        ["OlmecBlessing"] = "rbxassetid://17169000685",
        ["OnFire"] = "rbxassetid://17329007989",
        ["FireResistance"] = "rbxassetid://17329008818",
        ["SpeedBoost"] = "rbxassetid://17522595254"
    }
}
local function u17(p9, p10, p11) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local v12 = u8.MODIFIERS[p10] ~= nil
    local v13 = tostring(p10) .. " is not a valid modifier name"
    assert(v12, v13)
    if true then
        local v14 = p9:FindFirstChildOfClass("Humanoid")
        if v14 then
            local u15 = v14:FindFirstChild(p10)
            if u15 then
                if u15.Value > u3:GetServerTimeNow() + p11 then
                    return
                end
            else
                u15 = Instance.new("NumberValue")
                u15.Name = p10
                u15.Parent = v14
            end
            u15.Value = u3:GetServerTimeNow() + p11
            local u16 = task.delay(p11, function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:Destroy()
            end)
            u15.Changed:Connect(function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                coroutine.close(u16)
            end)
        end
    end
end
function u8.server_giveModifier(p18, p19, p20) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7:Fire(p18, p19, p20)
end
function u8.server_removeModifier(p21, p22) --[[ Line: 77 ]]
    local v23 = p21:FindFirstChildOfClass("Humanoid")
    local v24 = v23 and v23:FindFirstChild(p22)
    if v24 then
        v24:Destroy()
    end
end
function u8.playerHasModifier(p25, p26) --[[ Line: 87 ]]
    if p25.Character ~= nil then
        local v27 = p25.Character:FindFirstChildOfClass("Humanoid")
        local v28 = v27 and v27:FindFirstChild(p26)
        if v28 then
            return v28 ~= nil, v28.Value
        end
    end
    return false
end
function u8.getPlayerActiveModifiers(p29) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v30 = {}
    local v31 = p29.Character ~= nil and p29.Character:FindFirstChildOfClass("Humanoid")
    if not v31 then
        return v30
    end
    for _, v32 in ipairs(v31:GetChildren()) do
        if u8.MODIFIERS[v32.Name] then
            v30[v32.Name] = v32
        end
    end
    return v30
end
local function u33() --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6:Fire()
end
local function u35() --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u2
        [5] = u33
        [6] = u6
    --]]
    u5.added = u4.ChildAdded:Connect(function(p34) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u2
            [4] = u33
            [5] = u6
        --]]
        if u8.MODIFIERS[p34.Name] then
            u5[u2:GenerateGUID(false)] = p34.Changed:Connect(u33)
            u6:Fire()
        end
    end)
    u5.removed = u4.ChildRemoved:Connect(u33)
    u5.died = u4.Died:Connect(u33)
    u6:Fire()
end
local function u40(p36) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u35
    --]]
    for v37, v38 in pairs(u5) do
        v38:Disconnect()
        u5[v37] = nil
    end
    u6:Fire()
    u4 = p36:FindFirstChild("Humanoid")
    if u4 then
        u35()
    else
        u5.characterAdded = p36.ChildAdded:Connect(function(p39) --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u35
            --]]
            if p39.ClassName == "Humanoid" then
                u4 = p39
                u35()
            end
        end)
    end
end
function u8.client_init() --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u40
    --]]
    u1.LocalPlayer.CharacterAdded:Connect(u40)
    if u1.LocalPlayer.Character then
        u40(u1.LocalPlayer.Character)
    end
end
function u8.server_init() --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u17
    --]]
    u7.Event:Connect(u17)
end
return u8