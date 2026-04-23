-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.slider_service.Utils.Signal
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = {}
u1.__index = u1
u1.ClassName = "Signal"
function u1.new() --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3._bindableEvent = Instance.new("BindableEvent")
    v3._argData = nil
    v3._argCount = nil
    return v3
end
function u1.Fire(p4, ...) --[[ Line: 34 ]]
    p4._argData = { ... }
    p4._argCount = select("#", ...)
    p4._bindableEvent:Fire()
    p4._argData = nil
    p4._argCount = nil
end
function u1.Connect(u5, u6) --[[ Line: 45 ]]
    if type(u6) ~= "function" then
        error(("connect(%s)"):format((typeof(u6))), 2)
    end
    return u5._bindableEvent.Event:Connect(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
        --]]
        local v7 = u6
        local v8 = u5._argData
        local v9 = u5._argCount
        v7(unpack(v8, 1, v9))
    end)
end
function u1.Wait(p10) --[[ Line: 57 ]]
    p10._bindableEvent.Event:Wait()
    local v11 = p10._argData
    assert(v11, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
    local v12 = p10._argData
    local v13 = p10._argCount
    return unpack(v12, 1, v13)
end
function u1.Destroy(p14) --[[ Line: 65 ]]
    if p14._bindableEvent then
        p14._bindableEvent:Destroy()
        p14._bindableEvent = nil
    end
    p14._argData = nil
    p14._argCount = nil
end
return u1