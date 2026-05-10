local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/von63rd/atomui/main/AtomUI.lua"))()
local Window = library.new({
    Name = "Game Name Here",
    AccentColor = Color3.fromRGB(2, 133, 255),
    AutoConfig = true,
    ShowAutoSaveToggle = true,
    ConfigFolder = "MyGameConfigs",
    Watermark = "My Script v1.0",
    -- Custom Background (NEW)
    -- CustomBackground = true,
    -- BackgroundImage = "rbxassetid://YOUR_IMAGE_ID",
    -- BackgroundTransparency = 0.3,
    -- BackgroundTint = Color3.fromRGB(255, 255, 255),
    -- BackgroundBlur = true,
    -- Toggle Logo Animation
    -- SpinningLogo = true,
})

-- Example Sections
local MainSection = Window:AddSection({Name = "Main", Icon = "home"})
local CombatTab = MainSection:AddTab({Name = "Combat", Description = "Combat settings", Icon = "crosshair"})

-- Example Groups
local AimbotGroup = CombatTab:AddGroup({Name = "Aimbot", Side = "Left", Icon = "target"})

-- Example Elements
AimbotGroup:AddToggle({Name = "Enabled", Default = false, Callback = function(v) print("Aimbot:", v) end})
AimbotGroup:AddSlider({Name = "FOV", Min = 10, Max = 800, Default = 120, Increment = 5, Callback = function(v) print("FOV:", v) end})
AimbotGroup:AddDropdown({Name = "Target", Options = {"Head", "Torso"}, Default = "Head", Callback = function(v) print("Target:", v) end})
AimbotGroup:AddKeybind({Name = "Toggle Key", Default = Enum.KeyCode.E, Callback = function() print("Key pressed") end})

-- Another tab example
local VisualsTab = MainSection:AddTab({Name = "Visuals", Description = "Visual settings", Icon = "eye"})
local EspGroup = VisualsTab:AddGroup({Name = "ESP", Side = "Right", Icon = "eye"})
EspGroup:AddToggle({Name = "Box ESP", Default = true, Callback = function(v) print("ESP:", v) end})
EspGroup:AddColorPicker({Name = "ESP Color", Default = Color3.fromRGB(255, 0, 0), Callback = function(c) print("Color:", c) end})

-- Utility Section
local UtilitySection = Window:AddSection({Name = "Utility", Icon = "settings"})
local MiscTab = UtilitySection:AddTab({Name = "Misc", Description = "Miscellaneous", Icon = "tool"})
local MiscGroup = MiscTab:AddGroup({Name = "Tools", Side = "Left", Icon = "tool"})

MiscGroup:AddButton({Name = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
MiscGroup:AddTextInput({Name = "Webhook URL", Placeholder = "https://your-webhook-url...", Default = "", Callback = function(text) print("Webhook:", text) end})

-- Notifications
Window:Notify({Title = "Script Loaded", Description = "Press RightCtrl to toggle UI", Duration = 5, Icon = "rbxassetid://10747361219"})
