--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora (With additional help from ChatGPT)
   
---------------------------------------------------------------------------------------------------------------------------]]--

wait(0.5)

--[[---------------------------------------------------------------------------------------------------------------------------

  november 9 2024...
  this script doesnt even have a version lmao

---------------------------------------------------------------------------------------------------------------------------]]--

local screengui = Instance.new("ScreenGui")
local noxiousbutton = Instance.new("ImageButton")
local mainframe = Instance.new("Frame")
local buttonsframe = Instance.new("ScrollingFrame")

-------------------------------------------------------------------------------------------------------------------------------

-- screengui.Parent = game:GetService("CoreGui")
screengui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screengui.ResetOnSpawn = false

-------------------------------------------------------------------------------------------------------------------------------

local clicksound = Instance.new("Sound")
clicksound.SoundId = "rbxassetid://421058925"
clicksound.Parent = noxiousbutton

clicksound.Volume = 0.3

local notifsound = Instance.new("Sound")
notifsound.SoundId = "rbxassetid://8503529139"
notifsound.Parent = noxiousbutton

notifsound.Volume = 0.7

-------------------------------------------------------------------------------------------------------------------------------

local activenotifs = {}

local function notify(message, duration)
	local notifframe = Instance.new("Frame")
	notifframe.Size = UDim2.new(0, 300, 0, 80)
	notifframe.Position = UDim2.new(1, 300, 1, -10)
	notifframe.AnchorPoint = Vector2.new(1, 1)
	notifframe.BackgroundColor3 = Color3.new(0, 0, 0)
	notifframe.BackgroundTransparency = 0.2
	notifframe.BorderColor3 = Color3.new(1, 1, 1)
	notifframe.BorderSizePixel = 1
	notifframe.Parent = screengui
	notifframe.ZIndex = 13

	local notiftopframe = Instance.new("Frame")
	notiftopframe.Size = UDim2.new(1, 0, 0, 24)
	notiftopframe.Position = UDim2.new(0, 0, 0, 0)
	notiftopframe.BackgroundColor3 = Color3.new(0, 0, 0)
	notiftopframe.BackgroundTransparency = 0.2
	notiftopframe.BorderColor3 = Color3.new(1, 1, 1)
	notiftopframe.BorderSizePixel = 1
	notiftopframe.Parent = notifframe
	notiftopframe.ZIndex = 14

	local notifytopframetxt = Instance.new("TextLabel")
	notifytopframetxt.Size = UDim2.new(1, -10, 1, 0)
	notifytopframetxt.Position = UDim2.new(0, 5, 0, 0)
	notifytopframetxt.BackgroundTransparency = 1
	notifytopframetxt.TextColor3 = Color3.new(1, 1, 1)
	notifytopframetxt.Text = "Noxious Hub: Dandy's World"
	notifytopframetxt.Font = Enum.Font.Nunito
	notifytopframetxt.TextSize = 21.6
	notifytopframetxt.TextScaled = false
	notifytopframetxt.TextXAlignment = Enum.TextXAlignment.Left
	notifytopframetxt.ZIndex = 15
	notifytopframetxt.Parent = notiftopframe

	local closenotif = Instance.new("TextButton")
	closenotif.Size = UDim2.new(0, 24, 1, 0)
	closenotif.Position = UDim2.new(1, -23, 0, 0)
	closenotif.BackgroundColor3 = Color3.new(1, 0, 0)
	closenotif.BackgroundTransparency = 1
	closenotif.Text = "X"
	closenotif.Font = Enum.Font.Nunito
	closenotif.TextColor3 = Color3.new(1, 1, 1)
	closenotif.TextSize = 20
	closenotif.ZIndex = 16
	closenotif.Parent = notiftopframe
	closenotif.MouseButton1Click:Connect(
		function()
			clicksound:Play()
		end
	)

	local notiftimerframe = Instance.new("Frame")
	notiftimerframe.Size = UDim2.new(0, 301, 0, 6)
	notiftimerframe.Position = UDim2.new(0, -1, 0, 25)
	notiftimerframe.BackgroundColor3 = Color3.new(1, 1, 1)
	notiftimerframe.BorderSizePixel = 0
	notiftimerframe.BackgroundTransparency = 1
	notiftimerframe.Parent = notifframe
	notiftimerframe.ZIndex = 14

	local notiftimer = Instance.new("Frame")
	notiftimer.Size = UDim2.new(1, 0, 1, 0)
	notiftimer.Position = UDim2.new(0, 0, 0, 0)
	notiftimer.BackgroundColor3 = Color3.new(1, 1, 1)
	notiftimer.BorderSizePixel = 0
	notiftimer.BackgroundTransparency = 0.5
	notiftimer.Parent = notiftimerframe
	notiftimer.ZIndex = 15

	local notiftxt = Instance.new("TextLabel")
	notiftxt.Size = UDim2.new(1, -10, 0, 36)
	notiftxt.Position = UDim2.new(0, 10, 0, 36)
	notiftxt.BackgroundTransparency = 1
	notiftxt.TextColor3 = Color3.new(1, 1, 1)
	notiftxt.Text = message
	notiftxt.Font = Enum.Font.Nunito
	notiftxt.TextSize = 21.6
	notiftxt.TextScaled = false
	notiftxt.TextWrapped = true
	notiftxt.TextXAlignment = Enum.TextXAlignment.Left
	notiftxt.ZIndex = 14
	notiftxt.Parent = notifframe

	local tweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	notifsound:Play()

	for i, frame in ipairs(activenotifs) do
		local newTargetPosition = UDim2.new(1, -10, 1, -10 - (i * 90))
		local adjustTween =
			tweenService:Create(
				frame,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Position = newTargetPosition}
			)
		adjustTween:Play()
	end

	local targetPosition = UDim2.new(1, -10, 1, -10)

	local slideInTween = tweenService:Create(notifframe, tweenInfo, {Position = targetPosition})

	slideInTween:Play()

	table.insert(activenotifs, 1, notifframe)

	local barTweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local barTween = tweenService:Create(notiftimer, barTweenInfo, {Size = UDim2.new(0, 0, 1, 0)})
	barTween:Play()

	local function closeNotification()
		barTween:Cancel()

		local slideOutTween =
			tweenService:Create(
				notifframe,
				tweenInfo,
				{Position = UDim2.new(1, 300, notifframe.Position.Y.Scale, notifframe.Position.Y.Offset)}
			)
		slideOutTween:Play()

		slideOutTween.Completed:Connect(
			function()
				notifframe:Destroy()
				for i, frame in ipairs(activenotifs) do
					if frame == notifframe then
						table.remove(activenotifs, i)
						break
					end
				end
				for i, frame in ipairs(activenotifs) do
					local newTargetPosition = UDim2.new(1, -10, 1, -10 - ((i - 1) * 90))
					local adjustTween =
						tweenService:Create(
							frame,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = newTargetPosition}
						)
					adjustTween:Play()
				end
			end
		)
	end

	closenotif.MouseButton1Click:Connect(closeNotification)

	spawn(
		function()
			wait(duration)
			closeNotification()
		end
	)
	closenotif.ZIndex = 20
	notiftimer.ZIndex = 19
	notifytopframetxt.ZIndex = 19
	notiftxt.ZIndex = 18
	notiftimerframe.ZIndex = 18
	notiftopframe.ZIndex = 18
	notifframe.ZIndex = 17
end

-------------------------------------------------------------------------------------------------------------------------------

noxiousbutton.Size = UDim2.new(0, 48, 0, 48)
noxiousbutton.Position = UDim2.new(0.5, -24.5, 1, -350)
noxiousbutton.BorderSizePixel = 0
noxiousbutton.BorderColor3 = Color3.new(1, 1, 1)
noxiousbutton.BorderSizePixel = 1
noxiousbutton.Parent = screengui
noxiousbutton.Image = "rbxassetid://88959546525519"

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.3, 0)
uiCorner.Parent = noxiousbutton

local borderButton = Instance.new("Frame")
borderButton.Size = UDim2.new(0, 50, 0, 50)
borderButton.Position = UDim2.new(-0.02, 0, -0.02, 0)
borderButton.BackgroundColor3 = Color3.new(1, 1, 1)
borderButton.Parent = noxiousbutton

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.3, 0)
uiCorner.Parent = borderButton

local UIS = game:GetService('UserInputService')
local frame = noxiousbutton
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updatebuttoninput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updatebuttoninput(input)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local gradient = Instance.new("UIGradient")
gradient.Color =
	ColorSequence.new {
		ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)),
		ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
	}
gradient.Parent = borderButton

local rotationSpeed = 1
task.spawn(
	function()
		while true do
			gradient.Rotation = (gradient.Rotation + rotationSpeed) % 360
			task.wait(0.03)
		end
	end
)

-------------------------------------------------------------------------------------------------------------------------------

mainframe.Size = UDim2.new(0, 540 * 1.1, 0, 300 * 1.1)
mainframe.Position = UDim2.new(0.5, -270 * 1.1, -0.076, 0)
mainframe.BackgroundColor3 = Color3.new(0, 0, 0)
mainframe.BorderSizePixel = 1
mainframe.BorderColor3 = Color3.new(1, 1, 1)
mainframe.BackgroundTransparency = 0.2
mainframe.Parent = screengui
mainframe.Visible = false

local UIS = game:GetService('UserInputService')
local frame = mainframe
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updatemainframeinput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updatemainframeinput(input)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local commandBar = Instance.new("TextBox")
commandBar.Size = UDim2.new(0, 270 * 1.1, 0, 48 * 1.1)
commandBar.Position = UDim2.new(0, 0, 0.7, 54)
commandBar.PlaceholderText = "Type command here"
commandBar.Text = ""
commandBar.Font = Enum.Font.Nunito
commandBar.TextScaled = true
commandBar.BackgroundColor3 = Color3.new(0, 0, 0)
commandBar.TextColor3 = Color3.new(1, 1, 1)
commandBar.BorderColor3 = Color3.new(1, 1, 1)
commandBar.BorderSizePixel = 1
commandBar.TextXAlignment = Enum.TextXAlignment.Left
commandBar.TextSize = 21.6
commandBar.TextScaled = false
commandBar.Parent = mainframe

-------------------------------------------------------------------------------------------------------------------------------

