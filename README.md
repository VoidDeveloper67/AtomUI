# AtomUI

A modern, sleek, and highly customizable Roblox UI library built for executors. Designed with performance in mind and packed with features.

[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/VoidDeveloper67/AtomUI)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## Features

- **Modern Design** — Clean dark theme with customizable accent colors
- **Smooth Animations** — Tween-based transitions for all UI interactions
- **Fully Customizable** — Change colors, fonts, blur, snow effects, and more
- **Config System** — Auto-save and load configurations with JSON
- **Toggle System** — Press `RightCtrl` or use the floating button to toggle UI
- **Search** — Built-in search for tabs and groups
- **Notifications** — Toast-style notifications with progress indicators
- **ESP Preview** — Built-in 3D ESP preview with customizable settings
- **Watermark** — Optional watermark with FPS and time display
- **Safe & Stable** — Error handling throughout to prevent crashes

## Elements

| Element | Description |
|---------|-------------|
| `AddToggle` | On/off switch with animated pill |
| `AddSlider` | Draggable numeric slider with fill bar and value label |
| `AddDropdown` | Single-select dropdown with search filter and auto-width |
| `AddMultiDropdown` | Multi-select dropdown with per-option checkboxes |
| `AddButton` | Clickable button with optional icon and lock state |
| `AddKeybind` | Keybind input with Toggle and Hold modes |
| `AddKeybindToggle` | Combined keybind + toggle in a single row |
| `AddTextInput` | Single-line text field with placeholder and callbacks |
| `AddTextbox` | Alias for `AddTextInput` with extended callback support |
| `AddColorPicker` | HSV color picker with live preview swatch |
| `AddLabel` | Read-only text, single line |
| `AddParagraph` | Multi-line wrapped text block |
| `AddDivider` | Horizontal gradient separator |
| `AddSpacer` | Configurable vertical blank space |
| `AddProgressBar` | Animated fill bar for 0–1 values with optional percent label |
| `AddNumberInput` | − / + stepper with optional Min, Max, and Step constraints |
| `AddBadge` | Colored pill label for status or metadata |
| `AddSubTab` | Horizontal pill sub-navigation inside a tab, each with its own groups and elements |

## Quick Start

```lua
local atom_ui = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/refs/heads/main/AtomUI.lua"
))()

local lib = atom_ui.new({
    Name        = "My Script",
    AccentColor = Color3.fromRGB(2, 133, 255),
    AutoConfig  = true
})

local section = lib:AddSection({ Name = "Main", Icon = "home" })
local tab     = section:AddTab({ Name = "Combat", Description = "Combat settings", Icon = "crosshair" })
local group   = tab:AddGroup({ Name = "Aimbot", Side = "Left", Icon = "target" })

group:AddToggle({
    Name     = "Enabled",
    Default  = false,
    Callback = function(v) print("Aimbot:", v) end
})

lib:Notify({
    Title       = "Loaded",
    Description = "Press RightCtrl to toggle",
    Duration    = 5
})
```

## Configuration Options

```lua
atom_ui.new({
    Name               = "Script Name",
    AccentColor        = Color3.fromRGB(2, 133, 255),
    AutoConfig         = true,
    ShowAutoSaveToggle = true,
    ConfigFolder       = "MyConfigs",
    UseConfigSystem    = true,
    Watermark          = "My Script v1.0"
})
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Name` | string | `"Hub"` | Window title |
| `AccentColor` | Color3 | `fromRGB(2,133,255)` | Theme accent color |
| `AutoConfig` | boolean | `false` | Auto save/load on startup |
| `ConfigFolder` | string | `"AtomConfigs"` | Folder for JSON configs |
| `ShowAutoSaveToggle` | boolean | `true` | Show auto-save toggle in settings |
| `UseConfigSystem` | boolean | `true` | Enable the config UI tab |
| `Watermark` | string | `nil` | Watermark text overlay |

## Library Methods

