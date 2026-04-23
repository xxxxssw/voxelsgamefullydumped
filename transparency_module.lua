-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.transparency_module
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("TweenService")
local u2 = TweenInfo.new(1, Enum.EasingStyle.Cubic)
local u3 = {
    ["ImageButton"] = true,
    ["ImageLabel"] = true
}
local u4 = {
    ["TextLabel"] = true,
    ["TextButton"] = true,
    ["TextBox"] = true
}
local u5 = {
    ["ScrollingFrame"] = true
}
local function u18(p6, p7, p8) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u3
        [4] = u4
        [5] = u5
    --]]
    local v9 = {}
    if p7:IsA("UIStroke") then
        v9.Transparency = p7.Transparency
        local v10 = p6.UiElements
        table.insert(v10, p7)
        p6.AppearTweens[p7] = u1:Create(p7, p8 or u2, v9)
        p6.DisappearTweens[p7] = u1:Create(p7, p8 or u2, {
            ["Transparency"] = 1
        })
        return
    elseif p7:IsA("GuiObject") then
        v9.BackgroundTransparency = p7.BackgroundTransparency
        if u3[p7.ClassName] then
            v9.ImageTransparency = p7.ImageTransparency
        end
        if u4[p7.ClassName] then
            v9.TextTransparency = p7.TextTransparency
            v9.TextStrokeTransparency = p7.TextStrokeTransparency
        end
        if u5[p7.ClassName] then
            v9.ScrollBarImageTransparency = p7.ScrollBarImageTransparency
        end
        local v11 = p6.UiElements
        table.insert(v11, p7)
        p6.AppearTweens[p7] = u1:Create(p7, p8 or u2, v9)
        local v12 = p6.DisappearTweens
        local v13 = u1
        local v14 = p8 or u2
        local v15 = p7
        local v16 = {}
        for v17 in pairs(v9) do
            v16[v17] = 1
        end
        v12[v15] = v13:Create(p7, v14, v16)
    end
end
local u19 = {}
u19.__index = u19
u19.TweenIn = u19.FadeIn
u19.TweenOut = u19.FadeOut
function u19.CreateGroup(p20, p21) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
    --]]
    local v22 = {
        ["Faded"] = false,
        ["UiElements"] = {},
        ["AppearTweens"] = {},
        ["DisappearTweens"] = {}
    }
    for _, v23 in ipairs(p20) do
        u18(v22, v23, p21 or TweenInfo.new(0.01))
    end
    local v24 = u19
    return setmetatable(v22, v24)
end
function u19.FadeIn(p25) --[[ Line: 111 ]]
    p25.Faded = true
    for _, v26 in pairs(p25.AppearTweens) do
        v26:Play()
    end
end
function u19.FadeOut(p27) --[[ Line: 119 ]]
    p27.Faded = false
    for _, v28 in pairs(p27.DisappearTweens) do
        v28:Play()
    end
end
function u19.Fade(p29) --[[ Line: 126 ]]
    if p29.Faded then
        p29:FadeOut()
    else
        p29:FadeIn()
    end
end
function u19.GetElements(p30) --[[ Line: 136 ]]
    return p30.UiElements
end
return u19