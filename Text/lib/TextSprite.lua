-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Text.lib.TextSprite
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

game:GetService("ReplicatedStorage")
local u1 = game:GetService("RunService")
local v2 = script.Parent
local u3 = require(v2.XMLParser)
local u4 = require(v2.Signal)
local u5 = require(v2.Util)
local u6 = {}
local u7 = {
    Vector2.new(-2, -2),
    Vector2.new(2, 2),
    Vector2.new(2, -2),
    Vector2.new(-2, 2)
}
local u8 = {}
u8.__index = u8
function u8.new(p9, p10) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u1
    --]]
    local v11 = p9 == "ImageLabel"
    local v12 = {
        ["Instance"] = Instance.new(p9),
        ["Destroyed"] = false,
        ["StrokeInstances"] = {},
        ["AnimationEnabled"] = v11,
        ["AnimationTimer"] = 0,
        ["AnimationCompleted"] = true,
        ["Animation"] = nil,
        ["AnimationName"] = "",
        ["Looped"] = false,
        ["Frame"] = 1,
        ["LastFrame"] = nil,
        ["XMLFramePath"] = 1,
        ["RectOffsetOffset"] = Vector2.new(0, 0),
        ["RectSizeOffset"] = Vector2.new(0, 0),
        ["Stroke"] = false,
        ["StrokeColor3"] = Color3.new(1, 1, 1),
        ["Position"] = Vector2.new(0, 0),
        ["Size"] = v11 and Vector2.new(1, 1) or Vector2.new(100, 100),
        ["ScreenSize"] = u5.ScreenSize,
        ["Parent"] = nil,
        ["ImageID"] = "",
        ["XML"] = nil,
        ["ScaleFactor"] = 1,
        ["Animations"] = {},
        ["UpdateConnection"] = nil,
        ["OnAnimationCompleted"] = u4.new()
    }
    local v13 = u8
    local u14 = setmetatable(v12, v13)
    u14.Instance.BackgroundTransparency = 1
    u14.Instance.AnchorPoint = Vector2.new(0.5, 0.5)
    if p10 == false then
        u14.UpdateConnection = u1.RenderStepped:Connect(function(p15) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14:UpdateSprite(p15)
        end)
    end
    return u14
end
function u8.SetScaleFactor(p16, p17) --[[ Line: 90 ]]
    if p16.AnimationEnabled then
        p16.ScaleFactor = p17
    else
        warn("Animation is not enabled for instances of type: " .. p16.Instance.ClassName)
    end
end
function u8.LoadGraphic(p18, p19, p20) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    if p18.AnimationEnabled then
        if type(p20) ~= "string" then
            error("Invalid argument #2 to LoadGraphic(). String expected, got ModuleScript. Did you call require() first?")
        end
        if u6[p20] then
            p18.XML = u6[p20]
        else
            print("Parsing new XML!")
            p18.XML = u3.parse(p20)
            u6[p20] = p18.XML
        end
        p18.Instance.Image = p19
        p18.ImageID = p19
    else
        warn("Animation is not enabled for instances of type: " .. p18.Instance.ClassName)
    end
end
function u8.LoadImage(p21, p22) --[[ Line: 123 ]]
    if p21.AnimationEnabled then
        p21.ImageID = p22
        p21.Instance.Image = p22
    else
        warn("Animation is not enabled for instances of type: " .. p21.Instance.ClassName)
    end
end
function u8.AddByPrefix(p23, p24, p25, p26) --[[ Line: 133 ]]
    if p23.AnimationEnabled then
        if not (p23.ImageID and p23.XML) then
            error("No ImageID and XML loaded. Please use LoadGraphic()")
        end
        local v27 = p23.XML.children[p23.XMLFramePath].children
        local v28 = {
            ["Framerate"] = p26,
            ["Frames"] = {}
        }
        for v29 = 1, #v27 do
            local v30 = v27[v29].attrs
            if v30 and v30.name then
                local v31 = v30.name
                local v32 = string.len(p25)
                if string.sub(v31, 1, v32) == p25 then
                    local v33 = Vector2.new(v30.width * p23.ScaleFactor, v30.height * p23.ScaleFactor)
                    local v34 = Vector2.new(v30.x * p23.ScaleFactor, v30.y * p23.ScaleFactor)
                    local v35 = Vector2.new(v30.width, v30.height)
                    local v36 = {
                        ["ImageRectSize"] = v33,
                        ["ImageRectOffset"] = v34,
                        ["Offset"] = Vector2.new(0, 0),
                        ["ImageSize"] = v35
                    }
                    local v37 = v28.Frames
                    table.insert(v37, v36)
                end
            end
        end
        p23.Animations[p24] = v28
        return v28
    end
    warn("Animation is not enabled for instances of type: " .. p23.Instance.ClassName)
end
function u8.LoadSingleFrameImage(p38, p39, p40) --[[ Line: 196 ]]
    if p38.AnimationEnabled then
        local v41 = {
            ["Framerate"] = 24
        }
        local v42 = {
            {
                ["ImageRectSize"] = Vector2.new(0, 0),
                ["ImageRectOffset"] = Vector2.new(0, 0),
                ["Offset"] = Vector2.new(0, 0),
                ["ImageSize"] = p39
            }
        }
        v41.Frames = v42
        p38.Animations[p40] = v41
    else
        warn("Animation is not enabled for instances of type: " .. p38.Instance.ClassName)
    end
end
function u8.AddManual(p43, p44, p45) --[[ Line: 217 ]]
    if p43.AnimationEnabled then
        p43.Animations[p44] = p45
    else
        warn("Animation is not enabled for instances of type: " .. p43.Instance.ClassName)
    end
