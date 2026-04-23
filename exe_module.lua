-- Roblox script dump
-- ClassName: ModuleScript
-- Path: ReplicatedStorage.exe_storage.exe_module
-- Source: decompile
-- Dumped: 2026-04-23 03:45:37

local u1 = game:GetService("UserInputService")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Players")
game:GetService("Lighting")
local v4 = game:GetService("ReplicatedStorage")
local u5 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
local u6 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
local v7 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false)
TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
local v8 = u3.LocalPlayer.PlayerGui:WaitForChild("exe", 9999):FindFirstChild("frame")
if not v8 then
    script:Destroy()
end
local u9 = v8.menu_frame
local u10 = v8.profile_panel
local u11 = v8.confirmation_prompt
local u12 = v8.resyncing_screen
local u13 = v8.direct_action_panels
local u14 = v8.tools_panels
local u15 = v8.assets_panels
local v16 = v4.exe_storage
local u17 = require(v16:WaitForChild("notify_module"))
local v18 = require(v16.transparency_module)
local u19 = v18.CreateGroup(u10.frame:GetDescendants(), u5)
local u20 = v18.CreateGroup(u13.kick_panel:GetDescendants(), u5)
local u21 = v18.CreateGroup(u13.ban_panel:GetDescendants(), u5)
local u22 = v18.CreateGroup(u13.notify_panel:GetDescendants(), u5)
local u23 = v18.CreateGroup(u13.jail_panel:GetDescendants(), u5)
local u24 = v18.CreateGroup(u13.change_team:GetDescendants(), u5)
local u25 = v18.CreateGroup(u13.global_panel:GetDescendants(), u5)
local u26 = v18.CreateGroup(u13.revoke_panel:GetDescendants(), u5)
local u27 = v18.CreateGroup(u11:GetDescendants(), u5)
local u28 = v18.CreateGroup(u14.manage_panel:GetDescendants(), u5)
local u29 = v18.CreateGroup(u14.tools_panel:GetDescendants(), u5)
local u30 = v18.CreateGroup(u14.effects_panel:GetDescendants(), u5)
local u31 = v18.CreateGroup(u14.custom_commands_panel:GetDescendants(), u5)
local u32 = v18.CreateGroup(u14.server_privacy_panel:GetDescendants(), u5)
local u33 = v18.CreateGroup(u14.announcement_panel:GetDescendants(), u5)
local u34 = v18.CreateGroup(u15.manage_tools_panel:GetDescendants(), u5)
local u35 = v18.CreateGroup(u15.manage_effects_panel:GetDescendants(), u5)
local u36 = v18.CreateGroup(u15.select_player_panel:GetDescendants(), u5)
u19:FadeOut()
u20:FadeOut()
u21:FadeOut()
u22:FadeOut()
u23:FadeOut()
u24:FadeOut()
u25:FadeOut()
u26:FadeOut()
u27:FadeOut()
u28:FadeOut()
u29:FadeOut()
u30:FadeOut()
u31:FadeOut()
u32:FadeOut()
u33:FadeOut()
u34:FadeOut()
u35:FadeOut()
u36:FadeOut()
local v53 = {
    ["notify"] = function(_, p37, p38, p39, p40) --[[ Name: notify, Line 95 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:notify(p37, p38, p39, p40)
    end,
    ["announce"] = function(_, p41, p42, p43, p44) --[[ Name: announce, Line 99 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:announce(p41, p42, p43, p44)
    end,
    ["menu"] = function(_, p45) --[[ Name: menu, Line 103 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u2
            [3] = u5
        --]]
        if p45 and not u9.Visible then
            u9.Visible = true
            u9.menu.Position = UDim2.new(0, -60, 0.5, 0)
            u9.menu.scale.Scale = 0.5
            u2:Create(u9, u5, {
                ["BackgroundTransparency"] = 0.9
            }):Play()
            u2:Create(u9.menu, u5, {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0, 60, 0.5, 0)
            }):Play()
            u2:Create(u9.menu.scale, u5, {
                ["Scale"] = 1
            }):Play()
        else
            u2:Create(u9, u5, {
                ["BackgroundTransparency"] = 1
            }):Play()
            u2:Create(u9.menu, u5, {
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.new(0, -60, 0.5, 0)
            }):Play()
            u2:Create(u9.menu.scale, u5, {
                ["Scale"] = 0.5
            }):Play()
            task.wait(0.5)
            u9.Visible = false
        end
    end,
    ["profile_view"] = function(_, p46, p47) --[[ Name: profile_view, Line 128 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
            [3] = u2
            [4] = u5
            [5] = u19
            [6] = u6
        --]]
        if p46 and not u10.Visible then
            local v48 = u3:GetUserThumbnailAsync(p47.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
            u10.properties.id.Value = p47.UserId
            u10.properties.username.Value = p47.Name
            u10.Visible = true
            u10.ImageTransparency = 1
            u10.frame.ImageTransparency = 1
            u10.frame.scale.Scale = 1.2
            u10.frame.scroll.CanvasPosition = Vector2.new(0, 0)
            u10.frame.scroll.details.profile.Image = v48
            u10.frame.scroll.details.display_name.Text = p47.DisplayName
            u10.frame.scroll.details.username.Text = "@" .. p47.Name
            u2:Create(u10, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u10.frame, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u10.frame.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u19:FadeIn()
        else
            u2:Create(u10, u6, {
                ["ImageTransparency"] = 1
            }):Play()
            u2:Create(u10.frame, u6, {
                ["ImageTransparency"] = 1
            }):Play()
            u2:Create(u10.frame.scale, u6, {
                ["Scale"] = 1.2
            }):Play()
            u19:FadeOut()
            task.wait(0.3)
            u10.Visible = false
        end
    end,
    ["prompt_confirmation"] = function(_, p49, p50, p51, p52) --[[ Name: prompt_confirmation, Line 173 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u5
            [4] = u27
            [5] = u6
        --]]
        if p49 and not u11.Visible then
            u11.confirmation_id.Value = p50
            u11.Visible = true
            u11.ImageTransparency = 1
            u11.prompt.header.Text = p51
            u11.prompt.description.Text = p52
            u11.prompt.ImageTransparency = 1
            u11.prompt.scale.Scale = 1.2
            u2:Create(u11, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u11.prompt, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u11.prompt.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u27:FadeIn()
        else
            u2:Create(u11, u6, {
                ["ImageTransparency"] = 1
            }):Play()
            u2:Create(u11.prompt, u6, {
                ["ImageTransparency"] = 1
            }):Play()
            u2:Create(u11.prompt.scale, u6, {
                ["Scale"] = 1.2
            }):Play()
            u27:FadeOut()
            task.wait(0.3)
            u11.Visible = false
        end
    end
}
u2:Create(u12.panel.throbber, v7, {
    ["Rotation"] = 360
}):Play()
function v53.prompt_resync(_, p54, p55, p56) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u6
        [4] = u5
    --]]
    if p54 and not u12.Visible then
        u12.Visible = true
        u12.ImageTransparency = 1
        if p56 == "assets" then
            u12.panel.Visible = false
            u12.assets_loading.Visible = true
            u12.custom_commands_loading.Visible = false
            u12.manage_loading.Visible = false
            u12.team_loading.Visible = false
            u12.tools_effects_loading.Visible = false
            u12.assets_loading.GroupTransparency = 1
            u12.assets_loading.scale.Scale = 1.2
            u2:Create(u12.assets_loading, u6, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.assets_loading.scale, u5, {
                ["Scale"] = 1
            }):Play()
            return
        elseif p56 == "cc" then
            u12.panel.Visible = false
            u12.assets_loading.Visible = false
            u12.custom_commands_loading.Visible = true
            u12.manage_loading.Visible = false
            u12.team_loading.Visible = false
            u12.tools_effects_loading.Visible = false
            u12.custom_commands_loading.GroupTransparency = 1
            u12.custom_commands_loading.scale.Scale = 1.2
            u2:Create(u12.custom_commands_loading, u6, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.custom_commands_loading.scale, u5, {
                ["Scale"] = 1
            }):Play()
            return
        elseif p56 == "manage" then
            u12.panel.Visible = false
            u12.assets_loading.Visible = false
            u12.custom_commands_loading.Visible = false
            u12.manage_loading.Visible = true
            u12.team_loading.Visible = false
            u12.tools_effects_loading.Visible = false
            u12.manage_loading.GroupTransparency = 1
            u12.manage_loading.scale.Scale = 1.2
            u2:Create(u12.manage_loading, u6, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.manage_loading.scale, u5, {
                ["Scale"] = 1
            }):Play()
            return
        elseif p56 == "team" then
            u12.panel.Visible = false
            u12.assets_loading.Visible = false
            u12.custom_commands_loading.Visible = false
            u12.manage_loading.Visible = false
            u12.team_loading.Visible = true
            u12.tools_effects_loading.Visible = false
            u12.team_loading.GroupTransparency = 1
            u12.team_loading.scale.Scale = 1.2
            u2:Create(u12.team_loading, u6, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.team_loading.scale, u5, {
                ["Scale"] = 1
            }):Play()
            return
        elseif p56 == "tools_effects" then
            u12.panel.Visible = false
            u12.assets_loading.Visible = false
            u12.custom_commands_loading.Visible = false
            u12.manage_loading.Visible = false
            u12.team_loading.Visible = false
            u12.tools_effects_loading.Visible = true
            u12.tools_effects_loading.GroupTransparency = 1
            u12.tools_effects_loading.scale.Scale = 1.2
            u2:Create(u12.tools_effects_loading, u6, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.tools_effects_loading.scale, u5, {
                ["Scale"] = 1
            }):Play()
        else
            u12.panel.Visible = true
            u12.assets_loading.Visible = false
            u12.custom_commands_loading.Visible = false
            u12.manage_loading.Visible = false
            u12.team_loading.Visible = false
            u12.tools_effects_loading.Visible = false
            u12.tools_effects_loading.GroupTransparency = 1
            u12.tools_effects_loading.scale.Scale = 1.2
            u12.panel.header.Text = p55 or "Resyncing..."
            u2:Create(u12, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u12.panel, u5, {
                ["GroupTransparency"] = 0
            }):Play()
            u2:Create(u12.panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
        end
    else
        u2:Create(u12.assets_loading, u5, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12.custom_commands_loading, u5, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12.manage_loading, u5, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12.team_loading, u5, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12.tools_effects_loading, u5, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12.panel, u6, {
            ["GroupTransparency"] = 1
        }):Play()
        u2:Create(u12, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        task.wait(0.3)
        u12.Visible = false
        return
    end
end
function v53.direct_panels(_, p57, p58, p59) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u5
        [4] = u20
        [5] = u6
        [6] = u1
        [7] = u21
        [8] = u22
        [9] = u23
        [10] = u24
        [11] = u25
        [12] = u26
    --]]
    if p57 == "kick" then
        if p58 and not u13.Visible then
            u13.properties.id.Value = p59.UserId
            u13.properties.username.Value = p59.Name
            u13.page:JumpTo(u13.kick_panel)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.kick_panel.ImageTransparency = 1
            u13.kick_panel.scale.Scale = 1.2
            u13.kick_panel.reason.container.CanvasPosition = Vector2.new(0, 0)
            u13.kick_panel.reason.container.textbox.Text = ""
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.kick_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.kick_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u20:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.kick_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.kick_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u20:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "ban" then
        if p58 and not u13.Visible then
            u13.properties.id.Value = p59.UserId
            u13.properties.username.Value = p59.Name
            u13.page:JumpTo(u13.ban_panel)
            u13.ban_panel.pages.page:JumpTo(u13.ban_panel.pages.ban_page)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.ban_panel.ImageTransparency = 1
            u13.ban_panel.scale.Scale = 1.2
            u13.ban_panel.pages.ban_page.scroll.CanvasPosition = Vector2.new(0, 0)
            u13.ban_panel.pages.ban_page.scroll.reason.container.CanvasPosition = Vector2.new(0, 0)
            u13.ban_panel.pages.ban_page.scroll.reason.container.textbox.Text = ""
            u13.ban_panel.pages.settings_page.scroll.CanvasPosition = Vector2.new(0, 0)
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.ban_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.ban_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u21:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.ban_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.ban_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u21:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "notify" then
        if p58 and not u13.Visible then
            u13.properties.id.Value = p59.UserId
            u13.properties.username.Value = p59.Name
            u13.page:JumpTo(u13.notify_panel)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.notify_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u13.notify_panel.ImageTransparency = 1
            u13.notify_panel.scale.Scale = 1.2
            u13.notify_panel.scroll.description.container.CanvasPosition = Vector2.new(0, 0)
            u13.notify_panel.scroll.description.container.textbox.Text = ""
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.notify_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.notify_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u22:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.notify_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.notify_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u22:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "jail" then
        if p58 and not u13.Visible then
            u13.properties.id.Value = p59.UserId
            u13.properties.username.Value = p59.Name
            u13.page:JumpTo(u13.jail_panel)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.jail_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u13.jail_panel.ImageTransparency = 1
            u13.jail_panel.scale.Scale = 1.2
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.jail_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.jail_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u23:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.jail_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.jail_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u23:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "teams" then
        if p58 and not u13.Visible then
            u13.properties.id.Value = p59.UserId
            u13.properties.username.Value = p59.Name
            u13.page:JumpTo(u13.change_team)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.change_team.scroll.Visible = true
            u13.change_team.scroll.CanvasPosition = Vector2.new(0, 0)
            u13.change_team.ImageTransparency = 1
            u13.change_team.scale.Scale = 1.2
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.change_team, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.change_team.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u24:FadeIn()
            return
        end
        u13.change_team.scroll.Visible = false
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.change_team, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.change_team.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u24:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "global" then
        if p58 and not u13.Visible then
            u13.page:JumpTo(u13.global_panel)
            u13.global_panel.pages.page:JumpTo(u13.global_panel.pages.ban_page)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.global_panel.ImageTransparency = 1
            u13.global_panel.scale.Scale = 1.2
            u13.global_panel.pages.ban_page.scroll.CanvasPosition = Vector2.new(0, 0)
            u13.global_panel.pages.ban_page.scroll.reason.container.CanvasPosition = Vector2.new(0, 0)
            u13.global_panel.pages.ban_page.scroll.reason.container.textbox.Text = ""
            u13.global_panel.pages.ban_page.scroll.username.textbox.Text = ""
            u13.properties.global_ban.username.Value = ""
            u13.global_panel.pages.settings_page.scroll.CanvasPosition = Vector2.new(0, 0)
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.global_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.global_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u25:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.global_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.global_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u25:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p57 == "revoke" then
        if p58 and not u13.Visible then
            u13.page:JumpTo(u13.revoke_panel)
            u13.Visible = true
            u13.ImageTransparency = 1
            u13.revoke_panel.ImageTransparency = 1
            u13.revoke_panel.scale.Scale = 1.2
            u13.revoke_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u2:Create(u13, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u13.revoke_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u13.revoke_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u26:FadeIn()
            return
        end
        u2:Create(u13, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.revoke_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u13.revoke_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u26:FadeOut()
        task.wait(0.3)
        u13.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
        end
    end
end
function v53.tools_panels(_, p60, p61) --[[ Line: 644 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u5
        [4] = u28
        [5] = u6
        [6] = u1
        [7] = u29
        [8] = u30
        [9] = u31
        [10] = u32
        [11] = u33
    --]]
    if p60 == "manage" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.manage_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.manage_panel.ImageTransparency = 1
            u14.manage_panel.scale.Scale = 1.2
            u14.manage_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u14.manage_panel.scroll.Visible = true
            u14.manage_panel.scroll.search.textbox.Text = ""
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.manage_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.manage_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u28:FadeIn()
            return
        end
        u14.manage_panel.scroll.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.manage_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.manage_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u28:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p60 == "tools" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.tools_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.tools_panel.ImageTransparency = 1
            u14.tools_panel.scale.Scale = 1.2
            u14.tools_panel.player_list.CanvasPosition = Vector2.new(0, 0)
            u14.tools_panel.tool_list.CanvasPosition = Vector2.new(0, 0)
            u14.tools_panel.player_list.Visible = true
            u14.tools_panel.tool_list.Visible = true
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.tools_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.tools_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u29:FadeIn()
            return
        end
        u14.tools_panel.player_list.Visible = false
        u14.tools_panel.tool_list.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.tools_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.tools_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u29:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p60 == "effects" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.effects_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.effects_panel.ImageTransparency = 1
            u14.effects_panel.scale.Scale = 1.2
            u14.effects_panel.player_list.CanvasPosition = Vector2.new(0, 0)
            u14.effects_panel.effects_list.CanvasPosition = Vector2.new(0, 0)
            u14.effects_panel.player_list.Visible = true
            u14.effects_panel.effects_list.Visible = true
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.effects_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.effects_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u30:FadeIn()
            return
        end
        u14.effects_panel.player_list.Visible = false
        u14.effects_panel.effects_list.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.effects_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.effects_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u30:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p60 == "custom_commands" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.custom_commands_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.custom_commands_panel.ImageTransparency = 1
            u14.custom_commands_panel.scale.Scale = 1.2
            u14.custom_commands_panel.scroll.Visible = true
            u14.custom_commands_panel.scroll.search.textbox.Text = ""
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.custom_commands_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.custom_commands_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u31:FadeIn()
            return
        end
        u14.custom_commands_panel.scroll.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.custom_commands_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.custom_commands_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u31:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p60 == "server_privacy" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.server_privacy_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.server_privacy_panel.ImageTransparency = 1
            u14.server_privacy_panel.scale.Scale = 1.2
            u14.server_privacy_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u14.server_privacy_panel.scroll.Visible = true
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.server_privacy_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.server_privacy_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u32:FadeIn()
            return
        end
        u14.server_privacy_panel.scroll.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.server_privacy_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.server_privacy_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u32:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p60 == "announcement" then
        if p61 and not u14.Visible then
            u14.page:JumpTo(u14.announcement_panel)
            u14.Visible = true
            u14.ImageTransparency = 1
            u14.announcement_panel.ImageTransparency = 1
            u14.announcement_panel.scale.Scale = 1.2
            u14.announcement_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u14.announcement_panel.scroll.Visible = true
            u14.announcement_panel.scroll.description.container.textbox.Text = ""
            u2:Create(u14, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u14.announcement_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u14.announcement_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u33:FadeIn()
            return
        end
        u14.announcement_panel.scroll.Visible = false
        u2:Create(u14, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.announcement_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u14.announcement_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u33:FadeOut()
        task.wait(0.3)
        u14.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
        end
    end
end
function v53.assets_panels(_, p62, p63, p64, p65) --[[ Line: 911 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u5
        [4] = u34
        [5] = u6
        [6] = u1
        [7] = u35
        [8] = u36
    --]]
    if p62 == "tools" then
        if p63 and not u15.Visible then
            u15.properties.id.Value = p64.UserId
            u15.properties.username.Value = p64.Name
            u15.page:JumpTo(u15.manage_tools_panel)
            u15.Visible = true
            u15.ImageTransparency = 1
            u15.manage_tools_panel.ImageTransparency = 1
            u15.manage_tools_panel.scale.Scale = 1.2
            u15.manage_tools_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u15.manage_tools_panel.scroll.Visible = true
            u15.manage_tools_panel.scroll.search.textbox.Text = ""
            u2:Create(u15, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u15.manage_tools_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u15.manage_tools_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u34:FadeIn()
            return
        end
        u15.manage_tools_panel.scroll.Visible = false
        u2:Create(u15, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.manage_tools_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.manage_tools_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u34:FadeOut()
        task.wait(0.3)
        u15.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p62 == "effects" then
        if p63 and not u15.Visible then
            u15.properties.id.Value = p64.UserId
            u15.properties.username.Value = p64.Name
            u15.page:JumpTo(u15.manage_effects_panel)
            u15.Visible = true
            u15.ImageTransparency = 1
            u15.manage_effects_panel.ImageTransparency = 1
            u15.manage_effects_panel.scale.Scale = 1.2
            u15.manage_effects_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u15.manage_effects_panel.scroll.Visible = true
            u15.manage_effects_panel.scroll.search.textbox.Text = ""
            u2:Create(u15, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u15.manage_effects_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u15.manage_effects_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u35:FadeIn()
            return
        end
        u15.manage_effects_panel.scroll.Visible = false
        u2:Create(u15, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.manage_effects_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.manage_effects_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u35:FadeOut()
        task.wait(0.3)
        u15.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
            return
        end
    elseif p62 == "players_selection" then
        if p63 and not u15.Visible then
            u15.properties.object_reference.Value = p65
            u15.page:JumpTo(u15.select_player_panel)
            u15.Visible = true
            u15.ImageTransparency = 1
            u15.select_player_panel.ImageTransparency = 1
            u15.select_player_panel.scale.Scale = 1.2
            u15.select_player_panel.scroll.CanvasPosition = Vector2.new(0, 0)
            u15.select_player_panel.scroll.Visible = true
            u15.select_player_panel.scroll.search.textbox.Text = ""
            u2:Create(u15, u5, {
                ["ImageTransparency"] = 0.5
            }):Play()
            u2:Create(u15.select_player_panel, u5, {
                ["ImageTransparency"] = 0.1
            }):Play()
            u2:Create(u15.select_player_panel.scale, u5, {
                ["Scale"] = 1
            }):Play()
            u36:FadeIn()
            return
        end
        u15.select_player_panel.scroll.Visible = false
        u2:Create(u15, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.select_player_panel, u6, {
            ["ImageTransparency"] = 1
        }):Play()
        u2:Create(u15.select_player_panel.scale, u6, {
            ["Scale"] = 1.2
        }):Play()
        u36:FadeOut()
        task.wait(0.3)
        u15.Visible = false
        if u1:GetFocusedTextBox() then
            u1:GetFocusedTextBox():ReleaseFocus()
        end
    end
end
return v53