local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "RoHub Key System",
	LoadingTitle = "RoHub Key System",
	LoadingSubtitle = "by RoHub Dev Team",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "RoHub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})

_G.Key = "Test",
_G.KeyInput == Value

function MakeScriptHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/voidded/RoHub-Free/main/games/brokenbones.lua",true))()
end

local KeyTab = Window:CreateTab("Key", 4483362458)

local Input = KeyTab:CreateInput({
	Name = "Enter Key",
	PlaceholderText = "Enter Key",
	RemoveTextAfterFocusLost = true,
	Callback = function(Value)
        _G.KeyInput = Value
	end,
})

local Button = KeyTab:CreateButton({
	Name = "Check Key",
	Callback = function()
		if _G.KeyInput == _G.Key then
            MakeScriptHub()
        end
	end,
})