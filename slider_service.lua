-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.slider_service
-- Source: decompile
-- Dumped: 2026-04-23 03:45:36

local u1 = {
    ["Sliders"] = {}
}
local v2 = game:GetService("RunService")
local u3 = game:GetService("UserInputService")
local u4 = game:GetService("TweenService")
local v5 = v2:IsClient()
assert(v5, "Slider module can only be used on the Client!")
local v6 = script.Utils
local u7 = require(v6.Signal)
local u8 = require(v6.SliderFuncs)
function u1.__index(p9, p10) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v11 = {
        { ".OnChange", ".Changed", (rawget(p9, "Changed")) }
    }
    for _, v12 in ipairs(v11) do
        local v13 = v12[1]
        if string.sub(v13, 2) == p10 then
            warn(string.format("%s is deprecated, please use %s instead", v12[1], v12[2]))
            return v12[3]
        end
    end
    return u1[p10]
end
function u1.new(u14, p15) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u8
        [3] = u7
    --]]
    local v16 = pcall(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        return u14.AbsoluteSize, u14.AbsolutePosition
    end)
    assert(v16, "Holder argument does not have an AbsoluteSize/AbsolutePosition")
    local v17 = false
    for _, v18 in ipairs(u1.Sliders) do
        if v18._holder == u14 then
            v17 = true
            break
        end
    end
    assert(not v17, "Cannot set two sliders with same frame!")
    local v19 = p15.SliderData.Increment ~= nil
    assert(v19, "Failed to find Increment in SliderData table")
    local v20 = p15.SliderData.Start ~= nil
    assert(v20, "Failed to find Start in SliderData table")
    local v21 = p15.SliderData.End ~= nil
    assert(v21, "Failed to find End in SliderData table")
    local v22 = p15.SliderData.Increment > 0
    assert(v22, "SliderData.Increment must be greater than 0")
    local v23 = p15.SliderData.End > p15.SliderData.Start
    local v24 = string.format
    local v25 = p15.SliderData.End
    local v26 = p15.SliderData.Start
    assert(v23, v24("Slider end value must be greater than its start value! (%.1f <= %.1f)", v25, v26))
    local v27 = u1
    local u28 = setmetatable({}, v27)
    u28._holder = u14
    u28._data = {
        ["Button"] = nil,
        ["HolderButton"] = nil,
        ["_clickOverride"] = false,
        ["_mainConnection"] = nil,
        ["_clickConnections"] = {},
        ["_otherConnections"] = {},
        ["_inputPos"] = nil,
        ["_percent"] = 0,
        ["_value"] = 0,
        ["_scaleIncrement"] = 0,
        ["_currentTween"] = nil,
        ["_allowBackgroundClick"] = p15.AllowBackgroundClick ~= false
    }
    u28._config = p15
    u28._config.Axis = string.upper(p15.Axis or "X")
    u28._config.Padding = p15.Padding or 5
    u28._config.MoveInfo = p15.MoveInfo or TweenInfo.new(0.2)
    u28._config.MoveType = p15.MoveType or "Tween"
    u28.IsHeld = false
    local v29 = u14:FindFirstChild("Slider")
    local v30 = v29 ~= nil
    assert(v30, "Failed to find slider button.")
    local v31 = v29:IsA("GuiButton")
    assert(v31, "Slider is not a GuiButton")
    u28._data.Button = v29
    if u28._data._allowBackgroundClick then
        local v32 = Instance.new("TextButton")
        v32.BackgroundTransparency = 1
        v32.Text = ""
        v32.Name = "HolderClickButton"
        v32.Size = UDim2.fromScale(1, 1)
        v32.ZIndex = -1
        v32.Parent = u28._holder
        u28._data.HolderButton = v32
    end
    u28._data._percent = 0
    if p15.SliderData.DefaultValue then
        local v33 = p15.SliderData
        local v34 = p15.SliderData.DefaultValue
        local v35 = p15.SliderData.Start
        local v36 = p15.SliderData.End
        v33.DefaultValue = math.clamp(v34, v35, v36)
        u28._data._percent = u8.getAlphaBetween(p15.SliderData.Start, p15.SliderData.End, p15.SliderData.DefaultValue)
    end
    local v37 = u28._data
    local v38 = u28._data._percent
    v37._percent = math.clamp(v38, 0, 1)
    u28._data._value = u8.getNewValue(u28)
    u28._data._increment = p15.SliderData.Increment
    u28._data._scaleIncrement = u8.getScaleIncrement(u28)
    u28.Changed = u7.new()
    u28.Dragged = u7.new()
    u28.Released = u7.new()
    u28._data._percent = u8.snapToScale(u28._data._percent, u28._data._scaleIncrement)
    u28:Move()
    local v39 = u28._data._otherConnections
    local v40 = v29:GetPropertyChangedSignal("AbsoluteSize")
    table.insert(v39, v40:Connect(function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:Move("Instant")
    end))
    local v41 = u1.Sliders
    table.insert(v41, u28)
    return u28
