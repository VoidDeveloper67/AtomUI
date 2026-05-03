local AtomUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/VoidDeveloper67/AtomUI/main/AtomUI.lua"
))()

-- Example usage:
local lib = AtomUI.new({
    Name = "VoidHub",
    AccentColor = Color3.fromRGB(138, 43, 226),
    AutoConfig = true
})

local section = lib:AddSection({ Name = "Main", Icon = "sword" })
local tab = section:AddTab({ Name = "Combat", Icon = "crosshair" })
local group = tab:AddGroup({ Name = "Settings", Side = "Left" })

group:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(val)
        print("Auto Farm:", val)
    end
})
