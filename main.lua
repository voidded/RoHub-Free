--# Variables #--

local CurrentVersion = 0.1

--# Import #--

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "RoHub Freemium",
	LoadingTitle = "RoHub | Free",
	LoadingSubtitle = "A really good, free & paid script hub.",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "RoHub", -- Create a custom folder for your hub/game
		FileName = "Edition"
	},
        Discord = {
        	Enabled = false,
        	Invite = "", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system

	--# Keysystem is auto off on default, do not turn it on!
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Dev"
	}
})

--# Functions #--

local function Notification(Head, Subhead, Time)
    Rayfield:Notify({
        Title = Head,
        Content = Subhead,
        Duration = Time,
        Image = 4483362458,
    })
end

local function getexploit()
	local exploit =
		(syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
		(secure_load and "Sentinel") or
		(is_sirhurt_closure and "Sirhurt") or
		(pebc_execute and "ProtoSmasher") or
		(KRNL_LOADED and "Krnl") or
		(WrapGlobal and "WeAreDevs") or
		(isvm and "Proxo") or
		(shadow_env and "Shadow") or
		(jit and "EasyExploits") or
		(getscriptenvs and "Calamari") or
		(unit and not syn and "Unit") or
		(OXYGEN_LOADED and "Oxygen U") or
		(IsElectron and "Electron") or
		("Other")
	return exploit
end

--# Tables #--

local Games = {
	["Merge_Simulator"] = 10925589760,
	["Broken_Bones_IV"] = 2551991523,
}


--# Special Permissions #--

local Owners = {
	["LovelySin"] = "LovelySin#2182",
	["Voidded"] = "voidded#4920",
}

if game:GetService("Players").LocalPlayer.Name == Owners.Voidded or Owners.LovelySin then
	Notification("Welcome, "..game:GetService("Players").LocalPlayer.DisplayName.." 🙋‍♂️", "You're the #1 of Ro-Hub, we know it feels great.", 5)
end

local Developers = {
	["LovelySin"] = "LovelySin#2182",
	["Voidded"] = "voidded#4920",
}

if game:GetService("Players").LocalPlayer.Name == Developers.LovelySin or Developers.Voidded then
	Notification("Greetings, "..game:GetService("Players").LocalPlayer.DisplayName.." 👏", "Thank you for creating the #1 free & paid script hub for everybody to enjoy!", 3)
end

local Admins = {
	["Noah"] = "noah.#3029",
}

if game:GetService("Players").LocalPlayer.Name == Admins.Noah then
	Notification("Hello! 😲", "We're glad you're using our script, make sure to keep the moderation goes as well.", 5)
end

local Special_Permissions = {
	["Hexry"] = "Hexry#1219",
}

if game:GetService("Players").LocalPlayer.Name == Special_Permissions.Hexry then
	Notification("Hola! 🥶", "You're just a cool guy to be honest.")
end

--# Game Support #--

local Home = Window:CreateTab("Home")
local ServerInfo = Home:CreateSection("Server Information")
local LocalUpTime = Home:CreateLabel("Time since you launched 0h 0m 0s")
coroutine.wrap(function()
	local PlayerSeconds = 0;
	local PlayerMinutes = 0;
	local PlayerHours = 0;
	while task.wait(1) do
		PlayerSeconds += 1
		if PlayerSeconds == 60 then
			PlayerSeconds = 0;
			PlayerMinutes += 1
			if PlayerMinutes == 60 then
				PlayerMinutes = 0;
				PlayerHours += 1
			end
		end
		LocalUpTime:Set("Time since you launched "..PlayerHours.."h "..PlayerMinutes.."m "..PlayerSeconds.."s")
	end
end)()

local ServerUpTime = Home:CreateLabel("The server has been up for 0h 0m 0s")
coroutine.wrap(function()
	while task.wait() do
		local seconds = math.floor(game.Workspace.DistributedGameTime)
		local minutes = math.floor(game.Workspace.DistributedGameTime / 60)
		local hours = math.floor(game.Workspace.DistributedGameTime / 60 / 60)
		local seconds = seconds - (minutes * 60)
		local minutes = minutes - (hours * 60)
		if hours < 1 then
			if minutes < 1 then
				ServerUpTime:Set("The server has been up for 0h 0m "..seconds.."s")
			else
				ServerUpTime:Set("The server has been up for 0h "..minutes.."m "..seconds.."s")
			end
		else
			ServerUpTime:Set("The server has been up for "..hours.."h "..minutes.."m "..seconds.."s")
		end
	end
end)()

local Credits = Home:CreateSection("Script Credits")

local Owners = Home:CreateLabel("Owners of RoHub: "..Owners.Voidded..", "..Owners.LovelySin.."")
local Developers = Home:CreateLabel("Developers of RoHub: "..Developers.Voidded..", "..Developers.LovelySin.."")
local Admins = Home:CreateLabel("Admins of RoHub: "..Admins.Noah)
local Special = Home:CreateLabel("Special People: "..Special_Permissions.Hexry.."")

local Configuration = Window:CreateTab("Configuration")

local General = Configuration:CreateSection("Miscellaneous")
local DestroyGUI = Configuration:CreateButton({
	Name = "Destroy GUI",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local Rejoin = Configuration:CreateButton({
	Name = "Rejoin Game",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end,
})

local ServerHop = Configuration:CreateButton({
	Name = "Server Hop",
	Callback = function()
		httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		HttpService = game:GetService("HttpService")
		if httprequest then
			local servers = {}
			local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)})
			local body = HttpService:JSONDecode(req.Body)
			if body and body.data then
				for i, v in next, body.data do
					if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
						table.insert(servers, 1, v.id)
					end 
				end
			end
			if #servers > 0 then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
			else
				return Notification("Could not find a server!", "There are no servers available to join.")
			end
		end
	end,
})

