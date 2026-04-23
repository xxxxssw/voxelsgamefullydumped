-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.Serializer
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u20 = {
    ["SerializeVector3"] = function(p1) --[[ Name: SerializeVector3, Line 5 ]]
        local v2 = string.format
        local v3 = p1.X
        local v4 = math.round(v3)
        local v5 = p1.Y
        local v6 = math.round(v5)
        local v7 = p1.Z
        return v2("%s;%s;%s", v4, v6, (math.round(v7)))
    end,
    ["SerializeCFrame"] = function(p8) --[[ Name: SerializeCFrame, Line 9 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v9 = u20.SerializeVector3(p8.Position * 100)
        local v10 = u20.SerializeVector3(p8.rightVector * 100)
        local v11 = u20.SerializeVector3(p8.upVector * 100)
        local v12 = u20.SerializeVector3(-p8.lookVector * 100)
        return string.format("%s#%s#%s#%s", v9, v10, v11, v12)
    end,
    ["DeserializeVector3"] = function(p13) --[[ Name: DeserializeVector3, Line 18 ]]
        return Vector3.new(p13:match("(.+);(.+);(.+)")) / 100
    end,
    ["DeserializeCFrame"] = function(p14) --[[ Name: DeserializeCFrame, Line 22 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v15 = p14:split("#")
        local v16 = u20.DeserializeVector3(v15[1])
        local v17 = u20.DeserializeVector3(v15[2])
        local v18 = u20.DeserializeVector3(v15[3])
        local v19 = u20.DeserializeVector3(v15[4])
        return CFrame.fromMatrix(v16, v17, v18, v19)
    end
}
return u20