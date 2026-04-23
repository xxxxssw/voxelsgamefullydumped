-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.SkinSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Players")
local u3 = game:GetService("ServerScriptService")
local u4 = game:GetService("HttpService")
local u5 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.PlayerSessionSystem)
local u6 = require(script.UtilsSkinPack)
local u7 = u2.LocalPlayer
local u8 = v1.Assets.Sprites
local v9 = v1.Assets.Characters.Player
local u10 = v1.Systems.PlayersSystem.Network.UpdateSkin
local u11 = v1.Systems.PlayersSystem.Network.DownloadSkin
local u12 = {
    ["LOCAL_SKIN_NAME_ATTRIBUTE"] = "SkinFileName_local",
    ["SKIN_NAME_ATTRIBUTE"] = "SkinFileName",
    ["USE_DOWNLOADED_SKIN_TOKEN"] = "_downloaded_",
    ["DEFAULT_SKIN"] = script.DefaultSkin.Value
}
local v13 = u6.skinNameExists
local v14 = u12.DEFAULT_SKIN
assert(v13(v14))
local u15 = Instance.new("BindableEvent")
if game:GetService("RunService"):IsClient() and game:GetService("RunService"):IsStudio() then
    local _ = game.Players.LocalPlayer.Name == "ctc"
end
if u7 then
    u7:GetAttributeChangedSignal(u12.SKIN_NAME_ATTRIBUTE):Connect(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:Fire()
    end)
    u7:GetAttributeChangedSignal(u12.LOCAL_SKIN_NAME_ATTRIBUTE):Connect(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:Fire()
    end)
end
function u12.server_onPlayerAdded(p16) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u12
    --]]
    local v17 = u5.readSessionData(p16.UserId)
    if not u6.getSkinPackIdFromSkinName(v17.skinName) then
        v17.skinName = u12.DEFAULT_SKIN
    end
    local v18 = v17.skinName
    if not u6.skinNameExists(v18) then
        v18 = u12.DEFAULT_SKIN
    end
    p16:SetAttribute(u12.SKIN_NAME_ATTRIBUTE, v18)
    p16:SetAttribute(u12.LOCAL_SKIN_NAME_ATTRIBUTE, v18)
end
function u12.server_init() --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u8
        [4] = u12
        [5] = u10
        [6] = u4
        [7] = u11
    --]]
    local u19 = require(u3.Secret.SkinConverterURL)
    local u20 = {}
    function u10.OnServerInvoke(p21, p22) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u12
        --]]
        local v23 = u5.readSessionData(p21.UserId)
        if v23 ~= nil and p22 ~= v23.skinName then
            local v24 = nil
            for _, v25 in ipairs(u8:GetDescendants()) do
                if v25.Name == p22 then
                    v24 = p22
                    break
                end
            end
            if p22 == u12.USE_DOWNLOADED_SKIN_TOKEN then
                v24 = u12.USE_DOWNLOADED_SKIN_TOKEN
            end
            if v24 then
                p21:SetAttribute(u12.SKIN_NAME_ATTRIBUTE, v24)
                v23.skinName = v24
                u5.setSessionData(p21.UserId, v23)
                return true
            end
        end
    end
    function u11.OnServerInvoke(u26, u27) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u20
            [3] = u4
            [4] = u19
            [5] = u12
        --]]
        if u5.readSessionData(u26.UserId) == nil or u20[u26] ~= nil then
            return false
        end
        local v31, v32 = pcall(function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u19
                [3] = u27
                [4] = u5
                [5] = u26
                [6] = u12
                [7] = u20
            --]]
            local v28 = u4:GetAsync(u19 .. u27)
            local v29 = u4:JSONDecode(v28)
            local v30 = v29 and (v29.success == true and u5.readSessionData(u26.UserId))
            if v30 then
                v30.downloadedSkinData = v28
                v30.skinName = u12.USE_DOWNLOADED_SKIN_TOKEN
                u5.setSessionData(u26.UserId, v30)
                u26:SetAttribute(u12.SKIN_NAME_ATTRIBUTE, u12.USE_DOWNLOADED_SKIN_TOKEN)
                u20[u26] = nil
            end
        end)
        if not v31 then
            warn("Error fetching skin: ", v32)
        end
        u20[u26] = nil
        return v31
    end
