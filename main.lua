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
		Title = "RoHub | Free",
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
    ["Race_Clicker"] = 9285238704,
    ["Arsenal"] = , -- DO (will be free)
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
	local Tab = Window:CreateTab("Main")

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

if game.PlaceId == Games.Race_Clicker then -- NOT DONE (void making)
    local AutoClick

    local RaceTab = Window:CreateTab("Auto")

    local AutoClicker = RaceTab:CreateToggle({
	    Name = "Auto Clicker",
	    CurrentValue = false,
	    Flag = "Toggle2",
	    Callback = function(Value)
        AutoClick = Value
        while AutoClick do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
            wait(0.000000000000001)
	    end
    end
})
end

if game.PlaceId == Games.Arsenal then

	local aimbotOn

	local ArsenalTab = Window:CreateTab("Aim")

	local s1 = ArsenalTab:CreateSection("Aimbot")
	local Aimbot = ArsenalTab:CreateToggle({
		Name = "Aimbot",
		CurrentValue = false,
		Flag = "Toggle2",
		Callback = function(Value)
		_G.AimbotInput = "RightClick"
		_G.AimbotEasing = 0.2
		_G.TeamCheck = true
		if _G.AlreadyRanItBroDanger then
			return
		end
	_G.AlreadyRanItBroDanger = "It's your nutshack"

	local uis = game:GetService("UserInputService")
	local players = game:GetService("Players")
	local teams = game:GetService("Teams")
	local plr = players.LocalPlayer
	local ms = plr:GetMouse()
	local cam = workspace.CurrentCamera

	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		cam = Workspace.CurrentCamera
	end)

	local aimbotOn = false

	function canSee(part, des)
		local origin = cam.CFrame.Position
		local __, onscreen = cam:WorldToViewportPoint(part.Position)

		if onscreen then
			local ray = Ray.new(origin, part.Position - origin)
			local hit = workspace:FindPartOnRayWithIgnoreList(ray, plr.Character:GetDescendants())
			local vis = false

			if hit and hit:IsDescendantOf(des) then
				vis = true
			else
				vis = false
			end

			return vis
		else
			return false
		end
	end

	function getClosestPlrToMouse()
		local closest, distance = nil, math.huge

		for i, v in pairs(player:GetPlayers()) do
			if v ~= plr then
				pcall(function()
					local checkPassed = true
				
					if _G.TeamCheck then
						if plr.TeamColor == v.TeamColor then
							checkPassed = false
						end
					end
					
					if (ms.Hit.Position - v.Character.PrimaryPart.Position).magnitude < distance and checkPassed then
						if canSee(v.Character.Head, v.Character) and v.Character.Humanoid.Health > 0 then
							closest = v
							distance = (ms.Hit.Position - v.Charactter.PrimaryPart.Position).magnitude
						end
					end
				end)
			end
		end

		return closest, distance
	end
	uis.InputBegan:Connect(function(input, processed)
		if not processed then
			if _G.AimbotInput == "LeftClick" and input.UserInputType == Enum.UserInputType.MouseButton1 then
				aimbotOn = true
			elseif _G.AimbotInput == "RightClick" and input.UserInputType == Enum.UserInputType.MouseButton2 then
				aimbotOn = true
			elseif input.KeyCode.Name == _G.AimbotInput then
				aimbotOn = true
			end
		end
	end)

	uis.InputEnded:Connect(function(input, processed)
		if not processed then
			if _G.AimbotInput == "LeftClick" and input.UserInputType == Enum.UserInputType.MouseButton1 then
				aimbotOn = false
			elseif _G.AimbotInput == "RightClick" and input.UserInputType == Enum.UserInputType.MouseButton2 then
				aimbotOn = false
			elseif input.KeyCode.Name == _G.AimbotInput then
				aimbotOn = false
			end
		end
	end)
	
	while task.wait() do
		if aimbotOn then
			local targ = getClosestPlrToMouse
			if targ then
				local currentcf = workspace.CurrentCamera.CFrame
				workspace.CurrentCamera.CFrame = currentcf:Lerp(CFrame.new(currentcf.Position, targ.Character.Head.Position), _G.AimbotEasing)
			end
		end
	end
		end
	})

	local s2 = ArsenalTab:CreateSection("ESP")
	local ESP = ArsenalTab:CreateToggle({
		Name = "Box ESP",
		CurrentValue = false,
		Flag = "Toggle3",
		Callback = function(Value)
		local lplr = game.Players.LocalPlayer
		local camera = game:GetService()
		local CurrentCamera = workspace.CurrentCamera
		local worldToViewportPoint = CurrentCamera.worldToViewportPoint

		local HeadOff = Vector3.new(0, 0.5, 0)
		local LegOff = Vector3.new(0, 3, 0)

		for i,v in pairs(game.Players:GetChildren()) do
			local BoxOutline = Drawing.new("Square")
			BoxOutline.Visible = false
			BoxOutline.Color = Color3.new(0,0,0)
			BoxOutline.Thickness = 3
			BoxOutline.Transparency = 1
			BoxOutline.Filled = false

			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.new(1,1,1)
			Box.Thickness = 1
			Box.Transparency = 1
			Box.Filled = false

			function boxesp()
				game:GetService("RunService").RenderStepped:Connect(function()
				if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
					local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
					
					local RootPart = v.Character.HumanoidRootPart
					local Head = v.Character.Head
					local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
					local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
					local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
					
					if onScreen then
						BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
						BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
						BoxOutline.Visible = true
					
						Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
						Box.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
						Box.Visible = true

						if v.TeamColor == lplr.TeamColor then
							BoxOutline.Visible = false
							Box.Visible = false
						else
							BoxOutline.Visible = true
							Box.Visible = true
						end

					else
						BoxOutline.Visible = false
						Box.Visible = false
					end
				else
					BoxOutline.Visible = false
					Box.Visible = false
				end
			end)
		end
		coroutine.wrap(boxesp)()
	end

	game.Players.PlayerAdded:Connect(function(v)
	local BoxOutline = Drawing.new("Square")
	BoxOutline.Visible = false
	BoxOutline.Color = Color3.new(0,0,0)
	BoxOutline.Thickness = 3
	BoxOutline.Transparency = 1
	BoxOutline.Filled = false

	local Box = Drawing.new("Square")
	Box.Visible = false
	Box.Color = Color3.new(1,1,1)
	Box.Thickness = 1
	Box.Transparency = 1
	Box.Filled = false

	function boxesp()
		game:GetService("RunService").RenderStepped:Connect(function()
			if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
				local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
			
				local RootPart = v.Character.HumanoidRootPart
				local Head = v.Character.Head
				local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
				local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
				local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
				
				if onScreen then
					BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
					BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
					BoxOutline.Visible = true
				
					Box.Size Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
					Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
					Box.Visible = true
					
					if v.TeamColor == lplr.TeamColor then
						BoxOutline.Visible = false
						Box.Visible = false
					else
						BoxOutline.Visible = true
						Box.Visible = true
					end
				
				else
					BoxOutline.Visible = false
				Box.Visible = false
				end
			end)
		end
		coroutine.wrap(boxesp)()
	end)
		end	
	})
	local ESP2 = ArsenalTab:CreateToggle({
		Name = "Name ESP",
		CurrentValue = false,
		Flag = "Toggle4",
		Callback = function(Value)
		local c = workspace.CurrentCamera
		local ps = game:GetService("Players")
		local lp = ps.LocalPlayer
		local rs = game:GetService("RunService")

		local function esp(p,cr)
			local h = cr:WaitForChild("Humanoid")
			local hrp = cr:WaitForChild("HumanoidRootPart")

			local text = Drawing.new("Text")
			text.visible = false
			text.center = true
			text.Outline = true
			text.Font = 2
			text.Color = Color3.fromRGB(255,255,255)
			text.Size = 13

			local c1
			local c2
			local c3

			local function dc()
				text.Visible = false
				text:Remove()
				if c1 then
					c1:Disconnect()
					c1 = nil
				end
				if c3 then
					c3:Disconnect()
					c3 = nil
				end
			end

			c2 = cr.AncestryChanged:Connect(function(_,parent)
				if not parent then
					dc()
				end
			end)

			c3 = h.HealthChanged:Connect(function(v)
			if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
				dc()
			end
		end)
	end

	local function p_added(p)
		if p.Character then
			esp(p,p.Character)
		end
		p.CharacterAdded:Connect(function(cr)
		esp(p,cr)
		end)
	end

	for i,p in next, ps:GetPlayers() do
		if p ~= lp then
			p_added(p)
		end
	end

	ps.PlayerAdded:Connect(p_added)
	end
	})
	local SilentAim = ArsenalTab:CreateToggle({
		Name = "Silent Aimbot",
		CurrentValue = false,
		Flag = "Toggle5",
		Callback = function(Value)
		assert(getgc, "missing dependency: getgc");
			
		local players  = game:GetService("Players");
		local workspace = game:GetService("Workspace");
		local input_service = game:GetService("UserInputService");
		local replicated_first = game:GetService("ReplicatedFirst");
		
		local camera = workspace.CurrentCamera;
		local wtvp = camera.WorldToViewportPoint;
		local mouse_pos = input_service.GetMouseLocation;
		local localplayer = players.LocalPlayer;
		local ticket = 0;

		local new_vector2 = Vector2.new;

		local modules = {};
		modules.network = require(replicated_first.ClientModules.Old.framework.network);
		modules.values = require(replicated_first.SharedModules.SharedConfigs.PublicSettings);
		modules.physics = require(replicated_first.SharedModules.Old.Utilities.Math.physics:Clone());

		for _, v in next, getgc(true) do
			if type(v) == "table" then
				if rawget(v, "getbodyparts") then
					modules.replication = v;
				elseif rawget(v, "gammo") then
					modules.gamelogic = v;
				end
			end
		end

		local function get_closest()
			local closest, player = math.huge, nil;
			for _, p in next, players:GetPlayers() do
				local character = modules.replication.getbodyparts(p);
				if character and p.Team ~= localplayer.Team then
					local pos, visible = wtvp(camera, character.head.Position);
					pos = new_vector2(pos.X, pos.Y);

					local magnitude = (pos - mouse_pos(input_service)).Magnitude;
					if magnitude < closest and visible then
						closest = magnitude;
						player = p;
					end
				end
			end
			return player;
		end

		local old = modules.network.send;
		function modules.network.send(self, name, ...)
			local args = table.pack(...);
			if name = "newbullets" then
				local gun = modules.gamelogic.currnetgun;
				local data = gun and gun.data;
				if gun and data then
					local player = get_closest();
					local character = modules.replication.getbodyparts(player);
					if player and character then
						local hitpart = character.head;

						for _, bullet in next, args[1].bullets do
							bullet[1] = modules.physics.trajectory(args[1].firepos, modules.values.bulletAcceleration, hitpart.Position, data.bulletspeed);
							bullet[2] = ticket;

							ticket += 1;
						end

						old(self, name, table.unpack(args));

						for _, bullet in next, args[1].bullets do
							old(self, "bullethit", player, hitpart.Position, hitpart.Name, bullet[2]);
						end

						return;
					end
				end
			end
			return old(self, name, table.unpack(args));
		end
			end
	})

	local PlayerChams = ArsenalTab:CreateToggle({
		Name = "Player Chams",
		CurrentValue = false,
		Flags = "Toggle6",
		Callback = function()
			local settings = {

				fillcolor = Color3.fromRGB(255,255,255);
				filltransparency = .75;
				
				outlinecolor = Color3.fromRGB(255, 235, 67);
				outlinetransparency = 0;

			}
			
			local plr = game:service'Players'.LocalPlayer
			local highlights = Instance.new('Folder', game:service'CoreGui')

			local function addhighlight(object)
				local highlight = Instance.new('Highlight', highlights)
				highlight.Adornee = object

				highlight.FillColor = settings.fillcolor
				highlight.FillTransparency = settings.filltransparency

				highlight.OutlineColor = settings.outlinecolor
				highlight.OutlineTransparency = settings.outlinetransparency

				highlight.Adonee.Changed:Connect(function()
				if not highlight.Adornee or not highlight.Adornee.Parent then
					highlight:Destroy()
				end
			end)

			return highlight
		end

		local function addtoplayer(object)
			if object:IsA'Model' and object.Name == 'Player' and object.Parent.Name ~= tostring(plr.TeamColor) then
				addhighlight(object)
			end
		end

		for i,v in pairs(workspace.Players:GetDescendants()) do
			addtoplayer(v)
		end

		workspace.Players.DescendantAdded:Connect(function(v)
		addtoplayer(v)
		end)
			end
	})