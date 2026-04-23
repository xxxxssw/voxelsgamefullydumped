-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.PriorityQueue
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local u1 = math.floor
local u2 = {}
u2.__index = u2
function u2.new() --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    v4.heap = {}
    v4.current_size = 0
    return v4
end
function u2.isEmpty(p5) --[[ Line: 16 ]]
    return p5.current_size == 0
end
function u2.size(p6) --[[ Line: 20 ]]
    return p6.current_size
end
function u2.swim(p7) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v8 = p7.heap
    local v9 = u1
    local v10 = p7.current_size
    while v9(v10 / 2) > 0 do
        local v11 = v9(v10 / 2)
        if v8[v10][2] < v8[v11][2] then
            local v12 = v8[v11]
            local v13 = v8[v10]
            v8[v10] = v12
            v8[v11] = v13
            v10 = v11
        else
            v10 = v11
        end
    end
end
function u2.Push(p14, p15, p16) --[[ Line: 39 ]]
    p14.heap[p14.current_size + 1] = { p15, p16 }
    p14.current_size = p14.current_size + 1
    p14:swim()
end
function u2.sink(p17) --[[ Line: 52 ]]
    local v18 = p17.current_size
    local v19 = p17.heap
    local v20 = 1
    while v20 * 2 <= v18 do
        local v21 = p17:min_child(v20)
        if v19[v20][2] > v19[v21][2] then
            local v22 = v19[v21]
            local v23 = v19[v20]
            v19[v20] = v22
            v19[v21] = v23
            v20 = v21
        else
            v20 = v21
        end
    end
end
function u2.min_child(p24, p25) --[[ Line: 67 ]]
    if p25 * 2 + 1 > p24.current_size then
        return p25 * 2
    elseif p24.heap[p25 * 2][2] < p24.heap[p25 * 2 + 1][2] then
        return p25 * 2
    else
        return p25 * 2 + 1
    end
end
function u2.Pop(p26) --[[ Line: 79 ]]
    local v27 = p26.heap
    local v28 = v27[1][1]
    v27[1] = v27[p26.current_size]
    v27[p26.current_size] = nil
    p26.current_size = p26.current_size - 1
    p26:sink()
    return v28
end
return u2