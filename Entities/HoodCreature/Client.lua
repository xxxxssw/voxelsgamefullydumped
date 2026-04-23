-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Entities.HoodCreature.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = script.Parent
local v2 = v1:WaitForChild("ShowBubble", (1 / 0))
local u3 = v1:WaitForChild("HumanoidRootPart", (1 / 0))
local u4 = u3:WaitForChild("TraderBillboard", (1 / 0))
local u5 = Random.new()
local function u8() --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    if u3 then
        local v6 = {}
        for _, v7 in ipairs(u3:GetChildren()) do
            if v7:IsA("Sound") then
                table.insert(v6, v7)
            end
        end
        if #v6 > 0 then
            v6[u5:NextInteger(1, #v6)]:Play()
        end
    end
end
v2.OnClientEvent:Connect(function() --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
    --]]
    if u4.Enabled == false then
        u8()
        u4.Enabled = true
        task.wait(2.5)
        u4.Enabled = false
    end
end)