local BottomFrame = Instance.new("Frame")
BottomFrame.Size = UDim2.new(0, 270 * 1.1, 0, 48 * 1.1)
BottomFrame.Position = UDim2.new(0.5, 0, 0.7, 54)
BottomFrame.BackgroundColor3 = Color3.new(0, 0, 0)
BottomFrame.BorderColor3 = Color3.new(1, 1, 1)
BottomFrame.BorderSizePixel = 1
BottomFrame.Parent = mainframe

-------------------------------------------------------------------------------------------------------------------------------

local groupIcon = Instance.new("ImageLabel")
groupIcon.Size = UDim2.new(0, 33 * 1.1, 0, 33 * 1.1)
groupIcon.Position = UDim2.new(0.853, 0, 0.1579, 0)
groupIcon.BackgroundTransparency = 0
groupIcon.BackgroundColor3 = Color3.new(0, 0, 0)
groupIcon.BorderSizePixel = 1
groupIcon.BorderColor3 = Color3.new(1, 1, 1)
groupIcon.Image = "rbxassetid://88959546525519"
groupIcon.Parent = BottomFrame

-------------------------------------------------------------------------------------------------------------------------------

local hubVersionText = Instance.new("TextLabel")
hubVersionText.Size = UDim2.new(0.87 * 1.1, 0, 1 * 1.1, -5.5)
hubVersionText.Position = UDim2.new(0, -43, 0, 0)
hubVersionText.BackgroundTransparency = 1
hubVersionText.TextColor3 = Color3.new(1, 1, 1)
hubVersionText.Font = Enum.Font.Nunito
hubVersionText.TextSize = 21.6
hubVersionText.TextScaled = false
hubVersionText.Text = "Noxious Hub: Dandy's World"
hubVersionText.TextXAlignment = Enum.TextXAlignment.Right
hubVersionText.Parent = BottomFrame

-------------------------------------------------------------------------------------------------------------------------------

local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 13)
padding.Parent = commandBar

-------------------------------------------------------------------------------------------------------------------------------

local TopFrame = Instance.new("Frame")
TopFrame.Size = UDim2.new(0.909 * 1.1, 0, 0, 48 * 1.1)
TopFrame.BackgroundColor3 = Color3.new(0, 0, 0)
TopFrame.BorderSizePixel = 0
TopFrame.BorderColor3 = Color3.new(1, 1, 1)
TopFrame.BorderSizePixel = 1
TopFrame.Parent = mainframe

-------------------------------------------------------------------------------------------------------------------------------

local player = game.Players.LocalPlayer
local welcomeText = Instance.new("TextLabel")
welcomeText.Size = UDim2.new(0.5 * 1.1, 0, 1 * 1.1, 0)
welcomeText.Position = UDim2.new(0.08, 8, 0, -2)
welcomeText.BackgroundTransparency = 1
welcomeText.TextColor3 = Color3.new(1, 1, 1)
welcomeText.Font = Enum.Font.Nunito
welcomeText.TextSize = 21.6
welcomeText.TextScaled = false
welcomeText.Text = "Welcome, " .. player.DisplayName .. " (@" .. player.Name .. ")"
welcomeText.TextXAlignment = Enum.TextXAlignment.Left
welcomeText.Parent = TopFrame

-------------------------------------------------------------------------------------------------------------------------------

local profilePicture = Instance.new("ImageLabel")
profilePicture.Size = UDim2.new(0, 33 * 1.1, 0, 33 * 1.1)
profilePicture.Position = UDim2.new(0.013, 0, 0.158, 0)
profilePicture.BackgroundTransparency = 0
profilePicture.BackgroundColor3 = Color3.new(0, 0, 0)
profilePicture.BorderSizePixel = 1
profilePicture.BorderColor3 = Color3.new(1, 1, 1)
profilePicture.Image =
	"https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
profilePicture.Parent = TopFrame

-------------------------------------------------------------------------------------------------------------------------------

local buttonCommandLists = {
	["ESPs"] = {
		"epesp - enables player esp",
		"dpesp - disables player esp",
		" ",
		"mesp - enables machine esp",
		"dmesp - disables machine esp",
		" ",
		"etesp - enables twisteds esp",
		"dtesp - disables twisteds esp",
		" ",
		"eiesp - enables item esp",
		"didesp - disables item esp",
		" ",
		"eesp - enables all esp",
		"desp - disables all esp",
	},
	["Map / Environment"] = {
		"efb - enables fullbright",
		"dfb - disables fullbright",
		" ",
		"ddd - delete developer doors",
		"sds - shrimpo decal spam",
		" ",
		"scary - doesnt work for now... (CLIENT)"
	},
	["Teleports"] = {
		"tpte - teleport to elevator",
		"eatpte - enables auto tp to elevator",
		"datpte - disables auto tp to elevator",
		" ",
		"dtptg - teleport to a generator",
		" ",
		"tptar - teleport to admin room (LOBBY)",
		"tptbr - teleport to bedroom (LOBBY)",
		"tptds - teleport to dandy's shop (LOBBY)",
	},
	["Fun"] = {
		"fdc - fake dandy card",
		"bchar - become yourself (LOBBY)",
		"bd - become dandy (USE BOXTEN) (CLIENT)",
	},
	["Trolls"] = {
		"bang (user) - bangs user",
		"unbang (user) - unbangs user",
		" ",
		"head (user) - gives user head",
		"unhead (user) - stop giving user head",
		" ",
		"hsit (user) - sit on users head",
		"unhsit (user) - stop sitting on user",
		" ",
		"hjump (user) - jump on users head",
		"unhjump (user) - stop jumping on users head",
	},
	["Animations"] = {
		"agui - opens animations gui",
		" ",
		"therian - makes you crawl",
		"untherian - disables crawling",
		" ",
		"dance - makes you dance",
		"undance - stop dancing",
		" ",
		"hbang - makes you bang your head",
		"unhbang - stop headbanging",
		" ",
		"sit - makes you sit",
		"unsit - stop sitting",
		" ",
		"sit2 - makes you sit v2",
		"unsit2 - stop sitting 2",
		" ",
		"wave - makes you wave",
		"ecwave - enables click to wave",
		"dcwave - disables click to wave",
		" ",
		"dabr - makes you do a barrel roll",
		"ecdabr - enables click to do a barrel roll",
		"dcdabr - disables click to do a barrel roll",
		" ",
		"pounce - makes you pounce",
		"ecpounce - enables click to pounce",
		"dcpounce - disables click to pounce",
		" ",
		"twirl - makes you twirl",
		"ectwirl - enables click to twirl",
		"dctwirl - disables click to twirl",
		" ",
		"twirl2 - makes you twirl v2",
		"ectwirl2 - enables click to twirl v2",
		"dctwirl2 - disables click to twirl v2",
		" ",
		"shimmy - makes you shimmy side to side",
		"ecshimmy - enables click to shimmy side to side",
		"dcshimmy - disables click to shimmy side to side",
		" ",
		"facepalm - makes you facepalm",
		"ecfacepalm - enables click to facepalm",
		"dcfacepalm - disables click to facepalm",
		" ",
		"jump - makes you jump",
		"ecjump - enables click to jump",
		"dcjump - disables click to jump",
		" ",
		"cheer - makes you cheer",
		"eccheer - enables click to cheer",
		"dccheer - disables click to cheer",
		" ",
		"dive - makes you dive",
		"ecdive - enables click to dive",
		"dcdive - disables click to dive"
	},
	["Scripts"] = {
		"bacon - opens Bac0nH1ckOff's script",
		"gobby - opens g0bbyd0llan's script",
		"hex - opens hex's script",
		" ",
		"test - command used for testing, use if you want",
		" ",
		"af - enables autofarm (STILL TESTING)",
	}
}

-------------------------------------------------------------------------------------------------------------------------------

local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local hoverLabel = Instance.new("Frame")
hoverLabel.Name = "HoverLabel"
hoverLabel.Size = UDim2.new(0, 250 * 1.1, 0, 50 * 1.1)
hoverLabel.BackgroundTransparency = 1
hoverLabel.BackgroundColor3 = Color3.new(0, 0, 0)
hoverLabel.BorderSizePixel = 0
hoverLabel.Visible = false
hoverLabel.Parent = mainframe

local commandNameLabel = Instance.new("TextLabel")
commandNameLabel.Name = "CommandName"
commandNameLabel.Size = UDim2.new(1 * 1.1, 0, 0.5 * 1.1, 0)
commandNameLabel.Position = UDim2.new(0, 0, 0, -2.9)
commandNameLabel.BackgroundTransparency = 0
commandNameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
commandNameLabel.TextColor3 = Color3.new(1, 1, 1)
commandNameLabel.Font = Enum.Font.Nunito
commandNameLabel.TextSize = 16
commandNameLabel.TextScaled = false
commandNameLabel.TextWrapped = true
commandNameLabel.BorderSizePixel = 1
commandNameLabel.BorderColor3 = Color3.new(1, 1, 1)
commandNameLabel.TextXAlignment = Enum.TextXAlignment.Center
commandNameLabel.TextYAlignment = Enum.TextYAlignment.Center
commandNameLabel.Parent = hoverLabel

local descriptionLabel = Instance.new("TextLabel")
descriptionLabel.Name = "Description"
descriptionLabel.Size = UDim2.new(1 * 1.1, 0, 0.5 * 1.1, 0)
descriptionLabel.Position = UDim2.new(0, 0, 0.5, 0)
descriptionLabel.BackgroundTransparency = 0.2
descriptionLabel.BackgroundColor3 = Color3.new(0, 0, 0)
descriptionLabel.TextColor3 = Color3.new(1, 1, 1)
descriptionLabel.Font = Enum.Font.Nunito
descriptionLabel.TextSize = 16
descriptionLabel.TextScaled = false
descriptionLabel.TextWrapped = true
descriptionLabel.BorderSizePixel = 1
descriptionLabel.BorderColor3 = Color3.new(1, 1, 1)
descriptionLabel.TextXAlignment = Enum.TextXAlignment.Center
descriptionLabel.TextYAlignment = Enum.TextYAlignment.Center
descriptionLabel.Parent = hoverLabel

local function updateHoverLabelSize(commandName, description)
	local padding = 150
	local totalHeight = 50
	local maxWidth = 100000

	commandNameLabel.Text = commandName
	descriptionLabel.Text = description

	local commandNameWidth = commandNameLabel.TextBounds.X
	local descriptionWidth = descriptionLabel.TextBounds.X

	local newWidth = math.max(commandNameWidth, descriptionWidth) + padding
	hoverLabel.Size = UDim2.new(0, math.min(newWidth, maxWidth), 0, totalHeight)
