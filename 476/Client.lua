-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Geometry.Blocks.476.Client
-- Source: decompile
-- Dumped: 2026-04-23 03:45:19

local v1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
if script:IsDescendantOf(v1) then
    return
else
    local u2 = require(game.ReplicatedStorage.Libs.BlockState)
    require(game.ReplicatedStorage.Libs.Utils)
    local u3 = require(game.ReplicatedStorage.Libs.BlockMetadata)
    local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.BlockOrientation.UtilsOrientation)
    local u5 = script.Parent
    local u6 = u5:FindFirstChild("Side")
    if u6 then
        u6.Parent = nil
        local function u17(p7) --[[ Line: 20 ]]
            local v8 = p7.CFrame
            local v9 = p7.Size
            local v10 = {}
            local v11 = v8 + v8.LookVector * v9.Z / 2
            local v12 = v8 - v8.LookVector * v9.Z / 2
            local v13 = v11 + v11.UpVector * v9.Y / 2
            local v14 = v11 - v11.UpVector * v9.Y / 2
            local v15 = v12 + v12.UpVector * v9.Y / 2
            local v16 = v12 - v12.UpVector * v9.Y / 2
            v10.topFrontRight = (v13 + v13.RightVector * v9.X / 2).Position
            v10.topFrontLeft = (v13 - v13.RightVector * v9.X / 2).Position
            v10.bottomFrontRight = (v14 + v14.RightVector * v9.X / 2).Position
            v10.bottomFrontLeft = (v14 - v14.RightVector * v9.X / 2).Position
            v10.topBackRight = (v15 + v15.RightVector * v9.X / 2).Position
            v10.topBackLeft = (v15 - v15.RightVector * v9.X / 2).Position
            v10.bottomBackRight = (v16 + v16.RightVector * v9.X / 2).Position
            v10.bottomBackLeft = (v16 - v16.RightVector * v9.X / 2).Position
            return v10
        end
        local u18 = {
            "east",
            "west",
            "north",
            "south"
        }
        local function v38() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u2
                [3] = u3
                [4] = u18
                [5] = u6
                [6] = u4
                [7] = u17
            --]]
            local v19 = u5:GetAttribute(u2.ATTRIBUTE)
            local v20 = u2.getBlockId(v19)
            local v21 = u2.getMetadata(v19)
            local v22 = u3.getPropertiesValuesTable(v20, v21.compressed)
            for _, v23 in u18 do
                local v24 = u5:FindFirstChild(v23)
                if v22[v23] == true then
                    if not v24 then
                        local v25 = u6:Clone()
                        local v26 = u4.FacingCFrames[v23]
                        v25:SetPrimaryPartCFrame(u6:GetPrimaryPartCFrame() * v26)
                        v25.Name = v23
                        v25.Parent = u5
                    end
                elseif v24 then
                    v24:Destroy()
                end
            end
            local v27 = {
                ["xmin"] = (1 / 0),
                ["xmax"] = (-1 / 0),
                ["zmin"] = (1 / 0),
                ["zmax"] = (-1 / 0),
                ["ymin"] = (1 / 0)
            }
            for _, v28 in u5:GetDescendants() do
                if v28.Name == "Geometry" then
                    for _, v29 in u17(v28) do
                        v27.xmax = v29.X > v27.xmax and v29.X or v27.xmax
                        v27.xmin = v29.X < v27.xmin and v29.X or v27.xmin
                        v27.zmax = v29.Z > v27.zmax and v29.Z or v27.zmax
                        v27.zmin = v29.Z < v27.zmin and v29.Z or v27.zmin
                        v27.ymin = v29.Y < v27.ymin and v29.Y or v27.ymin
                    end
                end
            end
            local v30 = u5.Hitbox
            local v31 = v27.xmax - v27.xmin
            local v32 = v27.zmax - v27.zmin
            local v33 = Vector3.new(v31, 4, v32)
            local v34 = v27.xmin
            local v35 = v27.ymin
            local v36 = v27.zmin
            local v37 = Vector3.new(v34, v35, v36)
            v30.Size = v33
            v30.Position = v37 + v33 / 2
        end
        u5:GetAttributeChangedSignal(u2.ATTRIBUTE):Connect(v38)
        v38()
    end
end