end
function u12.client_getLocalPlayerSkinName() --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
    --]]
    local v33 = u7:GetAttribute(u12.LOCAL_SKIN_NAME_ATTRIBUTE)
    while not v33 do
        task.wait()
        v33 = u7:GetAttribute(u12.LOCAL_SKIN_NAME_ATTRIBUTE)
    end
    return v33
end
function u12.client_getGlobalPlayerSkinName() --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
    --]]
    local v34 = u7:GetAttribute(u12.SKIN_NAME_ATTRIBUTE)
    while not v34 do
        task.wait()
        v34 = u7:GetAttribute(u12.SKIN_NAME_ATTRIBUTE)
    end
    return v34
end
function u12.client_getLocalPlayerSkinChangedSignal() --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return u15.Event
end
function u12.client_updateSkinName(p35) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10:InvokeServer(p35)
end
function u12.client_downloadSkinName(p36) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
    --]]
    local v37 = u11:InvokeServer(p36)
    u15:Fire()
    return v37
end
local function u46(p38, p39) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u4
        [4] = u8
        [5] = u6
    --]]
    local v40 = false
    if p39 == u12.USE_DOWNLOADED_SKIN_TOKEN then
        local v41 = u4:JSONDecode(u5.readSessionData(p38.UserId).downloadedSkinData)
        local v42 = v41.height == 32 and true or v40
        return string.split(v41.skinData, ";"), v42
    end
    local v43 = u8:FindFirstChild(p39, true)
    local v44 = tostring(p39) .. " is not a valid skin"
    local v45 = assert(v43, v44)
    return u6.getSkinData(v45), v40
end
local u47 = nil
local u48 = nil
for _, v49 in ipairs(v9.HeadPart:GetChildren()) do
    if v49:IsA("SurfaceGui") and v49.Face == Enum.NormalId.Front then
        u47 = v49
    end
end
for _, v50 in ipairs(v9.HeadLayer:GetChildren()) do
    if v50:IsA("SurfaceGui") and v50.Face == Enum.NormalId.Front then
        u48 = v50
    end
