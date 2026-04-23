-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.filter_module
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = game:GetService("Chat")
local u2 = game:GetService("RunService")
local u3 = game:GetService("ReplicatedStorage").exe_storage
return {
    ["filter_string"] = function(_, u4, u5) --[[ Name: filter_string, Line 9 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
            [3] = u3
        --]]
        if u2:IsServer() then
            local u6 = u4
            local v7, v8 = pcall(function() --[[ Line: 14 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u1
                    [3] = u4
                    [4] = u5
                --]]
                u6 = u1:FilterStringForBroadcast(u4, u5)
                return u6
            end)
            if v7 then
                return u6
            end
            warn("Had issues filtering message. " .. v8)
        elseif u2:IsClient() then
            return u3.events.filter_string:InvokeServer(u4)
        end
    end
}