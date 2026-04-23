-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.MarkerSystem.UpdateMarker
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Workspace")
local v2 = game:GetService("Players")
local u3 = game:GetService("ReplicatedStorage")
local u4 = require(game.ReplicatedStorage.Libs.Coordinates)
local u5 = v1.CurrentCamera
local u6 = v2.LocalPlayer
local function u11(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u4
    --]]
    local v8 = p7.where
    if typeof(v8) == "Instance" and p7.where:IsA("Player") then
        if u6:GetAttribute("MarkerSystem_AdminLocatorEnabled") then
            return false
        else
            return u3.Client.States.CurrentDimension.Value ~= u4.getDimensionId(p7.where:GetAttribute("LastPosition")) and true or p7.where:GetAttribute("PlayerMarkerHidden") == true
        end
    else
        local v9 = p7.where
        if typeof(v9) == "Vector3" then
            local v10 = u4.coordinatesFromWorkspaceVector3(p7.where)
            if u3.Client.States.CurrentDimension.Value ~= u4.getDimensionId(v10) then
                return true
            end
        end
        return false
    end
end
return function(p12) --[[ Name: UpdateMarker, Line 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
    --]]
    local v13 = u5.ViewportSize.X
    local v14 = u5.ViewportSize.Y
    local v15 = p12.where
    local v16 = p12.markerGui.Bubble.AbsoluteSize.X
    local v17 = v13 - v16 * 2
    local v18 = v14 - v16 * 2
    local v19 = u5.CFrame
    local v20 = (v17 / 2) ^ 2 + (v18 / 2) ^ 2
    local v21 = math.sqrt(v20)
    local v22 = u5.CFrame.LookVector
    local _ = Vector2.new(v22.X, v22.Z).Unit
    local v23 = p12.markerGui
    local v24 = nil
    if typeof(v15) == "Vector3" then
        v23.Visible = not u11(p12)
    elseif typeof(v15) == "Instance" and v15:IsA("Player") then
        if v15:GetAttribute("LastPosition") == nil or u11(p12) then
            v23.Visible = false
            return false
        end
        v23.Visible = true
        local v25 = v15:GetAttribute("LastPosition")
        v23.Label.Text = v15.DisplayName
        v15 = v25
    else
        v15 = v24
    end
    local v26, v27 = u5:WorldToViewportPoint(v15)
    local v28 = v26.X
    local v29 = v13 - v16
    local v30 = math.clamp(v28, v16, v29)
    local v31 = v26.Y
    local v32 = v14 - v16
    local v33 = math.clamp(v31, v16, v32)
    if v30 == v26.X and (v33 == v26.Y and v27) then
        v23.ArrowFrame.Visible = false
    else
        v23.ArrowFrame.Visible = true
        local v34 = v19:VectorToObjectSpace(v15 - v19.Position)
        local v35 = Vector2.new(v34.X, v34.Y).Unit
        local v36 = v35 * v21
        local v37 = v35.X
        local v38 = v35.Y
        local v39 = math.atan2(v37, v38)
        local v40 = v36.Y
        local v41
        if math.abs(v40) > v18 / 2 then
            local v42 = v18 / 2 / v35.Y
            v41 = v35 * math.abs(v42)
        else
            local v43 = v17 / 2 / v35.X
            v41 = v35 * math.abs(v43)
        end
        v30 = v13 / 2 + v41.X
        v33 = v14 / 2 - v41.Y
        v23.ArrowFrame.Rotation = math.deg(v39)
    end
    v23.Position = UDim2.fromOffset(v30, v33)
    local v44 = v23.Parent
    local v45 = v44.AbsoluteSize * 0.5
    local v46 = (v23.AbsolutePosition + Vector2.new(0, 36) - v45).Magnitude
    local v47 = v44.AbsoluteSize.Y
    local v48 = v44.AbsoluteSize.X
    local v49 = v46 < math.min(v47, v48) * 0.25
    local v50 = (v15 - u5.CFrame.Position).Magnitude
    local v51 = math.floor(v50)
    if v51 < 104 and p12.name ~= "Compass" then
        v23.Visible = false
        if p12.destroyWhenClose then
            return true
        end
    end
    if v49 then
        v23.Label.Visible = true
        v23.Distance.Visible = true
        v23.Bubble.ImageTransparency = 0
        v23.ArrowFrame.ImageLabel.ImageTransparency = 0
        v23.InnerIcon.ImageTransparency = 0
        local v52 = v23.Distance
        local v53 = v51 / 4
        v52.Text = math.floor(v53) .. "m"
    else
        v23.Label.Visible = false
        v23.Distance.Visible = false
        v23.Bubble.ImageTransparency = 0.3
        v23.ArrowFrame.ImageLabel.ImageTransparency = 0.6
        v23.InnerIcon.ImageTransparency = 0
    end
    return false
end