end
assert(u47 and u48)
local function u92(p51, p52) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u47
        [2] = u48
    --]]
    local v53 = u47:GetAttribute("SpriteStartCorner")
    local v54 = assert(v53, "Missing SpriteStartCorner attribute")
    local v55 = u47:GetAttribute("SpriteSize")
    local v56 = assert(v55, "Missing SpriteSize attribute")
    for v57 = 0, v56.X - 1 do
        for v58 = 0, v56.Y - 1 do
            local v59 = v54.X + v57
            local v60 = v54.Y + v58
            local v61 = v59 + 1
            local v62 = p52[v60 * 64 + v61]
            local v63 = tonumber(v62)
            local v64 = bit32.rshift(v63, 16)
            local v65 = bit32.band(v64, 255)
            local v66 = bit32.rshift(v63, 8)
            local v67 = bit32.band(v66, 255)
            local v68 = bit32.band(v63, 255)
            local v69
            if v63 == 0 then
                v69 = nil
            else
                v69 = Color3.fromRGB(v68, v67, v65)
            end
            local v70 = v69 or Color3.fromRGB(0, 0, 0)
            if v70 then
                local v71 = script.Pixel:Clone()
                v71.Size = UDim2.fromScale(0.125, 0.125)
                local v72 = v54.X + v57
                v71.Name = tostring(v72) .. ", " .. v54.Y + v58
                v71.BackgroundColor3 = v70
                v71.Position = UDim2.fromScale(v57 / 8, v58 / 8)
                v71.Parent = p51
                v71.ZIndex = 10
            end
        end
    end
    local v73 = u48:GetAttribute("SpriteStartCorner")
    local v74 = assert(v73, "Missing SpriteStartCorner attribute")
    local v75 = u48:GetAttribute("SpriteSize")
    local v76 = assert(v75, "Missing SpriteSize attribute")
    for v77 = 0, v76.X - 1 do
        for v78 = 0, v76.Y - 1 do
            local v79 = v74.X + v77
            local v80 = v74.Y + v78
            local v81 = v79 + 1
            local v82 = p52[v80 * 64 + v81]
            local v83 = tonumber(v82)
            local v84 = bit32.rshift(v83, 16)
            local v85 = bit32.band(v84, 255)
            local v86 = bit32.rshift(v83, 8)
            local v87 = bit32.band(v86, 255)
            local v88 = bit32.band(v83, 255)
            local v89
            if v83 == 0 then
                v89 = nil
            else
                v89 = Color3.fromRGB(v88, v87, v85)
            end
            if v89 then
                local v90 = script.Pixel:Clone()
                v90.Size = UDim2.fromScale(0.125, 0.125)
                local v91 = v74.X + v77
                v90.Name = tostring(v91) .. ", " .. v74.Y + v78
                v90.BackgroundColor3 = v89
                v90.Position = UDim2.fromScale(v77 / 8, v78 / 8)
                v90.Parent = p51
                v90.ZIndex = 20
            end
        end
    end
end
function u12.client_drawHead(p93, p94) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u92
    --]]
    local v95 = u8:FindFirstChild(p94, true)
    local v96 = tostring(p94) .. " is not a valid skin"
    local v97 = assert(v95, v96)
    u92(p93, (u6.getSkinData(v97)))
end
function u12.client_drawDownloadedSkinHead(p98) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u92
    --]]
    local v99 = u4:JSONDecode(u5.readSessionData(u7.UserId).downloadedSkinData)
    u92(p98, (string.split(v99.skinData, ";")))
end
local function u107(p100, p101) --[[ Line: 379 ]]
    for _, v102 in ipairs(p101:GetChildren()) do
        if v102.Name == "SkinLayer" then
            local v103 = nil
            for _, v104 in ipairs(p100:GetChildren()) do
                if v104.Name == "SkinLayer" and v104.Face == v102.Face then
                    v103 = v104
                end
            end
            for v105, v106 in pairs(v103:GetAttributes()) do
                v102:SetAttribute(v105, v106)
            end
            v102:SetAttribute("Mirrored", true)
        end
    end
