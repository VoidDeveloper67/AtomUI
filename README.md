<div align="center">

# ⚛️ AtomUI

**A feature-rich Roblox UI library for exploit scripts.**

[![Version](https://img.shields.io/badge/version-1.0-7c3aed?style=flat-square&labelColor=0c0c10)](https://github.com/VoidDeveloper67/AtomUI)
[![Platform](https://img.shields.io/badge/platform-Roblox-7c3aed?style=flat-square&labelColor=0c0c10)](https://github.com/VoidDeveloper67/AtomUI)
[![License](https://img.shields.io/badge/license-MIT-7c3aed?style=flat-square&labelColor=0c0c10)](https://github.com/VoidDeveloper67/AtomUI)

Built by [**vonplayz_real**](https://github.com/VoidDeveloper67) & [**DarealBloxfruiter**](https://github.com/darkflareplays8) — VoidHub project

</div>

---

## 📦 Load

```lua
local AtomUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/main/AtomUI.lua"
))()
```

---

## ⚡ Quick Start

```lua
local lib = AtomUI.new({
    Name        = "VoidHub",
    AccentColor = Color3.fromRGB(138, 43, 226),
    AutoConfig  = true
})

local section = lib:AddSection({ Name = "Main", Icon = "sword" })
local tab     = section:AddTab({ Name = "Combat", Icon = "crosshair" })
local group   = tab:AddGroup({ Name = "Settings", Side = "Left" })

group:AddToggle({
    Name     = "Auto Farm",
    Default  = false,
    Callback = function(val) print("Auto Farm:", val) end
})

lib:Notify({ Title = "VoidHub", Description = "Loaded!", Duration = 4 })
```

---

## 🗂️ Structure

```
lib (AtomUI)
 └── Section    ← lib:AddSection()
      └── Tab   ← section:AddTab()
           └── Group   ← tab:AddGroup()
                └── Elements  (Toggle, Slider, Button, ...)
```

---

## 🔧 `AtomUI.new(config)`

Creates a new UI instance. All fields are optional.

| Field             | Type     | Default         | Description                         |
| ----------------- | -------- | --------------- | ----------------------------------- |
| `Name`            | `string` | `"o11 vision"`  | Window title                        |
| `AccentColor`     | `Color3` | Blue            | Main accent / highlight color       |
| `BackgroundColor` | `Color3` | `RGB(16,16,16)` | Window background                   |
| `SecondaryColor`  | `Color3` | `RGB(18,18,18)` | Secondary panel color               |
| `TextColor`       | `Color3` | White           | Primary text color                  |
| `SubTextColor`    | `Color3` | Grey            | Secondary / dim text                |
| `AutoConfig`      | `bool`   | `false`         | Auto save & restore all control values |

---

## 📌 Sections

```lua
local section = lib:AddSection({
    Name = "Main",   -- required
    Icon = "sword"   -- lucide icon name or rbxassetid://
})
```

## 🗃️ Tabs

```lua
local tab = section:AddTab({
    Name        = "Combat",
    Description = "Combat settings",  -- optional subtitle
    Icon        = "crosshair"
})
```

## 📦 Groups

```lua
local group = tab:AddGroup({
    Name = "Aimbot",
    Side = "Left",   -- "Left" or "Right"
    Icon = "target"
})
```

---

## 🎛️ Elements

### Toggle
```lua
group:AddToggle({
    Name     = "Enabled",
    Default  = false,
    Callback = function(val) end  -- val: bool
})
```

### Slider
```lua
group:AddSlider({
    Name      = "FOV",
    Min       = 10,
    Max       = 800,
    Default   = 120,
    Increment = 5,
    Callback  = function(val) end  -- val: number
})
```

### Button
```lua
group:AddButton({
    Name     = "Rejoin",
    Callback = function() end
})
```

### Dropdown
```lua
group:AddDropdown({
    Name     = "Target Part",
    Options  = { "Head", "HumanoidRootPart", "Torso" },
    Default  = "Head",
    Callback = function(val) end  -- val: string
})
```

### MultiDropdown
```lua
group:AddMultiDropdown({
    Name     = "Notifications",
    Options  = { "Kills", "Deaths", "Chat" },
    Default  = { "Kills", "Chat" },
    Callback = function(val) end  -- val: table of selected strings
})
```

### Keybind
```lua
group:AddKeybind({
    Name     = "Fly Key",
    Default  = Enum.KeyCode.F,
    Callback = function() end  -- fires on key press
})
```

### KeybindToggle
```lua
group:AddKeybindToggle({
    Name          = "Toggle Key",
    Default       = Enum.KeyCode.E,
    ToggleDefault = false,
    Callback      = function(val) end  -- val: bool (toggle state)
})
```

### ColorPicker
```lua
group:AddColorPicker({
    Name     = "ESP Color",
    Default  = Color3.fromRGB(255, 0, 0),
    Callback = function(val) end  -- val: Color3
})
```

### TextInput
```lua
group:AddTextInput({
    Name            = "Webhook URL",
    Default         = "",
    PlaceholderText = "https://...",
    Callback        = function(val) end  -- val: string, fires on Enter/unfocus
})
```

### Label
```lua
group:AddLabel({ Name = "Some info text here." })
```

### Divider
```lua
group:AddDivider()
```

---

## 📚 Library Methods

### Notify
```lua
lib:Notify({
    Title       = "VoidHub",
    Description = "Something happened!",
    Duration    = 4  -- seconds
})
```

### Visibility
```lua
lib:Toggle()                                   -- flip open/closed
lib:SetToggleKey(Enum.KeyCode.RightControl)    -- default: RightControl
lib:SetToggleVisible(true)                     -- show/hide toggle button
```

### Theming
```lua
lib:SetAccentColor(Color3.fromRGB(138, 43, 226))

-- Font presets 1–10:
-- 1=Gotham  2=Gotham Medium  3=Montserrat  4=Nunito
-- 5=Bodoni  6=Garamond  7=Source Sans  8=Highway  9=Antique  10=Code
lib:SetFontPreset(1)
```

### Config
```lua
lib:SaveConfig("my_config")   -- saves to file
lib:LoadConfig("my_config")   -- loads from file
```

> When `AutoConfig = true`, saving and loading happens automatically on UI close/open.

### ESP Preview
```lua
lib:SetESPProvider(function()
    return { ... }  -- your ESP data table
end)

lib:SetESPData({ ... })     -- set data directly
lib:SetESPPreview(true)     -- show/hide the preview panel
```

### Destroy
```lua
lib:Destroy()  -- removes all UI and cleans up connections
```

---

## 📝 Full Example

```lua
local AtomUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/main/AtomUI.lua"
))()

local lib = AtomUI.new({
    Name        = "VoidHub",
    AccentColor = Color3.fromRGB(138, 43, 226),
    AutoConfig  = true
})

-- ── Main Section ──────────────────────────────────────────────────────────────
local main = lib:AddSection({ Name = "Main", Icon = "sword" })

local combat = main:AddTab({ Name = "Combat", Icon = "crosshair" })

local aimbot = combat:AddGroup({ Name = "Aimbot", Side = "Left", Icon = "target" })
aimbot:AddToggle({ Name = "Enabled", Default = false, Callback = function(v) end })
aimbot:AddSlider({ Name = "FOV", Min = 10, Max = 800, Default = 120, Increment = 5, Callback = function(v) end })
aimbot:AddDropdown({ Name = "Target Part", Options = {"Head","Torso"}, Default = "Head", Callback = function(v) end })
aimbot:AddKeybindToggle({ Name = "Hotkey", Default = Enum.KeyCode.E, ToggleDefault = false, Callback = function(v) end })

local visuals = combat:AddGroup({ Name = "Visuals", Side = "Right", Icon = "eye" })
visuals:AddToggle({ Name = "ESP", Default = false, Callback = function(v) end })
visuals:AddColorPicker({ Name = "ESP Color", Default = Color3.fromRGB(255,0,0), Callback = function(v) end })

-- ── Player Section ────────────────────────────────────────────────────────────
local player = main:AddTab({ Name = "Player", Icon = "user" })

local movement = player:AddGroup({ Name = "Movement", Side = "Left", Icon = "move" })
movement:AddToggle({ Name = "Speed Hack", Default = false, Callback = function(v) end })
movement:AddSlider({ Name = "Walk Speed", Min = 16, Max = 200, Default = 16, Increment = 1, Callback = function(v) end })
movement:AddSlider({ Name = "Jump Power", Min = 50, Max = 500, Default = 50, Increment = 5, Callback = function(v) end })

-- ── Config Section ────────────────────────────────────────────────────────────
local cfg_sec = lib:AddSection({ Name = "Config", Icon = "settings" })
local cfg_tab = cfg_sec:AddTab({ Name = "Settings", Icon = "save" })
local cfg     = cfg_tab:AddGroup({ Name = "Config", Side = "Left", Icon = "hard-drive" })

cfg:AddButton({ Name = "Save", Callback = function()
    lib:SaveConfig("voidhub")
    lib:Notify({ Title = "Config", Description = "Saved!", Duration = 3 })
end })
cfg:AddButton({ Name = "Load", Callback = function()
    lib:LoadConfig("voidhub")
    lib:Notify({ Title = "Config", Description = "Loaded!", Duration = 3 })
end })

lib:Notify({ Title = "VoidHub", Description = "Press RightCtrl to toggle.", Duration = 5 })
```

---

<div align="center">

Made with 🔮 by [**vonplayz_real**](https://github.com/VoidDeveloper67) & [**DarealBloxfruiter**](https://github.com/darkflareplays8)

Part of the **VoidHub** project &nbsp;·&nbsp; [GitHub →](https://github.com/VoidDeveloper67/AtomUI)

</div>