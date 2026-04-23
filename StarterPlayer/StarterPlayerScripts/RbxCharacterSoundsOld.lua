-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.RbxCharacterSoundsOld
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = game:GetService("Players")
local u2 = game:GetService("RunService")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local v4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
local v5 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks)
local u6 = {}
for v7, v8 in pairs(v4) do
    if v8.material == "plant" then
        u6[v7] = "RunningVegetal"
    end
    if v8.material == "wood" then
        u6[v7] = "RunningWood"
    end
end
u6[v5.getBlockIdFromName("grass_block")] = "RunningVegetal"
u6[v5.getBlockIdFromName("dirt")] = "RunningSandAndDirt"
u6[v5.getBlockIdFromName("sand")] = "RunningSandAndDirt"
u6[v5.getBlockIdFromName("red_sand")] = "RunningSandAndDirt"
u6[v5.getBlockIdFromName("snow")] = "RunningSnow"
local v9 = require(script:WaitForChild("AtomicBinding"))
local u10 = "UserSoundsUseRelativeVelocity2"
local v11, v12 = pcall(function() --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return UserSettings():IsUserFeatureEnabled(u10)
end)
local u13 = v11 and v12
local u14 = {
    ["RunningDefault"] = true,
    ["RunningSnow"] = true,
    ["RunningVegetal"] = true,
    ["RunningSandAndDirt"] = true,
    ["RunningWood"] = true
}
local u15 = {
    ["Climbing"] = {
        ["SoundId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looped"] = true
    },
    ["Died"] = {
        ["SoundId"] = "rbxasset://sounds/uuhhh.mp3"
    },
    ["FreeFalling"] = {
        ["SoundId"] = "rbxasset://sounds/action_falling.mp3",
        ["Looped"] = true
    },
    ["GettingUp"] = {
        ["SoundId"] = "rbxasset://sounds/action_get_up.mp3"
    },
    ["Jumping"] = {
        ["SoundId"] = "rbxasset://sounds/action_jump.mp3"
    },
    ["Landing"] = {
        ["SoundId"] = "rbxasset://sounds/action_jump_land.mp3"
    },
    ["RunningDefault"] = {
        ["SoundId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looped"] = true,
        ["Pitch"] = 1.85
    },
    ["RunningSnow"] = {
        ["SoundId"] = "rbxassetid://17490154469",
        ["Looped"] = true,
        ["Pitch"] = 1,
        ["VolumeMultiplier"] = 0.1
    },
    ["RunningSandAndDirt"] = {
        ["SoundId"] = "rbxassetid://17490200200",
        ["Looped"] = true,
        ["Pitch"] = 1,
        ["VolumeMultiplier"] = 0.05
    },
    ["RunningVegetal"] = {
        ["SoundId"] = "rbxassetid://17490016795",
        ["Looped"] = true,
        ["Pitch"] = 1.1,
        ["VolumeMultiplier"] = 0.75,
        ["PlaybackSpeed"] = 1.1
    },
    ["RunningWood"] = {
        ["SoundId"] = "rbxassetid://17490097740",
        ["Looped"] = true,
        ["Pitch"] = 1.1,
        ["VolumeMultiplier"] = 0.2,
        ["PlaybackSpeed"] = 1.25
    },
    ["Splash"] = {
        ["SoundId"] = "rbxasset://sounds/impact_water.mp3"
    },
    ["Swimming"] = {
        ["SoundId"] = "rbxasset://sounds/action_swim.mp3",
        ["Looped"] = true,
        ["Pitch"] = 1.6
    }
}
local function u19(p16, p17) --[[ Line: 121 ]]
    if p16 then
        local v18 = p16.ActiveController and (not (p16.ActiveController:IsA("GroundController") and p16.GroundSensor) and p16.ActiveController:IsA("ClimbController"))
        if v18 then
            v18 = p16.ClimbSensor
        end
        if v18 and v18.SensedPart then
            return p17 - v18.SensedPart:GetVelocityAtPosition(p16.RootPart.Position)
        else
            return p17
        end
    else
        return p17
    end
