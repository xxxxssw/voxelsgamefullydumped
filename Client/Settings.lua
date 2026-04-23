-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Settings
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local u2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("Lighting")
local u4 = require(game.ReplicatedStorage.Systems.PlayersSystem.Libs.RenderDistance)
local u5 = u3.CloudsSystem
local u6 = v1.LocalPlayer
local u7 = u2.Client.States.UIScale
local u8 = Color3.fromRGB(255, 90, 90)
local u9 = Color3.fromRGB(138, 255, 165)
local u14 = {
    ["description"] = "Render distance",
    ["valueChanged"] = u4.changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 19 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u8
            [4] = u9
        --]]
        local v10 = u4.getRenderDistance(u6)
        local v11
        if v10 > 4 then
            v11 = u8
        else
            v11 = nil
        end
        if v10 < 3 then
            v11 = u9
        end
        return v10, v11
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 31 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
        --]]
        local v12 = u14.getSettingValue()
        u4.client_updateRenderDistance(v12 + 1)
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 36 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
        --]]
        local v13 = u14.getSettingValue()
        u4.client_updateRenderDistance(v13 - 1)
    end
}
local v15 = {
    ["description"] = "Terrain generation",
    ["valueChanged"] = u2.Client.States.FastChunkLoading.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 46 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        if u2.Client.States.FastChunkLoading.Value then
            return "FAST", u8
        else
            return "SMOOTH"
        end
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 55 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.FastChunkLoading.Value = true
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 59 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.FastChunkLoading.Value = false
    end
}
local v22 = {
    ["description"] = "Interface scale",
    ["valueChanged"] = u7.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 68 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v16 = u7.Value * 10
        return math.floor(v16) / 10
    end,
    ["setValue"] = function(p17) --[[ Name: setValue, Line 72 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v18 = u7
        local v19 = p17 * 10
        v18.Value = math.floor(v19) / 10
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 76 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v20 = u7
        v20.Value = v20.Value + 0.1
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 80 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v21 = u7
        v21.Value = v21.Value - 0.1
    end
}
local v28 = {
    ["description"] = "Clouds",
    ["valueChanged"] = u5.CloudsQuality.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 89 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
        --]]
        local v23 = u5.CloudsQuality.Value
        if v23 == 0 then
            return "OFF"
        end
        if v23 == 1 then
            return "LOW"
        end
        if v23 == 2 then
            return "HIGH", u8
        end
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 100 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v24 = u5.CloudsQuality
        local v25 = u5.CloudsQuality.Value + 1
        v24.Value = math.min(2, v25)
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 104 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v26 = u5.CloudsQuality
        local v27 = u5.CloudsQuality.Value - 1
        v26.Value = math.max(0, v27)
    end
}
local v33 = {
    ["description"] = "Fov",
    ["valueChanged"] = u2.Client.States.BaseFov.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 113 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.Client.States.BaseFov.Value .. "\194\176"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 118 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v29 = u2.Client.States.BaseFov.Value + 5
        local v30 = math.min(v29, 90)
        u2.Client.States.BaseFov.Value = v30
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 124 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v31 = u2.Client.States.BaseFov.Value - 5
        local v32 = math.max(v31, 65)
        u2.Client.States.BaseFov.Value = v32
    end
}
local v39 = {
    ["description"] = "Background chunks",
    ["valueChanged"] = u2.Client.States.HorizonDistance.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 135 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v34 = u2.Client.States.HorizonDistance.Value
        return v34 == 0 and "OFF" or v34
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 140 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v35 = u2.Client.States.HorizonDistance.Value + 1
        local v36 = math.min(v35, 4)
        u2.Client.States.HorizonDistance.Value = v36
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 146 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v37 = u2.Client.States.HorizonDistance.Value - 1
        local v38 = math.max(v37, 0)
        u2.Client.States.HorizonDistance.Value = v38
    end
}
local v40 = {
    ["description"] = "Ambient sounds",
    ["valueChanged"] = u2.Client.LocalSounds.AmbientSounds.SettingEnabled.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 157 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.Client.LocalSounds.AmbientSounds.SettingEnabled.Value and "ON" or "OFF"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 161 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.LocalSounds.AmbientSounds.SettingEnabled.Value = true
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 165 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.LocalSounds.AmbientSounds.SettingEnabled.Value = false
    end
}
local v46 = {
    ["description"] = "Grass quality",
    ["valueChanged"] = u2.Client.States.GrassQuality.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 174 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u8
        --]]
        local v41 = u2.Client.States.GrassQuality.Value
        if v41 == 1 then
            return "LOW", u9
        end
        if v41 == 2 then
            return "MEDIUM"
        end
        if v41 == 3 then
            return "HIGH", u8
        end
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 185 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v42 = u2.Client.States.GrassQuality.Value + 1
        local v43 = math.min(v42, 3)
        u2.Client.States.GrassQuality.Value = v43
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 191 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v44 = u2.Client.States.GrassQuality.Value - 1
        local v45 = math.max(v44, 1)
        u2.Client.States.GrassQuality.Value = v45
    end
}
local v47 = {
    ["description"] = "World markers",
    ["valueChanged"] = u2.Client.States.MarkersEnabled.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 202 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.Client.States.MarkersEnabled.Value and "ON" or "OFF"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 206 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.MarkersEnabled.Value = true
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 210 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.MarkersEnabled.Value = false
    end
}
local v48 = {
    ["description"] = "Show my location",
    ["valueChanged"] = u6:GetAttributeChangedSignal("PlayerMarkerHidden"),
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 219 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6:GetAttribute("PlayerMarkerHidden") and "NO ONE" or "FRIENDS"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 223 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Systems.PlayersSystem.Network.HideMyMarker:FireServer(true)
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 227 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Systems.PlayersSystem.Network.HideMyMarker:FireServer(false)
    end
}
local v49 = {
    ["description"] = "Coordinates",
    ["valueChanged"] = u2.Client.States.ShowCoordinatesGui.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 236 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.Client.States.ShowCoordinatesGui.Value and "ON" or "OFF"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 240 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.ShowCoordinatesGui.Value = true
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 244 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.ShowCoordinatesGui.Value = false
    end
}
local v50 = {
    ["description"] = "Depth of field",
    ["valueChanged"] = u2.Client.States.DofEnabled.Changed,
    ["getSettingValue"] = function() --[[ Name: getSettingValue, Line 255 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.Client.States.DofEnabled.Value and "ON" or "OFF"
    end,
    ["increaseSettingValue"] = function() --[[ Name: increaseSettingValue, Line 259 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.DofEnabled.Value = true
    end,
    ["decreaseSettingValue"] = function() --[[ Name: decreaseSettingValue, Line 263 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.Client.States.DofEnabled.Value = false
    end
}
local function v53() --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v51 = u3.DepthOfField
    local v52
    if u2.Client.States.HorizonDistance.Value > 0 then
        v52 = u2.Client.States.DofEnabled.Value
    else
        v52 = false
    end
    v51.Enabled = v52
end
v39.valueChanged:Connect(v53)
v50.valueChanged:Connect(v53)
local v54 = u3.DepthOfField
local v55
if u2.Client.States.HorizonDistance.Value > 0 then
    v55 = u2.Client.States.DofEnabled.Value
else
    v55 = false
end
v54.Enabled = v55
local v56 = {
    ["Settings"] = {
        ["RenderDistanceSetting"] = u14,
        ["HorizonSetting"] = v39,
        ["CloudsSetting"] = v28,
        ["GuiScaleSetting"] = v22,
        ["AmbientSoundsSettings"] = v40,
        ["GrassQualitySettings"] = v46,
        ["MarkersSettings"] = v47,
        ["DepthOfFieldSettings"] = v50,
        ["ShowCoordinatesGuiSettings"] = v49,
        ["HideMyMarkerSetting"] = v48,
        ["FastChunkLoading"] = v15,
        ["BaseFovSetting"] = v33
    },
    ["Layout"] = {
        "Graphics",
        u14,
        v28,
        v46,
        "Interface",
        v22,
        v47,
        v48,
        "Audio",
        v40,
        "Experimental",
        v15,
        v33
    }
}
return v56