local Coloring = Configuration:CreateSection("Colorings")
local ColorPicker_Background = Configuration:CreateLabel("Coming Soon, Not added to Rayfield yet!")

if game.PlaceId == Games.Merge_Simulator then
	--[[
		##############################################################################################################################################################
		##																																						    ##
		## 	 Not skidding if it's open sourced you retard skiddies	        																					    ##
		## 	 Made by Alyssa on GitHub, View the source code here: https://raw.githubusercontent.com/alyssagithub/Scripts/main/Script%20Hub%20-%20Inferno%20X.lua    ##
		##																																						    ##
		##############################################################################################################################################################
	]]
	local function Click(v)
		VirtualInputManager:SendMouseButtonEvent(v.AbsolutePosition.X+v.AbsoluteSize.X/2,v.AbsolutePosition.Y+50,0,true,v,1)
		VirtualInputManager:SendMouseButtonEvent(v.AbsolutePosition.X+v.AbsoluteSize.X/2,v.AbsolutePosition.Y+50,0,false,v,1)
	end
	local YourPlot = workspace.Plots:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
	local AutoTapLooping
	local AutoMergeLooping
	local AutoUpgradeLooping
	local AutoObbyLooping
	local AutoRebirthLooping
	local InfObbyMultiLooping
	local OriginalAutoMergeLooping
	local Blocks = {}
	local MergeingUwU = Window:CreateTab("Farming")
	local Farming = MergeingUwU:CreateSection("Statistics")
	local AutoMerge = MergeingUwU:CreateToggle({
		Name = "Auto Merge",
		CurrentValue = false,
		Flag = "Toggle2",
		Callback = function(Value)
			AutoMergeLooping = Value
			OriginalAutoMergeLooping = Value
			while AutoMergeLooping and task.wait() do
				for i,v in pairs(YourPlot.Blocks:GetChildren()) do
					v.CFrame = CFrame.new(YourPlot.Main.Position.X + 10, YourPlot.Main.Position.Y + 10, YourPlot.Main.Position.Z + 10)
				end
			end
		end,
	})
	local AutoUpgrade = MergeingUwU:CreateToggle({
		Name = "Auto Upgrade",
		CurrentValue = false,
		Flag = "Toggle3",
		Callback = function(Value)
			AutoUpgradeLooping = Value
			while AutoUpgradeLooping and task.wait() do
				for i,v in pairs(game.Players.LocalPlayer.PlayerGui.World.Upgrades.Main:GetChildren()) do
					if v:IsA("Frame") then
						firesignal(v.Buy.Activated)
					end
				end
			end
		end,
	})
	local AutoObby = MergeingUwU:CreateToggle({
		Name = "Auto Complete Obby",
		CurrentValue = false,
		Flag = "Toggle4",
		Callback = function(Value)
			AutoObbyLooping = Value
			while AutoObbyLooping and task.wait() do
				if game:GetService("Workspace").Obby.Blocker.Transparency == 1 then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(267, 81, 4)
					repeat task.wait() until game:GetService("Workspace").Obby.Blocker.Transparency ~= 1
				end
			end
		end,
	})
	local AutoRebirth = MergeingUwU:CreateToggle({
		Name = "Auto Rebirth",
		CurrentValue = false,
		Flag = "Toggle5",
		Callback = function(Value)
			AutoRebirthLooping = Value
			while AutoRebirthLooping do
				game:GetService("ReplicatedStorage").Functions.Rebirth:InvokeServer()
				task.wait(1)
			end
		end,
	})
	local InfObbyMultiply = MergeingUwU:CreateToggle({
		Name = "Infinite Obby Multiplier",
		CurrentValue = false,
		Flag = "Toggle6",
		Callback = function(Value)
			InfObbyMultiLooping = Value
			while InfObbyMultiLooping do
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Obby.Finish, 0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Obby.Finish, 1)
				task.wait(1)
			end
		end,
	})
end

if game.PlaceId == Games.Broken_Bones_IV then
	local Tab = Window:CreateTab("Main") -- Title, Image

	local Button = Tab:CreateButton({
		Name = "Start",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2207, 128, -374)
			plr = game:GetService('Players').LocalPlayer
			torso = plr.Character.UpperTorso
			hum = plr.Character.Humanoid
			mouse = plr:GetMouse()
			stop = false
			while stop == false do
			local bp = Instance.new('BodyPosition')
			bp.MaxForce = Vector3.new(999999,999999,999999)
			bp.Position = torso.Position
			bp.Parent = torso
			local bav = Instance.new('BodyAngularVelocity')
			bav.MaxTorque = Vector3.new(999999,999999,999999)
			bav.AngularVelocity = Vector3.new(200,200,200)
			bav.Parent = torso
			wait()
		end
	end,
	})

	local Button = Tab:CreateButton({
		Name = "Stop",
		Callback = function()
			local player = game.Players.LocalPlayer.Name

			game.workspace[player]:BreakJoints()
	end,
	})
end