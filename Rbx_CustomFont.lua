-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Rbx_CustomFont
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = script
local u2 = game:GetService("ContentProvider")
local u3 = next
local u4 = type
local u5 = pcall
local u6 = unpack
local u7 = tostring
local _ = tonumber
local u8 = math.abs
local _ = math.min
local u9 = math.max
local u10 = string.sub
local u11 = string.rep
local u12 = string.byte
local u13 = string.gsub
local u14 = string.find
local _ = string.char
local u15 = string.match
local u16 = string.upper
local u17 = string.gmatch
local u18 = table.sort
local u19 = table.insert
local u20 = UDim2.new
local u21 = Color3.new
local u22 = Vector2.new
local u23 = Instance.new
local u24 = u23("ImageLabel")
u24.Size = u20(0, 0, 0, 0)
u24.BackgroundTransparency = 1
u24.ScaleType = Enum.ScaleType.Stretch
u24.ResampleMode = Enum.ResamplerMode.Pixelated
local u25 = {
    ["Right"] = true,
    ["Bottom"] = true
}
local u26 = {
    ["Left"] = true,
    ["Top"] = true
}
local u27 = {
    ["AbsoluteSize"] = true,
    ["TextWrapped"] = true,
    ["TextScaled"] = true,
    ["TextXAlignment"] = true,
    ["TextYAlignment"] = true
}
local u28 = {
    ["TextTransparency"] = true,
    ["TextStrokeTransparency"] = true,
    ["BackgroundTransparency"] = true
}
local u29 = {
    ["AbsolutePosition"] = true,
    ["AbsoluteSize"] = true,
    ["Position"] = true,
    ["Size"] = true,
    ["Rotation"] = true,
    ["Parent"] = true
}
local u30 = {
    ["FontName"] = true,
    ["Style"] = true
}
local function u38(u31, u32) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v33 = newproxy(true)
    local v34 = getmetatable(v33)
    function v34.__index(_, p35) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u31
        --]]
        return u32[p35] or u31[p35]
    end
    function v34.__newindex(_, p36, p37) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u31
        --]]
        if u32[p36] then
            u32[p36] = p37
        else
            u31[p36] = p37
        end
    end
    function v34.__call() --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        return u31
    end
    function v34.__tostring(_) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u7
        --]]
        return u7(u31)
    end
    v34.__metatable = "The metatable is locked."
    return v33
end
local function u43(u39, p40) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u20
        [3] = u21
    --]]
    local u41 = u23("Frame", u39)
    u41.Name = "_background"
    u41.Size = u20(1, 0, 1, 0)
    u41.BackgroundTransparency = u39.BackgroundTransparency
    u41.BackgroundColor3 = u39.BackgroundColor3
    u41.BorderSizePixel = u39.BorderSizePixel
    u41.BorderColor3 = u39.BorderColor3
    u41.ZIndex = u39.ZIndex
    if p40 == "TextButton" then
        u41.MouseEnter:connect(function() --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u41
                [3] = u21
            --]]
            if u39.AutoButtonColor then
                local v42 = u39.BackgroundColor3
                u41.BackgroundColor3 = u21(v42.r - 0.29411764705882354, v42.g - 0.29411764705882354, v42.b - 0.29411764705882354)
            end
        end)
        u39.MouseLeave:connect(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u41
            --]]
            if u39.AutoButtonColor then
                u41.BackgroundColor3 = u39.BackgroundColor3
            end
        end)
    end
    return u41
end
local function u49(p44, p45) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
        [3] = u19
    --]]
    local v46 = 0
    local v47 = {}
    while true do
        local v48 = u14(p44, p45, v46, true)
        if not v48 then
            break
        end
        u19(v47, (u10(p44, v46, v48 - 1)))
        v46 = v48 + 1
    end
    u19(v47, (u10(p44, v46)))
    return v47
