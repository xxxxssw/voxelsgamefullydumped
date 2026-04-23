-- Roblox script dump
-- ClassName: ModuleScript
-- Path: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.BaseCharacterController
-- Source: decompile
-- Dumped: 2026-04-23 03:45:25

local u1 = {}
u1.__index = u1
function u1.new() --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3.enabled = false
    v3.moveVector = Vector3.new(0, 0, 0)
    v3.moveVectorIsCameraRelative = true
    v3.isJumping = false
    return v3
end
function u1.OnRenderStepped(_, _) --[[ Line: 23 ]] end
function u1.GetMoveVector(p4) --[[ Line: 27 ]]
    return p4.moveVector
end
function u1.IsMoveVectorCameraRelative(p5) --[[ Line: 31 ]]
    return p5.moveVectorIsCameraRelative
end
function u1.GetIsJumping(p6) --[[ Line: 35 ]]
    return p6.isJumping
end
function u1.Enable(_, _) --[[ Line: 41 ]]
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
    return false
end
return u1