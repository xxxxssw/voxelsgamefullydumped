-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.GetGuiInset
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = game:GetService("GuiService")
local u2 = game:GetService("RunService")
local u3 = game:GetService("UserInputService")
return function() --[[ Name: GetGuiInset, Line 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u1
    --]]
    if u2:IsStudio() then
        local v4 = u3
        if string.find(tostring(v4:GetLastInputType()), "Gamepad") then
            return Vector2.new()
        else
            return Vector2.new(script.StudioX.Value, script.StudioY.Value)
        end
    else
        return u1:GetGuiInset()
    end
end