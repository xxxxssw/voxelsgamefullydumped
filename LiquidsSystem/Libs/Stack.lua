-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.Stack
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = {}
u1.__index = u1
function u1.new(p2) --[[ Line: 4 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v3 = u1
    return setmetatable(p2 or {}, v3)
end
function u1.Top(p4) --[[ Line: 8 ]]
    return p4[#p4]
end
function u1.isEmpty(p5) --[[ Line: 12 ]]
    return #p5 == 0
end
function u1.Push(p6, p7) --[[ Line: 16 ]]
    table.insert(p6, p7)
end
function u1.Pop(p8) --[[ Line: 20 ]]
    table.remove(p8, #p8)
end
return u1