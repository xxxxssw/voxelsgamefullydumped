-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Text.lib.Signal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = {}
u1.__index = u1
local u2 = {}
u2.__index = u2
function u2.new(p3, p4) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v5 = u2
    return setmetatable({
        ["_handler"] = p4,
        ["_signal"] = p3
    }, v5)
end
function u2.Disconnect(p6) --[[ Line: 22 ]]
    local v7 = p6._signal
    local v8 = table.find(v7, p6)
    if v8 then
        table.remove(v7, v8)
    end
end
function u1.new() --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v9 = u1
    return setmetatable({}, v9)
end
function u1.Connect(p10, p11) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v12 = u2.new(p10, p11)
    table.insert(p10, v12)
    return v12
end
function u1.DisconnectAll(p13) --[[ Line: 40 ]]
    table.clear(p13)
end
function u1.Fire(p14, ...) --[[ Line: 44 ]]
    local v15 = #p14
    if v15 > 0 then
        local v16 = table.create(v15)
        table.move(p14, 1, v15, 1, v16)
        for v17 = v15, 1, -1 do
            task.spawn(v16[v17]._handler, ...)
        end
    end
end
function u1.Wait(p18) --[[ Line: 56 ]]
    local u19 = coroutine.running()
    local u20 = nil
    u20 = p18:Connect(function(...) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u19
        --]]
        u20:Disconnect()
        task.spawn(u19, ...)
    end)
    return coroutine.yield()
end
function u1.Once(p21, u22) --[[ Line: 66 ]]
    local u23 = nil
    u23 = p21:Connect(function(...) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u22
        --]]
        u23:Disconnect()
        u22(...)
    end)
    return u23
end
return u1