end
local function u57(p50, p51) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u49
        [4] = u17
        [5] = u19
    --]]
    local v52 = u49(u13(p50, "\t", u11(" ", 4)), "\n")
    local v53 = #v52
    local v54 = {}
    for v55 = 1, v53 do
        for v56 in u17(v52[v55], " *[^%s]+ *") do
            u19(v54, v56)
        end
        if p51 and v55 < v53 then
            u19(v54, "\n")
        end
    end
    return v54
end
local function u65(p58, p59) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    local v60 = 0
    for v61 = 1, #p58 do
        local v62
        if v61 + 1 <= #p58 then
            v62 = v61 + 1
        else
            v62 = false
        end
        local v63 = u12((u10(p58, v61, v61)))
        if v62 then
            v62 = u12((u10(p58, v62, v62)))
        end
        local _ = p59.characters[v63]
        local v64 = not (v62 and (p59.kerning[v63] and p59.kerning[v63][v62])) and 0 or p59.kerning[v63][v62].x
        v60 = v60 + p59.characters[v63].xadvance + v64
    end
    return v60
end
local function u72(p66, p67) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    local v68 = 0
    for v69 = 1, #p66 do
        local v70 = u12((u10(p66, v69, v69)))
        local _ = p67.characters[v70]
        local v71 = p67.characters[v70].height + p67.characters[v70].yoffset
        if v68 < v71 then
            v68 = v71
        end
    end
    return v68
end
local function u84(p73, p74, p75) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u57
        [2] = u8
        [3] = u65
    --]]
    local v76 = u57(p73, true)
    local v77 = u8(p75.child.AbsoluteSize.x)
    local v78 = 0
    local v79 = 1
    local v80 = { "" }
    for v81 = 1, #v76 do
        local v82 = v76[v81]
        if v82 == "\n" then
            v79 = v79 + 1
            v80[v79] = ""
            v78 = 0
        else
            local v83 = u65(v82, p75.styles[p75.style][p74])
            if v83 + v78 <= v77 then
                v80[v79] = v80[v79] .. v82
            else
                v79 = v79 + 1
                v80[v79] = v82
                v78 = 0
            end
            v78 = v78 + v83
        end
    end
    return v80
