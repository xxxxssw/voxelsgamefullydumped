-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Touchscreen
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = {}
local u2 = Instance.new("BindableEvent")
local u3 = Instance.new("BindableEvent")
local u4 = Instance.new("StringValue")
function v1.setLayer(p5) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.Value = p5
end
function v1.getLayer() --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.Value
end
function v1.getLayerChangedSignal() --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.Changed
end
function v1.inputBegan(p6, ...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2:Fire(p6, ...)
end
function v1.inputEnded(p7, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3:Fire(p7, ...)
end
function v1.getInputBeganSignal() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.Event
end
function v1.getInputEndedSignal() --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Event
end
return v1