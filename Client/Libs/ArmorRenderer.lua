-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Client.Libs.ArmorRenderer
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local v1 = game:GetService("Players")
local u2 = require(game.ReplicatedStorage.Configuration.Items.ArmorItems)
local u3 = require(game.ReplicatedStorage.Libs.Utils)
local u4 = require(game.ReplicatedStorage.Client.LocalSounds.LocalSoundPlayer)
local _ = v1.LocalPlayer
return {
    ["slots"] = u2.slots,
    ["reset"] = function(p5) --[[ Name: reset, Line 13 ]]
        local v6 = p5:FindFirstChild("Wearables")
        if v6 ~= nil then
            v6:Destroy()
        end
    end,
    ["clear"] = function(p7, p8, p9) --[[ Name: clear, Line 20 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v10 = p7:FindFirstChild("Wearables")
        local v11 = v10 and v10:FindFirstChild(p8)
        if v11 then
            if p9 then
                u4.play("Cloth2")
            end
            v11:Destroy()
        end
    end,
    ["render"] = function(p12, p13, p14) --[[ Name: render, Line 33 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u3
        --]]
        local v15 = u2.render[p13]
        if v15 == nil then
            return warn("Attempt to render invalid itemId")
        end
        local v16 = p12:FindFirstChild("Wearables")
        if v16 == nil then
            v16 = Instance.new("Folder")
            v16.Name = "Wearables"
            v16.Parent = p12
        end
        local v17 = v15.geometry
        local v18 = v17.Parent.Name
        local v19 = v16:FindFirstChild(v18)
        if v19 ~= nil then
            if v19:GetAttribute("RenderedItemId") == p13 then
                return
            end
            v19:Destroy()
        end
        local v20 = v17:Clone()
        if p14 then
            u4.play("Cloth1")
        end
        for _, v21 in ipairs(v20:GetDescendants()) do
            if v21.Name == "Inner" then
                v21.Color = v15.colors.mainColor
            elseif v21.Name == "Outline" then
                v21.Color = v15.colors.outlinesColor
            elseif v21:IsA("Model") then
                u3.weldModel(v21)
            end
        end
        v20:SetAttribute("RenderedItemId", p13)
        v20.Name = v18
        v20.Parent = v16
        for _, v22 in ipairs(v20:GetChildren()) do
            local v23 = p12:FindFirstChild(v22.Name, true)
            if v23 then
                v22:PivotTo(v23.CFrame)
                local v24 = Instance.new("WeldConstraint")
                v24.Part0 = v23
                v24.Part1 = v22.PrimaryPart
                v24.Parent = v20
            else
                warn(v22:GetFullName() .. "is supposed to be weld to " .. p12:GetFullName() .. "." .. v22.Name .. ", but none was found")
            end
        end
    end
}