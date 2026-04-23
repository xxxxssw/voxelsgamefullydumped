-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.Queue
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = require(script.Parent.Stack)
local u2 = setmetatable({}, {
    ["__index"] = u1
})
u2.__index = u2
function u2.new(p3) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v4 = u1.new(p3)
    local v5 = u2
    return setmetatable(v4, v5)
end
function u2.Get(p6) --[[ Line: 10 ]]
    return p6[1]
end
function u2.Pop(p7) --[[ Line: 14 ]]
    table.remove(p7, 1)
end
return u2