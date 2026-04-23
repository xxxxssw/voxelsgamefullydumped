-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.RegionsSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = {
    ["RegionStatus"] = {
        ["Empty"] = "Empty",
        ["Loading"] = "Loading",
        ["Ready"] = "Ready"
    }
}
local u2 = nil
local u3 = Instance.new("BindableEvent")
function u1.readRegionData(p4) --[[ Line: 15 ]]
    return shared.REGIONS_DATA[string.format("region_%s", p4)]
end
function u1.readRegionStatus(p5) --[[ Line: 19 ]]
    local v6 = script.ServerPool:FindFirstChild(p5)
    if v6 then
        return v6:GetAttribute("Status")
    else
        return nil
    end
end
function u1.requestRegionLoading(p7) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if script.ServerPool:FindFirstChild(p7) == nil then
        local v8 = u2:Clone()
        v8.Name = p7
        v8.Parent = script.ServerPool
    end
end
function u1.client_isRegionLoadedOnServer(p9) --[[ Line: 39 ]]
    return script.ServerPool:FindFirstChild(p9) ~= nil
end
function u1.client_getRegionLoadedOnServerSignal() --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.Event
end
function u1.server_init() --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    u2 = script.ServerPool.Actor
    u2.Parent = nil
    u2:SetAttribute("Status", u1.RegionStatus.Loading)
    shared.REGIONS_DATA = {}
end
function u1.client_init() --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local function v11(p10) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        p10:GetAttributeChangedSignal("Status"):Connect(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3:Fire()
        end)
        u3:Fire()
    end
    for _, v12 in ipairs(script.ServerPool:GetChildren()) do
        v12:GetAttributeChangedSignal("Status"):Connect(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3:Fire()
        end)
        u3:Fire()
    end
    script.ServerPool.ChildAdded:Connect(v11)
end
return u1