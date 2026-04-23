-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.Cursor
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("Workspace")
local u2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local u4 = game:GetService("ReplicatedStorage")
game:GetService("GuiService")
local u5 = game:GetService("CollectionService")
local u6 = require(game.ReplicatedStorage.Libs.Culling)
local u7 = require(game.ReplicatedStorage.Libs.Coordinates)
local u8 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u9 = require(game.ReplicatedStorage.Libs.Utils)
local u10 = require(game.ReplicatedStorage.Libs.BlockState)
local u11 = require(game.ReplicatedStorage.Configuration.Blocks.BlockTags)
local u12 = require(game.ReplicatedStorage.Libs.GetGuiInset)
local u13 = v3.LocalPlayer
local u14 = u1.CurrentCamera
local u15 = RaycastParams.new()
local u16 = RaycastParams.new()
local u17 = RaycastParams.new()
local u18 = script.OutlinesPart:Clone()
local u19 = script.OutlinesPart:Clone()
local u20 = script.HoveredCoordinates
local u21 = script.hoveredInteractableCoordinates
u18.Parent = nil
u19.Parent = nil
u15.FilterType = Enum.RaycastFilterType.Include
u15.CollisionGroup = "Default"
u16.FilterType = Enum.RaycastFilterType.Include
u16.FilterDescendantsInstances = { u1.Map }
u16.CollisionGroup = "Liquids"
u17.FilterType = Enum.RaycastFilterType.Include
u17.FilterDescendantsInstances = { u1.Map }
u17.CollisionGroup = "Default"
local function u25(p22) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u17
        [3] = u1
        [4] = u13
        [5] = u15
    --]]
    if p22 then
        u17.FilterDescendantsInstances = { u5:GetTagged("Interactable") }
    else
        local v23 = { u1.Map, u1.Entities }
        for _, v24 in ipairs(u1.Characters:GetChildren()) do
            if v24 ~= u13.Character then
                table.insert(v23, v24)
            end
        end
        u15.FilterDescendantsInstances = v23
    end
