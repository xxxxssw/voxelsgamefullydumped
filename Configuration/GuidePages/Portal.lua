-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Configuration.GuidePages.Portal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
return {
    {
        ["Element"] = "Image",
        ["Image"] = "rbxassetid://17373543679"
    },
    {
        ["Element"] = "Title",
        ["Text"] = "Portal to the Underworld"
    },
    {
        ["Element"] = "Text",
        ["Text"] = "You can travel to a parallel dimension called the Underworld by building a portal with <font color=\'#ff0000\'>Crimson Stone</font>. The portal need to be ignited with a <font color=\'#ff0000\'>Crimson Spirit</font>."
    },
    {
        ["Element"] = "Text",
        ["Text"] = "<font color=\'#ff0000\'>Crimson Stone</font> can be found on portal ruins scattered around the world. <font color=\'#ff0000\'>Crimson Spirit</font> can be found in a rare evil bastion, protected by skeletons spawners."
    },
    {
        ["Element"] = "CellsList",
        ["Items"] = { v1.itemIdFromName("glowstone"), v1.itemIdFromName("willothewisp") }
    },
    {
        ["Element"] = "Title",
        ["Text"] = "The Underworld"
    },
    {
        ["Element"] = "Text",
        ["Text"] = "Be careful, as a lot of evil creatures will attack on sight in the underworld. Make sure to bring armor and a good sword!"
    },
    {
        ["Element"] = "Title",
        ["Text"] = ""
    },
    {
        ["Element"] = "Title",
        ["Text"] = ""
    }
}