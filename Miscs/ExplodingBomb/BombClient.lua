-- Roblox script dump
-- ClassName: Script
-- Path: ReplicatedStorage.Assets.Miscs.ExplodingBomb.BombClient
-- Source: decompile
-- Dumped: 2026-04-23 03:45:20

local v1 = game:GetService("TweenService")
local v2 = game:GetService("Workspace")
if script:IsDescendantOf(v2) then
    local v3 = script.Parent
    local v4 = v3:WaitForChild("Hitbox")
    local v5 = v3:WaitForChild("Meshes/explosive_cube_1")
    local v6 = v3:WaitForChild("Fuse")
    v4.Fuse:Play()
    v1:Create(v6, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["Size"] = v6.Size * Vector3.new(1, 0, 1)
    }):Play()
    local v7 = {
        [false] = {
            [v4] = {
                ["Material"] = Enum.Material.Plastic,
                ["TextureID"] = v4.TextureID
            },
            [v5] = {
                ["Material"] = Enum.Material.Plastic,
                ["TextureID"] = v5.TextureID
            }
        },
        [true] = {
            [v4] = {
                ["Material"] = Enum.Material.Neon,
                ["TextureID"] = ""
            },
            [v5] = {
                ["Material"] = Enum.Material.Neon,
                ["TextureID"] = ""
            }
        }
    }
    for v8 = 1, 14 do
        for v9, v10 in pairs(v7[v8 % 2 == 0]) do
            for v11, v12 in pairs(v10) do
                v9[v11] = v12
            end
        end
        task.wait(0.25)
    end
end