end
function u1.Track(u42) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for _, v43 in ipairs(u42._data._clickConnections) do
        v43:Disconnect()
    end
    local v44 = u42._data._clickConnections
    local v45 = u42._data.Button.MouseButton1Down
    table.insert(v44, v45:Connect(function() --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42.IsHeld = true
    end))
    local v46 = u42._data._clickConnections
    local v47 = u42._data.Button.MouseButton1Up
    table.insert(v46, v47:Connect(function() --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if u42.IsHeld then
            u42.Released:Fire(u42._data._value)
        end
        u42.IsHeld = false
    end))
    if u42._data._allowBackgroundClick then
        local v48 = u42._data._clickConnections
        local v49 = u42._data.HolderButton.Activated
        table.insert(v48, v49:Connect(function(p50) --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            if p50.UserInputType == Enum.UserInputType.MouseButton1 or p50.UserInputType == Enum.UserInputType.Touch then
                u42._data._inputPos = p50.Position
                u42._data._clickOverride = true
                u42:Update()
                u42._data._clickOverride = false
            end
        end))
    end
    if u42.Changed then
        u42.Changed:Fire(u42._data._value)
    end
    if u42._data._mainConnection then
        u42._data._mainConnection:Disconnect()
    end
    u42._data._mainConnection = u3.InputChanged:Connect(function(p51, _) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if p51.UserInputType == Enum.UserInputType.MouseMovement or p51.UserInputType == Enum.UserInputType.Touch then
            u42._data._inputPos = p51.Position
            u42:Update()
        end
    end)
end
function u1.Update(p52) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if (p52.IsHeld or p52._data._clickOverride) and p52._data._inputPos then
        local v53 = p52._holder.AbsoluteSize[p52._config.Axis]
        local v54 = p52._holder.AbsolutePosition[p52._config.Axis]
        local v55 = p52._data._inputPos[p52._config.Axis]
        if v55 then
            local v56 = v55 - v54
            local v57 = u8.snapToScale(v56 / v53, p52._data._scaleIncrement)
            local v58 = math.clamp(v57, 0, 1)
            p52._data._percent = v58
            p52.Dragged:Fire(p52._data._value)
            p52:Move()
        end
    end
end
function u1.Untrack(p59) --[[ Line: 215 ]]
    for _, v60 in ipairs(p59._data._clickConnections) do
        v60:Disconnect()
    end
    if p59._data._mainConnection then
        p59._data._mainConnection:Disconnect()
    end
    p59.IsHeld = false
end
function u1.Reset(p61) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    for _, v62 in ipairs(p61._data._clickConnections) do
        v62:Disconnect()
    end
    if p61._data._mainConnection then
        p61._data._mainConnection:Disconnect()
    end
    p61.IsHeld = false
    p61._data._percent = 0
    if p61._config.SliderData.DefaultValue then
        p61._data._percent = u8.getAlphaBetween(p61._config.SliderData.Start, p61._config.SliderData.End, p61._config.SliderData.DefaultValue)
    end
    local v63 = p61._data
    local v64 = p61._data._percent
    v63._percent = math.clamp(v64, 0, 1)
    p61:Move()
end
function u1.OverrideValue(p65, p66) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    p65.IsHeld = false
    p65._data._percent = u8.getAlphaBetween(p65._config.SliderData.Start, p65._config.SliderData.End, p66)
    local v67 = p65._data
    local v68 = p65._data._percent
    v67._percent = math.clamp(v68, 0, 1)
    p65._data._percent = u8.snapToScale(p65._data._percent, p65._data._scaleIncrement)
    p65:Move()
end
function u1.Move(p69, p70) --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    p69._data._value = u8.getNewValue(p69)
    if p70 == nil then
        p70 = p69._config.MoveType
    end
    if p70 == "Tween" or p70 == nil then
        if p69._data._currentTween then
            p69._data._currentTween:Cancel()
        end
        p69._data._currentTween = u4:Create(p69._data.Button, p69._config.MoveInfo, {
            ["Position"] = u8.getNewPosition(p69)
        })
        p69._data._currentTween:Play()
    elseif p70 == "Instant" then
        p69._data.Button.Position = u8.getNewPosition(p69)
    end
    p69.Changed:Fire(p69._data._value)
end
function u1.OverrideIncrement(p71, p72) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    p71._config.SliderData.Increment = p72
    p71._data._increment = p72
    p71._data._scaleIncrement = u8.getScaleIncrement(p71)
    local v73 = p71._data
    local v74 = p71._data._percent
    v73._percent = math.clamp(v74, 0, 1)
    p71._data._percent = u8.snapToScale(p71._data._percent, p71._data._scaleIncrement)
    p71:Move()
end
function u1.GetValue(p75) --[[ Line: 278 ]]
    return p75._data._value
end
function u1.GetIncrement(p76) --[[ Line: 282 ]]
    return p76._data._increment
end
function u1.Destroy(p77) --[[ Line: 286 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    for _, v78 in ipairs(p77._data._clickConnections) do
        v78:Disconnect()
    end
    for _, v79 in ipairs(p77._data._otherConnections) do
        v79:Disconnect()
    end
    if p77._data._mainConnection then
        p77._data._mainConnection:Disconnect()
    end
    if p77._data.HolderButton then
        p77._data.HolderButton:Destroy()
        p77._data.HolderButton = nil
    end
    p77.Changed:Destroy()
    p77.Dragged:Destroy()
    p77.Released:Destroy()
    for v80 = 1, #u1.Sliders do
        if u1.Sliders[v80] == p77 then
            table.remove(u1.Sliders, v80)
        end
    end
    setmetatable(p77, nil)
end
u3.InputEnded:Connect(function(p81, _) --[[ Line: 317 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p81.UserInputType == Enum.UserInputType.MouseButton1 or p81.UserInputType == Enum.UserInputType.Touch then
        for _, v82 in ipairs(u1.Sliders) do
            if v82.IsHeld then
                v82.Released:Fire(v82._data._value)
            end
            v82.IsHeld = false
        end
    end
end)
return u1