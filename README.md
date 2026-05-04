# AtomUI

A modern, sleek, and highly customizable Roblox UI library built for executors. Designed with performance in mind and packed with features.

[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/von63rd/atomui)
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
| `AddToggle` | On/off switch with animation |
| `AddSlider` | Draggable value slider |
| `AddDropdown` | Single-select dropdown with search |
| `AddMultiDropdown` | Multi-select dropdown |
| `AddButton` | Clickable button with optional icon |
| `AddKeybind` | Keybind input with Toggle/Hold modes |
| `AddKeybindToggle` | Combined keybind + toggle |
| `AddTextInput` | Text input field |
| `AddTextbox` | Extended text input with callbacks |
| `AddLabel` | Text label with optional wrapping |
| `AddParagraph` | Multi-line wrapped text |
| `AddDivider` | Visual separator line |
| `AddSpacer` | Empty vertical space |
| `AddColorPicker` | HSV color picker with presets |

## Quick Start

```lua
local atom_ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/von63rd/atomui/main/AtomUI.lua"))()

local lib = atom_ui.new({
    Name = "My Script",
    AccentColor = Color3.fromRGB(2, 133, 255),
    AutoConfig = true
})

local section = lib:AddSection({Name = "Main", Icon = "home"})
local tab = section:AddTab({Name = "Combat", Description = "Combat settings", Icon = "crosshair"})
local group = tab:AddGroup({Name = "Aimbot", Side = "Left", Icon = "target"})

group:AddToggle({
    Name = "Enabled",
    Default = false,
    Callback = function(v) print("Aimbot:", v) end
})

lib:Notify({
    Title = "Loaded",
    Description = "Press RightCtrl to toggle",
    Duration = 5
})
```

## Configuration Options

```lua
atom_ui.new({
    Name = "Script Name",           -- UI title
    AccentColor = Color3.fromRGB(2, 133, 255), -- Theme color
    AutoConfig = true,              -- Enable config auto-save/load
    ShowAutoSaveToggle = true,      -- Show auto-save toggle in settings
    ConfigFolder = "MyConfigs",     -- Config folder name
    UseConfigSystem = true,         -- Enable config system
    Watermark = "My Script v1.0"    -- Optional watermark text
})
```

## Library Methods

| Method | Description |
|--------|-------------|
| `lib:Toggle()` | Open/close the UI |
| `lib:Open()` | Open the UI |
| `lib:Close()` | Close the UI |
| `lib:Notify(config)` | Show a notification |
| `lib:SetAccentColor(color)` | Change accent color |
| `lib:SetFontPreset(index)` | Change font preset |
| `lib:SaveConfig(name)` | Save config to file |
| `lib:LoadConfig(name)` | Load config from file |
| `lib:RefreshConfigs()` | List available configs |
| `lib:SetWatermark(config)` | Set watermark |
| `lib:SetWatermarkText(text)` | Update watermark text |
| `lib:SetESPPreview(enabled)` | Toggle ESP preview |
| `lib:Destroy()` | Destroy the UI |

## Demo

Run the built-in demo:

```lua
local atom_ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/von63rd/atomui/main/AtomUI.lua"))()
atom_ui.Demo()
```

## Documentation

Full documentation is available at: [https://von63rd.github.io/atomui](https://von63rd.github.io/atomui)

## Credits

Made by **von63rd**

## License

MIT License — feel free to use and modify.
