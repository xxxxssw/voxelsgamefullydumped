-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Text
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local u1 = Vector2.new(1920, 1080)
game:GetService("ReplicatedStorage")
local u2 = game:GetService("RunService")
local u3 = require(script.lib.TextSprite)
local v4 = require(script.lib.Util)
local u5 = require(script.lib.Unicode)
v4.ScreenSize = u1
local u6 = {}
u6.__index = u6
function u6.new(p7, p8) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    local v9 = script.Fonts:FindFirstChild(p7)
    if not v9 then
        error(p7 .. " was not found in font folder.")
    end
    local v10 = {
        ["Parent"] = nil,
        ["Sprites"] = {},
        ["Folder"] = v9,
        ["Text"] = "",
        ["OldText"] = "",
        ["TextCentered"] = false,
        ["Stroke"] = false,
        ["TextColor3"] = Color3.new(1, 1, 1),
        ["StrokeColor3"] = Color3.new(0, 0, 0),
        ["ZIndex"] = 1,
        ["Position"] = Vector2.new(0, 0),
        ["TextSize"] = 1,
        ["UpdateConnection"] = nil,
        ["FontData"] = require(v9.FontData),
        ["ImageID"] = v9.ImageID.Value,
        ["CanUpdate"] = true
    }
    local v11 = u6
    local u12 = setmetatable(v10, v11)
    if p8 then
        u12.UpdateConnection = u2.RenderStepped:Connect(function(p13) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12:Update(p13)
        end)
    end
    return u12
end
function u6.GetTextGUI(p14) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v15 = Instance.new("ScreenGui")
    v15.DisplayOrder = p14 or 0
    v15.ResetOnSpawn = false
    v15.IgnoreGuiInset = true
    v15.Enabled = true
    local v16 = Instance.new("Frame")
    v16.BackgroundTransparency = 1
    v16.Size = UDim2.fromScale(1, 1)
    v16.Position = UDim2.fromScale(0.5, 0.5)
    v16.AnchorPoint = Vector2.new(0.5, 0.5)
    v16.Parent = v15
    v16.Name = "TextParent"
    local v17 = Instance.new("UIAspectRatioConstraint")
    v17.AspectRatio = u1.X / u1.Y
    v17.Parent = v16
    return v15
end
function u6.GetVirtualResolution() --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1
end
function u6.Update(p18, p19) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    if p18.CanUpdate then
        for v20 = 1, #p18.Sprites do
            p18.Sprites[v20].Stroke = p18.Stroke
            p18.Sprites[v20].StrokeColor3 = p18.StrokeColor3
            p18.Sprites[v20]:UpdateSprite(p19)
            if p18.Sprites[v20].Instance.Parent ~= p18.Parent then
                p18.Sprites[v20].Instance.Parent = p18.Parent
            end
            p18.Sprites[v20].Instance.ImageColor3 = p18.TextColor3
        end
        if p18.Text ~= p18.OldText then
            local v21 = p18.OldText
            local v22 = string.len(v21)
            p18.OldText = p18.Text
            local v23 = p18.Text
            local v24 = string.len(v23)
            local v25 = string.split(p18.Text, "")
            local v26 = v24 - v22
            local v27 = 0
            if v26 ~= 0 then
                if v26 > 0 then
                    for _ = 1, math.abs(v26) do
                        local v28 = p18.Sprites
                        local v29 = u3.new
                        table.insert(v28, v29("ImageLabel", false))
                    end
                else
                    for v30 = 1, math.abs(v26) do
                        p18.Sprites[v30]:DestroySprite()
                    end
                    local v31 = {}
                    for v32 = 1, #p18.Sprites do
                        if not p18.Sprites[v32].Destroyed then
                            local v33 = p18.Sprites[v32]
                            table.insert(v31, v33)
                        end
                    end
                    p18.Sprites = v31
                end
            end
            for v34 = 1, v24 do
                p18.Sprites[v34].Stroke = p18.Stroke
                p18.Sprites[v34].StrokeColor3 = p18.StrokeColor3
                p18.Sprites[v34]:LoadImage(p18.ImageID)
                p18.Sprites[v34].SpriteName = v25[v34]
                p18.Sprites[v34].Instance.ZIndex = p18.ZIndex
                p18.Sprites[v34].Size = Vector2.new(p18.TextSize, p18.TextSize)
                local v35 = p18.FontData[u5[v25[v34]]]
                local v36 = {
                    ["Framerate"] = 24,
                    ["Frames"] = {
                        {
                            ["ImageRectSize"] = Vector2.new(v35.width, v35.height),
                            ["ImageRectOffset"] = Vector2.new(v35.x, v35.y),
                            ["Offset"] = Vector2.new(v35.xoffset, v35.yoffset / 2),
                            ["ImageSize"] = Vector2.new(v35.width, v35.height)
                        }
                    }
                }
                p18.Sprites[v34]:AddManual(v25[v34], v36)
                p18.Sprites[v34]:Play(v25[v34], true)
                if v25[v34] == " " then
                    v27 = v27 + v35.xadvance * p18.TextSize
                else
                    v27 = v27 + v35.width * p18.TextSize
                end
            end
            local v37 = p18.Position.X
            if p18.TextCentered then
                v37 = v37 - v27 / 2
            end
            local v38 = p18.Position.Y
            for v39 = 1, v24 do
                local v40 = v25[v39 + 1] or v25[v39]
                local v41 = p18.FontData[u5[v40]].width
                if v40 == " " then
                    v41 = p18.FontData[u5[v40]].xadvance
                end
                p18.Sprites[v39].Position = Vector2.new(v37, v38)
                v37 = v37 + v41 * p18.TextSize
            end
        end
    end
end
function u6.Destroy(p42) --[[ Line: 225 ]]
    p42.CanUpdate = false
    for v43 = 1, #p42.Sprites do
        p42.Sprites[v43]:DestroySprite()
    end
    if p42.UpdateConnection then
        p42.UpdateConnection:Disconnect()
    end
end
return u6