-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.194.Swirl
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

if not script:IsDescendantOf(game:GetService("ReplicatedStorage")) then
    local v1 = Color3.fromRGB(146, 53, 222)
    local u2 = script.Parent
    local u3 = {
        ["nether_portal_0"] = 18665387791,
        ["nether_portal_1"] = 18665387413,
        ["nether_portal_10"] = 18665384780,
        ["nether_portal_11"] = 18665383945,
        ["nether_portal_12"] = 18665383472,
        ["nether_portal_13"] = 18665383232,
        ["nether_portal_14"] = 18665382994,
        ["nether_portal_15"] = 18665382759,
        ["nether_portal_16"] = 18665382558,
        ["nether_portal_17"] = 18665382334,
        ["nether_portal_18"] = 18665382149,
        ["nether_portal_19"] = 18665381914,
        ["nether_portal_2"] = 18665387106,
        ["nether_portal_20"] = 18665381657,
        ["nether_portal_21"] = 18665381454,
        ["nether_portal_22"] = 18665381265,
        ["nether_portal_23"] = 18665380868,
        ["nether_portal_24"] = 18665380537,
        ["nether_portal_25"] = 18665380309,
        ["nether_portal_26"] = 18665380161,
        ["nether_portal_27"] = 18665379943,
        ["nether_portal_28"] = 18665379707,
        ["nether_portal_29"] = 18665379385,
        ["nether_portal_3"] = 18665386863,
        ["nether_portal_30"] = 18665379096,
        ["nether_portal_31"] = 18665378827,
        ["nether_portal_4"] = 18665386557,
        ["nether_portal_5"] = 18665386272,
        ["nether_portal_6"] = 18665385968,
        ["nether_portal_7"] = 18665385682,
        ["nether_portal_8"] = 18665385451,
        ["nether_portal_9"] = 18665385208
    }
    for _, v4 in u2:GetDescendants() do
        if v4:IsA("ParticleEmitter") then
            v4.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v1), ColorSequenceKeypoint.new(1, v1) })
        elseif v4:IsA("PointLight") then
            v4.Color = v1
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function(_) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local v5 = tick() / 0.1 % 32
        local v6 = math.floor(v5)
        for _, v7 in u2:GetDescendants() do
            if v7:IsA("Texture") then
                v7.Texture = string.format("rbxassetid://%s", u3[string.format("nether_portal_%s", v6)])
            end
        end
    end)
end