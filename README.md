# AtomUI

> A feature-rich Roblox UI library for exploit scripts. Built by **vonplayz_real** & **DarealBloxfruiter** — VoidHub project.

-----

## Load

```lua
local AtomUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/main/AtomUI.lua"
))()
```

-----

## Quick Start

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

-----

## `AtomUI.new(config)`

Creates a new UI instance. All fields are optional.

|Field            |Type  |Default        |Description                        |
|-----------------|------|---------------|-----------------------------------|
|`Name`           |string|`"o11 vision"` |Window title                       |
|`AccentColor`    |Color3|Blue           |Main accent color                  |
|`BackgroundColor`|Color3|`RGB(16,16,16)`|Window background                  |
|`SecondaryColor` |Color3|`RGB(18,18,18)`|Secondary panels                   |
|`TextColor`      |Color3|White          |Primary text                       |
|`SubTextColor`   |Color3|Grey           |Secondary text                     |
|`AutoConfig`     |bool  |`false`        |Auto save/load config on open/close|

-----

## Structure

```
lib (atom_ui)
 └── Section  (lib:AddSection)
      └── Tab  (section:AddTab)
           └── Group  (tab:AddGroup)
                └── Elements (Toggle, Slider, Button, etc.)
```

-----

## Sections

```lua
local section = lib:AddSection({
    Name = "Main",   -- required
    Icon = "sword"   -- lucide icon name or rbxassetid
})
```

-----

## Tabs

```lua
local tab = section:AddTab({
    Name        = "Combat",
    Description = "Combat settings",  -- shown as subtitle
    Icon        = "crosshair"
})
```

-----

## Groups

```lua
local group = tab:AddGroup({
    Name = "Aimbot",
    Side = "Left",   -- "Left" or "Right"
    Icon = "target"
})
```

-----

## Elements

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
    Options  = {"Head", "HumanoidRootPart", "Torso"},
    Default  = "Head",
    Callback = function(val) end  -- val: string
})
```

### Multi-Dropdown

```lua
group:AddMultiDropdown({
    Name     = "Notifications",
    Options  = {"Kills", "Deaths", "Chat"},
    Default  = {"Kills", "Chat"},
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

### Keybind Toggle

```lua
group:AddKeybindToggle({
    Name          = "Toggle Key",
    Default       = Enum.KeyCode.E,
    ToggleDefault = false,
    Callback      = function(val) end  -- val: bool (toggle state)
})
```

### Color Picker

```lua
group:AddColorPicker({
    Name     = "ESP Color",
    Default  = Color3.fromRGB(255, 0, 0),
    Callback = function(val) end  -- val: Color3
})
```

### Text Input

```lua
group:AddTextInput({
    Name            = "Webhook URL",
    Default         = "",
    PlaceholderText = "https://...",
    Callback        = function(val) end  -- val: string (fires on Enter/unfocus)
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

-----

## Library Methods

### Notify

```lua
lib:Notify({
    Title       = "VoidHub",
    Description = "Something happened!",
    Duration    = 4  -- seconds
})
```

### Toggle Visibility

```lua
lib:Toggle()                          -- flip open/closed
lib:SetToggleKey(Enum.KeyCode.RightControl)  -- default key
lib:SetToggleVisible(true)            -- show/hide the toggle button
```

### Accent Color

```lua
lib:SetAccentColor(Color3.fromRGB(138, 43, 226))
```

### Font Preset

```lua
-- index 1–10
-- 1=Gotham, 2=Gotham Medium, 3=Montserrat, 4=Nunito,
-- 5=Bodoni, 6=Garamond, 7=Source Sans, 8=Highway, 9=Antique, 10=Code
lib:SetFontPreset(1)
```

### Config

```lua
lib:SaveConfig("my_config")   -- saves to file
lib:LoadConfig("my_config")   -- loads from file
```

### Destroy

```lua
lib:Destroy()  -- removes all UI and cleans up connections
```

### ESP Preview

```lua
-- Provide a function that returns ESP data for the live preview panel
lib:SetESPProvider(function()
    return { ... }  -- your esp data table
end)

lib:SetESPData({ ... })     -- set data directly
lib:SetESPPreview(true)     -- show/hide the preview panel
```

-----

## Config (Auto Save/Load)

When `AutoConfig = true`, the library automatically saves all control values when the UI closes and restores them on next load. Manual save/load also works:

```lua
lib:SaveConfig("voidhub_cfg")
lib:LoadConfig("voidhub_cfg")
```

-----

## Full Example (VoidHub style)

```lua
local AtomUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/main/AtomUI.lua"
))()

local lib = AtomUI.new({
    Name        = "VoidHub",
    AccentColor = Color3.fromRGB(138, 43, 226),
    AutoConfig  = true
})

-- ── Main Section ──────────────────────────────────────────
local main = lib:AddSection({ Name = "Main", Icon = "sword" })

-- Combat Tab
local combat = main:AddTab({ Name = "Combat", Icon = "crosshair" })

local aimbot = combat:AddGroup({ Name = "Aimbot", Side = "Left", Icon = "target" })
aimbot:AddToggle({ Name = "Enabled", Default = false, Callback = function(v) end })
aimbot:AddSlider({ Name = "FOV", Min = 10, Max = 800, Default = 120, Increment = 5, Callback = function(v) end })
aimbot:AddDropdown({ Name = "Target Part", Options = {"Head", "Torso"}, Default = "Head", Callback = function(v) end })
aimbot:AddKeybindToggle({ Name = "Hotkey", Default = Enum.KeyCode.E, ToggleDefault = false, Callback = function(v) end })

local visuals = combat:AddGroup({ Name = "Visuals", Side = "Right", Icon = "eye" })
visuals:AddToggle({ Name = "ESP", Default = false, Callback = function(v) end })
visuals:AddColorPicker({ Name = "ESP Color", Default = Color3.fromRGB(255, 0, 0), Callback = function(v) end })

-- Player Tab
local player = main:AddTab({ Name = "Player", Icon = "user" })

local movement = player:AddGroup({ Name = "Movement", Side = "Left", Icon = "move" })
movement:AddToggle({ Name = "Speed Hack", Default = false, Callback = function(v) end })
movement:AddSlider({ Name = "Walk Speed", Min = 16, Max = 200, Default = 16, Increment = 1, Callback = function(v) end })
movement:AddSlider({ Name = "Jump Power", Min = 50, Max = 500, Default = 50, Increment = 5, Callback = function(v) end })

-- ── Config Section ────────────────────────────────────────
local cfg_sec = lib:AddSection({ Name = "Config", Icon = "settings" })
local cfg_tab = cfg_sec:AddTab({ Name = "Settings", Icon = "save" })

local cfg = cfg_tab:AddGroup({ Name = "Config", Side = "Left", Icon = "hard-drive" })
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

-----

## Credits

Made by **vonplayz_real** & **DarealBloxfruiter**  
Part of the **VoidHub** project
