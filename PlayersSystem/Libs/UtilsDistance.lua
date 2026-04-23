-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.PlayersSystem.Libs.UtilsDistance
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local u7 = {
    ["DistanceType"] = {
        ["Manhattan"] = true,
        ["Euclidean"] = true,
        ["Chebyshev"] = true
    },
    ["getDistance"] = function(p1, p2, p3) --[[ Name: getDistance, Line 9 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if p1 == u7.DistanceType.Euclidean then
            local v4 = p2 ^ 2 + p3 ^ 2
            return math.sqrt(v4)
        end
        if p1 == u7.DistanceType.Manhattan then
            return math.abs(p2) + math.abs(p3)
        end
        if p1 == u7.DistanceType.Chebyshev then
            local v5 = math.abs(p2)
            local v6 = math.abs(p3)
            return math.min(v5, v6)
        end
    end
}
return u7