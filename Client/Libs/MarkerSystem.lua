-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.MarkerSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
local u2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local u4 = game:GetService("ReplicatedStorage")
local u5 = require(script.UpdateMarker)
local v6 = require(game.ReplicatedStorage.Systems.ItemsSystem.UtilsItems)
local u7 = require(game.ReplicatedStorage.Libs.Utils)
local u8 = {
    ["ADMIN_LOCATOR_ATTRIBUTE"] = "MarkerSystem_AdminLocatorEnabled"
}
local u9 = u2.LocalPlayer
local _ = v1.CurrentCamera
local u10 = nil
local u11 = {}
local u12 = v6.itemIdFromName("compass")
local u13 = {
    ["NonFriend"] = {
        ["color"] = Color3.fromRGB(144, 170, 156),
        ["icon"] = "rbxassetid://15992588411"
    },
    ["Friend"] = {
        ["color"] = Color3.fromRGB(85, 170, 127),
        ["icon"] = "rbxassetid://15992588411"
    },
    ["Bed"] = {
        ["color"] = Color3.fromRGB(85, 170, 255),
        ["icon"] = "rbxassetid://15993191718"
    },
    ["Death"] = {
        ["color"] = Color3.fromRGB(225, 225, 225),
        ["icon"] = "rbxassetid://15993191585",
        ["destroyWhenClose"] = true
    },
    ["Compass"] = {
        ["color"] = Color3.fromRGB(255, 170, 0),
        ["icon"] = "rbxassetid://17482791763"
    }
}
local u14
if u3:IsClient() then
    u14 = Instance.new("ScreenGui")
    u14.Name = "MarkerScreenGui"
    u14.ResetOnSpawn = false
    u14.IgnoreGuiInset = true
    u14.Parent = u9.PlayerGui
else
    u14 = nil
end
function u8.init() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u13
        [4] = u2
        [5] = u12
        [6] = u7
    --]]
    local function v16() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u13
        --]]
        local v15 = u9:GetAttribute("bedCoordinates")
        if v15 == nil then
            u8.deleteMarker("Bed")
        else
            u8.createMarker("Bed", u13.Bed, v15 * 4)
        end
    end
    u9:GetAttributeChangedSignal("bedCoordinates"):Connect(v16)
    local v17 = u9:GetAttribute("bedCoordinates")
    if v17 == nil then
        u8.deleteMarker("Bed")
    else
        u8.createMarker("Bed", u13.Bed, v17 * 4)
    end
    local u18 = 0
    u9:GetAttributeChangedSignal("health"):Connect(function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u13
            [4] = u18
        --]]
        local v19 = u9:GetAttribute("health") <= 0 and u9:GetAttribute("LastPosition")
        if v19 then
            u8.createMarker("Death", u13.Death, v19)
            local u20 = tick()
            u18 = u20
            task.delay(300, function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u20
                    [3] = u8
                --]]
                if u18 == u20 then
                    u8.deleteMarker("Death")
                end
            end)
        end
    end)
    local function u22(p21) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u13
        --]]
        if p21 ~= u9 then
            if u9:IsFriendsWith(p21.UserId) then
                u8.createMarker(p21.Name, u13.Friend, p21)
                return
            end
            if u9:GetAttribute(u8.ADMIN_LOCATOR_ATTRIBUTE) == true then
                u8.createMarker(p21.Name, u13.NonFriend, p21)
                return
            end
            u8.deleteMarker(p21.Name)
        end
    end
    for _, v23 in ipairs(u2:GetPlayers()) do
        coroutine.wrap(u22)(v23)
    end
    u2.PlayerAdded:Connect(u22)
    u2.PlayerRemoving:Connect(function(p24) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.deleteMarker(p24.Name)
    end)
    u9:GetAttributeChangedSignal(u8.ADMIN_LOCATOR_ATTRIBUTE):Connect(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u22
        --]]
        for _, v25 in ipairs(u2:GetPlayers()) do
            coroutine.wrap(u22)(v25)
        end
    end)
    local u26 = Instance.new("Vector3Value")
    u26.Changed:Connect(function(p27) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
        --]]
        u8.deleteMarker("Compass")
        if p27 ~= Vector3.new() then
            u8.createMarker("Compass", u13.Compass, p27 * 4)
        end
    end)
    task.spawn(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
            [3] = u7
        --]]
        local v28 = require(game.ReplicatedStorage.Client.States.HotbarState)
        while task.wait(1) do
            local v29, _, v30 = v28.getCurrentlyHeldItemId()
            if v29 and v29 == u12 then
                if v30.compass and v30.compass ~= -1 then
                    u26.Value = u7.decodeVector3(v30.compass)
                else
                    u26.Value = Vector3.new()
                end
            else
                u26.Value = Vector3.new()
            end
        end
    end)
end
function u8.setGuiEnabled(p31) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u3
        [4] = u11
        [5] = u5
        [6] = u8
        [7] = u14
    --]]
    if u4.Client.States.MarkersEnabled.Value == false then
        p31 = false
    end
    if u10 ~= nil then
        u10:Disconnect()
        u10 = nil
    end
    if p31 then
        u10 = u3.RenderStepped:Connect(function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u5
                [3] = u8
            --]]
            for v32, v33 in pairs(u11) do
                if u5(v33) then
                    u8.deleteMarker(v32)
                end
            end
        end)
    end
    u14.Enabled = p31
end
function u8.deleteMarker(p34) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v35 = u11[p34]
    if v35 ~= nil then
        v35.markerGui:Destroy()
        u11[p34] = nil
    end
end
function u8.createMarker(p36, p37, p38) --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u11
    --]]
    u8.deleteMarker(p36)
    local v39 = script.Marker:Clone()
    v39.Bubble.ImageColor3 = p37.color
    v39.ArrowFrame.ImageLabel.ImageColor3 = p37.color
    v39.InnerIcon.Image = p37.icon
    v39.InnerIcon.ImageColor3 = p37.color:Lerp(Color3.fromRGB(0, 0, 0), 0.35)
    v39.Label.Text = p36
    v39.Parent = u14
    u11[p36] = {
        ["name"] = p36,
        ["markerGui"] = v39,
        ["where"] = p38
    }
end
return u8