end
local u171 = v9.new({
    ["humanoid"] = "Humanoid",
    ["rootPart"] = "HumanoidRootPart"
}, function(p20) --[[ Name: initializeSoundSystem, Line 156 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u1
        [4] = u3
        [5] = u6
        [6] = u19
        [7] = u14
        [8] = u2
    --]]
    local _ = p20.player
    local u21 = p20.humanoid
    local u22 = p20.rootPart
    local u23 = u22.Parent
    local u24
    if u13 then
        u24 = u21.Parent:FindFirstChild("ControllerManager")
    else
        u24 = nil
    end
    local u25 = u22:WaitForChild("ControllerPartSensor")
    local u26 = {}
    for v27, v28 in pairs(u15) do
        local v29 = Instance.new("Sound")
        v29.Name = v27
        v29.Archivable = false
        v29.RollOffMinDistance = 5
        v29.RollOffMaxDistance = 150
        v29.Volume = 0.65 * (v28.VolumeMultiplier or 1)
        v28.VolumeMultiplier = nil
        for v30, v31 in pairs(v28) do
            v29[v30] = v31
        end
        v29.Parent = u22
        u26[v27] = v29
    end
    local u32 = {}
    local u33 = nil
    u21.StateChanged:Connect(function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u33
        --]]
        if u21:GetState() ~= Enum.HumanoidStateType.Running and u33 ~= nil then
            u33:Disconnect()
            u33 = nil
        end
    end)
    local u145 = {
        [Enum.HumanoidStateType.FallingDown] = function() --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            local v34 = pairs
            local v35 = u32
            local v36 = {}
            for v37, v38 in pairs(v35) do
                v36[v37] = v38
            end
            for v39 in v34(v36) do
                if v39 ~= nil then
                    v39.Playing = false
                    u32[v39] = nil
                end
            end
        end,
        [Enum.HumanoidStateType.GettingUp] = function() --[[ Line: 221 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u26
            --]]
            local v40 = pairs
            local v41 = u32
            local v42 = {}
            for v43, v44 in pairs(v41) do
                v42[v43] = v44
            end
            for v45 in v40(v42) do
                if v45 ~= nil then
                    v45.Playing = false
                    u32[v45] = nil
                end
            end
            local v46 = u26.GettingUp
            if v46 then
                v46.TimePosition = 0
                v46.Playing = true
            else
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Jumping] = function() --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u26
            --]]
            local v47 = pairs
            local v48 = u32
            local v49 = {}
            for v50, v51 in pairs(v48) do
                v49[v50] = v51
            end
            for v52 in v47(v49) do
                if v52 ~= nil then
                    v52.Playing = false
                    u32[v52] = nil
                end
            end
            local v53 = u26.Jumping
            if v53 then
                v53.TimePosition = 0
                v53.Playing = true
            else
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Swimming] = function() --[[ Line: 231 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u26
                [3] = u32
            --]]
            local v54 = u22.AssemblyLinearVelocity.Y
            local v55 = math.abs(v54)
            if v55 > 0.1 then
                local v56 = u26.Splash
                local v57 = (v55 - 100) * 0.72 / 250 + 0.28
                v56.Volume = math.clamp(v57, 0, 1)
                local v58 = u26.Splash
                if v58 then
                    v58.TimePosition = 0
                    v58.Playing = true
                else
                    warn("Sound is nil")
                end
            end
            local v59 = u26.Swimming
            local v60 = pairs
            local v61 = u32
            local v62 = {}
            for v63, v64 in pairs(v61) do
                v62[v63] = v64
            end
            for v65 in v60(v62) do
                if v65 ~= v59 then
                    v65.Playing = false
                    u32[v65] = nil
                end
            end
            u26.Swimming.Playing = true
            u32[u26.Swimming] = true
        end,
        [Enum.HumanoidStateType.Freefall] = function() --[[ Line: 242 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u32
            --]]
            u26.FreeFalling.Volume = 0
            local v66 = u26.FreeFalling
            local v67 = pairs
            local v68 = u32
            local v69 = {}
            for v70, v71 in pairs(v68) do
                v69[v70] = v71
            end
            for v72 in v67(v69) do
                if v72 ~= v66 then
                    v72.Playing = false
                    u32[v72] = nil
                end
            end
            u32[u26.FreeFalling] = true
        end,
        [Enum.HumanoidStateType.Landed] = function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u22
                [3] = u26
            --]]
            local v73 = pairs
            local v74 = u32
            local v75 = {}
            for v76, v77 in pairs(v74) do
                v75[v76] = v77
            end
            for v78 in v73(v75) do
                if v78 ~= nil then
                    v78.Playing = false
                    u32[v78] = nil
                end
            end
            local v79 = u22.AssemblyLinearVelocity.Y
            local v80 = math.abs(v79)
            if v80 > 75 then
                local v81 = u26.Landing
                local v82 = (v80 - 50) * 1 / 50 + 0
                v81.Volume = math.clamp(v82, 0, 1)
                local v83 = u26.Landing
                if v83 then
                    v83.TimePosition = 0
                    v83.Playing = true
                    return
                end
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Running] = function() --[[ Line: 257 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u1
                [3] = u32
                [4] = u3
                [5] = u6
                [6] = u25
                [7] = u26
                [8] = u33
            --]]
            if u23 == u1.LocalPlayer.Character then
                local u84 = nil
                local function v97() --[[ Line: 280 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u84
                        [3] = u3
                        [4] = u6
                        [5] = u32
                        [6] = u26
                    --]]
                    local v85 = u25.SensedPart
                    if v85 then
                        local v86
                        if v85.Name == "SneakCage" then
                            v86 = u84
                        else
                            local v87 = v85:GetAttribute("b")
                            if v87 then
                                local v88 = u3.getBlockId(v87)
                                v86 = not u6[v88] and "RunningDefault" or u6[v88]
                            else
                                v86 = "RunningDefault"
                            end
                        end
                        if v86 ~= u84 then
                            u84 = v86
                        end
                    end
                    if u84 ~= nil then
                        if not u32[u26[u84]] then
                            local v89 = u26[u84]
                            if v89 then
                                v89.TimePosition = 0
                                v89.Playing = true
                            else
                                warn("Sound is nil")
                            end
                        end
                        local v90 = u26[u84]
                        local v91 = pairs
                        local v92 = u32
                        local v93 = {}
                        for v94, v95 in pairs(v92) do
                            v93[v94] = v95
                        end
                        for v96 in v91(v93) do
                            if v96 ~= v90 then
                                v96.Playing = false
                                u32[v96] = nil
                            end
                        end
                        u32[u26[u84]] = true
                    end
                end
                u33 = game["Run Service"].Heartbeat:Connect(v97)
                local v98 = u25.SensedPart
                if v98 then
                    local v99
                    if v98.Name == "SneakCage" then
                        v99 = u84
                    else
                        local v100 = v98:GetAttribute("b")
                        if v100 then
                            local v101 = u3.getBlockId(v100)
                            v99 = not u6[v101] and "RunningDefault" or u6[v101]
                        else
                            v99 = "RunningDefault"
                        end
                    end
                    if v99 ~= u84 then
                        u84 = v99
                    end
                end
                if u84 ~= nil then
                    if not u32[u26[u84]] then
                        local v102 = u26[u84]
                        if v102 then
                            v102.TimePosition = 0
                            v102.Playing = true
                        else
                            warn("Sound is nil")
                        end
                    end
                    local v103 = u26[u84]
                    local v104 = pairs
                    local v105 = u32
                    local v106 = u84
                    local v107 = {}
                    for v108, v109 in pairs(v105) do
                        v107[v108] = v109
                    end
                    for v110 in v104(v107) do
                        if v110 ~= v103 then
                            v110.Playing = false
                            u32[v110] = nil
                        end
                    end
                    u32[u26[v106]] = true
                end
            else
                local v111 = pairs
                local v112 = u32
                local v113 = {}
                for v114, v115 in pairs(v112) do
                    v113[v114] = v115
                end
                for v116 in v111(v113) do
                    if v116 ~= nil then
                        v116.Playing = false
                        u32[v116] = nil
                    end
                end
            end
        end,
        [Enum.HumanoidStateType.Climbing] = function() --[[ Line: 306 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u22
                [3] = u13
                [4] = u19
                [5] = u24
                [6] = u32
            --]]
            local v117 = u26.Climbing
            local v118 = u22.AssemblyLinearVelocity
            if u13 then
                v118 = u19(u24, v118)
            end
            local v119 = v118.Y
            if math.abs(v119) > 0.1 then
                v117.Playing = true
                local v120 = pairs
                local v121 = u32
                local v122 = {}
                for v123, v124 in pairs(v121) do
                    v122[v123] = v124
                end
                for v125 in v120(v122) do
                    if v125 ~= v117 then
                        v125.Playing = false
                        u32[v125] = nil
                    end
                end
            else
                local v126 = pairs
                local v127 = u32
                local v128 = {}
                for v129, v130 in pairs(v127) do
                    v128[v129] = v130
                end
                for v131 in v126(v128) do
                    if v131 ~= nil then
                        v131.Playing = false
                        u32[v131] = nil
                    end
                end
            end
            u32[v117] = true
        end,
        [Enum.HumanoidStateType.Seated] = function() --[[ Line: 319 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            local v132 = pairs
            local v133 = u32
            local v134 = {}
            for v135, v136 in pairs(v133) do
                v134[v135] = v136
            end
            for v137 in v132(v134) do
                if v137 ~= nil then
                    v137.Playing = false
                    u32[v137] = nil
                end
            end
        end,
        [Enum.HumanoidStateType.Dead] = function() --[[ Line: 323 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u26
            --]]
            local v138 = pairs
            local v139 = u32
            local v140 = {}
            for v141, v142 in pairs(v139) do
                v140[v141] = v142
            end
            for v143 in v138(v140) do
                if v143 ~= nil then
                    v143.Playing = false
                    u32[v143] = nil
                end
            end
            local v144 = u26.Died
            if v144 then
                v144.TimePosition = 0
                v144.Playing = true
            else
                warn("Sound is nil")
            end
        end
    }
    local u152 = {
        [u26.Climbing] = function(_, p146, p147) --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u19
                [3] = u24
            --]]
            if u13 then
                p147 = u19(u24, p147)
            end
            p146.Playing = p147.Magnitude > 0.1
        end,
        [u26.FreeFalling] = function(p148, p149, p150) --[[ Line: 336 ]]
            if p150.Magnitude > 75 then
                local v151 = p149.Volume + p148 * 0.9
                p149.Volume = math.clamp(v151, 0, 1)
            else
                p149.Volume = 0
            end
        end
    }
    local u153 = u33
    for v154 in pairs(u14) do
        u152[u26[v154]] = function(_, p155, p156) --[[ Line: 348 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            local v157
            if p156.Magnitude > 0.5 then
                v157 = u21.MoveDirection.Magnitude > 0.5
            else
                v157 = false
            end
            p155.Playing = v157
        end
    end
    local u158 = {
        [Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    }
    local u159 = u158[u21:GetState()] or u21:GetState()
    local v160 = u159
    local v161 = u145[v160]
    if v161 then
        v161()
    end
    u159 = v160
    local u165 = u21.StateChanged:Connect(function(_, p162) --[[ Line: 372 ]]
        --[[
        Upvalues:
            [1] = u158
            [2] = u159
            [3] = u145
        --]]
        local v163 = u158[p162] or p162
        if v163 ~= u159 then
            local v164 = u145[v163]
            if v164 then
                v164()
            end
            u159 = v163
        end
    end)
    local u169 = u2.Stepped:Connect(function(_, p166) --[[ Line: 380 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u152
            [3] = u22
        --]]
        for v167 in pairs(u32) do
            local v168 = u152[v167]
            if v168 then
                v168(p166, v167, u22.AssemblyLinearVelocity)
            end
        end
    end)
    return function() --[[ Name: terminate, Line 391 ]]
        --[[
        Upvalues:
            [1] = u165
            [2] = u169
            [3] = u26
            [4] = u153
        --]]
        u165:Disconnect()
        u169:Disconnect()
        for _, v170 in pairs(u26) do
            v170:Destroy()
        end
        if u153 ~= nil then
            u153:Disconnect()
            u153 = nil
        end
        table.clear(u26)
    end
end)
local u172 = {}
local function u174(p173) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u171
    --]]
    u171:bindRoot(p173)
