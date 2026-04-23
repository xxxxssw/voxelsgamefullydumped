-- Roblox script dump
-- ClassName: LocalScript
-- Path: StarterPlayer.StarterPlayerScripts.RbxCharacterSounds
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
local v11, v12 = pcall(function() --[[ Line: 40 ]]
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
local v15 = game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("LocalSounds"):WaitForChild("Footstep")
local u16 = {
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
        ["SoundId"] = v15.footstep_snow_loop.SoundId,
        ["Looped"] = true,
        ["Pitch"] = 1,
        ["VolumeMultiplier"] = 0.1
    },
    ["RunningSandAndDirt"] = {
        ["SoundId"] = v15.footsteps_sand_loop.SoundId,
        ["Looped"] = true,
        ["Pitch"] = 1,
        ["VolumeMultiplier"] = 0.05
    },
    ["RunningVegetal"] = {
        ["SoundId"] = v15.walk_grass_loop.SoundId,
        ["Looped"] = true,
        ["Pitch"] = 1.1,
        ["VolumeMultiplier"] = 0.75,
        ["PlaybackSpeed"] = 1.1
    },
    ["RunningWood"] = {
        ["SoundId"] = v15.footsteps_wood_loop.SoundId,
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
local function u20(p17, p18) --[[ Line: 127 ]]
    if p17 then
        local v19 = p17.ActiveController and (not (p17.ActiveController:IsA("GroundController") and p17.GroundSensor) and p17.ActiveController:IsA("ClimbController"))
        if v19 then
            v19 = p17.ClimbSensor
        end
        if v19 and v19.SensedPart then
            return p18 - v19.SensedPart:GetVelocityAtPosition(p17.RootPart.Position)
        else
            return p18
        end
    else
        return p18
    end
end
local u172 = v9.new({
    ["humanoid"] = "Humanoid",
    ["rootPart"] = "HumanoidRootPart"
}, function(p21) --[[ Name: initializeSoundSystem, Line 162 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u1
        [4] = u3
        [5] = u6
        [6] = u20
        [7] = u14
        [8] = u2
    --]]
    local _ = p21.player
    local u22 = p21.humanoid
    local u23 = p21.rootPart
    local u24 = u23.Parent
    local u25
    if u13 then
        u25 = u22.Parent:FindFirstChild("ControllerManager")
    else
        u25 = nil
    end
    local u26 = u23:WaitForChild("ControllerPartSensor")
    local u27 = {}
    for v28, v29 in pairs(u16) do
        local v30 = Instance.new("Sound")
        v30.Name = v28
        v30.Archivable = false
        v30.RollOffMinDistance = 5
        v30.RollOffMaxDistance = 150
        v30.Volume = 0.65 * (v29.VolumeMultiplier or 1)
        v29.VolumeMultiplier = nil
        for v31, v32 in pairs(v29) do
            v30[v31] = v32
        end
        v30.Parent = u23
        u27[v28] = v30
    end
    local u33 = {}
    local u34 = nil
    u22.StateChanged:Connect(function() --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u34
        --]]
        if u22:GetState() ~= Enum.HumanoidStateType.Running and u34 ~= nil then
            u34:Disconnect()
            u34 = nil
        end
    end)
    local u146 = {
        [Enum.HumanoidStateType.FallingDown] = function() --[[ Line: 223 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v35 = pairs
            local v36 = u33
            local v37 = {}
            for v38, v39 in pairs(v36) do
                v37[v38] = v39
            end
            for v40 in v35(v37) do
                if v40 ~= nil then
                    v40.Playing = false
                    u33[v40] = nil
                end
            end
        end,
        [Enum.HumanoidStateType.GettingUp] = function() --[[ Line: 227 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u27
            --]]
            local v41 = pairs
            local v42 = u33
            local v43 = {}
            for v44, v45 in pairs(v42) do
                v43[v44] = v45
            end
            for v46 in v41(v43) do
                if v46 ~= nil then
                    v46.Playing = false
                    u33[v46] = nil
                end
            end
            local v47 = u27.GettingUp
            if v47 then
                v47.TimePosition = 0
                v47.Playing = true
            else
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Jumping] = function() --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u27
            --]]
            local v48 = pairs
            local v49 = u33
            local v50 = {}
            for v51, v52 in pairs(v49) do
                v50[v51] = v52
            end
            for v53 in v48(v50) do
                if v53 ~= nil then
                    v53.Playing = false
                    u33[v53] = nil
                end
            end
            local v54 = u27.Jumping
            if v54 then
                v54.TimePosition = 0
                v54.Playing = true
            else
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Swimming] = function() --[[ Line: 237 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u27
                [3] = u33
            --]]
            local v55 = u23.AssemblyLinearVelocity.Y
            local v56 = math.abs(v55)
            if v56 > 0.1 then
                local v57 = u27.Splash
                local v58 = (v56 - 100) * 0.72 / 250 + 0.28
                v57.Volume = math.clamp(v58, 0, 1)
                local v59 = u27.Splash
                if v59 then
                    v59.TimePosition = 0
                    v59.Playing = true
                else
                    warn("Sound is nil")
                end
            end
            local v60 = u27.Swimming
            local v61 = pairs
            local v62 = u33
            local v63 = {}
            for v64, v65 in pairs(v62) do
                v63[v64] = v65
            end
            for v66 in v61(v63) do
                if v66 ~= v60 then
                    v66.Playing = false
                    u33[v66] = nil
                end
            end
            u27.Swimming.Playing = true
            u33[u27.Swimming] = true
        end,
        [Enum.HumanoidStateType.Freefall] = function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u33
            --]]
            u27.FreeFalling.Volume = 0
            local v67 = u27.FreeFalling
            local v68 = pairs
            local v69 = u33
            local v70 = {}
            for v71, v72 in pairs(v69) do
                v70[v71] = v72
            end
            for v73 in v68(v70) do
                if v73 ~= v67 then
                    v73.Playing = false
                    u33[v73] = nil
                end
            end
            u33[u27.FreeFalling] = true
        end,
        [Enum.HumanoidStateType.Landed] = function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u23
                [3] = u27
            --]]
            local v74 = pairs
            local v75 = u33
            local v76 = {}
            for v77, v78 in pairs(v75) do
                v76[v77] = v78
            end
            for v79 in v74(v76) do
                if v79 ~= nil then
                    v79.Playing = false
                    u33[v79] = nil
                end
            end
            local v80 = u23.AssemblyLinearVelocity.Y
            local v81 = math.abs(v80)
            if v81 > 75 then
                local v82 = u27.Landing
                local v83 = (v81 - 50) * 1 / 50 + 0
                v82.Volume = math.clamp(v83, 0, 1)
                local v84 = u27.Landing
                if v84 then
                    v84.TimePosition = 0
                    v84.Playing = true
                    return
                end
                warn("Sound is nil")
            end
        end,
        [Enum.HumanoidStateType.Running] = function() --[[ Line: 263 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u1
                [3] = u33
                [4] = u3
                [5] = u6
                [6] = u26
                [7] = u27
                [8] = u34
            --]]
            if u24 == u1.LocalPlayer.Character then
                local u85 = nil
                local function v98() --[[ Line: 286 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u85
                        [3] = u3
                        [4] = u6
                        [5] = u33
                        [6] = u27
                    --]]
                    local v86 = u26.SensedPart
                    if v86 then
                        local v87
                        if v86.Name == "SneakCage" then
                            v87 = u85
                        else
                            local v88 = v86:GetAttribute("b")
                            if v88 then
                                local v89 = u3.getBlockId(v88)
                                v87 = not u6[v89] and "RunningDefault" or u6[v89]
                            else
                                v87 = "RunningDefault"
                            end
                        end
                        if v87 ~= u85 then
                            u85 = v87
                        end
                    end
                    if u85 ~= nil then
                        if not u33[u27[u85]] then
                            local v90 = u27[u85]
                            if v90 then
                                v90.TimePosition = 0
                                v90.Playing = true
                            else
                                warn("Sound is nil")
                            end
                        end
                        local v91 = u27[u85]
                        local v92 = pairs
                        local v93 = u33
                        local v94 = {}
                        for v95, v96 in pairs(v93) do
                            v94[v95] = v96
                        end
                        for v97 in v92(v94) do
                            if v97 ~= v91 then
                                v97.Playing = false
                                u33[v97] = nil
                            end
                        end
                        u33[u27[u85]] = true
                    end
                end
                u34 = game["Run Service"].Heartbeat:Connect(v98)
                local v99 = u26.SensedPart
                if v99 then
                    local v100
                    if v99.Name == "SneakCage" then
                        v100 = u85
                    else
                        local v101 = v99:GetAttribute("b")
                        if v101 then
                            local v102 = u3.getBlockId(v101)
                            v100 = not u6[v102] and "RunningDefault" or u6[v102]
                        else
                            v100 = "RunningDefault"
                        end
                    end
                    if v100 ~= u85 then
                        u85 = v100
                    end
                end
                if u85 ~= nil then
                    if not u33[u27[u85]] then
                        local v103 = u27[u85]
                        if v103 then
                            v103.TimePosition = 0
                            v103.Playing = true
                        else
                            warn("Sound is nil")
                        end
                    end
                    local v104 = u27[u85]
                    local v105 = pairs
                    local v106 = u33
                    local v107 = u85
                    local v108 = {}
                    for v109, v110 in pairs(v106) do
                        v108[v109] = v110
                    end
                    for v111 in v105(v108) do
                        if v111 ~= v104 then
                            v111.Playing = false
                            u33[v111] = nil
                        end
                    end
                    u33[u27[v107]] = true
                end
            else
                local v112 = pairs
                local v113 = u33
                local v114 = {}
                for v115, v116 in pairs(v113) do
                    v114[v115] = v116
                end
                for v117 in v112(v114) do
                    if v117 ~= nil then
                        v117.Playing = false
                        u33[v117] = nil
                    end
                end
            end
        end,
        [Enum.HumanoidStateType.Climbing] = function() --[[ Line: 312 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u23
                [3] = u13
                [4] = u20
                [5] = u25
                [6] = u33
            --]]
            local v118 = u27.Climbing
            local v119 = u23.AssemblyLinearVelocity
            if u13 then
                v119 = u20(u25, v119)
            end
            local v120 = v119.Y
            if math.abs(v120) > 0.1 then
                v118.Playing = true
                local v121 = pairs
                local v122 = u33
                local v123 = {}
                for v124, v125 in pairs(v122) do
                    v123[v124] = v125
                end
                for v126 in v121(v123) do
                    if v126 ~= v118 then
                        v126.Playing = false
                        u33[v126] = nil
                    end
                end
            else
                local v127 = pairs
                local v128 = u33
                local v129 = {}
                for v130, v131 in pairs(v128) do
                    v129[v130] = v131
                end
                for v132 in v127(v129) do
                    if v132 ~= nil then
                        v132.Playing = false
                        u33[v132] = nil
                    end
                end
            end
            u33[v118] = true
        end,
        [Enum.HumanoidStateType.Seated] = function() --[[ Line: 325 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v133 = pairs
            local v134 = u33
            local v135 = {}
            for v136, v137 in pairs(v134) do
                v135[v136] = v137
            end
            for v138 in v133(v135) do
                if v138 ~= nil then
                    v138.Playing = false
                    u33[v138] = nil
                end
            end
        end,
        [Enum.HumanoidStateType.Dead] = function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u27
            --]]
            local v139 = pairs
            local v140 = u33
            local v141 = {}
            for v142, v143 in pairs(v140) do
                v141[v142] = v143
            end
            for v144 in v139(v141) do
                if v144 ~= nil then
                    v144.Playing = false
                    u33[v144] = nil
                end
            end
            local v145 = u27.Died
            if v145 then
                v145.TimePosition = 0
                v145.Playing = true
            else
                warn("Sound is nil")
            end
        end
    }
    local u153 = {
        [u27.Climbing] = function(_, p147, p148) --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u20
                [3] = u25
            --]]
            if u13 then
                p148 = u20(u25, p148)
            end
            p147.Playing = p148.Magnitude > 0.1
        end,
        [u27.FreeFalling] = function(p149, p150, p151) --[[ Line: 342 ]]
            if p151.Magnitude > 75 then
                local v152 = p150.Volume + p149 * 0.9
                p150.Volume = math.clamp(v152, 0, 1)
            else
                p150.Volume = 0
            end
        end
    }
    local u154 = u34
    for v155 in pairs(u14) do
        u153[u27[v155]] = function(_, p156, p157) --[[ Line: 354 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            local v158
            if p157.Magnitude > 0.5 then
                v158 = u22.MoveDirection.Magnitude > 0.5
            else
                v158 = false
            end
            p156.Playing = v158
        end
    end
    local u159 = {
        [Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    }
    local u160 = u159[u22:GetState()] or u22:GetState()
    local v161 = u160
    local v162 = u146[v161]
    if v162 then
        v162()
    end
    u160 = v161
    local u166 = u22.StateChanged:Connect(function(_, p163) --[[ Line: 378 ]]
        --[[
        Upvalues:
            [1] = u159
            [2] = u160
            [3] = u146
        --]]
        local v164 = u159[p163] or p163
        if v164 ~= u160 then
            local v165 = u146[v164]
            if v165 then
                v165()
            end
            u160 = v164
        end
    end)
    local u170 = u2.Stepped:Connect(function(_, p167) --[[ Line: 386 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u153
            [3] = u23
        --]]
        for v168 in pairs(u33) do
            local v169 = u153[v168]
            if v169 then
                v169(p167, v168, u23.AssemblyLinearVelocity)
            end
        end
    end)
    return function() --[[ Name: terminate, Line 397 ]]
        --[[
        Upvalues:
            [1] = u166
            [2] = u170
            [3] = u27
            [4] = u154
        --]]
        u166:Disconnect()
        u170:Disconnect()
        for _, v171 in pairs(u27) do
            v171:Destroy()
        end
        if u154 ~= nil then
            u154:Disconnect()
            u154 = nil
        end
        table.clear(u27)
    end
end)
local u173 = {}
local function u175(p174) --[[ Line: 424 ]]
    --[[
    Upvalues:
        [1] = u172
    --]]
    u172:bindRoot(p174)
end
local function u177(p176) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u172
    --]]
    u172:unbindRoot(p176)
end
local function v184(p178) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u173
        [2] = u172
        [3] = u175
        [4] = u177
    --]]
    local v179 = u173[p178]
    if not v179 then
        v179 = {}
        u173[p178] = v179
    end
    if p178.Character then
        u172:bindRoot(p178.Character)
    end
    local v180 = p178.CharacterAdded
    local v181 = u175
    table.insert(v179, v180:Connect(v181))
    local v182 = p178.CharacterRemoving
    local v183 = u177
    table.insert(v179, v182:Connect(v183))
end
local function v188(p185) --[[ Line: 446 ]]
    --[[
    Upvalues:
        [1] = u173
        [2] = u172
    --]]
    local v186 = u173[p185]
    if v186 then
        for _, v187 in ipairs(v186) do
            v187:Disconnect()
        end
        u173[p185] = nil
    end
    if p185.Character then
        u172:unbindRoot(p185.Character)
    end
end
for _, v189 in ipairs(u1:GetPlayers()) do
    task.spawn(v184, v189)
end
u1.PlayerAdded:Connect(v184)
u1.PlayerRemoving:Connect(v188)