end
function scaleText(p85, p86)
    --[[
    Upvalues:
        [1] = u18
        [2] = u84
        [3] = u13
        [4] = u11
        [5] = u49
        [6] = u72
        [7] = u65
        [8] = u19
        [9] = u6
        [10] = u9
        [11] = u8
    --]]
    local v87 = p86.child
    local _ = p86.attached
    u18(p86.information.sizes, function(p88, p89) --[[ Line: 258 ]]
        return p89 < p88
    end)
    local v90 = p86.information.sizes[1]
    local v91 = false
    for v92 = 1, #p86.information.sizes do
        local v93 = p86.information.sizes[v92]
        local v94 = p86.styles[p86.style][v93]
        local v95 = v87.TextWrapped and u84(p85, v93, p86) or u49(u13(p85, "\t", u11(" ", 4)), "\n")
        local v96 = -v94.firstAdjust
        local v97 = {}
        for v98 = 1, #v95 do
            local v99 = v95[v98]
            v96 = v96 + u72(v99, v94)
            u19(v97, (u65(v99, v94)))
        end
        if u9(u6(v97)) <= u8(v87.AbsoluteSize.x) and v96 <= u8(v87.AbsoluteSize.y) then
            v90 = v93
            v91 = true
            break
        end
    end
    return v91 and v90 and v90 or p86.information.sizes[#p86.information.sizes]
end
local function u111(p100, p101, p102) --[[ Line: 288 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u20
    --]]
    local v103 = u24:Clone()
    local v104 = p102.child
    local v105 = p102.attached
    local v106 = p102.styles[p102.style][p102.size]
    local v107 = v106.characters[p100]
    v103.Name = p100
    v103.ImageColor3 = v104.TextColor3
    v103.ImageTransparency = v105.TextTransparency
    v103.ZIndex = v104.ZIndex
    v103.Image = p102.atlases[v107.atlas + 1]
    v103.ImageRectSize = u22(v107.width, v107.height)
    v103.ImageRectOffset = u22(v107.x, v107.y)
    local v108, v109
    if p101 and (v106.kerning[p100] and v106.kerning[p100][p101]) then
        local v110 = v106.kerning[p100][p101]
        v108 = v110.x
        v109 = v110.y
    else
        v108 = 0
        v109 = 0
    end
    v103.Position = u20(0, v108, 0, v107.yoffset + v109)
    v103.Size = u20(0, v107.width, 0, v107.height)
    return v103, v108, v109 + v107.yoffset + v107.height
end
local function u134(p112, p113, p114, p115) --[[ Line: 322 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u111
        [4] = u20
        [5] = u19
        [6] = u25
        [7] = u26
        [8] = u8
    --]]
    local v116 = p115.child
    local _ = p115.attached
    local v117 = #p112
    local v118 = p115.styles[p115.style][p115.size]
    local v119 = 0
    local v120 = {}
    local v121 = 0
    for v122 = 1, v117 do
        local v123
        if v122 + 1 <= v117 then
            v123 = v122 + 1
        else
            v123 = false
        end
        local v124 = u12((u10(p112, v122, v122)))
        local v125
        if v123 then
            v125 = u12((u10(p112, v123, v123)))
        else
            v125 = v123
        end
        local v126, v127, v128 = u111(v124, v125, p115)
        if v119 < v128 then
            v119 = v128 or v119
        end
        v126.Position = v126.Position + u20(0, v121, 0, p113)
        v121 = v121 + (v123 and v118.characters[v124].xadvance or v118.characters[v124].width) + v127
        u19(v120, v126)
        u19(p114, v126)
    end
    local v129 = v116.TextXAlignment
    local v130 = u25[v129.Name] and 1 or (u26[v129.Name] and 0 or 0.5)
    local v131 = (u8(v116.AbsoluteSize.x) - v121) * v130
    for v132 = 1, v117 do
        local v133 = v120[v132]
        v133.Position = v133.Position + u20(0, v131, 0, 0)
    end
    return v121, v119
end
local function u151(p135, p136, p137) --[[ Line: 355 ]]
    --[[
    Upvalues:
        [1] = u84
        [2] = u13
        [3] = u11
        [4] = u49
        [5] = u134
        [6] = u19
        [7] = u25
        [8] = u26
        [9] = u8
        [10] = u20
    --]]
    local v138 = p136.child
    if v138.TextScaled then
        p136.size = scaleText(p135, p136)
    end
    local v139 = v138.TextWrapped and u84(p135, p136.size, p136) or u49(u13(p135, "\t", u11(" ", 4)), "\n")
    local _ = p136.styles[p136.style][p136.size].lineHeight
    local v140 = -p136.styles[p136.style][p136.size].firstAdjust
    local v141 = {}
    local v142 = { 0 }
    for v143 = 1, #v139 do
        local v144, v145 = u134(v139[v143], v140, v141, p136)
        v140 = v140 + v145
        u19(v142, v144)
    end
    local v146 = v138.TextYAlignment
    local v147 = u25[v146.Name] and 1 or (u26[v146.Name] and 0 or 0.5)
    local v148 = (u8(v138.AbsoluteSize.y) - v140) * v147
    for v149 = 1, #v141 do
        local v150 = v141[v149]
        v150.Position = v150.Position + u20(0, 0, 0, v148)
        v150.Parent = p137
    end
    return v141
end
local u160 = {
    ["new"] = function(u152) --[[ Name: new, Line 391 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local u153 = {}
        local v156 = {
            ["__index"] = u152,
            ["__newindex"] = function(_, p154, p155) --[[ Name: __newindex, Line 395 ]]
                --[[
                Upvalues:
                    [1] = u152
                    [2] = u153
                    [3] = u4
                --]]
                if u152[p154] ~= p155 then
                    u152[p154] = p155
                    if u4(u153[p154]) == "function" then
                        u153[p154](p155)
                    end
                end
            end,
            ["__metatable"] = "The metatable is locked."
        }
        local v157 = setmetatable({}, v156)
        function v157.connect(_, p158, p159) --[[ Line: 406 ]]
            --[[
            Upvalues:
                [1] = u153
            --]]
            u153[p158] = p159
        end
        return v157
    end
}
local u194 = {
    ["new"] = function(p161, u162, u163) --[[ Name: new, Line 415 ]]
        --[[
        Upvalues:
            [1] = u194
            [2] = u18
            [3] = u3
            [4] = u7
            [5] = u8
        --]]
        local v164 = {
            ["__index"] = u194
        }
        local u165 = setmetatable({}, v164)
        u194.child = u163
        u194.attached = u162
        u165.information = p161.font.information
        u165.atlases = p161.atlases
        u165.styles = p161.font.styles
        u18(u165.information.sizes, function(p166, p167) --[[ Line: 427 ]]
            return p167 < p166
        end)
        u165.style = u165.information.styles[1]
        u165.size = u163.TextSize
        for _, v168 in u3, u165.styles do
            for _, v169 in u3, v168 do
                local v170 = v169.characters
                local v176 = {
                    ["__index"] = function(p171, p172) --[[ Name: __index, Line 438 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                        --]]
                        local v173 = u7(p172)
                        local v174 = rawget(p171, v173)
                        if v174 then
                            return v174
                        end
                        warn(v173, "is not a valid character. Replaced with, \"?\"")
                        local v175 = u7(63)
                        return rawget(p171, v175)
                    end
                }
                setmetatable(v170, v176)
            end
            local v186 = {
                ["__index"] = function(p177, p178) --[[ Name: __index, Line 451 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u165
                        [3] = u18
                        [4] = u8
                        [5] = u163
                    --]]
                    local u179 = u7(p178)
                    local v180 = rawget(p177, u179)
                    if v180 then
                        return v180
                    end
                    local v181 = u165.information.sizes
                    u18(v181, function(p182, p183) --[[ Line: 107 ]]
                        --[[
                        Upvalues:
                            [1] = u179
                            [2] = u8
                        --]]
                        return u8(u179 - p182) < u8(u179 - p183)
                    end)
                    local v184 = v181[1]
                    u165.size = v184
                    u163.TextSize = v184
                    warn(u179, "is not a valid size. Using the closest size,", v184)
                    local v185 = u7(v184)
                    return rawget(p177, v185)
                end
            }
            setmetatable(v168, v186)
        end
        local v187 = u165.styles
        setmetatable(v187, {
            ["__index"] = function(p188, p189) --[[ Name: __index, Line 467 ]]
                --[[
                Upvalues:
                    [1] = u165
                    [2] = u162
                --]]
                local v190 = rawget(p188, p189)
                if v190 then
                    return v190
                end
                local v191 = u165.information.styles[1]
                u165.style = v191
                u162.Style = v191
                warn(p189, "is not a valid style. Using first style found", v191)
                return rawget(p188, v191)
            end
        })
        return u165
    end,
    ["preload"] = function(p192) --[[ Name: preload, Line 483 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        for _, v193 in u3, p192.atlases do
            u2:Preload(v193)
        end
    end
}
local u234 = {
    ["new"] = function(p195, u196, p197) --[[ Name: new, Line 493 ]]
        --[[
        Upvalues:
            [1] = u160
            [2] = u4
            [3] = u23
            [4] = u1
            [5] = u194
            [6] = u3
            [7] = u30
            [8] = u16
            [9] = u10
            [10] = u43
            [11] = u151
            [12] = u28
            [13] = u27
            [14] = u15
            [15] = u29
            [16] = u5
            [17] = u19
            [18] = u38
        --]]
        local u198 = u160.new({})
        if u4(u196) == "string" or not u196 then
            u196 = u23(u196)
        end
        local v199 = u1:FindFirstChild(p195)
        local u200 = u194.new(require(v199), u198, u196)
        u200:preload()
        u198.FontName = p195
        u198.Style = u200.style
        u198.TextTransparency = u196.TextTransparency
        u198.TextStrokeTransparency = u196.TextStrokeTransparency
        u198.BackgroundTransparency = u196.BackgroundTransparency
        u198.TextFits = false
        local u201 = {}
        local u202 = {}
        local u203 = {}
        local u204 = {}
        for u205, _ in u3, u30 do
            local v206 = u198[u205]
            local v207 = u4(v206)
            local v208 = u16((u10(v207, 1, 1))) .. u10(v207, 2) .. "Value"
            local v209 = Instance.new(v208, u196)
            v209.Name = u205
            v209.Value = v206
            v209.Changed:connect(function(p210) --[[ Line: 526 ]]
                --[[
                Upvalues:
                    [1] = u198
                    [2] = u205
                --]]
                u198[u205] = p210
            end)
            u201[v209.Name] = v209
            u202[v209] = true
        end
        local u211 = u43(u196, p197 and "TextButton")
        u196.TextTransparency = 1
        u196.BackgroundTransparency = 1
        u196.TextStrokeTransparency = 1
        u198:connect("FontName", function(_) --[[ Line: 546 ]]
            --[[
            Upvalues:
                [1] = u211
                [2] = u204
                [3] = u151
                [4] = u196
                [5] = u200
            --]]
            u211:ClearAllChildren()
            u204 = u151(u196.Text, u200, u211)
        end)
        u198:connect("TextStrokeTransparency", function(_) --[[ Line: 547 ]]
            --[[
            Upvalues:
                [1] = u211
                [2] = u204
                [3] = u151
                [4] = u196
                [5] = u200
            --]]
            u211:ClearAllChildren()
            u204 = u151(u196.Text, u200, u211)
        end)
        u198:connect("BackgroundTransparency", function(p212) --[[ Line: 549 ]]
            --[[
            Upvalues:
                [1] = u211
            --]]
            u211.BackgroundTransparency = p212
        end)
        u198:connect("Style", function(p213) --[[ Line: 553 ]]
            --[[
            Upvalues:
                [1] = u200
                [2] = u201
                [3] = u211
                [4] = u204
                [5] = u151
                [6] = u196
            --]]
            u200.style = p213
            u201.Style.Value = p213
            u211:ClearAllChildren()
            u204 = u151(u196.Text, u200, u211)
        end)
        u198:connect("TextTransparency", function(p214) --[[ Line: 559 ]]
            --[[
            Upvalues:
                [1] = u204
            --]]
            for v215 = 1, #u204 do
                u204[v215].ImageTransparency = p214
            end
        end)
        u198:connect("FontName", function(p216) --[[ Line: 565 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u200
                [3] = u198
                [4] = u196
                [5] = u201
                [6] = u211
                [7] = u204
                [8] = u151
            --]]
            local v217 = u1:FindFirstChild(p216)
            u200 = u200.new(require(v217), u198, u196)
            u200:preload()
            u201.FontName.Value = p216
            if not u196.TextScaled then
                u200.size = u196.TextSize
            end
            u200.style = u198.Style
            u211:ClearAllChildren()
            u204 = u151(u196.Text, u200, u211)
        end)
        u19(u203, u196.Changed:connect(function(u218) --[[ Line: 579 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u196
                [3] = u198
                [4] = u200
                [5] = u211
                [6] = u204
                [7] = u151
                [8] = u3
                [9] = u27
                [10] = u15
                [11] = u29
                [12] = u5
            --]]
            if u28[u218] then
                if u196[u218] ~= 1 then
                    u198[u218] = u196[u218]
                end
                u196[u218] = 1
                return
            elseif u218 == "TextSize" then
                u200.size = u196[u218]
                u211:ClearAllChildren()
                u204 = u151(u196.Text, u200, u211)
                return
            elseif u218 == "TextColor3" then
                for _, v219 in u3, u204 do
                    v219.ImageColor3 = u196[u218]
                end
                return
            elseif u218 == "ZIndex" then
                u211.ZIndex = u196[u218]
                for _, v220 in u3, u204 do
                    v220.ZIndex = u196[u218]
                end
                return
            elseif u218 == "Text" then
                u211:ClearAllChildren()
                u204 = u151(u196.Text, u200, u211)
                return
            elseif u27[u218] then
                if u218 == "TextScaled" and not u196[u218] then
                    u200.size = u196.TextSize
                end
                u211:ClearAllChildren()
                u204 = u151(u196.Text, u200, u211)
            elseif not (u15(u218, "Text") or u29[u218]) then
                u5(function() --[[ Line: 605 ]]
                    --[[
                    Upvalues:
                        [1] = u211
                        [2] = u218
                        [3] = u196
                    --]]
                    u211[u218] = u196[u218]
                end)
            end
        end))
        if u196:IsA("TextBox") then
            u19(u203, u196.Focused:connect(function() --[[ Line: 610 ]]
                --[[
                Upvalues:
                    [1] = u196
                --]]
                if u196.ClearTextOnFocus then
                    u196.Text = ""
                end
            end))
        end
        function u198.Revert(p221) --[[ Line: 619 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u201
                [3] = u203
                [4] = u211
                [5] = u196
                [6] = u202
            --]]
            for _, v222 in u3, u201 do
                v222:Destroy()
            end
            for _, v223 in u3, u203 do
                v223:disconnect()
            end
            u211:Destroy()
            u196.TextTransparency = p221.TextTransparency
            u196.BackgroundTransparency = p221.BackgroundTransparency
            u202 = nil
            u201 = nil
            u203 = nil
            return u196
        end
        function u198.GetChildren(_) --[[ Line: 629 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u196
                [3] = u211
                [4] = u202
                [5] = u19
            --]]
            local v224 = u3
            local v225, v226 = u196:GetChildren()
            local v227 = {}
            for _, v228 in v224, v225, v226 do
                if v228 ~= u211 and not u202[v228] then
                    u19(v227, v228)
                end
            end
            return v227
        end
        function u198.ClearAllChildren(_) --[[ Line: 639 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u196
                [3] = u211
                [4] = u202
            --]]
            local v229 = u3
            local v230, v231 = u196:GetChildren()
            for _, v232 in v229, v230, v231 do
                if v232 ~= u211 and not u202[v232] then
                    v232:Destroy()
                end
            end
        end
        function u198.Destroy(p233) --[[ Line: 647 ]]
            p233:Revert():Destroy()
        end
        u211:ClearAllChildren()
        local _ = u151(u196.Text, u200, u211)
        return u38(u196, u198)
    end
}
local v235 = {}
for _, u236 in u3, {
    "TextLabel",
    "TextBox",
    "TextButton",
    "TextReplace"
} do
    v235[string.sub(u236, 5)] = function(p237, p238) --[[ Line: 662 ]]
        --[[
        Upvalues:
            [1] = u234
            [2] = u236
        --]]
        local v239 = u234.new
        local v240 = u236 == "TextReplace" and p238 and p238 or u236
        local v241
        if u236 == "TextButton" then
            v241 = true
        elseif u236 == "TextReplace" then
            v241 = p238:IsA("TextButton")
        else
            v241 = false
        end
        return v239(p237, v240, v241)
    end
end
wait()
return v235