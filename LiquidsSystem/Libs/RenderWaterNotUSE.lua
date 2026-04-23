-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.RenderWaterNotUSE
-- Source: decompile
-- Dumped: 2026-04-23 03:45:23

local v1 = game:GetService("ReplicatedStorage")
local u2 = require(game.ReplicatedStorage.Libs.Coordinates)
local u3 = require(game.ReplicatedStorage.Libs.BlockState)
local u4 = require(game.ReplicatedStorage.Systems.BlocksSystem)
local u5 = {
    ["level"] = 0
}
local u6 = require(game.ReplicatedStorage.Systems.BlocksSystem.Libs.UtilsBlocks).getBlockIdFromName("water")
local u7 = v1.Assets.Miscs.WaterSurface
u7.CollisionGroup = "Liquids"
local u8 = {
    Enum.NormalId.Left,
    Enum.NormalId.Right,
    Enum.NormalId.Front,
    Enum.NormalId.Back
}
return function(p9) --[[ Name: RenderWater, Line 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
        [4] = u4
        [5] = u6
        [6] = u7
        [7] = u8
    --]]
    local v10 = u2.fromBlockInstance(p9)
    local v11 = (u3.getMetadata(p9:GetAttribute("blockState")) or u5).level
    if p9:GetAttribute("renderedLevel") == v11 then
        ::l4::
        return
    end
    p9:SetAttribute("renderedLevel", v11)
    for _, v12 in ipairs(p9:GetChildren()) do
        if v12 ~= p9.PrimaryPart then
            v12:Destroy()
        end
    end
    local v13 = u4.getBlockState(v10 + Vector3.new(0, 1, 0))
    local v14
    if u3.getBlockId(v13) == u6 then
        v14 = 4
    else
        v14 = (1 - v11 / 8) * 3.5
        local v15 = u7:Clone()
        v15.Name = "Top"
        local v16 = p9.PrimaryPart.CFrame
        local v17 = v14 - 2
        v15.CFrame = v16 + Vector3.new(0, v17, 0)
        v15.Parent = p9
    end
    for _, v18 in ipairs(u8) do
        local v19 = u4.getBlockState(v10 + Vector3.fromNormalId(v18))
        local v20
        if u3.getBlockId(v19) == u6 then
            v20 = nil
            ::l16::
            if v20 ~= nil then
                local v21 = u7:Clone()
                v21.Name = tostring(v18)
                local v22 = v20.cframe
                local v23 = 4 - v14
                v21.CFrame = v22 - Vector3.new(0, v23, 0) * 0.5
                local v24 = v20.height
                v21.Size = Vector3.new(4, v24, 0)
                v21.Parent = p9
            end
        elseif u4.isBlockStateTransparent(v19) then
            v20 = {
                ["height"] = v14,
                ["cframe"] = CFrame.lookAt(p9.PrimaryPart.Position, p9.PrimaryPart.Position + Vector3.fromNormalId(v18))
            }
            v20.cframe = v20.cframe + v20.cframe.LookVector * 2
            goto l16
        end
    end
    goto l4
end