-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.GuidePages.Armors
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
        v1.itemIdFromName("leather_helmet"),
        v1.itemIdFromName("leather_chestplate"),
        v1.itemIdFromName("leather_leggings"),
        v1.itemIdFromName("leather_boots")
    }
}
local v10 = {
    ["Element"] = "Text"
}
local v11 = string.format
local v12 = v1.getItemDisplayName(v1.itemIdFromName("leather_chestplate"))
local v13 = u2.colors.Leather.mainColor
local v14 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v13:ToHex())
local v15 = string.format("%s%s%s", v14, v12, "</font></b>")
local v16 = v1.getItemDisplayName(v1.itemIdFromName("leather"))
local v17 = u2.colors.Leather.mainColor
local v18 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v17:ToHex())
v10.Text = v11("%s, you can craft it with %s\nUpon death, cows drop 0\226\128\1472 %s", v15, string.format("%s%s%s", v18, v16, "</font></b>"), v7("Leather", v1.getItemDisplayName(v1.itemIdFromName("leather"))))
local v19 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("golden_helmet"),
        v1.itemIdFromName("golden_chestplate"),
        v1.itemIdFromName("golden_leggings"),
        v1.itemIdFromName("golden_boots")
    }
}
local v20 = {
    ["Element"] = "Text"
}
local v21 = string.format
local v22 = v1.getItemDisplayName(v1.itemIdFromName("golden_chestplate"))
local v23 = u2.colors.Gold.mainColor
local v24 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v23:ToHex())
local v25 = string.format("%s%s%s", v24, v22, "</font></b>")
local v26 = v1.getItemDisplayName(v1.itemIdFromName("gold_ingot"))
local v27 = u2.colors.Gold.mainColor
local v28 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v27:ToHex())
local v29 = string.format("%s%s%s", v28, v26, "</font></b>")
local v30 = v1.getItemDisplayName(v1.itemIdFromName("gold_ingot"))
local v31 = u2.colors.Gold.mainColor
local v32 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v31:ToHex())
v20.Text = v21("%s, you can craft it with %s\n%s are obtained by smelting %s", v25, v29, string.format("%s%s%s", v32, v30, "</font></b>"), v7("Gold", v1.getItemDisplayName(v1.itemIdFromName("gold_ore"))))
local v33 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("iron_helmet"),
        v1.itemIdFromName("iron_chestplate"),
        v1.itemIdFromName("iron_leggings"),
        v1.itemIdFromName("iron_boots")
    }
}
local v34 = {
    ["Element"] = "Text"
}
local v35 = string.format
local v36 = v1.getItemDisplayName(v1.itemIdFromName("iron_chestplate"))
local v37 = u2.colors.Iron.mainColor
local v38 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v37:ToHex())
local v39 = string.format("%s%s%s", v38, v36, "</font></b>")
local v40 = v1.getItemDisplayName(v1.itemIdFromName("iron_ingot"))
local v41 = u2.colors.Iron.mainColor
local v42 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v41:ToHex())
local v43 = string.format("%s%s%s", v42, v40, "</font></b>")
local v44 = v1.getItemDisplayName(v1.itemIdFromName("iron_ingot"))
local v45 = u2.colors.Iron.mainColor
local v46 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v45:ToHex())
v34.Text = v35("%s, you can craft it with %s\n%s are obtained by smelting %s", v39, v43, string.format("%s%s%s", v46, v44, "</font></b>"), v7("Iron", v1.getItemDisplayName(v1.itemIdFromName("iron_ore"))))
local v47 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("mythril_helmet"),
        v1.itemIdFromName("mythril_chestplate"),
        v1.itemIdFromName("mythril_leggings"),
        v1.itemIdFromName("mythril_boots")
    }
}
local v48 = {
    ["Element"] = "Text"
}
local v49 = string.format
local v50 = v1.getItemDisplayName(v1.itemIdFromName("mythril_chestplate"))
local v51 = u2.colors.Mythril.mainColor
local v52 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v51:ToHex())
local v53 = string.format("%s%s%s", v52, v50, "</font></b>")
local v54 = u2.colors.Mythril.mainColor
local v55 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v54:ToHex())
local v56 = string.format("%s%s%s", v55, "Mythril", "</font></b>")
local v57 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v58 = u2.colors.Diamond.mainColor
local v59 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v58:ToHex())
v48.Text = v49("%s, you can claim it from shop\n%s has the protection of %s with a better durability than %s", v53, v56, string.format("%s%s%s", v59, v57, "</font></b>"), v7("Iron", "Iron"))
local v60 = {
    ["Element"] = "CellsList",
    ["Items"] = {
        v1.itemIdFromName("diamond_helmet"),
        v1.itemIdFromName("diamond_chestplate"),
        v1.itemIdFromName("diamond_leggings"),
        v1.itemIdFromName("diamond_boots")
    }
}
local v61 = {
    ["Element"] = "Text"
}
local v62 = string.format
local v63 = v1.getItemDisplayName(v1.itemIdFromName("diamond_chestplate"))
local v64 = u2.colors.Diamond.mainColor
local v65 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v64:ToHex())
local v66 = string.format("%s%s%s", v65, v63, "</font></b>")
local v67 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v68 = u2.colors.Diamond.mainColor
local v69 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v68:ToHex())
local v70 = string.format("%s%s%s", v69, v67, "</font></b>")
local v71 = v1.getItemDisplayName(v1.itemIdFromName("diamond"))
local v72 = u2.colors.Diamond.mainColor
local v73 = string.gsub("<b><font color=\'#XXX\'>", "XXX", v72:ToHex())
v61.Text = v62("%s, you can craft it with %s\n%s are obtained from %s", v66, v70, string.format("%s%s%s", v73, v71, "</font></b>"), v7("Diamond", v1.getItemDisplayName(v1.itemIdFromName("diamond_ore"))))
__set_list(v8, 1, {{
    ["Element"] = "Title",
    ["Text"] = "Armor list"
}, {
    ["Element"] = "Text",
    ["Text"] = "This is the list of all armors, sort from weakest to strongest"
}, v9, v10, v19, v20, v33, v34, v47, v48, v60, v61, {
    ["Element"] = "Title",
    ["Text"] = ""
}, {
    ["Element"] = "Title",
    ["Text"] = ""
}})
return v8