end
local function u176(p175) --[[ Line: 422 ]]
    --[[
    Upvalues:
        [1] = u171
    --]]
    u171:unbindRoot(p175)
end
local function v183(p177) --[[ Line: 426 ]]
    --[[
    Upvalues:
        [1] = u172
        [2] = u171
        [3] = u174
        [4] = u176
    --]]
    local v178 = u172[p177]
    if not v178 then
        v178 = {}
        u172[p177] = v178
    end
    if p177.Character then
        u171:bindRoot(p177.Character)
    end
    local v179 = p177.CharacterAdded
    local v180 = u174
    table.insert(v178, v179:Connect(v180))
    local v181 = p177.CharacterRemoving
    local v182 = u176
    table.insert(v178, v181:Connect(v182))
end
local function v187(p184) --[[ Line: 440 ]]
    --[[
    Upvalues:
        [1] = u172
        [2] = u171
    --]]
    local v185 = u172[p184]
    if v185 then
        for _, v186 in ipairs(v185) do
            v186:Disconnect()
        end
        u172[p184] = nil
    end
    if p184.Character then
        u171:unbindRoot(p184.Character)
    end
end
for _, v188 in ipairs(u1:GetPlayers()) do
    task.spawn(v183, v188)
end
u1.PlayerAdded:Connect(v183)
u1.PlayerRemoving:Connect(v187)