| Method | Description |
|--------|-------------|
| `lib:Toggle()` | Open/close the UI |
| `lib:Open()` | Open the UI |
| `lib:Close()` | Close the UI |
| `lib:Notify(config)` | Show a toast notification |
| `lib:SetAccentColor(color)` | Change accent color at runtime |
| `lib:SetFontPreset(index)` | Change font preset |
| `lib:SaveConfig(name)` | Save flagged element states to file |
| `lib:LoadConfig(name)` | Load config from file |
| `lib:RefreshConfigs()` | Returns list of saved config names |
| `lib:SetWatermark(config)` | Configure the watermark overlay |
| `lib:SetWatermarkText(text)` | Update watermark text |
| `lib:SetSearchFilter(query)` | Filter tabs/groups by query string |
| `lib:SetESPPreview(enabled)` | Toggle the ESP preview panel |
| `lib:Destroy()` | Destroy the UI and disconnect all connections |

## Element Reference

### AddToggle

```lua
local t = group:AddToggle({
    Name     = "Enabled",
    Default  = false,        -- initial state
    Flag     = "my_toggle",  -- config system key
    Callback = function(v) print(v) end
})
t:Set(true)   -- set programmatically
t:Get()       -- → bool
```

### AddSlider

```lua
local s = group:AddSlider({
    Name      = "FOV",
    Min       = 10,
    Max       = 800,
    Default   = 120,
    Increment = 5,
    Suffix    = "px",         -- unit label (optional)
    ShowMax   = false,        -- show "value / max" format
    Flag      = "my_slider",
    Callback  = function(v) print(v) end
})
s:Set(200)   -- jump to value
s:Get()      -- → number
```

### AddDropdown

```lua
local d = group:AddDropdown({
    Name     = "Target Part",
    Options  = {"Head", "Torso", "HumanoidRootPart"},
    Default  = "Head",
    Flag     = "my_dropdown",
    Callback = function(v) print(v) end
})
d:Set("Torso")
d:UpdateOptions({"Head", "Neck"})  -- swap options at runtime
d:Get()   -- → string
```

### AddMultiDropdown

```lua
local md = group:AddMultiDropdown({
    Name     = "ESP Types",
    Options  = {"Box", "Name", "Health", "Distance"},
    Default  = {"Box", "Name"},
    Flag     = "esp_types",
    Callback = function(values) print(values) end
})
md:Set({"Health"})
md:Get()   -- → table (array of selected strings)
```

### AddButton

```lua
group:AddButton({
    Name     = "Rejoin Server",
    Icon     = "refresh-cw",   -- lucide icon name or rbxassetid (optional)
    Locked   = false,          -- grays out and disables when true
    Callback = function() print("clicked") end
})
```

### AddKeybind

```lua
group:AddKeybind({
    Name            = "Toggle Key",
    Default         = Enum.KeyCode.E,
    Mode            = "Toggle",   -- "Toggle" | "Hold"
    Flag            = "my_key",
    Callback        = function() print("fired") end,
    ChangedCallback = function(key) print("rebound to", key) end
})
```

### AddKeybindToggle

```lua
group:AddKeybindToggle({
    Name          = "Aimbot Key",
    Default       = Enum.KeyCode.CapsLock,
    ToggleDefault = false,
    Flag          = "aimbot_keytoggle",
    Callback      = function(state) print("active:", state) end
})
```

### AddTextInput

```lua
local ti = group:AddTextInput({
    Name        = "Webhook URL",
    Placeholder = "https://discord.com/api/webhooks/...",
    Default     = "",
    Flag        = "webhook_url",
    Callback    = function(text, enterPressed) print(text) end
})
ti:Set("https://...")
ti:Get()          -- → string
ti:ResetValue()   -- revert to Default
```

### AddColorPicker

```lua
local cp = group:AddColorPicker({
    Name     = "ESP Color",
    Default  = Color3.fromRGB(255, 0, 0),
    Flag     = "esp_color",
    Callback = function(c) print(c) end
})
cp:Set(Color3.fromRGB(0, 255, 128))
cp:Get()   -- → Color3
```

