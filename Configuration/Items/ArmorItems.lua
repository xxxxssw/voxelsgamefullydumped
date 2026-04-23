-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.Items.ArmorItems
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local v3 = v1.Assets.Wearables
local v4 = {
    ["Leather"] = {
        ["mainColor"] = Color3.fromRGB(108, 88, 75),
        ["outlinesColor"] = Color3.fromRGB(68, 55, 47)
    },
    ["Iron"] = {
        ["mainColor"] = Color3.fromRGB(220, 234, 234),
        ["outlinesColor"] = Color3.fromRGB(167, 198, 198)
    },
    ["Gold"] = {
        ["mainColor"] = Color3.fromRGB(255, 220, 81),
        ["outlinesColor"] = Color3.fromRGB(221, 168, 53)
    },
    ["Diamond"] = {
        ["mainColor"] = Color3.fromRGB(0, 255, 255),
        ["outlinesColor"] = Color3.fromRGB(0, 182, 182)
    },
    ["Netherite"] = {
        ["mainColor"] = Color3.fromRGB(76, 65, 67),
        ["outlinesColor"] = Color3.fromRGB(39, 28, 29)
    },
    ["Mythril"] = {
        ["mainColor"] = Color3.fromRGB(45, 255, 174),
        ["outlinesColor"] = Color3.fromRGB(33, 183, 123)
    }
}
local v5 = {
    ["slots"] = {
        "Helmet",
        "Chestplate",
        "Leggings",
        "Boots"
    },
    ["colors"] = v4
}
local v6 = {
    [v2.itemIdFromName("leather_helmet")] = {
        ["geometry"] = v3.Helmet.Helmet,
        ["colors"] = v4.Leather
    },
    [v2.itemIdFromName("iron_helmet")] = {
        ["geometry"] = v3.Helmet.Helmet,
        ["colors"] = v4.Iron
    },
    [v2.itemIdFromName("golden_helmet")] = {
        ["geometry"] = v3.Helmet.Helmet,
        ["colors"] = v4.Gold
    },
    [v2.itemIdFromName("diamond_helmet")] = {
        ["geometry"] = v3.Helmet.Helmet,
        ["colors"] = v4.Diamond
    },
    [v2.itemIdFromName("mythril_helmet")] = {
        ["geometry"] = v3.Helmet.Helmet,
        ["colors"] = v4.Mythril
    },
    [v2.itemIdFromName("leather_chestplate")] = {
        ["geometry"] = v3.Chestplate.Armor,
        ["colors"] = v4.Leather
    },
    [v2.itemIdFromName("iron_chestplate")] = {
        ["geometry"] = v3.Chestplate.Armor,
        ["colors"] = v4.Iron
    },
    [v2.itemIdFromName("golden_chestplate")] = {
        ["geometry"] = v3.Chestplate.Armor,
        ["colors"] = v4.Gold
    },
    [v2.itemIdFromName("diamond_chestplate")] = {
        ["geometry"] = v3.Chestplate.Armor,
        ["colors"] = v4.Diamond
    }
}
local v7 = v2.itemIdFromName("ancient_armor")
local v8 = {
    ["geometry"] = v3.Chestplate.Armor,
    ["colors"] = {
        ["mainColor"] = Color3.fromRGB(62, 62, 62),
        ["outlinesColor"] = Color3.fromRGB(48, 47, 44)
    }
}
v6[v7] = v8
v6[v2.itemIdFromName("mythril_chestplate")] = {
    ["geometry"] = v3.Chestplate.Armor,
    ["colors"] = v4.Mythril
}
v6[v2.itemIdFromName("leather_leggings")] = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = v4.Leather
}
v6[v2.itemIdFromName("iron_leggings")] = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = v4.Iron
}
v6[v2.itemIdFromName("golden_leggings")] = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = v4.Gold
}
v6[v2.itemIdFromName("diamond_leggings")] = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = v4.Diamond
}
local v9 = v2.itemIdFromName("ancient_leggings")
local v10 = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = {
        ["mainColor"] = Color3.fromRGB(178, 77, 57),
        ["outlinesColor"] = Color3.fromRGB(150, 62, 45)
    }
}
v6[v9] = v10
v6[v2.itemIdFromName("mythril_leggings")] = {
    ["geometry"] = v3.Leggings.Leggings,
    ["colors"] = v4.Mythril
}
v6[v2.itemIdFromName("leather_boots")] = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = v4.Leather
}
v6[v2.itemIdFromName("iron_boots")] = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = v4.Iron
}
v6[v2.itemIdFromName("golden_boots")] = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = v4.Gold
}
v6[v2.itemIdFromName("diamond_boots")] = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = v4.Diamond
}
local v11 = v2.itemIdFromName("ancient_boots")
local v12 = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = {
        ["mainColor"] = Color3.fromRGB(115, 159, 209),
        ["outlinesColor"] = Color3.fromRGB(90, 126, 166)
    }
}
v6[v11] = v12
v6[v2.itemIdFromName("mythril_boots")] = {
    ["geometry"] = v3.Boots.Boots,
    ["colors"] = v4.Mythril
}
v5.render = v6
v5.armors = {
    [v2.itemIdFromName("leather_helmet")] = 0.03,
    [v2.itemIdFromName("leather_chestplate")] = 0.09,
    [v2.itemIdFromName("leather_leggings")] = 0.06,
    [v2.itemIdFromName("leather_boots")] = 0.03,
    [v2.itemIdFromName("golden_helmet")] = 0.06,
    [v2.itemIdFromName("golden_chestplate")] = 0.15,
    [v2.itemIdFromName("golden_leggings")] = 0.09,
    [v2.itemIdFromName("golden_boots")] = 0.03,
    [v2.itemIdFromName("iron_helmet")] = 0.06,
    [v2.itemIdFromName("iron_chestplate")] = 0.18,
    [v2.itemIdFromName("iron_leggings")] = 0.15,
    [v2.itemIdFromName("iron_boots")] = 0.06,
    [v2.itemIdFromName("mythril_helmet")] = 0.06,
    [v2.itemIdFromName("mythril_chestplate")] = 0.18,
    [v2.itemIdFromName("mythril_leggings")] = 0.15,
    [v2.itemIdFromName("mythril_boots")] = 0.06,
    [v2.itemIdFromName("ancient_armor")] = 0.2,
    [v2.itemIdFromName("ancient_leggings")] = 0.16,
    [v2.itemIdFromName("ancient_boots")] = 0.07,
    [v2.itemIdFromName("diamond_helmet")] = 0.09,
    [v2.itemIdFromName("diamond_chestplate")] = 0.24,
    [v2.itemIdFromName("diamond_leggings")] = 0.18,
    [v2.itemIdFromName("diamond_boots")] = 0.09,
    [v2.itemIdFromName("netherite_helmet")] = 0.11,
    [v2.itemIdFromName("netherite_chestplate")] = 0.26,
    [v2.itemIdFromName("netherite_leggings")] = 0.2,
    [v2.itemIdFromName("netherite_boots")] = 0.11
}
for _, v13 in { "Netherite" } do
    for _, v14 in {
        "Helmet",
        "Chestplate",
        "Leggings",
        "Boots"
    } do
        local v15 = v14:lower()
        local v16
        if v14 == "Chestplate" then
            v16 = v3[v14].Armor
        else
            v16 = v3[v14][v14]
        end
        v5.render[v2.itemIdFromName(string.format("%s_%s", v13:lower(), v15))] = {
            ["geometry"] = v16,
            ["colors"] = v4[v13]
        }
    end
end
for v17, _ in v5.armors do
    if string.find(v2.getItemName(v17), "mythril") then
        local v18 = string.gsub(v2.getItemName(v17), "mythril", "diamond")
        local v19 = v2.itemIdFromName(v18, true)
        if v2.itemIdExists(v19) and v5.armors[v19] then
            v5.armors[v17] = v5.armors[v19]
        end
    end
end
return v5