-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Text.lib.Util
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = game:GetService("HttpService")
local u4 = {
    ["ScreenSize"] = Vector2.new(1920, 1080),
    ["GetDataFileSize"] = function(p2) --[[ Name: GetDataFileSize, Line 9 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u4
        --]]
        local v3 = #u1:JSONEncode(p2)
        if v3 >= 1048576 then
            return u4.RoundNumber(v3 / 1048576, 2) .. " MB"
        elseif v3 >= 1024 then
            return u4.RoundNumber(v3 / 1024, 2) .. " KB"
        else
            return v3 .. " Bytes"
        end
    end
}
return u4