end

local hoverDebounce = false
local currentHoverCommand = nil

local function displayCommands(commandList)
	for _, child in ipairs(mainframe:GetChildren()) do
		if child:IsA("TextLabel") and child.Name == "List of commands" then
			child:Destroy()
		elseif child:IsA("TextLabel") and child.Name == "HoverToView" then
			child:Destroy()
		elseif child:IsA("ScrollingFrame") and child.Name == "CommandScrollFrame" then
			child:Destroy()
		end
	end

	local commandLabel = Instance.new("TextLabel")
	commandLabel.Name = "List of commands"
	commandLabel.Size = UDim2.new(0, 298 * 1.1, 0, 36 * 1.1)
	commandLabel.Position = UDim2.new(1, -166.5, 0, 46)
	commandLabel.AnchorPoint = Vector2.new(0.5, 0)
	commandLabel.BackgroundTransparency = 1
	commandLabel.TextColor3 = Color3.new(1, 1, 1)
	commandLabel.Font = Enum.Font.Nunito
	commandLabel.TextSize = 21
	commandLabel.BorderSizePixel = 1
	commandLabel.BorderColor3 = Color3.new(1, 1, 1)
	commandLabel.TextScaled = false
	commandLabel.Text = "▼ List of commands ▼"
	commandLabel.Parent = mainframe

	local commandLabel2 = Instance.new("TextLabel")
	commandLabel2.Name = "HoverToView"
	commandLabel2.Size = UDim2.new(0, 264 * 1.1, 0, 36 * 1.1)
	commandLabel2.Position = UDim2.new(1, -166.5, 0, 64)
	commandLabel2.AnchorPoint = Vector2.new(0.5, 0)
	commandLabel2.BackgroundTransparency = 1
	commandLabel2.TextColor3 = Color3.new(1, 1, 1)
	commandLabel2.Font = Enum.Font.Nunito
	commandLabel2.TextSize = 15
	commandLabel2.BorderSizePixel = 1
	commandLabel2.BorderColor3 = Color3.new(1, 1, 1)
	commandLabel2.TextScaled = false
	commandLabel2.Text = "Hover over a command to view its info."
	commandLabel2.Parent = mainframe

	local commandScrollingFrame = Instance.new("ScrollingFrame")
	commandScrollingFrame.Name = "CommandScrollFrame"
	commandScrollingFrame.Size = UDim2.new(0, 299 * 1.1, 0, 174 * 1.1)
	commandScrollingFrame.Position = UDim2.new(1, -328, 0, 93)
	commandScrollingFrame.CanvasSize = UDim2.new(0, 0, #commandList * 0, 0)
	commandScrollingFrame.ScrollBarThickness = 10
	commandScrollingFrame.BackgroundTransparency = 1
	commandScrollingFrame.BorderSizePixel = 0
	commandScrollingFrame.Parent = mainframe
	commandScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	commandScrollingFrame.ScrollBarImageTransparency = 0

	local itemHeight = 15
	local spacing = 1
	local totalHeight = (#commandList * itemHeight) + (#commandList - 1) * spacing

	for i, commandText in ipairs(commandList) do
		local commandTextLabel = Instance.new("TextLabel")
		commandTextLabel.Size = UDim2.new(1 * 1.1, 0, 0, itemHeight * 1.1)
		commandTextLabel.Position = UDim2.new(0, 0, 0, (i - 1) * (itemHeight + spacing))
		commandTextLabel.BackgroundTransparency = 1
		commandTextLabel.TextColor3 = Color3.new(1, 1, 1)
		commandTextLabel.Font = Enum.Font.Nunito
		commandTextLabel.TextSize = 17
		commandTextLabel.TextScaled = false
		commandTextLabel.Text = commandText
		commandTextLabel.BorderSizePixel = 0
		commandTextLabel.TextXAlignment = Enum.TextXAlignment.Left
		commandTextLabel.Parent = commandScrollingFrame

		commandTextLabel.MouseEnter:Connect(function()
			if not hoverDebounce and commandText and commandText:match("^%s*$") == nil then
				hoverDebounce = true
				currentHoverCommand = commandTextLabel

				local namePart, descriptionPart = commandText:match("^(.-)%s*%-%s*(.*)$")
				namePart = namePart or commandText
				descriptionPart = descriptionPart or ""

				updateHoverLabelSize(namePart, descriptionPart)

				local mousePosition = userInputService:GetMouseLocation()
				hoverLabel.Position = UDim2.new(0, mousePosition.X - mainframe.AbsolutePosition.X - (hoverLabel.Size.X.Offset / 2), 0, mousePosition.Y - mainframe.AbsolutePosition.Y - hoverLabel.Size.Y.Offset - 82)
				hoverLabel.Visible = true

				task.delay(0.05, function()
					hoverDebounce = false
				end)
			end
		end)

		commandTextLabel.MouseLeave:Connect(function()
			if currentHoverCommand == commandTextLabel then
				hoverLabel.Visible = false
				currentHoverCommand = nil
			end
		end)
	end

	commandScrollingFrame.CanvasSize = UDim2.new(0, 0, 0.017, totalHeight)

	userInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if hoverLabel.Visible then
				local mousePosition = input.Position
				hoverLabel.Position = UDim2.new(0, mousePosition.X - mainframe.AbsolutePosition.X - (hoverLabel.Size.X.Offset / 2), 0, mousePosition.Y - mainframe.AbsolutePosition.Y - hoverLabel.Size.Y.Offset - 30)
			end
		end
	end)
end

runService.RenderStepped:Connect(function()
	if currentHoverCommand then
		if not hoverLabel.Visible then
			hoverLabel.Visible = true
		end
	else
		hoverLabel.Visible = false
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local orderedButtonNames = {
	"ESPs",
	"Map / Environment",
	"Teleports",
	"Fun",
	"Trolls",
	"Animations",
	"Scripts"
}

-------------------------------------------------------------------------------------------------------------------------------

buttonsframe.Size = UDim2.new(0, 237 * 1.1, 0.876 * 1.1, -69.19 * 1.1)
buttonsframe.Position = UDim2.new(0, 0, 0, 48)
buttonsframe.CanvasSize = UDim2.new(0, 0, 1.24, 0)
buttonsframe.ScrollBarThickness = 12
buttonsframe.BackgroundTransparency = 1
buttonsframe.BorderSizePixel = 1
buttonsframe.BorderColor3 = Color3.new(1, 1, 1)
buttonsframe.Parent = mainframe
buttonsframe.ScrollingDirection = Enum.ScrollingDirection.Y
buttonsframe.ScrollBarImageTransparency = 0

-------------------------------------------------------------------------------------------------------------------------------

local scrollBarFrame = Instance.new("Frame")
scrollBarFrame.Size = UDim2.new(0, 11 * 1.1, 0, 220 * 1.1)
scrollBarFrame.BackgroundColor3 = Color3.new(0, 0, 0)
scrollBarFrame.BorderSizePixel = 0
scrollBarFrame.Position = UDim2.new(0, 248, 0, 48)
scrollBarFrame.BorderColor3 = Color3.new(1, 1, 1)
scrollBarFrame.BorderSizePixel = 1
scrollBarFrame.ZIndex = 1
scrollBarFrame.Parent = mainframe

-------------------------------------------------------------------------------------------------------------------------------

local TweenService = game:GetService("TweenService")

local buttonCount = 0
for _, buttonName in ipairs(orderedButtonNames) do
	local commandList = buttonCommandLists[buttonName]

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1 * 1.1, -50 * 1.1, 0, 45)
	button.Position = UDim2.new(0, 112 * 1.1, buttonCount * 0.137, 33 * 1.1)
	button.AnchorPoint = Vector2.new(0.5, 0.5)
	button.BackgroundColor3 = Color3.new(0, 0, 0)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Text = buttonName
	button.BorderColor3 = Color3.new(1, 1, 1)
	button.BorderSizePixel = 1
	button.Font = Enum.Font.Nunito
	button.TextSize = 19.2
	button.ZIndex = 17
	button.Parent = buttonsframe

	local defaultSize = button.Size
	local hoverSize = UDim2.new(defaultSize.X.Scale, defaultSize.X.Offset - 5, defaultSize.Y.Scale, defaultSize.Y.Offset - 5)

	local function onHover()
		local hoverTween = TweenService:Create(button, TweenInfo.new(0.2), { Size = hoverSize })
		hoverTween:Play()
	end

	local function onUnhover()
		local unhoverTween = TweenService:Create(button, TweenInfo.new(0.2), { Size = defaultSize })
		unhoverTween:Play()
	end

	button.MouseButton1Click:Connect(
		function()
			clicksound:Play()
			displayCommands(commandList)
		end
	)

	button.MouseEnter:Connect(onHover)
	button.MouseLeave:Connect(onUnhover)

	buttonCount = buttonCount + 1
end

-------------------------------------------------------------------------------------------------------------------------------

local function toggleVisibility()
	mainframe.Visible = not mainframe.Visible
end

noxiousbutton.MouseButton1Click:Connect(
	function()
		toggleVisibility()
		clicksound:Play()
	end
)

-------------------------------------------------------------------------------------------------------------------------------

noxiousbutton.ZIndex = 20
commandNameLabel.ZIndex= 19
descriptionLabel.ZIndex= 19
borderButton.ZIndex = 19
groupIcon.ZIndex = 18
hubVersionText.ZIndex = 18
hoverLabel.ZIndex = 18
profilePicture.ZIndex = 18
welcomeText.ZIndex = 18
TopFrame.ZIndex = 18
hubVersionText.ZIndex = 18
groupIcon.ZIndex = 18
commandBar.ZIndex = 18
BottomFrame.ZIndex = 18
buttonsframe.ZIndex = 17

-------------------------------------------------------------------------------------------------------------------------------

local gameID1 = 16116270224
local gameID2 = 16552821455
local gameID3 = 18984416148
local testgameID = 118022198489171

if game.PlaceId == gameID1 or game.PlaceId == gameID2 or game.PlaceId == gameID3 or game.PlaceId == testgameID then

	-------------------------------------------------------------------------------------------------------------------------------

	print("---------------------------------------------------------------------------")
	print("[:3] Welcome to Noxious Hub: Dandy's World")
	print("[:3] Script is still in development. Expect bugs.")
	print("---------------------------------------------------------------------------")
	print("[:3] Join our discord: https://discord.gg/xZC8zJzF7u")
	print("---------------------------------------------------------------------------")
	print("[:3] Hover over a command to view its info.")
	print("[:3] Some of the commands have not been properly implemented yet.")
	print("---------------------------------------------------------------------------")

--[[---------------------------------------------------------------------------------------------------------------------------

DANDYS WORLD SECTION | DANDYS WORLD SECTION | DANDYS WORLD SECTION | DANDYS WORLD SECTION | DANDYS WORLD SECTION

---------------------------------------------------------------------------------------------------------------------------]]--

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	-------------------------------------------------------------------------------------------------------------------------------

	local function becomeCharacter()
		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local speaker = Players.LocalPlayer

		local args = {
			[1] = false
		}
		ReplicatedStorage.Events.UpdateSpawnedIn:FireServer(unpack(args))

		local character = speaker.Character
		local savedCFrame

		if character then
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if rootPart then
				savedCFrame = rootPart.CFrame
			end
		end

		if character then
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				humanoid.Health = 0
			end
		end

		speaker.CharacterAdded:Wait()
		local newCharacter = speaker.Character

		if not newCharacter then return end

		local function setupHumanoid()
			local Cam = workspace.CurrentCamera
			local Pos = Cam.CFrame
			local Char = newCharacter
			local Human = Char:FindFirstChildWhichIsA("Humanoid")

			if not Human then return end

			local nHuman = Human:Clone()
			nHuman.Parent = Char
			speaker.Character = nil

			nHuman.BreakJointsOnDeath = true
			nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

			Human:Destroy()
			speaker.Character = Char
			Cam.CameraSubject = nHuman
			Cam.CFrame = Pos

			local rootPart = Char:FindFirstChild("HumanoidRootPart")
			if rootPart and savedCFrame then
				rootPart.CFrame = savedCFrame
			end

			local animateScript = Char:FindFirstChild("Animate")
			if animateScript then
				animateScript.Disabled = true
				wait()
				animateScript.Disabled = false
			end

			nHuman.Health = nHuman.MaxHealth
		end

		newCharacter:WaitForChild("Humanoid", 5)
		setupHumanoid()
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local localPlayer = Players.LocalPlayer

	local highlightLoopRunning = false
	local highlightTypes = {
		Monsters = false,
		Items = false,
		Players = false,
		Machines = false
	}

	local function addHighlights()
		local currentRoom = workspace:FindFirstChild("CurrentRoom")

		-- Highlight monsters
		if highlightTypes.Monsters and currentRoom then
			for _, model in pairs(currentRoom:GetChildren()) do
				local monstersFolder = model:FindFirstChild("Monsters")
				if monstersFolder then
					for _, monster in pairs(monstersFolder:GetChildren()) do
						if monster:IsA("Model") and not monster:FindFirstChildOfClass("Highlight") then
							local highlight = Instance.new("Highlight")
							highlight.FillColor = Color3.fromRGB(255, 0, 0)
							highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							highlight.Parent = monster
						end
					end
				end
			end
		end

		-- Highlight items
		if highlightTypes.Items and currentRoom then
			for _, model in pairs(currentRoom:GetChildren()) do
				local itemsFolder = model:FindFirstChild("Items")
				if itemsFolder then
					for _, item in pairs(itemsFolder:GetChildren()) do
						if item:IsA("Model") and not item:FindFirstChildOfClass("Highlight") then
							local highlight = Instance.new("Highlight")
							highlight.FillColor = Color3.fromRGB(0, 255, 0)
							highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							highlight.Parent = item
						end
					end
				end
			end
		end

		-- Highlight players
		if highlightTypes.Players then
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local highlight = player.Character:FindFirstChildOfClass("Highlight")
					if not highlight then
						highlight = Instance.new("Highlight")
						highlight.FillColor = Color3.fromRGB(0, 0, 255)
						highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						highlight.Parent = player.Character
					end
				end
			end
		end

		-- Highlight machines
		if highlightTypes.Machines and currentRoom then
			for _, model in pairs(currentRoom:GetChildren()) do
				local generatorsFolder = model:FindFirstChild("Generators")
				if generatorsFolder then
					for _, generator in pairs(generatorsFolder:GetChildren()) do
						if generator:IsA("Model") and not generator:FindFirstChildOfClass("Highlight") then
							local highlight = Instance.new("Highlight")
							highlight.FillColor = Color3.fromRGB(130, 130, 130)
							highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
							highlight.Parent = generator
						end
					end
				end
			end
		end
	end

	local function removeHighlights()
		local currentRoom = workspace:FindFirstChild("CurrentRoom")

		-- Remove highlights from monsters, items, and machines
		if currentRoom then
			for _, model in pairs(currentRoom:GetChildren()) do
				for _, folderName in pairs({"Monsters", "Items", "Generators"}) do
					local folder = model:FindFirstChild(folderName)
					if folder then
						for _, obj in pairs(folder:GetChildren()) do
							local highlight = obj:FindFirstChildOfClass("Highlight")
							if highlight then
								highlight:Destroy()
							end
						end
					end
				end
			end
		end

		-- Remove highlights from players
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character then
				local highlight = player.Character:FindFirstChildOfClass("Highlight")
				if highlight then
					highlight:Destroy()
				end
			end
		end
	end

	local function startHighlightLoop()
		if highlightLoopRunning then return end
		highlightLoopRunning = true

		RunService.Stepped:Connect(function()
			if highlightLoopRunning then
				addHighlights()
			end
		end)
	end

	local function stopHighlightLoop()
		highlightLoopRunning = false
		removeHighlights()
	end

	-- Functions to enable/disable specific ESP types
	local function enableEsp(type)
		highlightTypes[type] = true
		startHighlightLoop()
	end

	local function disableEsp(type)
		highlightTypes[type] = false

		-- Check if all ESP types are disabled
		local allDisabled = true
		for _, isEnabled in pairs(highlightTypes) do
			if isEnabled then
				allDisabled = false
				break
			end
		end

		if allDisabled then
			stopHighlightLoop()
		else
			removeHighlights()
		end
	end

	-- Function to enable all ESP types
	local function enableAllEsp()
		for type in pairs(highlightTypes) do
			highlightTypes[type] = true
		end
		startHighlightLoop()
	end

	-- Function to disable all ESP types
	local function disableAllEsp()
		for type in pairs(highlightTypes) do
			highlightTypes[type] = false
		end
		stopHighlightLoop()
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function deleteDeveloperDoors()
		workspace.DevDoor:Destroy()
		wait(0)
		workspace.DevDoor2:Destroy()
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function fakeDandyCard()
		local args = {
			[1] = "Dandy"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Voted"):InvokeServer(unpack(args))
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function becomeDandy()
		local Dandy = game.Workspace.Elevators.Elevator.DandyStore.DandyShop
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local DHAir = Dandy.Hair
		local CHAir = character.Hair

		for _, partA in ipairs(Dandy:GetDescendants()) do
			local partB = character:FindFirstChild(partA.Name, true)
			if partB then
				DHAir.Parent = character
				DHAir.Joint.Part0 = character.Head
				wait(0.01)
				character.Animate.idle.Animation1.AnimationId = "rbxassetid://16496520991"
				character.Animate.idle.Animation2.AnimationId = "rbxassetid://16496520991"
				character.Animate.run.RunAnim.AnimationId = "rbxassetid://16496812530"
				character.Config.NormalTexture.Texture = "rbxassetid://16496414911"
				character.Config.HurtTexture.Texture = "rbxassetid://17561468145"

				CHAir:Destroy()
				wait(0.01)
				if partA:IsA("MeshPart") and partB:IsA("MeshPart") then
					local tempMeshId = partA.MeshId
					partA.MeshId = partB.MeshId
					partB.MeshId = tempMeshId
					local tempTextureId = partA.TextureID
					partA.TextureID = partB.TextureID
					partB.TextureID = tempTextureId


				end
				if partA:IsA("SpecialMesh") and partB:IsA("SpecialMesh") then
					local tempMeshId = partA.MeshId
					partA.MeshId = partB.MeshId
					partB.MeshId = tempMeshId
				end
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local Lighting = game:GetService("Lighting")
	local isLooping = false
	local loopConnection
	local originalSettings = {}

	local function saveOriginalSettings()
		originalSettings.Brightness = Lighting.Brightness
		originalSettings.ClockTime = Lighting.ClockTime
		originalSettings.FogEnd = Lighting.FogEnd
		originalSettings.GlobalShadows = Lighting.GlobalShadows
		originalSettings.OutdoorAmbient = Lighting.OutdoorAmbient
	end

	local function restoreOriginalSettings()
		Lighting.Brightness = originalSettings.Brightness
		Lighting.ClockTime = originalSettings.ClockTime
		Lighting.FogEnd = originalSettings.FogEnd
		Lighting.GlobalShadows = originalSettings.GlobalShadows
		Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
	end

	local function fullBright()
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end

	local function enableFullBright()
		if not isLooping then
			isLooping = true
			saveOriginalSettings()
			loopConnection = game:GetService("RunService").RenderStepped:Connect(function()
				fullBright()
			end)
		end
	end

	local function disableFullBright()
		if isLooping then
			isLooping = false
			if loopConnection then
				loopConnection:Disconnect()
				loopConnection = nil
			end
			restoreOriginalSettings()
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local teleportConnections = {}
	local currentAnimationTracks = {}

	local function playAnimation(character, animationId, connectionKey)
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://" .. animationId

		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			currentAnimationTracks[connectionKey] = humanoid:LoadAnimation(Anim)
			currentAnimationTracks[connectionKey]:Play()
			currentAnimationTracks[connectionKey]:AdjustWeight(999)
			currentAnimationTracks[connectionKey].Looped = true
		end
	end

	local function isAnimationPlaying(character, animationId)
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
				if track.Animation.AnimationId == "rbxassetid://" .. animationId then
					return true
				end
			end
		end
		return false
	end

	local function teleportBehindTarget(player, targetPlayer, baseOffset, connectionKey)
		local character = player.Character
		local targetCharacter = targetPlayer.Character
		if character and targetCharacter then
			local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
			local playerRoot = character:FindFirstChild("HumanoidRootPart")
			if targetRoot and playerRoot then
				local offset = baseOffset

				-- Apply randomized Y offset only for "dwhsit" and "dwhjump"
				if (connectionKey == "hsit" or connectionKey == "hjump") and isAnimationPlaying(targetCharacter, "16873659196") then
					local yOffset = 3.7 -- Random Y-axis offset between 1 and 5 studs
					offset = CFrame.new(baseOffset.X, yOffset, baseOffset.Z)
				end

				playerRoot.CFrame = targetRoot.CFrame * offset
			end
		end
	end

	local function findPlayerByName(partialName)
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Name:lower():sub(1, #partialName) == partialName:lower() then
				return player
			end
		end
		return nil
	end

	local function handleTeleportCommand(command, player, animationId, offset, connectionKey)
		local targetName = command:match("^" .. connectionKey .. "%s+(%S+)$")
		local targetPlayer

		if targetName then
			targetPlayer = findPlayerByName(targetName)
		end

		if targetPlayer then
			playAnimation(player.Character, animationId, connectionKey)

			if teleportConnections[connectionKey] then teleportConnections[connectionKey]:Disconnect() end
			teleportConnections[connectionKey] = game:GetService("RunService").Heartbeat:Connect(function()
				if not targetPlayer.Character or not player.Character then
					teleportConnections[connectionKey]:Disconnect()
					teleportConnections[connectionKey] = nil
					return
				end
				teleportBehindTarget(player, targetPlayer, offset, connectionKey)
			end)
		end
	end

	local function handleStopCommand(connectionKey)
		if teleportConnections[connectionKey] then
			teleportConnections[connectionKey]:Disconnect()
			teleportConnections[connectionKey] = nil
		end

		if currentAnimationTracks[connectionKey] then
			currentAnimationTracks[connectionKey]:Stop()
			currentAnimationTracks[connectionKey] = nil
		end

		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")

		local animate = character:FindFirstChild("Animate")
		if animate then
			animate.Disabled = true
			for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
				track:Stop()
			end
			animate.Disabled = false
		end
	end

	function dwbang(command, player)
		handleTeleportCommand(command, player, "18213671382", CFrame.new(0, 0, 0.8), "bang")
	end

	function dwunbang()
		handleStopCommand("bang")
	end

	function dwhead(command, player)
		handleTeleportCommand(command, player, "17098030743", CFrame.new(0, -0.35, -1.75) * CFrame.Angles(0, math.pi, 0), "head")
	end

	function dwunhead()
		handleStopCommand("head")
	end

	function dwhsit(command, player)
		handleTeleportCommand(command, player, "16873659196", CFrame.new(0, 4.65, -0.3), "hsit")
	end

	function dwunhsit()
		handleStopCommand("hsit")
	end

	function dwhjump(command, player)
		handleTeleportCommand(command, player, "16909854575", CFrame.new(0, 4.65, -0.3), "hjump")
	end

	function dwunhjsit()
		handleStopCommand("hjump")
	end

	-------------------------------------------------------------------------------------------------------------------------------

	-- Services
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")

	-- Variables
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local currentAnimationTrack = nil
	local inputConnection

	-- Create Animations
	local BarrelRollAnim = Instance.new("Animation")
	BarrelRollAnim.AnimationId = "rbxassetid://18226927388"

	local WaveAnim = Instance.new("Animation")
	WaveAnim.AnimationId = "rbxassetid://17059625743"

	local TwirlAnim = Instance.new("Animation")
	TwirlAnim.AnimationId = "rbxassetid://17630950280"

	local Twirl2Anim = Instance.new("Animation")
	Twirl2Anim.AnimationId = "rbxassetid://18998583113"

	local CheerAnim = Instance.new("Animation")
	CheerAnim.AnimationId = "rbxassetid://18199893624"

	local ShimmyAnim = Instance.new("Animation")
	ShimmyAnim.AnimationId = "rbxassetid://18155419600"

	local JumpAnim = Instance.new("Animation")
	JumpAnim.AnimationId = "rbxassetid://17295478127"

	local FacepalmAnim = Instance.new("Animation")
	FacepalmAnim.AnimationId = "rbxassetid://73742913578970"

	local PounceAnim = Instance.new("Animation")
	PounceAnim.AnimationId = "rbxassetid://17617839395"

	local DiveAnim = Instance.new("Animation")
	DiveAnim.AnimationId = "rbxassetid://17175061517"

	-- Animation functions
	local function playAnimation(animation)
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end
		currentAnimationTrack = humanoid:LoadAnimation(animation)
		currentAnimationTrack:Play()
		currentAnimationTrack:AdjustWeight(999)
	end

	-- Animation-specific functions
	local function dwbarrelroll() playAnimation(BarrelRollAnim) end
	local function dwwave() playAnimation(WaveAnim) end
	local function dwtwirl() playAnimation(TwirlAnim) end
	local function dwtwirl2() playAnimation(Twirl2Anim) end
	local function dwcheer() playAnimation(CheerAnim) end
	local function dwshimmy() playAnimation(ShimmyAnim) end
	local function dwjump() playAnimation(JumpAnim) end
	local function dwfacepalm() playAnimation(FacepalmAnim) end
	local function dwdive() playAnimation(DiveAnim) end

	local function disableAnimation()
		if inputConnection then
			inputConnection:Disconnect()
			inputConnection = nil
		end
	end

	-- Functions to enable and disable a specific animation on tap/click
	local function enableAnimation(animationFunction)
		disableAnimation() -- Ensure no existing input connection
		inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				animationFunction()
			end
		end)
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local HeadbangAnim = Instance.new("Animation")
	HeadbangAnim.AnimationId = "rbxassetid://17561277632"

	local function dwhbang(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(HeadbangAnim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local DanceAnim = Instance.new("Animation")
	DanceAnim.AnimationId = "rbxassetid://17516071317"

	local function dwdance(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(DanceAnim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local TherianAnim = Instance.new("Animation")
	TherianAnim.AnimationId = "rbxassetid://91029796934547"

	local function dwtherian(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(TherianAnim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local SitAnim = Instance.new("Animation")
	SitAnim.AnimationId = "rbxassetid://18989418012"

	local function dwsit(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(SitAnim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local PounceAnim = Instance.new("Animation")
	PounceAnim.AnimationId = "rbxassetid://17617839395"

	local function dwpounce(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(PounceAnim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local Sit2Anim = Instance.new("Animation")
	Sit2Anim.AnimationId = "rbxassetid://16873659196"

	local function dwsit2(command)
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
		if currentAnimationTrack then
			currentAnimationTrack:Stop()
		end

		currentAnimationTrack = humanoid:LoadAnimation(Sit2Anim)
		currentAnimationTrack:Play()

		currentAnimationTrack:AdjustWeight(999)
		end
	end
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	local function dwunhbang(command)
		local Char = player.Character or player.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild("Humanoid", 15)
		local Animate = Char and Char:WaitForChild("Animate", 15)

		if Animate then
			Animate.Disabled = true
			for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			Animate.Disabled = false
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	local function dwunsit2(command)
		local Char = player.Character or player.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild("Humanoid", 15)
		local Animate = Char and Char:WaitForChild("Animate", 15)

		if Animate then
			Animate.Disabled = true
			for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			Animate.Disabled = false
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	local function dwundance(command)
		local Char = player.Character or player.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild("Humanoid", 15)
		local Animate = Char and Char:WaitForChild("Animate", 15)

		if Animate then
			Animate.Disabled = true
			for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			Animate.Disabled = false
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	local function dwuntherian(command)
		local Char = player.Character or player.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild("Humanoid", 15)
		local Animate = Char and Char:WaitForChild("Animate", 15)

		if Animate then
			Animate.Disabled = true
			for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			Animate.Disabled = false
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local currentAnimationTrack
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local function updateCharacterReferences(newCharacter)
		character = newCharacter
		humanoid = character:WaitForChild("Humanoid")
	end

	player.CharacterAdded:Connect(updateCharacterReferences)

	local function dwunsit(command)
		local Char = player.Character or player.CharacterAdded:Wait()
		local Human = Char and Char:WaitForChild("Humanoid", 15)
		local Animate = Char and Char:WaitForChild("Animate", 15)

		if Animate then
			Animate.Disabled = true
			for _, v in ipairs(Human:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			Animate.Disabled = false
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function breakstats()
		local inGamePlayersFolder = game.Workspace:FindFirstChild("InGamePlayers")

		if inGamePlayersFolder then
			for _, playerFolder in pairs(inGamePlayersFolder:GetChildren()) do
				local statsFolder = playerFolder:FindFirstChild("Stats")

				if statsFolder then
					for _, stat in pairs(statsFolder:GetChildren()) do
						if stat:IsA("NumberValue") then
							stat.Value = 999
						end
					end
				end
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer
	local workspace = game:GetService("Workspace")
	local runService = game:GetService("RunService")

	local infoFolder = workspace:FindFirstChild("Info")
	local teleportEnabled = true

	local function dweatpte()
		if infoFolder then
			local panicBool = infoFolder:FindFirstChild("Panic")
			if panicBool and panicBool:IsA("BoolValue") then
				runService.Heartbeat:Connect(function()
					if teleportEnabled and panicBool.Value == true then
						local elevatorsFolder = workspace:FindFirstChild("Elevators")
						if elevatorsFolder then
							local elevatorModel = elevatorsFolder:FindFirstChildWhichIsA("Model")
							if elevatorModel then
								local monsterBlocker = elevatorModel:FindFirstChild("MonsterBlocker")
								if monsterBlocker and monsterBlocker:IsA("Part") then
									local character = localPlayer.Character
									if character and character:FindFirstChild("HumanoidRootPart") then
										character.HumanoidRootPart.CFrame = monsterBlocker.CFrame
									end
								end
							end
						end
					end
				end)
			end
		end
	end

	local function dwdatpte()
		teleportEnabled = false
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function dwtptg()
		local currentRoom = workspace:FindFirstChild("CurrentRoom")
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()

		if currentRoom then
			for _, item in pairs(currentRoom:GetChildren()) do
				if item:IsA("Model") then
					local generatorsFolder = item:FindFirstChild("Generators")

					if generatorsFolder then
						local generators = {}

						for _, generator in pairs(generatorsFolder:GetChildren()) do
							if generator:IsA("Model") and generator.PrimaryPart then
								local statsFolder = generator:FindFirstChild("Stats")
								if statsFolder then
									local completedValue = statsFolder:FindFirstChild("Completed")
									if completedValue and completedValue:IsA("BoolValue") and not completedValue.Value then
										table.insert(generators, generator)
									end
								end
							end
						end

						if #generators > 0 then
							local randomGenerator = generators[math.random(1, #generators)]
							local generatorCFrame = randomGenerator:GetPrimaryPartCFrame()

							local forwardPosition = generatorCFrame.Position + generatorCFrame.LookVector * 4
							local targetCFrame = CFrame.new(forwardPosition, generatorCFrame.Position)

							character:SetPrimaryPartCFrame(targetCFrame)
						end
					end
				end
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local players = game:GetService("Players")
	local player = players.LocalPlayer

	local function dwtpte()
		local elevatorsFolder = workspace:FindFirstChild("Elevators")

		if elevatorsFolder then
			local elevatorModel = elevatorsFolder:FindFirstChildWhichIsA("Model")

			if elevatorModel then
				local monsterBlocker = elevatorModel:FindFirstChild("MonsterBlocker")

				if monsterBlocker and monsterBlocker:IsA("Part") then
					local character = player.Character
					if character and character:FindFirstChild("HumanoidRootPart") then
						character.HumanoidRootPart.CFrame = monsterBlocker.CFrame
					end
				end
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function dwshrimpdecal()
		local function replacealltextures(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "rbxassetid://97212326743600" then
					v.Parent = nil
				elseif v:IsA("BasePart") then
					v.Material = "Plastic"
					v.Transparency = 0
					local One = Instance.new("Decal", v)
					local Two = Instance.new("Decal", v)
					local Three = Instance.new("Decal", v)
					local Four = Instance.new("Decal", v)
					local Five = Instance.new("Decal", v)
					local Six = Instance.new("Decal", v)
					One.Texture = "rbxassetid://97212326743600"
					Two.Texture = "rbxassetid://97212326743600"
					Three.Texture = "rbxassetid://97212326743600"
					Four.Texture = "rbxassetid://97212326743600"
					Five.Texture = "rbxassetid://97212326743600"
					Six.Texture = "rbxassetid://97212326743600"
					One.Face = "Front"
					Two.Face = "Back"
					Three.Face = "Right"
					Four.Face = "Left"
					Five.Face = "Top"
					Six.Face = "Bottom"
				end
				replacealltextures(v)
			end
		end
		local function applytextures(root)
			for _, v in pairs(root:GetChildren()) do
				applytextures(v)
			end
		end
		replacealltextures(game.Workspace)
		applytextures(game.Workspace)
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function scary()
		local function scary2(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "rbxassetid://100506288509343" then
					v.Parent = nil
				elseif v:IsA("BasePart") then
					v.Material = "Plastic"
					local One = Instance.new("Decal", v)
					local Two = Instance.new("Decal", v)
					local Three = Instance.new("Decal", v)
					local Four = Instance.new("Decal", v)
					local Five = Instance.new("Decal", v)
					local Six = Instance.new("Decal", v)
					One.Texture = "rbxassetid://100506288509343"
					Two.Texture = "rbxassetid://100506288509343"
					Three.Texture = "rbxassetid://100506288509343"
					Four.Texture = "rbxassetid://100506288509343"
					Five.Texture = "rbxassetid://100506288509343"
					Six.Texture = "rbxassetid://100506288509343"
					One.Face = "Front"
					Two.Face = "Back"
					Three.Face = "Right"
					Four.Face = "Left"
					Five.Face = "Top"
					Six.Face = "Bottom"
				end
				scary2(v)
			end
		end
		local function scary3(root)
			for _, v in pairs(root:GetChildren()) do
				scary3(v)
			end
		end
		scary2(game.Workspace)
		scary3(game.Workspace)

		local function replaceTextInGui(guiObject)
			if guiObject:IsA("TextLabel") or guiObject:IsA("TextButton") then
				guiObject.Text = "NOXIOUS OWNS YOU"
			end
		end

		local function replaceTextInWorkspace()
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
					for _, child in pairs(obj:GetDescendants()) do
						replaceTextInGui(child)
					end
				end
			end
		end

		replaceTextInWorkspace()

		for _, gui in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			replaceTextInGui(gui)
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function bacondwscript()
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/Dandy's%20World"))("t.me/arceusxscripts")
		end)
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function g0bbydwscript()
		loadstring(game:HttpGet("https://pastebin.com/raw/QQt4pVtu"))() 
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function hexdwscript()
		loadstring(game:HttpGet("https://pastebin.com/raw/83ex8rxx"))();
	end

	-------------------------------------------------------------------------------------------------------------------------------

	local function test()
		local function test2(root)
			for _, v in pairs(root:GetChildren()) do
				if v:IsA("Decal") and v.Texture ~= "rbxassetid://70931990930559" then
					v.Parent = nil
				elseif v:IsA("BasePart") then
					v.Material = "Plastic"
					local One = Instance.new("Decal", v)
					local Two = Instance.new("Decal", v)
					local Three = Instance.new("Decal", v)
					local Four = Instance.new("Decal", v)
					local Five = Instance.new("Decal", v)
					local Six = Instance.new("Decal", v)
					One.Texture = "rbxassetid://70931990930559"
					Two.Texture = "rbxassetid://70931990930559"
					Three.Texture = "rbxassetid://70931990930559"
					Four.Texture = "rbxassetid://70931990930559"
					Five.Texture = "rbxassetid://70931990930559"
					Six.Texture = "rbxassetid://70931990930559"
					One.Face = "Front"
					Two.Face = "Back"
					Three.Face = "Right"
					Four.Face = "Left"
					Five.Face = "Top"
					Six.Face = "Bottom"
				end
				test2(v)
			end
		end
		local function test3(root)
			for _, v in pairs(root:GetChildren()) do
				test3(v)
			end
		end
		test2(game.Workspace)
		test3(game.Workspace)

		local function replaceTextInGui(guiObject)
			if guiObject:IsA("TextLabel") or guiObject:IsA("TextButton") then
				guiObject.Text = "noxious ot"
			end
		end

		local function replaceTextInWorkspace()
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
					for _, child in pairs(obj:GetDescendants()) do
						replaceTextInGui(child)
					end
				end
			end
		end

		replaceTextInWorkspace()

		for _, gui in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			replaceTextInGui(gui)
		end
	
	local imageId = "rbxassetid://70931990930559"

	local function createBillboardGui(part)
		if part:FindFirstChildOfClass("BillboardGui") then return end

		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Size = UDim2.new(3, 0, 3, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Parent = part
		billboardGui.Adornee = part

		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Parent = billboardGui
	end

	local function addBillboardGuis()
		for _, descendant in pairs(workspace:GetDescendants()) do
			if descendant:IsA("BasePart") then
				createBillboardGui(descendant)
			end
		end

		workspace.DescendantAdded:Connect(function(newDescendant)
			if newDescendant:IsA("BasePart") then
				createBillboardGui(newDescendant)
			end
		end)
	end

	addBillboardGuis()
	end
	
	-------------------------------------------------------------------------------------------------------------------------------
	
	local function tptoadminroom()
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local targetPosition = Vector3.new(-43, 21, 24)
		humanoidRootPart.CFrame = CFrame.new(targetPosition)
	end
	
	-------------------------------------------------------------------------------------------------------------------------------

	local function tptobedroom()
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local targetPosition = Vector3.new(-175, 8, 49)
		humanoidRootPart.CFrame = CFrame.new(targetPosition)
	end
	
	-------------------------------------------------------------------------------------------------------------------------------

	local function tptodandysshop()
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local targetPosition = Vector3.new(-19, 21, 17)
		humanoidRootPart.CFrame = CFrame.new(targetPosition)
	end
	
	-------------------------------------------------------------------------------------------------------------------------------
	
	local function dwautofarm()
		local players = game:GetService("Players")
		local localPlayer = players.LocalPlayer
		local workspace = game:GetService("Workspace")
		local runService = game:GetService("RunService")

		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local currentRoom = workspace:FindFirstChild("CurrentRoom")
		local teleportEnabled = true
		local monsterProximity = 40 -- Distance threshold for monster detection
		local airTeleportCooldown = false -- Cooldown flag for air teleport
		local lastTeleportedGenerator = nil
		local proximityPromptPause = false -- Flag to pause proximity prompts

		local args = {
			[1] = "Stop"
		}

		local debounce = false  -- Add a debounce flag

		-- Function to handle the interaction with each generator
		local function interactWithGenerators()
			if debounce then return end  -- Exit if the script is already active
			debounce = true  -- Set debounce to true to prevent immediate reactivation

			-- Get the first child of the CurrentRoom folder, assuming it is the model you want
			local currentRoomModel = workspace.CurrentRoom:GetChildren()[1]

			if currentRoomModel and currentRoomModel:IsA("Model") then
				local generatorsFolder = currentRoomModel:FindFirstChild("Generators")

				if generatorsFolder then
					-- Loop through each child in the Generators folder
					for _, generator in ipairs(generatorsFolder:GetChildren()) do
						if generator:IsA("Model") and generator:FindFirstChild("Stats") then
							local stopInteracting = generator.Stats:FindFirstChild("StopInteracting")

							if stopInteracting then
								stopInteracting:FireServer(unpack(args))
							else
								warn("StopInteracting event not found in generator:", generator.Name)
							end
						else
							warn("Invalid generator model or missing Stats in generator:", generator.Name)
						end
					end
				else
					warn("No Generators folder found in", currentRoomModel.Name)
				end
			else
				warn("No valid model found in CurrentRoom")
			end

			-- Add a short delay to reset debounce
			wait(1)  -- Adjust time as needed
			debounce = false  -- Reset debounce after delay
		end

		-- Function to teleport to a random generator and pause proximity prompt trigger
		local function teleportToRandomGenerator()
			local availableGenerators = {}

			for _, item in pairs(currentRoom:GetChildren()) do
				if item:IsA("Model") then
					local generatorsFolder = item:FindFirstChild("Generators")
					if generatorsFolder then
						for _, generator in pairs(generatorsFolder:GetChildren()) do
							if generator:IsA("Model") and generator.PrimaryPart then
								local statsFolder = generator:FindFirstChild("Stats")
								if statsFolder then
									local completedValue = statsFolder:FindFirstChild("Completed")
									if completedValue and completedValue:IsA("BoolValue") and not completedValue.Value then
										table.insert(availableGenerators, generator)
									end
								end
							end
						end
					end
				end
			end

			if #availableGenerators > 0 then
				local randomGenerator = availableGenerators[math.random(1, #availableGenerators)]
				local generatorCFrame = randomGenerator:GetPrimaryPartCFrame()
				local forwardPosition = generatorCFrame.Position + generatorCFrame.LookVector * 4
				local targetCFrame = CFrame.new(forwardPosition, generatorCFrame.Position)
				character:SetPrimaryPartCFrame(targetCFrame)
				lastTeleportedGenerator = randomGenerator

				-- Pause proximity prompt triggering for 5 seconds
				proximityPromptPause = true
				task.delay(5, function()
					proximityPromptPause = false
				end)
			end
		end

		-- Function to trigger ProximityPrompts, with pause support
		local function triggerNearbyProximityPrompts()
			if proximityPromptPause then return end -- Exit if paused
			if currentRoom and character and character:FindFirstChild("HumanoidRootPart") then
				for _, prompt in pairs(currentRoom:GetDescendants()) do
					if prompt:IsA("ProximityPrompt") and prompt.Enabled then
						local distance = (prompt.Parent.Position - character.HumanoidRootPart.Position).Magnitude
						if distance <= prompt.MaxActivationDistance then
							prompt:InputHoldBegin()
							wait(0)
							prompt:InputHoldEnd()
						end
					end
				end
			end
		end

		-- Monitor "FloorActive" and teleport if active
		local infoFolder = workspace:FindFirstChild("Info")
		if infoFolder then
			local floorActive = infoFolder:FindFirstChild("FloorActive")
			if floorActive and floorActive:IsA("BoolValue") then
				floorActive:GetPropertyChangedSignal("Value"):Connect(function()
					if floorActive.Value == true then
						teleportToRandomGenerator()
					end
				end)
			end
		end

		-- Check for nearby monsters, teleport if needed, and trigger interactWithGenerators
		runService.Heartbeat:Connect(function()
			-- Check if the character is near any generator for triggering proximity prompts
			local isNearGenerator = false
			if currentRoom and character and character:FindFirstChild("HumanoidRootPart") then
				for _, item in pairs(currentRoom:GetChildren()) do
					local generatorsFolder = item:FindFirstChild("Generators")
					if generatorsFolder then
						for _, generator in pairs(generatorsFolder:GetChildren()) do
							if generator:IsA("Model") and generator.PrimaryPart then
								local distance = (generator.PrimaryPart.Position - character.HumanoidRootPart.Position).Magnitude
								if distance <= 10 then -- Check if within 10 studs
									isNearGenerator = true
									break
								end
							end
						end
					end
					if isNearGenerator then break end
				end
			end

			-- Only trigger prompts if near a generator
			if isNearGenerator then
				triggerNearbyProximityPrompts()
			end

			-- Check for nearby monsters, teleport if needed, and trigger interactWithGenerators
			if currentRoom and not airTeleportCooldown then
				for _, model in pairs(currentRoom:GetChildren()) do
					local monstersFolder = model:FindFirstChild("Monsters")
					if monstersFolder then
						for _, monster in pairs(monstersFolder:GetChildren()) do
							if monster:IsA("Model") and monster.PrimaryPart then
								-- Calculate the horizontal distance between the character and the monster
								local characterPosition = character.HumanoidRootPart.Position
								local monsterPosition = monster.PrimaryPart.Position
								local horizontalDistance = (Vector3.new(characterPosition.X, 0, characterPosition.Z) - Vector3.new(monsterPosition.X, 0, monsterPosition.Z)).Magnitude

								-- Check if within 30 studs horizontally (X and Z only)
								if horizontalDistance <= 30 then
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()
									wait(0)
									interactWithGenerators()

									-- Air teleport to avoid the monster
									character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 60, 0)
									airTeleportCooldown = true
									task.delay(20, function()
										airTeleportCooldown = false
										teleportToRandomGenerator()
									end)
									break
								end
							end
						end
					end
				end
			end
		end)

		-- Repeatedly check nearest generator's "Completed" status
		local function checkNearestGenerator()
			while true do
				if currentRoom and character and character:FindFirstChild("HumanoidRootPart") then
					local closestGenerator = nil
					local closestDistance = math.huge

					for _, item in pairs(currentRoom:GetChildren()) do
						local generatorsFolder = item:FindFirstChild("Generators")
						if generatorsFolder then
							for _, generator in pairs(generatorsFolder:GetChildren()) do
								if generator:IsA("Model") and generator.PrimaryPart then
									local distance = (generator.PrimaryPart.Position - character.HumanoidRootPart.Position).Magnitude
									if distance < closestDistance then
										closestDistance = distance
										closestGenerator = generator
									end
								end
							end
						end
					end

					if closestGenerator then
						local statsFolder = closestGenerator:FindFirstChild("Stats")
						if statsFolder then
							local completedValue = statsFolder:FindFirstChild("Completed")
							if completedValue and completedValue:IsA("BoolValue") and completedValue.Value == true then
								teleportToRandomGenerator()
							end
						end
					end
				end
				wait(1)
			end
		end

		-- Function to teleport to the MonsterBlocker when Panic is true
		local function checkAndTeleportToMonsterBlocker()
			local infoFolder = workspace:FindFirstChild("Info")
			if infoFolder then
				local panicBool = infoFolder:FindFirstChild("Panic")
				if panicBool and panicBool:IsA("BoolValue") then
					runService.Heartbeat:Connect(function()
						if teleportEnabled and panicBool.Value == true then
							local elevatorsFolder = workspace:FindFirstChild("Elevators")
							if elevatorsFolder then
								local elevatorModel = elevatorsFolder:FindFirstChildWhichIsA("Model")
								if elevatorModel then
									local monsterBlocker = elevatorModel:FindFirstChild("MonsterBlocker")
									if monsterBlocker and monsterBlocker:IsA("Part") then
										local character = localPlayer.Character
										if character and character:FindFirstChild("HumanoidRootPart") then
											character.HumanoidRootPart.CFrame = monsterBlocker.CFrame
										end
									end
								end
							end
						end
					end)
				end
			end
		end

		-- Function to check if any monster's "Chasing" BoolValue is set to true
		local function checkForChasingMonsters()
			if currentRoom and character and character:FindFirstChild("HumanoidRootPart") then
				for _, model in pairs(currentRoom:GetChildren()) do
					local monstersFolder = model:FindFirstChild("Monsters")
					if monstersFolder then
						for _, monster in pairs(monstersFolder:GetChildren()) do
							if monster:IsA("Model") and monster.PrimaryPart then
								local chasingValue = monster:FindFirstChild("Chasing")
								if chasingValue and chasingValue:IsA("BoolValue") and chasingValue.Value == true then
									-- Teleport the character up 60 studs and start cooldown
									if not airTeleportCooldown then
										character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 60, 0)
										airTeleportCooldown = true
										task.delay(20, function()
											airTeleportCooldown = false
										end)
									end
									break
								end
							end
						end
					end
				end
			end
		end

		-- Start the Panic check and nearest generator check
		checkAndTeleportToMonsterBlocker()
		checkNearestGenerator()

		while true do
			local args = {
				[1] = workspace.Info.CardVote.Heal
			}

			game:GetService("ReplicatedStorage").Events.CardVoteEvent:FireServer(unpack(args))
			task.wait(0.1)
		end

		-- Integrate the check into the Heartbeat loop
		runService.Heartbeat:Connect(function()
			-- Check for nearby monsters with "Chasing" set to true and teleport if needed
			checkForChasingMonsters()
		end)
	end

	-------------------------------------------------------------------------------------------------------------------------------
	
	local function handleDandysWorldCommands(command)
		-- open anims gui
		if command == "agui" then
			loadstring(game:HttpGet("https://pastebin.com/raw/8wagaezj"))()
			-- teleport to a generator
		elseif command == "tptg" then
			dwtptg()
			-- autofarm
		elseif command == "af" then
			dwautofarm()
			-- teleport to admin room
		elseif command == "tptar" then
			tptoadminroom()
			-- teleport to bedroom
		elseif command == "tptbr" then
			tptobedroom()
			-- teleport to dandys shop
		elseif command == "tptds" then
			tptodandysshop()
			-- pre made scripts
		elseif command == "bacon" then
			bacondwscript()
		elseif command == "gobby" then
			g0bbydwscript()
		elseif command == "hex" then
			hexdwscript()
			-- shrimp decal spam
		elseif command == "sds" then
			dwshrimpdecal()
			-- scary ahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh!!!!
		elseif command == "scary" then
			scary()
			-- test command
		elseif command == "test" then
			test()
			-- teleport to the elevator
		elseif command == "tpte" then
			dwtpte()
			-- enable auto teleport to elevator
		elseif command == "eatpte" then
			dweatpte()
			-- disable auto teleport to elevator
		elseif command == "datpte" then
			dwdatpte()
			-- break stats
		elseif command == "bstats" then
			breakstats()
			-- bechome character
		elseif command == "bchar" then
			becomeCharacter()
			-- delete dev doors
		elseif command == "ddd" then
			deleteDeveloperDoors()
			-- enable monster esp
		elseif command == "etesp" then
			enableEsp("Monsters")
			-- disable monster esp
		elseif command == "dtesp" then
			disableEsp("Monsters")
			-- enable player esp
		elseif command == "epesp" then
			enableEsp("Players")
			-- disable player esp
		elseif command == "dpesp" then
			disableEsp("Players")
			-- enable item esp
		elseif command == "eiesp" then
			enableEsp("Items")
			-- disable item esp
		elseif command == "diesp" then
			disableEsp("Items")
			-- enable machines esp
		elseif command == "emesp" then
			enableEsp("Machines")
			-- disable machines esp
		elseif command == "dmesp" then
			disableEsp("Machines")
			-- enable all esp types
		elseif command == "eesp" then
			enableAllEsp()
			-- disable all esp types
		elseif command == "desp" then
			disableAllEsp()
			-- fake dandy card
		elseif command == "fdc" then
			fakeDandyCard()
			-- become dandy
		elseif command == "bd" then
			becomeDandy()
			-- enable fullbright
		elseif command == "efb" then
			enableFullBright()
			-- disable fullbright
		elseif command == "dfb" then
			disableFullBright()
			-- (un)bang, (un)head, (un)headsit, (un)headjump player
		elseif command:sub(1, 4) == "bang" then
			dwbang(command, player)
		elseif command == "unbang" then
			dwunbang()
		elseif command:sub(1, 4) == "head" then
			dwhead(command, player)
		elseif command == "unhead" then
			dwunhead()
		elseif command:sub(1, 4) == "hsit" then
			dwhsit(command, player)
		elseif command == "unhsit" then
			dwunhsit()
		elseif command:sub(1, 5) == "hjump" then
			dwhjump(command, player)
		elseif command == "unhjump" then
			dwunhjsit()
			-- animations and emotes
		elseif command == "dance" then
			dwdance()
		elseif command == "undance" then
			dwundance()
		elseif command == "hbang" then
			dwhbang()
		elseif command == "unhbang" then
			dwunhbang()
		elseif command == "therian" then
			dwtherian()
		elseif command == "untherian" then
			dwuntherian()
		elseif command == "sit" then
			dwsit()
		elseif command == "unsit" then
			dwunsit()
		elseif command == "sit2" then
			dwsit2()
		elseif command == "unsit2" then
			dwunsit2()
		elseif command == "wave" then
			dwwave()
		elseif command == "pounce" then
			dwpounce()
		elseif command == "dabr" then
			dwbarrelroll()
		elseif command == "twirl" then
			dwtwirl()
		elseif command == "twirl2" then
			dwtwirl2()
		elseif command == "facepalm" then
			dwfacepalm()
		elseif command == "jump" then
			dwjump()
		elseif command == "dhimmy" then
			dwshimmy()
		elseif command == "cheer" then
			dwcheer()
		elseif command == "dive" then
			dwdive()
			-- click to play an emote / animation
		elseif command == "ecwave" then
			enableAnimation(dwwave)
		elseif command == "dcwave" then
			disableAnimation()
		elseif command == "ecpounce" then
			enableAnimation(dwpounce)
		elseif command == "dcpounce" then
			disableAnimation()
		elseif command == "ecdabr" then
			enableAnimation(dwbarrelroll)
		elseif command == "dcdabr" then
			disableAnimation()
		elseif command == "ectwirl" then
			enableAnimation(dwtwirl)
		elseif command == "dctwirl" then
			disableAnimation()
		elseif command == "ectwirl2" then
			enableAnimation(dwtwirl2)
		elseif command == "dctwirl2" then
			disableAnimation()
		elseif command == "ecfacepalm" then
			enableAnimation(dwfacepalm)
		elseif command == "dcfacepalm" then
			disableAnimation()
		elseif command == "ecjump" then
			enableAnimation(dwjump)
		elseif command == "dcjump" then
			disableAnimation()
		elseif command == "ecshimmy" then
			enableAnimation(dwshimmy)
		elseif command == "dcshimmy" then
			disableAnimation()
		elseif command == "eccheer" then
			enableAnimation(dwcheer)
		elseif command == "dccheer" then
			disableAnimation()
		elseif command == "ecdive" then
			enableAnimation(dwdive)
		elseif command == "dcdive" then
			disableAnimation()
		end
	end

	-------------------------------------------------------------------------------------------------------------------------------

	commandBar.FocusLost:Connect(
		function(enterPressed)
			if enterPressed then
				local command = commandBar.Text
				handleDandysWorldCommands(command)
				commandBar.Text = ""
			end
		end
	)

	-------------------------------------------------------------------------------------------------------------------------------
	
	local Players = game:GetService("Players")

	-- Listen for the chat message and handle the command
	local function onPlayerChatted(player, message)
		-- Strip the command prefix if needed
		local command = message:lower() -- Make the command case-insensitive

		if command == "!agui" then
			loadstring(game:HttpGet("https://pastebin.com/raw/8wagaezj"))()
		elseif command == "!tptg" then
			dwtptg()
		elseif command == "!af" then
			dwautofarm()
		elseif command == "!tptar" then
			tptoadminroom()
		elseif command == "!tptbr" then
			tptobedroom()
		elseif command == "!tptds" then
			tptodandysshop()
		elseif command == "!bacon" then
			bacondwscript()
		elseif command == "!gobby" then
			g0bbydwscript()
		elseif command == "!hex" then
			hexdwscript()
		elseif command == "!sds" then
			dwshrimpdecal()
		elseif command == "!scary" then
			scary()
		elseif command == "!test" then
			test()
		elseif command == "!tpte" then
			dwtpte()
		elseif command == "!eatpte" then
			dweatpte()
		elseif command == "!datpte" then
			dwdatpte()
		elseif command == "!bstats" then
			breakstats()
		elseif command == "!bchar" then
			becomeCharacter()
		elseif command == "!ddd" then
			deleteDeveloperDoors()
		elseif command == "!etesp" then
			enableEsp("Monsters")
		elseif command == "!dtesp" then
			disableEsp("Monsters")
		elseif command == "!epesp" then
			enableEsp("Players")
		elseif command == "!dpesp" then
			disableEsp("Players")
		elseif command == "!eiesp" then
			enableEsp("Items")
		elseif command == "!diesp" then
			disableEsp("Items")
		elseif command == "!emesp" then
			enableEsp("Machines")
		elseif command == "!dmesp" then
			disableEsp("Machines")
		elseif command == "!eesp" then
			enableAllEsp()
		elseif command == "!desp" then
			disableAllEsp()
		elseif command == "!fdc" then
			fakeDandyCard()
		elseif command == "!bd" then
			becomeDandy()
		elseif command == "!efb" then
			enableFullBright()
		elseif command == "!dfb" then
			disableFullBright()
		elseif command:sub(1, 5) == "!bang" then
			dwbang(command, player)
		elseif command == "!unbang" then
			dwunbang()
		elseif command:sub(1, 5) == "!head" then
			dwhead(command, player)
		elseif command == "!unhead" then
			dwunhead()
		elseif command:sub(1, 5) == "!hsit" then
			dwhsit(command, player)
		elseif command == "!unhsit" then
			dwunhsit()
		elseif command:sub(1, 6) == "!hjump" then
			dwhjump(command, player)
		elseif command == "!unhjump" then
			dwunhjsit()
		elseif command == "!dance" then
			dwdance()
		elseif command == "!undance" then
			dwundance()
		elseif command == "!hbang" then
			dwhbang()
		elseif command == "!unhbang" then
			dwunhbang()
		elseif command == "!therian" then
			dwtherian()
		elseif command == "!untherian" then
			dwuntherian()
		elseif command == "!sit" then
			dwsit()
		elseif command == "!unsit" then
			dwunsit()
		elseif command == "!sit2" then
			dwsit2()
		elseif command == "!unsit2" then
			dwunsit2()
		elseif command == "!wave" then
			dwwave()
		elseif command == "!pounce" then
			dwpounce()
		elseif command == "!dabr" then
			dwbarrelroll()
		elseif command == "!twirl" then
			dwtwirl()
		elseif command == "!twirl2" then
			dwtwirl2()
		elseif command == "!facepalm" then
			dwfacepalm()
		elseif command == "!jump" then
			dwjump()
		elseif command == "!dhimmy" then
			dwshimmy()
		elseif command == "!cheer" then
			dwcheer()
		elseif command == "!dive" then
			dwdive()
		elseif command == "!ecwave" then
			enableAnimation(dwwave)
		elseif command == "!dcwave" then
			disableAnimation()
		elseif command == "!ecpounce" then
			enableAnimation(dwpounce)
		elseif command == "!dcpounce" then
			disableAnimation()
		elseif command == "!ecdabr" then
			enableAnimation(dwbarrelroll)
		elseif command == "!dcdabr" then
			disableAnimation()
		elseif command == "!ectwirl" then
			enableAnimation(dwtwirl)
		elseif command == "!dctwirl" then
			disableAnimation()
		elseif command == "!ectwirl2" then
			enableAnimation(dwtwirl2)
		elseif command == "!dctwirl2" then
			disableAnimation()
		elseif command == "!ecfacepalm" then
			enableAnimation(dwfacepalm)
		elseif command == "!dcfacepalm" then
			disableAnimation()
		elseif command == "!ecjump" then
			enableAnimation(dwjump)
		elseif command == "!dcjump" then
			disableAnimation()
		elseif command == "!ecshimmy" then
			enableAnimation(dwshimmy)
		elseif command == "!dcshimmy" then
			disableAnimation()
		elseif command == "!eccheer" then
			enableAnimation(dwcheer)
		elseif command == "!dccheer" then
			disableAnimation()
		elseif command == "!ecdive" then
			enableAnimation(dwdive)
		elseif command == "!dcdive" then
			disableAnimation()
		end
	end

	-- Connect the function to PlayerChatted event
	Players.PlayerAdded:Connect(function(player)
		player.Chatted:Connect(function(message)
			onPlayerChatted(player, message)
		end)
	end)

	-------------------------------------------------------------------------------------------------------------------------------

	wait(0)

	notify("Script is still indev. Expect bugs.", 5)

	wait(1.5)

	-------------------------------------------------------------------------------------------------------------------------------

	local players = game:GetService("Players")

	local devs = { "noxiousholder", "DWNoxiousTester", "hxpxotic", "exherxal", "Plectora", "unaqle", "furbound", "9sght", "protogenfemboys", "BellasPerspective" }

	local devnotified = {}

	local function devnotify(player)
		for _, developers in ipairs(devs) do
			if player.Name == developers and not devnotified[player.UserId] then
				notify("A Noxious Developer is in your server.", 5)
				devnotified[player.UserId] = true
			end
		end
	end

	local function onPlayerRemoving(player)
		if devnotified[player.UserId] then
			devnotified[player.UserId] = nil
		end
	end

	players.PlayerAdded:Connect(devnotify)
	players.PlayerRemoving:Connect(onPlayerRemoving)

	for _, player in ipairs(players:GetPlayers()) do
		devnotify(player)
	end

	-------------------------------------------------------------------------------------------------------------------------------

else
	notify("You arent in Dandy's World.", 5)

	wait(1.5)

	notify("Script disabled.", 5)
end

-------------------------------------------------------------------------------------------------------------------------------
