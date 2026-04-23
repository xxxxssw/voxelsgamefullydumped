-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.Coordinates
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u1 = nil
local u66 = {
    ["Chunk"] = Vector3.new(16, 0, 16),
    ["Region"] = Vector3.new(256, 0, 256),
    ["lateralDirection"] = {
        Enum.NormalId.Left,
        Enum.NormalId.Right,
        Enum.NormalId.Back,
        Enum.NormalId.Front
    },
    ["coordinatesFromWorkspaceVector3"] = function(p2) --[[ Name: coordinatesFromWorkspaceVector3, Line 30 ]]
        local v3 = p2 / 4
        local v4 = v3.X + 0.5
        local v5 = math.floor(v4)
        local v6 = v3.Y + 0.5
        local v7 = math.floor(v6)
        local v8 = v3.Z + 0.5
        local v9 = math.floor(v8)
        return Vector3.new(v5, v7, v9)
    end,
    ["regionGridFromCoordinates"] = function(p10) --[[ Name: regionGridFromCoordinates, Line 37 ]]
        local v11 = p10.X / 256
        local v12 = math.floor(v11)
        local v13 = p10.Z / 256
        return v12, math.floor(v13)
    end,
    ["chunkGridFromCoordinates"] = function(p14) --[[ Name: chunkGridFromCoordinates, Line 42 ]]
        local v15 = p14.X % 256 / 16
        local v16 = math.floor(v15)
        local v17 = p14.Z % 256 / 16
        return v16, math.floor(v17)
    end,
    ["blockGridFromCoordinates"] = function(p18) --[[ Name: blockGridFromCoordinates, Line 47 ]]
        return p18.X % 16, p18.Y % 256, p18.Z % 16
    end,
    ["coordinatesOffsetFromRegionName"] = function(p19) --[[ Name: coordinatesOffsetFromRegionName, Line 53 ]]
        local v20 = string.split
        local v21, v22 = table.unpack(v20(p19, "."))
        return Vector3.new(v21, 0, v22) * 16 * 16
    end,
    ["coordinatesOffsetFromChunkName"] = function(p23) --[[ Name: coordinatesOffsetFromChunkName, Line 58 ]]
        local v24 = tonumber(p23)
        local v25 = v24 % 16
        local v26 = (v24 - v25) / 16
        return Vector3.new(v25, 0, v26) * 16
    end,
    ["coordinatesOffsetFromBlockName"] = function(p27) --[[ Name: coordinatesOffsetFromBlockName, Line 65 ]]
        local v28 = tonumber(p27)
        local v29 = v28 % 256
        local v30 = (v28 - v29) % 4096 / 256
        local v31 = (v28 - v29 - v30 * 256) / 4096
        return Vector3.new(v31, v29, v30)
    end,
    ["regionNameFromCoordinates"] = function(p32) --[[ Name: regionNameFromCoordinates, Line 73 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v33, v34 = u66.regionGridFromCoordinates(p32)
        return v33 .. "." .. v34
    end,
    ["chunkNameFromCoordinates"] = function(p35) --[[ Name: chunkNameFromCoordinates, Line 78 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v36, v37 = u66.chunkGridFromCoordinates(p35)
        local v38 = v36 + 16 * v37
        return tostring(v38)
    end,
    ["blockNameFromCoordinates"] = function(p39) --[[ Name: blockNameFromCoordinates, Line 84 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v40, v41, v42 = u66.blockGridFromCoordinates(p39)
        local v43 = v41 + 256 * v42 + 4096 * v40
        return tostring(v43)
    end,
    ["getNamesFromCoordinates"] = function(p44) --[[ Name: getNamesFromCoordinates, Line 89 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        return u66.regionNameFromCoordinates(p44), u66.chunkNameFromCoordinates(p44), u66.blockNameFromCoordinates(p44)
    end,
    ["blockNameXZFromCoordinates"] = function(p45) --[[ Name: blockNameXZFromCoordinates, Line 98 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v46, _, v47 = u66.blockGridFromCoordinates(p45)
        local v48 = v46 + 16 * v47
        return tostring(v48)
    end,
    ["isValidBlockName"] = function(p49) --[[ Name: isValidBlockName, Line 104 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v50 = u66.coordinatesOffsetFromBlockName(p49)
        local v51
        if v50.X >= 0 and (v50.X < 16 and (v50.Z >= 0 and (v50.Z < 16 and v50.Y >= 0))) then
            v51 = v50.Y < 256
        else
            v51 = false
        end
        return v51
    end,
    ["coordinatesFromNames"] = function(p52, p53, p54) --[[ Name: coordinatesFromNames, Line 110 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        return u66.coordinatesOffsetFromRegionName(p52) + u66.coordinatesOffsetFromChunkName(p53) + u66.coordinatesOffsetFromBlockName(p54)
    end,
    ["fromBlockInstance"] = function(p55) --[[ Name: fromBlockInstance, Line 116 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v56 = p55.Parent
        local v57 = string.split
        local v58 = v56.Name
        local v59, v60 = table.unpack(v57(v58, "_"))
        return u66.coordinatesFromNames(v59, v60, p55.Name)
    end,
    ["getDimensionId"] = function(p61) --[[ Name: getDimensionId, Line 122 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v62 = (1 / 0)
        local v63 = nil
        for _, v64 in u1 do
            local v65 = (v64.offset - p61).Magnitude
            if v65 < v62 then
                v63 = v64.id
                v62 = v65
            end
        end
        return v63 or 1
    end,
    ["init"] = function() --[[ Name: init, Line 150 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1 = require(game.ReplicatedStorage.Systems.DimensionsSystem.Configuration:FindFirstChild("DimensionsData"))
    end
}
return u66