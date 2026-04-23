-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Client.Libs.Actor.NeckAnimation
-- Source: decompile
-- Dumped: 2026-04-23 03:45:24

local v1 = game:GetService("RunService")
local v2 = game:GetService("Workspace")
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u3 = v2.Entities
local u4 = v2.Characters
local u5 = v2.Camera
local function u14(p6) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v7 = p6:FindFirstChild("LookTarget")
    if v7 then
        local v8 = v7.Value
        if v8 == nil then
            return v8
        else
            return v8:FindFirstChild("Head_") or (v8:FindFirstChild("Head") or v8:FindFirstChild("HeadPart"))
        end
    else
        local v9 = (1 / 0)
        local v10 = nil
        for _, v11 in ipairs(u4:GetChildren()) do
            if v11 ~= p6 then
                local v12 = v11:FindFirstChild("Head_") or (v11:FindFirstChild("Head") or v11:FindFirstChild("HeadPart"))
                if v12 ~= nil then
                    local v13 = (v12.Position - p6.PrimaryPart.Position).Magnitude
                    if v13 < v9 and v13 < 24 then
                        v10 = v12
                        v9 = v13
                    end
                end
            end
        end
        return v10
    end
end
local function u33(p15, p16, p17, p18) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p16:GetAttribute("defaultNeckC0") == nil then
        local v19 = {
            ["action"] = 1,
            ["instance"] = p16,
            ["value"] = p18.C0
        }
        table.insert(p15, v19)
        return
    else
        local v20 = p16:GetAttribute("defaultNeckC0")
        if p16.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
            table.insert(p15, {
                ["action"] = 2,
                ["instance"] = p18,
                ["value"] = v20
            })
        else
            local v21 = u14(p16)
            if v21 then
                local v22 = p17.Position - v21.Position
                local v23, v24, v25 = p16.PrimaryPart.CFrame:ToEulerAnglesYXZ()
                local v26 = CFrame.new(p16.PrimaryPart.Position, v21.Position).LookVector
                local v27 = p16.PrimaryPart.CFrame.LookVector:Dot(v26)
                local v28 = math.acos(v27)
                if math.deg(v28) <= 80 then
                    local v29 = v26.Y
                    if math.abs(v29) <= 0.8 then
                        local v30 = v20 * CFrame.Angles(-v23, -v24, v25) * (CFrame.new(v22, (Vector3.new())) - v22)
                        local v31 = {
                            ["action"] = 2,
                            ["instance"] = p18,
                            ["value"] = p18.C0:Lerp(v30, 0.1)
                        }
                        table.insert(p15, v31)
                        return
                    end
                end
            end
            local v32 = {
                ["action"] = 2,
                ["instance"] = p18,
                ["value"] = p18.C0:Lerp(v20, 0.05)
            }
            table.insert(p15, v32)
        end
    end
end
v1.Stepped:ConnectParallel(function() --[[ Name: stepped, Line 83 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u33
    --]]
    local v34 = {}
    for _, v35 in ipairs(u3:GetChildren()) do
        if v35.PrimaryPart ~= nil and (v35:FindFirstChildOfClass("Humanoid") and (v35.PrimaryPart.Position - u5.CFrame.Position).Magnitude <= 200) then
            local v36 = v35:FindFirstChild("Neck", true)
            local v37 = v35:FindFirstChild("Head_") or (v35:FindFirstChild("Head") or v35:FindFirstChild("HeadPart"))
            if v36 ~= nil and v37 ~= nil then
                u33(v34, v35, v37, v36)
            end
        end
    end
    if #v34 > 0 then
        task.synchronize()
        for _, v38 in ipairs(v34) do
            if v38.action == 1 then
                v38.instance:SetAttribute("defaultNeckC0", v38.value)
            elseif v38.action == 2 then
                v38.instance.C0 = v38.value
            end
        end
    end
end)