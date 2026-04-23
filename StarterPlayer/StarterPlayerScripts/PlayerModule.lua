-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = {}
u1.__index = u1
function u1.new() --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3.cameras = require(script:WaitForChild("CameraModule"))
    v3.controls = require(script:WaitForChild("ControlModule"))
    return v3
end
function u1.GetCameras(p4) --[[ Line: 25 ]]
    return p4.cameras
end
function u1.GetControls(p5) --[[ Line: 29 ]]
    return p5.controls
end
function u1.GetClickToMoveController(p6) --[[ Line: 33 ]]
    return p6.controls:GetClickToMoveController()
end
return u1.new()