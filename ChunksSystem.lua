-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.Systems.ChunksSystem
-- Source: decompile
-- Dumped: 2026-04-23 03:45:38

local v1 = game:GetService("RunService")
local u2 = game:GetService("Workspace")
local u3 = require(game.ReplicatedStorage.Systems.ChunksSystem.Libs.SharedWait)
local u4
if v1:IsServer() then
    u4 = require(game.ServerScriptService.Secret.GetServerChunksFolder)()
else
    u4 = nil
end
local u5 = {
    ["ChunkStatus"] = {
        ["Empty"] = "Empty",
        ["Loading"] = "Loading",
        ["Loaded"] = "Loaded",
        ["Rendered"] = "Rendered",
        ["Unloading"] = "Unloading",
        ["RegionNotReadyOnServer"] = "RegionNotReadyOnServer"
    },
    ["EMPTY_CHUNK_TOKEN"] = 0
}
local u6 = nil
local u7 = nil
local u8 = v1:IsClient()
local u9 = v1:IsServer()
function u5.getFolderName(p10, p11) --[[ Line: 35 ]]
    return string.format("%s_%s", p10, p11)
end
function u5.getNamesFromFolder(p12) --[[ Line: 39 ]]
    return string.match(p12.Name, "(.*)_(.*)")
end
function u5.readChunkStatus(p13, p14, _) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local v15 = u6:FindFirstChild(u5.getFolderName(p13, p14))
    if v15 == nil then
        return
    elseif v15:GetAttribute("Unload") then
        return u5.ChunkStatus.Unloading
    else
        return v15:GetAttribute("Status")
    end
end
function u5.readChunkData(p16, p17) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return shared["data_" .. u5.getFolderName(p16, p17)] or {}
end
function u5.getChunksFolder() --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u2
    --]]
    if u9 then
        return u4
    else
        return u2.Map
    end
end
function u5.getChunkFolder(p18, p19) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.getChunksFolder():FindFirstChild(u5.getFolderName(p18, p19))
end
function u5.getBiomeId(p20, p21, p22) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v23 = u5.readChunkData(p20, p21)
    if not (v23 and v23.biomes) then
        return nil
    end
    local v24 = v23.biomes[p22]
    return tonumber(v24)
end
function u5.getBlockEncode(p25, p26, p27) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v28 = u5.readChunkData(p25, p26)
    if not v28.block_palette then
        v28.block_palette = {}
    end
    local v29 = v28.block_palette
    if not v29[tostring(p27)] then
        local v30 = #v29
        v29[v30] = tostring(p27)
        v29[tostring(p27)] = v30
    end
    return v29[tostring(p27)]
end
function u5.getBlockInteger(p31, p32, p33) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v34 = u5.readChunkData(p31, p32)
    if not v34.block_palette then
        v34.block_palette = {}
    end
    return v34.block_palette[p33]
end
function u5.getBlockInstance(p35, p36, p37) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v38 = u5.getChunksFolder():FindFirstChild(u5.getFolderName(p35, p36))
    if v38 then
        v38 = v38:FindFirstChild(p37)
    end
    return v38
end
function u5.client_waitChunksLoadingStabilization() --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    while true do
        local v39 = false
        for _, v40 in ipairs(u6:GetChildren()) do
            if v40:GetAttribute("Status") == u5.ChunkStatus.Loading then
                v39 = true
            end
        end
        task.wait()
        if not v39 then
            return
        end
    end
end
function u5.requestChunkLoading(p41, p42) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u7
        [4] = u6
    --]]
    local v43 = u5.readChunkStatus(p41, p42)
    if u8 then
        local v44 = script.ServerPool:FindFirstChild(u5.getFolderName(p41, p42))
        if v44 == nil or v44:GetAttribute("Status") == "Loading" then
            return
        end
    end
    if v43 == nil then
        local v45 = u7:Clone()
        v45:SetAttribute("Status", u5.ChunkStatus.Loading)
        v45.Name = u5.getFolderName(p41, p42)
        v45.Parent = u6
    end
end
function u5.unloadChunk(_, p46, p47) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6:FindFirstChild(u5.getFolderName(p46, p47)).Unload.Value = true
end
function u5.cancelLoading(p48, p49) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local v50 = u6:FindFirstChild(u5.getFolderName(p48, p49))
    if v50 then
        v50.CancelLoading:Fire()
    end
end
function u5.init() --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u7
        [4] = u3
    --]]
    u6 = u9 and script.ServerPool or script.ClientPool
    u7 = u6.Actor
    u7.Parent = nil
    if u9 then
        script.FetchChunkData.OnServerInvoke = require(script.Libs:FindFirstChild("ServerSendChunkData"))
    end
    u3.init()
end
function u5.statusIsLoadedOrRendered(p51, p52) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v53 = u5.readChunkStatus(p51, p52)
    return v53 == u5.ChunkStatus.Rendered and true or v53 == u5.ChunkStatus.Loaded
end
function u5.getChunksWithStatus(p54) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    if not u6 then
        return {}
    end
    local v55 = {}
    for _, v56 in ipairs(u6:GetChildren()) do
        local v57, v58 = u5.getNamesFromFolder(v56)
        if u5.readChunkStatus(v57, v58) == p54 then
            table.insert(v55, {
                ["regionName"] = v57,
                ["chunkName"] = v58
            })
        end
    end
    return v55
end
return u5