end
function u12.client_drawCharacterSkinTest(p108, p109) --[[ Line: 397 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u107
    --]]
    local v110, v111 = u46(p108, p109)
    if v111 then
        u107(p108.RightArm, p108.LeftArm)
        u107(p108.LeftLeg, p108.RightLeg)
    end
    local v112 = {}
    for _, v113 in ipairs(p108:GetDescendants()) do
        if v113:IsA("SurfaceGui") and v113.Name == "SkinLayer" then
            v113.Pixels:ClearAllChildren()
            if v113:FindFirstChild("HurtLayer") == nil then
                script.HurtLayer:Clone().Parent = v113
            end
            table.insert(v112, v113)
        end
    end
    for _, v114 in ipairs(v112) do
        local v115 = v114:GetAttribute("SpriteStartCorner")
        local v116 = "Missing SpriteStartCorner attribute in " .. v114:GetFullName()
        local v117 = assert(v115, v116)
        local v118 = v114:GetAttribute("SpriteSize")
        local v119 = "Missing SpriteSize attribute in " .. v114:GetFullName()
        local v120 = assert(v118, v119)
        for v121 = 0, v120.X - 1 do
            for v122 = 0, v120.Y - 1 do
                local v123 = v117.X + v121
                local v124 = v117.Y + v122
                local v125 = v123 + 1
                local v126 = v110[v124 * 64 + v125]
                local v127 = tonumber(v126)
                local v128 = bit32.rshift(v127, 16)
                local v129 = bit32.band(v128, 255)
                local v130 = bit32.rshift(v127, 8)
                local v131 = bit32.band(v130, 255)
                local v132 = bit32.band(v127, 255)
                local v133
                if v127 == 0 then
                    v133 = nil
                else
                    v133 = Color3.fromRGB(v132, v131, v129)
                end
                if v133 == nil and v114.Parent.Name ~= "HeadLayer" then
                    v133 = Color3.fromRGB(0, 0, 0)
                end
                if v133 then
                    local v134 = script.Pixel:Clone()
                    local v135 = v117.X + v121
                    v134.Name = tostring(v135) .. ", " .. v117.Y + v122
                    v134.BackgroundColor3 = v133
                    if v114:GetAttribute("Mirrored") == true then
                        v134.Position = UDim2.fromOffset(v120.X + 1 - v121 * 2 + 1, v122 * 2)
                    else
                        v134.Position = UDim2.fromOffset(v121 * 2, v122 * 2)
                    end
                    v134.Parent = v114.Pixels
                end
            end
        end
    end
end
function u12.client_drawCharacterSkin(p136) --[[ Line: 531 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u46
        [4] = u107
    --]]
    local v137 = u2:GetPlayerFromCharacter(p136)
    local v138, v139 = u46(v137, (v137:GetAttribute(u12.SKIN_NAME_ATTRIBUTE)))
    if v139 then
        u107(p136.RightArm, p136.LeftArm)
        u107(p136.LeftLeg, p136.RightLeg)
    end
    local v140 = {}
    for _, v141 in ipairs(p136:GetDescendants()) do
        if v141:IsA("SurfaceGui") and v141.Name == "SkinLayer" then
            v141.Pixels:ClearAllChildren()
            if v141:FindFirstChild("HurtLayer") == nil then
                script.HurtLayer:Clone().Parent = v141
            end
            table.insert(v140, v141)
        end
    end
    for _, v142 in ipairs(v140) do
        local v143 = v142:GetAttribute("SpriteStartCorner")
        local v144 = "Missing SpriteStartCorner attribute in " .. v142:GetFullName()
        local v145 = assert(v143, v144)
        local v146 = v142:GetAttribute("SpriteSize")
        local v147 = "Missing SpriteSize attribute in " .. v142:GetFullName()
        local v148 = assert(v146, v147)
        for v149 = 0, v148.X - 1 do
            for v150 = 0, v148.Y - 1 do
                local v151 = v145.X + v149
                local v152 = v145.Y + v150
                local v153 = v151 + 1
                local v154 = v138[v152 * 64 + v153]
                local v155 = tonumber(v154)
                local v156 = bit32.rshift(v155, 16)
                local v157 = bit32.band(v156, 255)
                local v158 = bit32.rshift(v155, 8)
                local v159 = bit32.band(v158, 255)
                local v160 = bit32.band(v155, 255)
                local v161
                if v155 == 0 then
                    v161 = nil
                else
                    v161 = Color3.fromRGB(v160, v159, v157)
                end
                if v161 == nil and v142.Parent.Name ~= "HeadLayer" then
                    v161 = Color3.fromRGB(0, 0, 0)
                end
                if v161 then
                    local v162 = script.Pixel:Clone()
                    local v163 = v145.X + v149
                    v162.Name = tostring(v163) .. ", " .. v145.Y + v150
                    v162.BackgroundColor3 = v161
                    if v142:GetAttribute("Mirrored") == true then
                        v162.Position = UDim2.fromOffset(v148.X + 1 - v149 * 2 + 1, v150 * 2)
                    else
                        v162.Position = UDim2.fromOffset(v149 * 2, v150 * 2)
                    end
                    v162.Parent = v142.Pixels
                end
            end
        end
    end
