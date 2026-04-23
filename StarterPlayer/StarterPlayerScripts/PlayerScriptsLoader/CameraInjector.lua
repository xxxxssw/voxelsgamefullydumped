-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader.CameraInjector
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local v1 = require(game.ReplicatedStorage:WaitForChild("Client"):WaitForChild("Libs"):WaitForChild("Telemetry"))
local u2 = {
    ["UserRemoveTheCameraApi"] = false
}
local u5 = {
    ["IsUserFeatureEnabled"] = function(_, p3) --[[ Name: IsUserFeatureEnabled, Line 15 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if u2[p3] == nil then
            return UserSettings():IsUserFeatureEnabled(p3)
        else
            return u2[p3]
        end
    end,
    ["GetService"] = function(_, p4) --[[ Name: GetService, Line 22 ]]
        return UserSettings():GetService(p4)
    end
}
local function u6() --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5
end
local v7 = script.Parent.Parent:WaitForChild("PlayerModule")
local v8 = v7:WaitForChild("CameraModule")
local u9 = require(v8:WaitForChild("TransparencyController"))
local u10 = nil
local u11 = u9.Enable
local u12 = Instance.new("BindableEvent")
function u9.Enable(p13, ...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u9
        [4] = u10
        [5] = u12
    --]]
    u11(p13, ...)
    local v14 = getfenv(3)
    v14.UserSettings = u6
    local v15 = setfenv(3, v14)
    u9.Enable = u11
    u10 = v15()
    u12.Event:Wait()
end
coroutine.wrap(require)(v8)
v1.client_addData("CameraModule childrenLoaded", false)
local v16 = u10
while #v8:GetChildren() < 10 do
    task.wait(1)
    print(#v8:GetChildren())
end
for _, v17 in pairs(v8:GetChildren()) do
    v17.Parent = script
end
v1.client_addData("CameraModule childrenLoaded", true)
v8.Name = "_CameraModule"
script.Name = "CameraModule"
script.Parent = v7
return v16