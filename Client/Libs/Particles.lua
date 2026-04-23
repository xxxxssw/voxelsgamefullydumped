-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.Particles
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
local u2 = game:GetService("Debris")
local u3 = v1.CurrentCamera
local u4 = Instance.new("BindableEvent")
u4.Event:Connect(function(p5) --[[ Name: emitSmoke, Line 11 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local u6 = script.WhiteSmoke:Clone()
    u6.Position = p5
    u6.Parent = u3
    task.delay(0.75, function() --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6.Smoke.Enabled = false
    end)
    u2:AddItem(u6, 3)
end)
return {
    ["smoke"] = function(p7) --[[ Name: smoke, Line 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
        --]]
        if (p7 - u3.CFrame.Position).Magnitude <= 100 then
            u4:Fire(p7)
        end
    end
}