end
function u12.client_drawViewportCharacterSkin(p164, _) --[[ Line: 668 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u46
        [4] = u107
    --]]
    local v165 = p164:FindFirstAncestorWhichIsA("ViewportFrame")
    assert(v165, "This should be used on viewport characters only!")
    local v166, v167 = u46(u7, (u7:GetAttribute(u12.LOCAL_SKIN_NAME_ATTRIBUTE)))
    if v167 then
        u107(p164.RightArm, p164.LeftArm)
        u107(p164.LeftLeg, p164.RightLeg)
    end
    local v168 = Instance.new("Folder")
    v168.Name = "Welds"
    v168.Parent = p164
    local v169 = {}
    for _, v170 in ipairs(p164:GetDescendants()) do
        if v170:IsA("SurfaceGui") and v170.Name == "SkinLayer" then
            for _, v171 in ipairs(v170:GetChildren()) do
                if v171.Name == "Pixel" then
                    v171:ClearAllChildren()
                    v171.Transparency = 1
                    v171.Massless = true
                    v170.Parent.Transparency = 1
                    if v170:GetAttribute("Mirrored") == true then
                        v171.CFrame = v171.CFrame - v171.CFrame.RightVector * v171.Size.X * (v170:GetAttribute("SpriteSize").X - 1)
                    end
                else
                    v171:Destroy()
                end
            end
            table.insert(v169, v170)
        end
    end
    for _, v172 in ipairs(v169) do
        local v173 = v172:GetAttribute("SpriteStartCorner")
        local v174 = "Missing SpriteStartCorner attribute in " .. v172:GetFullName()
        local v175 = assert(v173, v174)
        local v176 = v172:GetAttribute("SpriteSize")
        local v177 = "Missing SpriteSize attribute in " .. v172:GetFullName()
        local v178 = assert(v176, v177)
        for v179 = 0, v178.X - 1 do
            for v180 = 0, v178.Y - 1 do
                local v181 = v175.X + v179
                local v182 = v175.Y + v180
                local v183 = v181 + 1
                local v184 = v166[v182 * 64 + v183]
                local v185 = tonumber(v184)
                local v186 = bit32.rshift(v185, 16)
                local v187 = bit32.band(v186, 255)
                local v188 = bit32.rshift(v185, 8)
                local v189 = bit32.band(v188, 255)
                local v190 = bit32.band(v185, 255)
                local v191
                if v185 == 0 then
                    v191 = nil
                else
                    v191 = Color3.fromRGB(v190, v189, v187)
                end
                if v191 == nil and v172.Parent.Name ~= "HeadLayer" then
                    v191 = Color3.fromRGB(0, 0, 0)
                end
                if v191 then
                    local v192 = v172:FindFirstAncestor("HeadLayer") and 0.232 or 0.225
                    local v193 = v172.Pixel:Clone()
                    local v194 = v175.X + v179
                    v193.Name = tostring(v194) .. ", " .. v175.Y + v180
                    v193.Color = v191
                    v193.Transparency = 0
                    if v172:GetAttribute("Mirrored") == true then
                        v193.Position = v172.Pixel.Position - v172.Pixel.CFrame.UpVector * v180 * v192 + v172.Pixel.CFrame.RightVector * v179 * v192
                    else
                        v193.Position = v172.Pixel.Position - v172.Pixel.CFrame.UpVector * v180 * v192 - v172.Pixel.CFrame.RightVector * v179 * v192
                    end
                    local v195 = Instance.new("Weld")
                    v195.Part0 = v193.Parent
                    v195.Part1 = v193
                    v195.Parent = v168
                    v193.Anchored = false
                    v193.Parent = v172
                end
            end
        end
    end
end
return u12