end
function u8.Play(p46, p47, p48) --[[ Line: 226 ]]
    if p46.AnimationEnabled then
        if p46.AnimationCompleted or p48 then
            p46.Animation = p46.Animations[p47]
            p46.AnimationName = p47
            p46.Looped = false
            p46.Frame = 1
            p46.AnimationTimer = 0
            p46.AnimationCompleted = false
            p46:UpdateImage()
        end
    else
        warn("Animation is not enabled for instances of type: " .. p46.Instance.ClassName)
    end
end
function u8.PlayLooped(p49, p50, p51) --[[ Line: 243 ]]
    if p49.AnimationEnabled then
        if p49.AnimationCompleted or p51 then
            p49.Animation = p49.Animations[p50]
            p49.AnimationName = p50
            p49.Looped = true
            p49.Frame = 1
            p49.AnimationTimer = 0
            p49.AnimationCompleted = false
            p49:UpdateImage()
        end
    else
        warn("Animation is not enabled for instances of type: " .. p49.Instance.ClassName)
    end
end
function u8.Stop(p52) --[[ Line: 260 ]]
    if p52.AnimationEnabled then
        p52.AnimationCompleted = true
        p52.AnimationLooped = false
        p52.CurrentFrame = 1
        p52.CurrentAnimationName = ""
        p52.CurrentAnimation = nil
        p52:UpdateImage(0.016666666666666666)
    else
        warn("Animation is not enabled for instances of type: " .. p52.Instance.ClassName)
    end
end
function u8.UpdateImage(p53) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p53.Stroke then
        if #p53.StrokeInstances < 1 then
            for v54 = 1, #u7 do
                p53.StrokeInstances[v54] = p53.Instance:Clone()
            end
        end
    elseif #p53.StrokeInstances > 0 then
        for v55 = 1, #p53.StrokeInstances do
            if p53.StrokeInstances[v55] then
                p53.StrokeInstances[v55]:Destroy()
            end
        end
    end
    if p53.AnimationEnabled then
        if p53.LastFrame or not p53.AnimationCompleted then
            if p53.Animation then
                p53.LastFrame = p53.Animation.Frames[p53.Frame]
            end
            if p53.LastFrame then
                p53.Instance.ImageRectOffset = p53.LastFrame.ImageRectOffset + p53.RectOffsetOffset
                p53.Instance.ImageRectSize = p53.LastFrame.ImageRectSize + p53.RectSizeOffset
                p53.Instance.Size = UDim2.fromScale(p53.LastFrame.ImageSize.X / p53.ScreenSize.X * p53.Size.X, p53.LastFrame.ImageSize.Y / p53.ScreenSize.Y * p53.Size.Y)
                p53.Instance.Position = UDim2.fromScale((p53.Position.X + p53.LastFrame.Offset.X * p53.Size.X) / p53.ScreenSize.X, (p53.Position.Y + p53.LastFrame.Offset.Y * p53.Size.Y) / p53.ScreenSize.Y)
            end
        end
        if p53.Stroke and #p53.StrokeInstances > 0 then
            for v56 = 1, #p53.StrokeInstances do
                local v57 = p53.StrokeInstances[v56]
                v57.ImageColor3 = p53.StrokeColor3
                v57.Size = p53.Instance.Size
                v57.Parent = p53.Instance.Parent
                v57.Image = p53.Instance.Image
                v57.ImageRectOffset = p53.Instance.ImageRectOffset
                v57.ImageRectSize = p53.Instance.ImageRectSize
                v57.Position = p53.Instance.Position + UDim2.fromScale(u7[v56].X * p53.Size.X / p53.ScreenSize.X, u7[v56].Y * p53.Size.Y / p53.ScreenSize.Y)
                v57.ZIndex = p53.Instance.ZIndex - 1
            end
        end
    else
        warn("Animation is not enabled for instances of type: " .. p53.Instance.ClassName)
    end
end
function u8.UpdatePosAndSize(p58) --[[ Line: 341 ]]
    p58.Instance.Size = UDim2.fromScale(p58.Size.X / p58.ScreenSize.X, p58.Size.Y / p58.ScreenSize.Y)
    p58.Instance.Position = UDim2.fromScale(p58.Position.X / p58.ScreenSize.X, p58.Position.Y / p58.ScreenSize.Y)
end
function u8.UpdateSprite(p59, p60) --[[ Line: 354 ]]
    if p59.Destroyed then
        return
    elseif p59.AnimationEnabled then
        p59:UpdateImage()
        if not p59.AnimationCompleted and p59.Animation then
            local v61 = 1 / p59.Animation.Framerate
            p59.AnimationTimer = p59.AnimationTimer + p60
            while v61 <= p59.AnimationTimer and not p59.AnimationCompleted do
                p59.Frame = p59.Frame + 1
                if p59.Frame > #p59.Animation.Frames then
                    if p59.Looped then
                        p59.Frame = 1
                    else
                        p59.AnimationCompleted = true
                        p59.Animation = nil
                        p59.OnAnimationCompleted:Fire(p59.AnimationName)
                    end
                else
                    p59:UpdateImage()
                end
                p59.AnimationTimer = p59.AnimationTimer - v61
            end
        end
    else
        p59:UpdatePosAndSize()
    end
end
function u8.DestroySprite(p62) --[[ Line: 390 ]]
    p62.Destroyed = true
    p62.OnAnimationCompleted:DisconnectAll()
    if p62.UpdateConnection then
        p62.UpdateConnection:Disconnect()
    end
    p62.Instance:Destroy()
    if #p62.StrokeInstances > 0 then
        for v63 = 1, #p62.StrokeInstances do
            if p62.StrokeInstances[v63] then
                p62.StrokeInstances[v63]:Destroy()
            end
        end
    end
end
return u8