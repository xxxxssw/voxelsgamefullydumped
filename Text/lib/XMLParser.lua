-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Text.lib.XMLParser
-- Source: decompile
-- Dumped: 2026-04-23 03:45:18

local function u4(p1, p2) --[[ Line: 55 ]]
    if not p2 then
        p2 = {
            ["quot"] = "\"",
            ["apos"] = "\'",
            ["lt"] = "<",
            ["gt"] = ">",
            ["amp"] = "&",
            ["tab"] = "\t",
            ["nbsp"] = " "
        }
    end
    for _, v3 in pairs(p1) do
        v3.value = v3.value:gsub("&([^;]+);", p2)
        p2[v3.name] = v3.value
    end
    return p2
end
return {
    ["parse"] = function(p5, p6) --[[ Name: parse, Line 85 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v7 = p5:gsub("<!%-%-(.-)%-%->", "")
        local u8 = {}
        local v9 = {}
        if p6 then
            local v10 = v7:find("<[_%w]")
            if v10 then
                v7:sub(1, v10):gsub("<!ENTITY%s+([_%w]+)%s+(.)(.-)%2", function(p11, _, p12) --[[ Line: 94 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8[#u8 + 1] = {
                        ["name"] = p11,
                        ["value"] = p12
                    }
                end)
                v9 = u4(u8)
                v7 = v7:sub(v10):gsub("&([^;]+);", v9)
            end
        end
        local u13 = {}
        local u14 = {}
        v7:gsub("<([?!/]?)([-:_%w]+)%s*(/?>?)([^<]*)", function(p15, p16, p17, p18) --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u14
                [3] = u8
            --]]
            if #p15 == 0 then
                local v19 = {}
                local v20 = {}
                if #p17 == 0 then
                    local v21 = 0
                    for v22, v23, _, v24, v25 in string.gmatch(p18, "(.-([-_%w]+)%s*=%s*(.)(.-)%3%s*(/?>?))") do
                        v21 = v21 + #v22
                        v19[v23] = v24
                        v20[#v20 + 1] = {
                            ["name"] = v23,
                            ["value"] = v24
                        }
                        if #v25 ~= 0 then
                            p18 = p18:sub(v21 + 1)
                            p17 = v25
                            break
                        end
                    end
                end
                u13[#u13 + 1] = {
                    ["tag"] = p16,
                    ["attrs"] = v19,
                    ["children"] = {},
                    ["orderedattrs"] = v20
                }
                if p17:byte(1) ~= 47 then
                    u14[#u14 + 1] = u13
                    u13 = u13[#u13].children
                end
                local v26 = p18:match("^%s*(.*%S)") or ""
                if #v26 ~= 0 then
                    u13[#u13 + 1] = {
                        ["text"] = v26
                    }
                    return
                end
            elseif p15 == "/" then
                u13 = u14[#u14]
                u14[#u14] = nil
                local v27 = p18:match("^%s*(.*%S)") or ""
                if #v27 ~= 0 then
                    u13[#u13 + 1] = {
                        ["text"] = v27
                    }
                    return
                end
            elseif p15 == "!" and p16:byte(1) == 69 then
                p18:gsub("([_%w]+)%s+(.)(.-)%2", function(p28, _, p29) --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8[#u8 + 1] = {
                        ["name"] = p28,
                        ["value"] = p29
                    }
                end, 1)
            end
        end)
        return {
            ["children"] = u13,
            ["entities"] = u8,
            ["tentities"] = v9
        }
    end,
    ["defaultEntityTable"] = function() --[[ Name: defaultEntityTable, Line 38 ]]
        return {
            ["quot"] = "\"",
            ["apos"] = "\'",
            ["lt"] = "<",
            ["gt"] = ">",
            ["amp"] = "&",
            ["tab"] = "\t",
            ["nbsp"] = " "
        }
    end,
    ["replaceEntities"] = function(p30, p31) --[[ Name: replaceEntities, Line 45 ]]
        return p30:gsub("&([^;]+);", p31)
    end,
    ["createEntityTable"] = u4
}