### AddLabel / AddParagraph

```lua
group:AddLabel({ Text = "v1.0.0 — Build 42" })

group:AddParagraph({
    Text = "This wraps automatically across multiple lines."
})
```

### AddDivider

```lua
group:AddDivider()   -- no config needed
```

### AddSpacer

```lua
group:AddSpacer()     -- 10px gap (default)
group:AddSpacer(20)   -- 20px gap
```

### AddProgressBar

```lua
local bar = group:AddProgressBar({
    Name        = "Health",
    Value       = 0.75,       -- 0.0 to 1.0
    ShowPercent = true,       -- show "75%" label
    Color       = Color3.fromRGB(80, 220, 100),  -- optional, defaults to AccentColor
})
bar:Set(0.5)                              -- animate to 50%
bar:Set(0.5, false)                       -- instant, no tween
bar:SetColor(Color3.fromRGB(255, 80, 80)) -- tween fill color
bar:Get()                                 -- → number (0–1)
```

### AddNumberInput

```lua
local ni = group:AddNumberInput({
    Name     = "Max Players",
    Default  = 10,
    Min      = 1,      -- optional lower bound
    Max      = 100,    -- optional upper bound
    Step     = 1,      -- amount per +/- click
    Flag     = "max_players",
    Callback = function(v) print(v) end
})
ni:Set(25)   -- set value (clamped to Min/Max)
ni:Get()     -- → number
```

### AddSubTab

Renders a horizontal pill bar at the top of a tab's content area. Each subtab has its own groups and elements. Once any subtab is added to a tab, that tab's direct columns are hidden and all content goes through subtab groups.

```lua
local tab = section:AddTab({ Name = "Settings", Icon = "sliders" })

-- Create subtabs
local general  = tab:AddSubTab({ Name = "General",  Icon = "settings" })
local visual   = tab:AddSubTab({ Name = "Visual",   Icon = "eye" })
local advanced = tab:AddSubTab({ Name = "Advanced" })

-- Add groups and elements to each subtab
local g1 = general:AddGroup({ Name = "Core", Side = "Left", Icon = "cpu" })
g1:AddToggle({ Name = "Enabled",   Default = true,  Callback = function(v) end })
g1:AddSlider({ Name = "Intensity", Min = 0, Max = 100, Default = 50, Callback = function(v) end })

local g2 = visual:AddGroup({ Name = "ESP", Side = "Left", Icon = "box" })
g2:AddToggle({     Name = "Box ESP", Default = false, Callback = function(v) end })
g2:AddColorPicker({ Name = "Color",  Default = Color3.fromRGB(255, 0, 0), Callback = function(c) end })

-- Programmatic control
general:Activate()    -- switch to a subtab
general:Deactivate()  -- hide a subtab (without activating another)
```

> **Note:** SubTab groups support every element method — `AddToggle`, `AddSlider`, `AddDropdown`, `AddColorPicker`, etc.

### AddBadge

```lua
local badge = group:AddBadge({
    Name  = "Status",
    Value = "Active",
    Color = "green",   -- blue | green | red | yellow | purple | gray
})
badge:Set("Inactive", "red")   -- update value and color
badge:Set("Loading")           -- update value only
badge:Get()                    -- → string
```

## Notifications

```lua
lib:Notify({
    Title       = "AtomUI",
    Description = "Script loaded successfully!",
    Duration    = 5,           -- seconds
    Icon        = "check",     -- lucide icon (optional)
})
```

## Demo

Run the built-in demo to see every element in action:

```lua
local atom_ui = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/refs/heads/main/AtomUI.lua"
))()

atom_ui.Demo()
```

> Press **RightCtrl** to toggle the UI open/closed.

## Documentation

Full documentation with interactive examples:
**[https://voiddeveloper67.github.io/AtomUI/](https://voiddeveloper67.github.io/AtomUI/#intro)**

## Credits

Made by **von63rd** and **professionalflare**

## License

MIT License — feel free to use and modify.
