-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.GuidePages.Tools & Weapons
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u2 = require(game.ReplicatedStorage.Configuration.Items.ArmorItems)
local function v7(p3, p4) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v5 = u2.colors[p3].mainColor
    local v6 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v5:ToHex())
    return string.format("%s%s%s", v6, p4, "</font></b>")
end
local v8 = {}
local v9 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("wooden_pickaxe"),
        v1.itemIdFromName("wooden_axe"),
        v1.itemIdFromName("wooden_shovel"),
        v1.itemIdFromName("wooden_hoe"),
        v1.itemIdFromName("wooden_sword")
    }
}
local v10 = {
    ["Element"] = "Text"
}
local v11 = string.format
local v12 = u2.colors.Leather.mainColor
local v13 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v12:ToHex())
local v14 = string.format("%s%s%s", v13, "Wooden", "</font></b>")
local v15 = v1.getItemDisplayName(v1.itemIdFromName("stick"))
local v16 = u2.colors.Leather.mainColor
local v17 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v16:ToHex())
v10.Text = v11("%s, you can craft it with %s and any type of %s", v14, string.format("%s%s%s", v17, v15, "</font></b>"), v7("Leather", "Planks"))
local v18 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("golden_pickaxe"),
        v1.itemIdFromName("golden_axe"),
        v1.itemIdFromName("golden_shovel"),
        v1.itemIdFromName("golden_hoe"),
        v1.itemIdFromName("golden_sword")
    }
}
local v19 = {
    ["Element"] = "Text"
}
local v20 = string.format
local v21 = u2.colors.Gold.mainColor
local v22 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v21:ToHex())
local v23 = string.format("%s%s%s", v22, "Golden", "</font></b>")
local v24 = v1.getItemDisplayName(v1.itemIdFromName("stick"))
local v25 = u2.colors.Leather.mainColor
local v26 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v25:ToHex())
local v27 = string.format("%s%s%s", v26, v24, "</font></b>")
local v28 = v1.getItemDisplayName(v1.itemIdFromName("gold_ingot"))
local v29 = u2.colors.Gold.mainColor
local v30 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v29:ToHex())
local v31 = string.format("%s%s%s", v30, v28, "</font></b>")
local v32 = v1.getItemDisplayName(v1.itemIdFromName("gold_ingot"))
local v33 = u2.colors.Gold.mainColor
local v34 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v33:ToHex())
local v35 = string.format("%s%s%s", v34, v32, "</font></b>")
local v36 = v1.getItemDisplayName(v1.itemIdFromName("gold_ingot"))
local v37 = u2.colors.Gold.mainColor
local v38 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v37:ToHex())
v19.Text = v20("%s, you can craft it with %s and %s\n%s are obtained by smelting %s", v23, v27, v31, v35, string.format("%s%s%s", v38, v36, "</font></b>"), v7("Gold", v1.getItemDisplayName(v1.itemIdFromName("gold_ore"))))
local v39 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("iron_pickaxe"),
        v1.itemIdFromName("iron_axe"),
        v1.itemIdFromName("iron_shovel"),
        v1.itemIdFromName("iron_hoe"),
        v1.itemIdFromName("iron_sword")
    }
}
local v40 = {
    ["Element"] = "Text"
}
local v41 = string.format
local v42 = u2.colors.Iron.mainColor
local v43 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v42:ToHex())
local v44 = string.format("%s%s%s", v43, "Iron", "</font></b>")
local v45 = v1.getItemDisplayName(v1.itemIdFromName("stick"))
local v46 = u2.colors.Leather.mainColor
local v47 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v46:ToHex())
local v48 = string.format("%s%s%s", v47, v45, "</font></b>")
local v49 = v1.getItemDisplayName(v1.itemIdFromName("iron_ingot"))
local v50 = u2.colors.Iron.mainColor
local v51 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v50:ToHex())
local v52 = string.format("%s%s%s", v51, v49, "</font></b>")
local v53 = v1.getItemDisplayName(v1.itemIdFromName("iron_ingot"))
local v54 = u2.colors.Iron.mainColor
local v55 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v54:ToHex())
local v56 = string.format("%s%s%s", v55, v53, "</font></b>")
local v57 = v1.getItemDisplayName(v1.itemIdFromName("iron_ingot"))
local v58 = u2.colors.Iron.mainColor
local v59 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v58:ToHex())
v40.Text = v41("%s, you can craft it with %s and %s\n%s are obtained by smelting %s", v44, v48, v52, v56, string.format("%s%s%s", v59, v57, "</font></b>"), v7("Iron", v1.getItemDisplayName(v1.itemIdFromName("iron_ore"))))
local v60 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("mythril_pickaxe"),
        v1.itemIdFromName("mythril_axe"),
        v1.itemIdFromName("mythril_shovel"),
        v1.itemIdFromName("mythril_bow"),
        v1.itemIdFromName("mythril_sword")
    }
}
local v61 = {
    ["Element"] = "Text"
}
local v62 = string.format
local v63 = v1.getItemDisplayName(v1.itemIdFromName("mythril_chestplate"))
local v64 = u2.colors.Mythril.mainColor
local v65 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v64:ToHex())
local v66 = string.format("%s%s%s", v65, v63, "</font></b>")
local v67 = u2.colors.Mythril.mainColor
local v68 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v67:ToHex())
local v69 = string.format("%s%s%s", v68, "Mythril", "</font></b>")
local v70 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v71 = u2.colors.Diamond.mainColor
local v72 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v71:ToHex())
v61.Text = v62("%s, you can claim it from shop\n%s has the damage and efficiency of %s with a better durability than %s", v66, v69, string.format("%s%s%s", v72, v70, "</font></b>"), v7("Iron", "Iron"))
local v73 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("diamond_pickaxe"),
        v1.itemIdFromName("diamond_axe"),
        v1.itemIdFromName("diamond_shovel"),
        v1.itemIdFromName("diamond_hoe"),
        v1.itemIdFromName("diamond_sword")
    }
}
local v74 = {
    ["Element"] = "Text"
}
local v75 = string.format
local v76 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v77 = u2.colors.Diamond.mainColor
local v78 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v77:ToHex())
local v79 = string.format("%s%s%s", v78, v76, "</font></b>")
local v80 = v1.getItemDisplayName(v1.itemIdFromName("stick"))
local v81 = u2.colors.Leather.mainColor
local v82 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v81:ToHex())
local v83 = string.format("%s%s%s", v82, v80, "</font></b>")
local v84 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v85 = u2.colors.Diamond.mainColor
local v86 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v85:ToHex())
local v87 = string.format("%s%s%s", v86, v84, "</font></b>")
local v88 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v89 = u2.colors.Diamond.mainColor
local v90 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v89:ToHex())
v74.Text = v75("%s, you can craft it with %s and %s\n%s are obtained from %s", v79, v83, v87, string.format("%s%s%s", v90, v88, "</font></b>"), v7("Diamond", v1.getItemDisplayName(v1.itemIdFromName("diamond_ore"))))
__set_list(v8, 1, {{
    ["Element"] = "Title",
    ["Text"] = "Tools and Weapons list"
}, {
    ["Element"] = "Text",
    ["Text"] = "This is the list of all tools and weapons, sort from weakest to strongest"
}, v9, v10, v18, v19, v39, v40, v60, v61, v73, v74, {
    ["Element"] = "Title",
    ["Text"] = ""
}, {
    ["Element"] = "Title",
    ["Text"] = ""
}})
return v8