end
local u69 = {
    ["outlinesPart"] = u18,
    ["getHoveredCharacterOrEntity"] = function() --[[ Name: getHoveredCharacterOrEntity, Line 68 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u14
            [3] = u12
            [4] = u1
            [5] = u15
            [6] = u9
        --]]
        u25()
        local v26 = u14:ScreenPointToRay(u14.ViewportSize.X / 2, u14.ViewportSize.Y / 2 - u12().Y, 0)
        local v27 = u1:Raycast(v26.Origin, v26.Direction * 16, u15)
        if v27 and (v27.Instance and (v27.Instance:IsDescendantOf(u1.Characters) or v27.Instance:IsDescendantOf(u1.Entities))) then
            local v28 = u9.getAncestorParentedTo(v27.Instance, u1.Characters) or u9.getAncestorParentedTo(v27.Instance, u1.Entities)
            if v28.PrimaryPart == nil then
                return nil
            else
                return v28
            end
        else
            return nil
        end
    end,
    ["getHoveredLiquidBlockInstance"] = function() --[[ Name: getHoveredLiquidBlockInstance, Line 86 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u12
            [3] = u1
            [4] = u16
            [5] = u7
        --]]
        local v29 = u14:ScreenPointToRay(u14.ViewportSize.X / 2, u14.ViewportSize.Y / 2 - u12().Y, 0)
        local v30 = u1:Raycast(v29.Origin, v29.Direction * 20, u16)
        if not (v30 and v30.Instance) then
            return nil
        end
        local v31 = u7.coordinatesFromWorkspaceVector3(v30.Position + v29.Direction)
        return v30.Instance, v31
    end,
    ["getHoveredBlockInstance"] = function(p32) --[[ Name: getHoveredBlockInstance, Line 101 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u17
            [3] = u15
            [4] = u14
            [5] = u12
            [6] = u1
        --]]
        u25(p32)
        local v33 = p32 and u17 or u15
        local v34 = u14:ScreenPointToRay(u14.ViewportSize.X / 2, u14.ViewportSize.Y / 2 - u12().Y, 0)
        local v35 = u1:Raycast(v34.Origin, v34.Direction * 20, v33)
        local _ = game.Players.LocalPlayer.UserId == 123
        if not v35 or (not v35.Instance or v35.Instance:FindFirstAncestor("Skybox") ~= nil) then
            return nil
        end
        if v35.Instance:IsDescendantOf(u1.Map) == false then
            return nil
        end
        local v36 = v35.Instance
        if v36.Parent:IsA("Model") then
            return v36.Parent, v35
        end
        if v36.Name ~= "BarrierChunk" then
            return v36, v35
        end
    end,
    ["getHoveredBlockInstanceInteractable"] = function() --[[ Name: getHoveredBlockInstanceInteractable, Line 136 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u14
            [3] = u12
            [4] = u1
            [5] = u15
        --]]
        u25()
        local v37 = u14:ScreenPointToRay(u14.ViewportSize.X / 2, u14.ViewportSize.Y / 2 - u12().Y, 0)
        local v38 = u1:Raycast(v37.Origin, v37.Direction * 20, u15)
        if not v38 or (not v38.Instance or v38.Instance:FindFirstAncestor("Skybox") ~= nil) then
            return nil
        end
        if v38.Instance:IsDescendantOf(u1.Map) == false then
            return nil
        end
        local v39 = v38.Instance
        if v39.Parent:IsA("Model") then
            return v39.Parent, v38
        end
        if v39.Name ~= "BarrierChunk" then
            return v39, v38
        end
    end,
    ["getHoveredBlockState"] = function(p40) --[[ Name: getHoveredBlockState, Line 161 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u20
        --]]
        local v41 = require(game.ReplicatedStorage.Systems.BlocksSystem)
        local v42
        if p40 then
            v42 = u21.Value
        else
            v42 = u20.Value
        end
        if v42 then
            return v41.getBlockState(v42)
        end
    end,
    ["getNamesFromHoveredBlock"] = function(p43) --[[ Name: getNamesFromHoveredBlock, Line 180 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u10
            [3] = u11
            [4] = u7
            [5] = u8
        --]]
        local v44, v45 = u69.getHoveredBlockInstance(p43)
        local v46
        if v44 then
            v46 = v44:GetAttribute(u10.ATTRIBUTE)
        else
            v46 = v44
        end
        local v47 = v46 and u10.getBlockId(v46) or 0
        if not p43 and u11.ManyBlocks[v47] then
            local v48 = v45.Position - 0.05 * v45.Normal
            local v49 = u7.coordinatesFromWorkspaceVector3(v48)
            local v50 = string.split
            local v51 = v44.Parent.Name
            local v52, v53 = table.unpack(v50(v51, "_"))
            return v52, v53, u7.blockNameFromCoordinates(v49)
        end
        if v44 and v44:GetAttribute("PartType") ~= u8.PartType.GreedyMeshingPart then
            local v54 = v44.Name
            local v55 = string.split
            local v56 = v44.Parent.Name
            local v57, v58 = table.unpack(v55(v56, "_"))
            return v57, v58, v54
        end
        if v44 and (v44:GetAttribute("PartType") == u8.PartType.GreedyMeshingPart and v45) then
            local v59 = v45.Position - 0.05 * v45.Normal
            local v60 = u7.coordinatesFromWorkspaceVector3(v59)
            local v61 = string.split
            local v62 = v44.Parent.Name
            local v63, v64 = table.unpack(v61(v62, "_"))
            return v63, v64, u7.blockNameFromCoordinates(v60)
        end
    end,
    ["coordinatesFromHoveredBlock"] = function(p65) --[[ Name: coordinatesFromHoveredBlock, Line 208 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u7
        --]]
        local v66, v67, v68 = u69.getNamesFromHoveredBlock(p65)
        if v66 and (v67 and v68) then
            return u7.coordinatesFromNames(v66, v67, v68)
        end
    end
}
local function u78(p70) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u69
        [2] = u19
        [3] = u18
        [4] = u21
        [5] = u20
        [6] = u10
        [7] = u11
        [8] = u7
        [9] = u6
        [10] = u14
    --]]
    local v71, v72 = u69.getHoveredBlockInstance(p70)
    local v73 = p70 and u21 or u20
    if v71 then
        local v74
        if v71:IsA("Model") then
            local v75 = v71:FindFirstChild("Hitbox") or v71.PrimaryPart
            u18.CFrame = v75.CFrame
            u18.Size = v75.Size + Vector3.new(0.01, 0.01, 0.01)
            local v76 = v71:GetAttribute(u10.ATTRIBUTE)
            if not v76 then
                return
            end
            local v77 = u10.getBlockId(v76)
            if u11.Door[v77] or u11.Trapdoor[v77] then
                v74 = u7.fromBlockInstance(v71)
            else
                v74 = u7.coordinatesFromWorkspaceVector3(v72.Position - v72.Normal * 0.001)
            end
        else
            v74 = u7.coordinatesFromWorkspaceVector3(v72.Position - v72.Normal)
            u18.CFrame = CFrame.new(v74 * 4)
            u18.Size = Vector3.new(4.01, 4.01, 4.01)
        end
        if u6.canCoordinatesBeEdited(v74) then
            u18.SelectionBox.Color3 = Color3.fromRGB(0, 0, 0)
        else
            u18.SelectionBox.Color3 = Color3.fromRGB(170, 0, 0)
        end
        u18.Parent = u14
        v73.Value = v74
    else
        u18.Parent = nil
        v73.Value = Vector3.new(-1, -1, -1)
    end
end
local function u79() --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u78
    --]]
    u78(false)
end
function u69.init() --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u2
        [4] = u79
    --]]
    if u4.Systems.LiquidsSystem.Debug_CursorShowLiquids.Value then
        u16.CollisionGroup = "Default"
    end
    u2.RenderStepped:Connect(u79)
end
return u69