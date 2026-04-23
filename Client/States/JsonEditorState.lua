-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.States.JsonEditorState
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("HttpService")
local u2 = Instance.new("BindableEvent")
local u3 = Instance.new("BindableEvent")
local u8 = {
    ["state"] = {
        ["enabled"] = false,
        ["file"] = nil,
        ["jsonString"] = ""
    },
    ["changed"] = u2.Event,
    ["editorClosed"] = u3.Event,
    ["open"] = function(p4, p5) --[[ Name: open, Line 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u1
            [3] = u2
        --]]
        u8.state.file = p4
        u8.state.jsonString = u1:JSONEncode(p5)
        u8.state.enabled = true
        u2:Fire()
    end,
    ["displayString"] = function(p6) --[[ Name: displayString, Line 23 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
        --]]
        u8.state.file = Vector3.new()
        u8.state.jsonString = p6
        u8.state.enabled = true
        u2:Fire()
    end,
    ["close"] = function() --[[ Name: close, Line 30 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u3
        --]]
        u8.state.enabled = false
        u2:Fire()
        u3:Fire(nil)
    end,
    ["commit"] = function(p7) --[[ Name: commit, Line 36 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u2
        --]]
        u3:Fire(p7)
        u8.state.enabled = false
        u2:Fire()
    end
}
return u8