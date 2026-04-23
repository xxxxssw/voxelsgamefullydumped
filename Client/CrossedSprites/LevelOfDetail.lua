-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.CrossedSprites.LevelOfDetail
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u1 = game:GetService("CollectionService")
local v2 = game:GetService("Workspace")
local u3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local u5 = v2.CurrentCamera
local u6 = v4.Client.States.GrassQuality
local u7 = nil
local function u9(p8) --[[ Line: 25 ]]
    return p8 < 32 and 3 or (p8 < 80 and 1 or (p8 < 200 and 1 or 0))
end
local function u11(p10) --[[ Line: 37 ]]
    return p10 < 30 and 3 or (p10 < 50 and 1 or (p10 < 120 and 1 or 0))
end
local function u13(p12) --[[ Line: 49 ]]
    return p12 < 20 and 2 or (p12 < 60 and 1 or 0)
end
local function u14() --[[ Line: 59 ]]
    return 3
end
local function v16() --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u13
        [4] = u11
        [5] = u9
        [6] = u14
    --]]
    local v15 = u6.Value
    if v15 == 1 then
        u7 = u13
    elseif v15 == 2 then
        u7 = u11
    elseif v15 == 3 then
        u7 = u9
    end
    u7 = u14
end
u6.Changed:Connect(v16)
local v17 = u6.Value
if v17 == 1 then
    u7 = u13
elseif v17 == 2 then
    u7 = u11
elseif v17 == 3 then
    u7 = u9
end
u7 = u14
changes = {}
local u18 = nil
local u19 = 1
local u20 = 1
local u21 = false
local u22 = tick()
local u23 = 0
local function v24() --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22 = tick()
end
local function v32() --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
        [3] = u23
        [4] = u18
        [5] = u1
        [6] = u19
        [7] = u20
        [8] = u5
        [9] = u7
        [10] = u3
    --]]
    if u21 then
        return
    else
        if tick() - u22 > 0.011 then
            u23 = u23 + 1
            if u23 ~= 10 then
                return
            end
            u23 = 0
        else
            u23 = 0
        end
        if u18 == nil then
            debug.profilebegin("cslod_gather")
            u18 = u1:GetTagged("crossedSprites")
            u19 = 1
            u20 = #u18
            debug.profileend()
        else
            debug.profilebegin("cslod_compute")
            if changes == nil then
                changes = {}
            end
            local v25 = 1
            for v26 = u19, u20 do
                local v27 = u18[v26]
                local v28 = u7((v27:GetAttribute("c") * 4 - u5.CFrame.Position).Magnitude)
                if v28 ~= v27:GetAttribute("lod") then
                    changes[v27] = v28
                end
                if v25 == 150 then
                    debug.profileend()
                    u19 = v26
                    return
                end
                v25 = v25 + 1
            end
            u18 = nil
            u21 = true
            local v29 = 1
            task.synchronize()
            u3.Heartbeat:Wait()
            if changes and next(changes) then
                for v30, v31 in pairs(changes) do
                    v30:SetAttribute("lod", v31)
                    v29 = v29 + 1
                    if v29 == 30 then
                        u3.Heartbeat:Wait()
                        v29 = 1
                    end
                end
            end
            u21 = false
            changes = nil
        end
    end
end
u3.Heartbeat:Connect(v24)
u3.Stepped:ConnectParallel(v32)