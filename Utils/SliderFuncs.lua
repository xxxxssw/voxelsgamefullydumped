-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.slider_service.Utils.SliderFuncs
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u5 = {
    ["snapToScale"] = function(p1, p2) --[[ Name: snapToScale, Line 3 ]]
        local v3 = p1 / p2
        local v4 = math.round(v3) * p2
        return math.clamp(v4, 0, 1)
    end
}
function lerp(p6, p7, p8)
    return (1 - p8) * p6 + p8 * p7
end
function u5.map(p9, p10, p11, p12, p13, p14) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v15 = lerp(p12, p13, u5.getAlphaBetween(p10, p11, p9))
    if not p14 then
        return v15
    end
    if p12 >= p13 then
        local v16 = p12
        p12 = p13
        p13 = v16
    end
    local v17 = math.min(v15, p13)
    return math.max(v17, p12)
end
function u5.getNewPosition(p18) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v19 = p18._data.Button.AbsoluteSize[p18._config.Axis]
    local v20 = p18._holder.AbsoluteSize[p18._config.Axis]
    local v21 = p18._data.Button.AnchorPoint[p18._config.Axis]
    local v22 = p18._config.Padding / v20
    local v23 = v21 * v19 / v20 + v22
    local v24 = 2 * v19 * v21 - v19
    local v25 = 1 - v23 + v24 / v20
    local v26 = u5.map(p18._data._percent, 0, 1, v23, v25, true)
    if p18._config.Axis == "X" then
        return UDim2.fromScale(v26, p18._data.Button.Position.Y.Scale)
    else
        return UDim2.fromScale(p18._data.Button.Position.X.Scale, v26)
    end
end
function u5.getScaleIncrement(p27) --[[ Line: 43 ]]
    return 1 / ((p27._config.SliderData.End - p27._config.SliderData.Start) / p27._config.SliderData.Increment)
end
function u5.getAlphaBetween(p28, p29, p30) --[[ Line: 47 ]]
    return (p30 - p28) / (p29 - p28)
end
function u5.getNewValue(p31) --[[ Line: 51 ]]
    local v32 = lerp(p31._config.SliderData.Start, p31._config.SliderData.End, p31._data._percent)
    local v33 = 1 / p31._config.SliderData.Increment
    local v34 = v32 * v33
    return math.round(v34) / v33
end
return u5