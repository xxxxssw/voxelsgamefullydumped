-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.Utils
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

game:GetService("Players")
local u1 = game:GetService("TextService")
local u2 = require(game.ReplicatedStorage.Configuration.Gamepasses)
local u3 = {}
local u4 = Random.new()
function u3.getGamepassIdFromGamepassKey(p5) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    for v6, v7 in u2 do
        if v7 == p5 then
            return v6
        end
    end
    print(p5, u2)
    error(p5)
end
function u3.chooseWeighted(p8) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for v9, v10 in pairs(p8) do
        if v10 == false then
            p8[v9] = nil
        end
    end
    local v11 = 0
    for _, v12 in pairs(p8) do
        v11 = v11 + v12
    end
    local v13 = u4:NextNumber(0, 1)
    local v14 = 0
    for v15, v16 in pairs(p8) do
        local v17 = v16 / v11
        if v14 <= v13 and v13 < v14 + v17 then
            return v15
        end
        v14 = v14 + v17
    end
    return nil
end
function u3.weldModel(p18) --[[ Line: 48 ]]
    local v19 = p18.PrimaryPart or p18:FindFirstChildWhichIsA("BasePart", true)
    local v20 = p18:FindFirstChild("Welds") or Instance.new("Folder")
    for _, v21 in pairs(p18:GetDescendants()) do
        if v21:IsA("BasePart") and v21 ~= v19 then
            local v22 = Instance.new("WeldConstraint")
            v22.Part0 = v19
            v22.Part1 = v21
            v22.Parent = v20
        end
    end
    v20.Name = "Welds"
    v20.Parent = p18
end
function u3.deepCopy(p23) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v24 = {}
    for v25, v27 in p23 do
        if typeof(v27) == "table" or typeof(v27) == "SharedTable" then
            local v27 = u3.deepCopy(v27)
        end
        v24[v25] = v27
    end
    return v24
end
function u3.encodeVector3(p28) --[[ Line: 81 ]]
    local v29 = {}
    local v30 = string.format
    local v31 = p28.X
    local v32 = tonumber(v30("%.1f", v31))
    local v33 = string.format
    local v34 = p28.Y
    local v35 = tonumber(v33("%.1f", v34))
    local v36 = string.format
    local v37 = p28.Z
    __set_list(v29, 1, {v32, v35, (tonumber(v36("%.1f", v37)))})
    return v29
end
function u3.decodeVector3(p38) --[[ Line: 89 ]]
    local v39 = p38[1]
    local v40 = p38[2]
    local v41 = p38[3]
    local v42 = tonumber(v39)
    local v43 = tonumber(v40)
    local v44 = tonumber(v41)
    return Vector3.new(v42, v43, v44)
end
function u3.toSharedtable(p45) --[[ Line: 94 ]]
    local v46 = SharedTable.new()
    for v47, v48 in pairs(p45) do
        v46[v47] = v48
    end
    return v46
end
function u3.waitForFirst(...) --[[ Line: 102 ]]
    local u49 = Instance.new("BindableEvent")
    local u50 = { ... }
    local function v52(...) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u49
        --]]
        for v51 = 1, #u50 do
            u50[v51]:Disconnect()
        end
        return u49:Fire(...)
    end
    for v53 = 1, #u50 do
        u50[v53] = u50[v53]:Connect(v52)
    end
    return u49.Event:Wait()
end
function u3.getAncestorParentedTo(p54, p55) --[[ Line: 121 ]]
    if not p54:IsDescendantOf(p55) then
        return nil
    end
    while p54.Parent ~= p55 do
        p54 = p54.Parent
    end
    return p54
end
function u3.setModelNetworkOwner(p56, p57) --[[ Line: 132 ]]
    for _, v58 in ipairs(p56:GetDescendants()) do
        if v58:IsA("BasePart") and not v58.Anchored then
            local v59, v60 = pcall(v58.SetNetworkOwner, v58, p57)
            if not v59 then
                warn(v60)
            end
        end
    end
end
function u3.setModelNetworkOwnerAuto(p61) --[[ Line: 143 ]]
    for _, v62 in ipairs(p61:GetDescendants()) do
        if v62:IsA("BasePart") and not v62.Anchored then
            v62:SetNetworkOwnershipAuto()
        end
    end
end
function u3.align(p63, p64) --[[ Line: 151 ]]
    return p64.LookVector * p63.Z + p64.UpVector * p63.Y + p64.RightVector * p63.X
end
function u3.sortTable(p65) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    table.sort(p65)
    for _, v66 in p65 do
        if type(v66) == "table" then
            u3.sortTable(v66)
        end
    end
end
function u3.deconstructDict(p67) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p67 ~= nil then
        for v68, v69 in pairs(p67) do
            if typeof(v69) == "table" then
                u3.deconstructDict(v69)
            end
            p67[v68] = nil
        end
    end
end
function u3.shuffleTable(p70) --[[ Line: 175 ]]
    for v71 = #p70, 2, -1 do
        local v72 = math.random(v71)
        local v73 = p70[v72]
        local v74 = p70[v71]
        p70[v71] = v73
        p70[v72] = v74
    end
end
function u3.filterStringAsync(u75, u76) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local u77 = nil
    local v78, v79 = pcall(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u77
            [2] = u1
            [3] = u76
            [4] = u75
        --]]
        u77 = u1:FilterStringAsync(u76, u75.UserId)
    end)
    if not v78 then
        warn(v79)
        return false, nil
    end
    local u80 = nil
    if not v78 then
        return false, nil
    end
    local v81, v82 = pcall(function() --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u77
        --]]
        u80 = u77:GetNonChatStringForBroadcastAsync()
    end)
    if v81 and u80 then
        return true, u80
    end
    warn(v82)
    return false, nil
end
local u83 = {}
function u3.createCacheFunction(u84) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u83
    --]]
    local u85 = {}
    return function(p86) --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u85
            [2] = u84
            [3] = u83
        --]]
        if u85[p86] == nil then
            u85[p86] = u84(p86)
            if u85[p86] == nil then
                u85[p86] = u83
            end
        end
        local v87 = u85[p86]
        if v87 == u83 then
            return nil
        else
            return v87
        end
    end
end
return u3