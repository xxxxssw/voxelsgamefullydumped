-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.LiquidsSystem.Libs.Utils
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

return {
    ["string2vector"] = function(p1) --[[ Name: string2vector, Line 3 ]]
        return Vector2.new(p1:match("[%d.]+),([%d.]+)"))
    end,
    ["string2normalId"] = function(p2) --[[ Name: string2normalId, Line 7 ]]
        for _, v3 in Enum.NormalId:GetEnumItems() do
            if tostring(v3) == p2 then
                return v3
            end
        end
    end
}