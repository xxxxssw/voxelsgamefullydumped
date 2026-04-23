-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Libs.BlockMetadata
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = {}
local u2 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
require(script.base64)
local u3 = require(game.ReplicatedStorage.Systems.BlocksSystem.Configuration.BlocksData)
local u4 = nil
function u1.init() --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4 = require(game.ReplicatedStorage.Libs.BlockState)
end
function u1.getDefaultValue(p5) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v6 = u2[tonumber(p5)]
    if not v6 then
        return nil
    end
    local v7 = v6.defaultState - v6.minStateId
    return tonumber(v7)
end
function u1.getPropertiesName(p8) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v9 = u2[p8]
    if not v9 then
        warn(p8, (typeof(p8)))
    end
    local v10 = v9.states
    local v11 = {}
    for _, v12 in ipairs(v10) do
        local v13 = v12.name
        local _ = v12.num_values
        table.insert(v11, v13)
    end
    return v11
end
function u1.getPropertiesValuesTable(p14, p15) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v16 = p15 or u1.getDefaultValue(p14)
    local v17 = {}
    for _, v18 in u1.getPropertiesName(p14) do
        v17[v18] = u1.getProperty(p14, v16, v18)
    end
    return v17
end
function u1.getPropertyValues(p19, p20) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v21 = u2[p19].states
    for _, v22 in ipairs(v21) do
        local v23 = v22.name
        local _ = v22.num_values
        if v23 == p20 then
            return v22.values
        end
    end
end
function u1.printPropertiesValue(p24, p25) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    local _ = u2[p24].states
    for _, v26 in ipairs(u2[p24].states) do
        local v27 = v26.name
        print(v27, u1.getProperty(p24, p25, v27))
    end
end
function u1.getIntFromPropertyValue(p28, p29, p30) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    for _, v31 in ipairs(u2[p28].states) do
        if v31.name == p29 then
            if v31.type == "enum" then
                for v32, v33 in ipairs(v31.values) do
                    if v33 == p30 then
                        return v32 - 1
                    end
                end
            else
                if v31.type == "int" then
                    return tonumber(p30)
                end
                if v31.type == "bool" then
                    if p30 == false then
                        return 0
                    end
                    if p30 == true then
                        return 1
                    end
                    warn(p30)
                else
                    warn(p29)
                end
            end
        end
    end
end
function u1.setPropertyValue(p34, p35, p36, p37) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v38 = p35 or u1.getDefaultValue(p34)
    local v39 = u2[p34]
    if not v39 then
        warn("problem:", p34)
        return nil
    end
    local v40 = v39.states
    local v41 = 0
    for _, v42 in ipairs(v40) do
        local v43 = v42.name
        local v44 = v42.num_values
        local v45 = math.log(v44, 2)
        local v46 = math.floor(v45)
        if math.pow(2, v46) ~= v44 then
            v46 = v46 + 1
        end
        if v43 == p36 then
            local v47 = u1.getIntFromPropertyValue(p34, p36, p37)
            if v47 == nil then
                warn(p34, p36, p37)
            end
            return bit32.replace(v38, v47, v41, v46)
        end
        v41 = v41 + v46
    end
end
function u1.getPropertyFromState(p48, p49) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    local v50 = u4.getBlockId(p48)
    local v51 = u4.getMetadata(p48)
    return u1.getProperty(v50, v51, p49)
end
function u1.getProperty(p52, p53, p54) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v55 = p53 or u1.getDefaultValue(p52)
    local v56 = u2[p52]
    if not v56 then
        warn(p52 .. " not found")
        return nil
    end
    local v57 = v56.states
    local v58 = 0
    for _, v59 in ipairs(v57) do
        local v60 = v59.name
        local v61 = v59.num_values
        local v62 = math.log(v61, 2)
        local v63 = math.floor(v62)
        if math.pow(2, v63) ~= v61 then
            v63 = v63 + 1
        end
        if v60 == p54 then
            local v64 = bit32.extract(v55, v58, v63)
            if v59.type == "enum" then
                return v59.values[v64 + 1]
            end
            if v59.type == "int" then
                return v64
            end
            if v59.type == "bool" then
                return v64 ~= 0
            end
            warn(v59.type)
        else
            v58 = v58 + v63
        end
    end
end
function u1.blockIdHasProperty(p65, p66) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v67 = u3[p65]
    for _, v68 in ipairs(v67.states or {}) do
        if v68.name == p66 then
            return true
        end
    end
    return false
end
function u1.blockIdHasPropertyValue(p69, p70) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v71 = u3[p69]
    for _, v72 in ipairs(v71.states or {}) do
        if v72.values then
            for _, v73 in v72.values do
                if v73 == p70 then
                    return true
                end
            end
        end
    end
    return false
end
function u1.blockIdGetPropertyNumValues(p74, p75) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v76 = u3[p74]
    for _, v77 in ipairs(v76.states or {}) do
        if v77.name == p75 then
            return v77.num_values
        end
    end
    return nil
end
return u1