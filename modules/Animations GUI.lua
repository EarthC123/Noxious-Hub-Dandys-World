--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora (With additional help from ChatGPT) - Dandy's World Animations GUI
   
---------------------------------------------------------------------------------------------------------------------------]]--

wait(0)

-------------------------------------------------------------------------------------------------------------------------------

local screenGui = Instance.new("ScreenGui")

local toggleButton = Instance.new("ImageButton")
local scrollingFrame = Instance.new("ScrollingFrame")
local draggableFrame = Instance.new("Frame")

-------------------------------------------------------------------------------------------------------------------------------

if game.PlaceId == 118022198489171 then
	screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
else
	screenGui.Parent = game:GetService("CoreGui")
end

screenGui.ResetOnSpawn = false

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 48, 0, 48)
toggleButton.Image = "rbxassetid://112253526068779"

function centerbutton()
	-- Fetch screen dimensions
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	-- Calculate the position to center the button horizontally and vertically (adjust for its size)
	local buttonWidth = 48
	local buttonHeight = 48
	local centerX = (screenWidth - buttonWidth) / 2
	local topMargin = 20  -- 20px from the top of the screen
	local centerY = topMargin

	-- Set the position to center the button at the bottom of the screen
	toggleButton.Position = UDim2.new(0, centerX, 0, centerY)
end
centerbutton()

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.3, 0)
uiCorner.Parent = toggleButton

local borderButton2 = Instance.new("Frame")
borderButton2.Size = UDim2.new(0, 50, 0, 50)
borderButton2.Position = UDim2.new(-0.02, 0, -0.02, 0)
borderButton2.BackgroundColor3 = Color3.new(1,1,1)
borderButton2.Parent = toggleButton

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.3, 0)
uiCorner.Parent = borderButton2

local UIS = game:GetService('UserInputService')
local frame = toggleButton
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updatedwbuttoninput(input)
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
			updatedwbuttoninput(input)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
}
gradient.Parent = borderButton2

local rotationSpeed = 1
task.spawn(function()
	while true do
		gradient.Rotation = (gradient.Rotation + rotationSpeed) % 360
		task.wait(0.03)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://421058925"
clickSound.Parent = toggleButton

clickSound.Volume = 0.3

local notifsound = Instance.new("Sound")
notifsound.SoundId = "rbxassetid://8503529139"
notifsound.Parent = toggleButton

notifsound.Volume = 0.7

-------------------------------------------------------------------------------------------------------------------------------

draggableFrame.Parent = screenGui
draggableFrame.Size = UDim2.new(0, 240, 0, 350)
draggableFrame.Visible = false -- Initially hidden
draggableFrame.Active = true
draggableFrame.BackgroundTransparency = 0.2
draggableFrame.BorderSizePixel = 1
draggableFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
draggableFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

function centerdraggableframe()
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	-- Calculate the position to center the frame on the screen
	local frameWidth = 240
	local frameHeight = 350
	local centerX = (screenWidth - frameWidth) / 2 - -13
	local centerY = (screenHeight - frameHeight) / 2 - 55

	-- Set the position to center it on the screen
	draggableFrame.Position = UDim2.new(0, centerX, 0, centerY)
end
centerdraggableframe()

function dragdraggableframe()
	local UIS = game:GetService('UserInputService')
	local frame = draggableFrame
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil

	local function updatedraggableframeinput(input)
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
				updatedraggableframeinput(input)
			end
		end
	end)
end

dragdraggableframe()

-------------------------------------------------------------------------------------------------------------------------------

local topframe = Instance.new("TextLabel")
topframe.Parent = draggableFrame
topframe.Text = "Dandy's World Animations GUI"
topframe.Size = UDim2.new(0, 240.1, 0, 30)
topframe.Position = UDim2.new(0.417, -100, 0, 0)
topframe.Visible = false
topframe.BackgroundTransparency = 0
topframe.TextColor3 = Color3.new(1,1,1)
topframe.TextSize = 21.6
topframe.Font = Enum.Font.Nunito
topframe.TextScaled = false
topframe.BorderSizePixel = 1
topframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframe.BackgroundColor3 = Color3.fromRGB(0,0,0)
topframe.Active = true

-------------------------------------------------------------------------------------------------------------------------------

scrollingFrame.Parent = draggableFrame
scrollingFrame.Size = UDim2.new(0, 240, 0, 250)
scrollingFrame.Position = UDim2.new(0.45, -100, 0.07, -4)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 25.392, 0)
scrollingFrame.Visible = false
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.ScrollBarImageTransparency = 1
scrollingFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
scrollingFrame.Active = true

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.MouseButton1Click:Connect(function()
	clickSound:Play()
	scrollingFrame.Visible = not scrollingFrame.Visible
	draggableFrame.Visible = not draggableFrame.Visible
	topframe.Visible = not topframe.Visible
end)

-------------------------------------------------------------------------------------------------------------------------------

local currentAnimationTrack = nil

-------------------------------------------------------------------------------------------------------------------------------

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function stopCurrentAnimation()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local animator = humanoid:FindFirstChildOfClass("Animator")
		if animator then
			-- Stop all currently playing animations
			for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
				track:Stop()
			end
		end
	end
	
	if currentAnimationTrack then
		currentAnimationTrack:Stop()
		currentAnimationTrack = nil
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local TweenService = game:GetService("TweenService")

scrollingFrame.Position = UDim2.new(0, 0, 0, 80)

-- Create the search bar (TextBox)
local searchBox = Instance.new("TextBox")
searchBox.Parent = draggableFrame
searchBox.Size = UDim2.new(0, 240.1, 0, 30)
searchBox.Position = UDim2.new(0.417, -100, 0, 31) -- Position it above the buttons
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
searchBox.PlaceholderText = "Search..."
searchBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
searchBox.Font = Enum.Font.Nunito
searchBox.TextSize = 21.6
searchBox.TextScaled = false
searchBox.TextWrapped = true
searchBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Active = true

local buttonSpacing = 16 -- Increased space between buttons

-- Function to filter buttons based on search input
local function filterButtons(searchText)
	local visibleButtons = {}
	local buttonCount = 0

	-- Iterate over the children of the scrolling frame (buttons)
	for _, button in ipairs(scrollingFrame:GetChildren()) do
		if button:IsA("TextButton") then
			-- Check if the button's text contains the search text (case-insensitive)
			if string.find(button.Text:lower(), searchText:lower()) then
				button.Visible = true
				table.insert(visibleButtons, button)
				buttonCount = buttonCount + 1
			else
				button.Visible = false
			end
		end
	end

	-- Reposition visible buttons to the top with added spacing
	for index, button in ipairs(visibleButtons) do
		button.Position = UDim2.new(0.5, 0, 0, (index - 1) * (button.Size.Y.Offset + buttonSpacing) - -1) -- Apply more space between buttons
		button.AnchorPoint = Vector2.new(0.5, 0) -- Anchor them from the top
	end

	-- Adjust CanvasSize of the ScrollingFrame to fit the visible buttons with added spacing
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, buttonCount * (visibleButtons[1].Size.Y.Offset + buttonSpacing) - 13) -- Adjust for vertical spacing
end

-- Listen for changes in the search box text
searchBox.Changed:Connect(function(property)
	if property == "Text" then
		-- Filter buttons when the text changes
		filterButtons(searchBox.Text)
	end
end)

-- Modify the createFunctionButton to update the button list dynamically
local function createFunctionButton(name, functionToRun)
	local button = Instance.new("TextButton")
	button.Parent = scrollingFrame
	button.Size = UDim2.new(0, 197, 0, 50)
	button.Text = name
	button.AnchorPoint = Vector2.new(0.5, 0.5) -- Set AnchorPoint to center
	button.BorderColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Nunito
	button.TextSize = 21.6
	button.Active = true
	button.TextScaled = false
	button.TextWrapped = true
	button.ZIndex = 8

	button.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()

		stopCurrentAnimation()

		currentAnimationTrack = functionToRun(character)

		currentAnimationTrack:AdjustWeight(999)
		clickSound:Play()
	end)

	-- After creating a button, filter the buttons to ensure the correct visibility based on the search
	filterButtons(searchBox.Text)
end

-------------------------------------------------------------------------------------------------------------------------------

scrollingFrame.ZIndex = 7
draggableFrame.ZIndex = 8
topframe.ZIndex = 9
searchBox.ZIndex = 9
borderButton2.ZIndex = 9
borderButton2.ZIndex = 10
toggleButton.ZIndex = 11

--[[---------------------------------------------------------------------------------------------------------------------------

TOON ANIMATIONS | TOON ANIMATIONS | TOON ANIMATIONS | TOON ANIMATIONS | TOON ANIMATIONS | TOON ANIMATIONS | TOON ANIMATIONS

---------------------------------------------------------------------------------------------------------------------------]]--

-- astro
local function astroIdle(character)
	local animationId = "rbxassetid://17477484184"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function astroWalk(character)
	local animationId = "rbxassetid://17477562502"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- brightney
local function brightneyIdle(character)
	local animationId = "rbxassetid://17266012992"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function brightneyWalk(character)
	local animationId = "rbxassetid://17267881920"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- boxten
local function boxtenIdle(character)
	local animationId = "rbxassetid://16987798588"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function boxtenWalk(character)
	local animationId = "rbxassetid://16987891441"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- cosmo
local function cosmoIdle(character)
	local animationId = "rbxassetid://18608700264"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function cosmoWalk(character)
	local animationId = "rbxassetid://18608782689"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- connie
local function connieIdle(character)
	local animationId = "rbxassetid://96412679901902"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function connieWalk(character)
	local animationId = "rbxassetid://71819089910283"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- dandy
local function dandyIdle(character)
	local animationId = "rbxassetid://16496520991"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function dandyWalk(character)
	local animationId = "rbxassetid://16496812530"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- finn
local function finnIdle(character)
	local animationId = "rbxassetid://18717443931"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function finnWalk(character)
	local animationId = "rbxassetid://18717500470"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- flutter
local function flutterIdle(character)
	local animationId = "rbxassetid://18226198149"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function flutterWalk(character)
	local animationId = "rbxassetid://18226261062"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- gigi
local function gigiIdle(character)
	local animationId = "rbxassetid://131680997351874"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function gigiWalk(character)
	local animationId = "rbxassetid://79372488497037"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- glisten
local function glistenIdle(character)
	local animationId = "rbxassetid://18789173875"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function glistenWalk(character)
	local animationId = "rbxassetid://18789278688"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- goob
local function goobIdle(character)
	local animationId = "rbxassetid://17231779680"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function goobWalk(character)
	local animationId = "rbxassetid://17231273641"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- looey
local function looeyIdle(character)
	local animationId = "rbxassetid://78197156369403"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function looeyWalk(character)
	local animationId = "rbxassetid://124245470232056"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function looeyRun(character)
	local animationId = "rbxassetid://131545440842534"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- pebble
local function pebbleIdle(character)
	local animationId = "rbxassetid://14544408615"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function pebbleWalk(character)
	local animationId = "rbxassetid://16470633655"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- poppy
local function poppyIdle(character)
	local animationId = "rbxassetid://16205089554"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function poppyWalk(character)
	local animationId = "rbxassetid://16409449646"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rnd
local function razzledazzleIdle(character)
	local animationId = "rbxassetid://17450844457"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function razzledazzleWalk(character)
	local animationId = "rbxassetid://17451039864"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rodger
local function rodgerIdle(character)
	local animationId = "rbxassetid://17097874814"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function rodgerWalk(character)
	local animationId = "rbxassetid://17097949440"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- scraps
local function scrapsIdle(character)
	local animationId = "rbxassetid://17553394893"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function scrapsWalk(character)
	local animationId = "rbxassetid://17554165839"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shelly
local function shellyIdle(character)
	local animationId = "rbxassetid://18199284470"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shellyWalk(character)
	local animationId = "rbxassetid://18199493442"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shrimpo
local function shrimpoIdle(character)
	local animationId = "rbxassetid://17561045485"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shrimpoWalk(character)
	local animationId = "rbxassetid://17561196171"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- sprout
local function sproutIdle(character)
	local animationId = "rbxassetid://18555568169"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function sproutWalk(character)
	local animationId = "rbxassetid://18578948869"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- teagan
local function teaganIdle(character)
	local animationId = "rbxassetid://18183602038"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function teaganWalk(character)
	local animationId = "rbxassetid://18183710195"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- tisha
local function tishaIdle(character)
	local animationId = "rbxassetid://18152665882"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function tishaWalk(character)
	local animationId = "rbxassetid://18152903980"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- toodles
local function toodlesIdle(character)
	local animationId = "rbxassetid://17504197216"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function toodlesWalk(character)
	local animationId = "rbxassetid://17504345651"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- vee
local function veeIdle(character)
	local animationId = "rbxassetid://17293962722"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function veeWalk(character)
	local animationId = "rbxassetid://17294160873"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

--[[---------------------------------------------------------------------------------------------------------------------------

TWISTED ANIMATIONS | TWISTED ANIMATIONS | TWISTED ANIMATIONS | TWISTED ANIMATIONS | TWISTED ANIMATIONS | TWISTED ANIMATIONS

---------------------------------------------------------------------------------------------------------------------------]]--

-- astro
local function astroTwistedIdle(character)
	local animationId = "rbxassetid://17616899088"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function astroTwistedWalk(character)
	local animationId = "rbxassetid://17617109508"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function astroTwistedRun(character)
	local animationId = "rbxassetid://17617489384"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- brightney
local function brightneyTwistedIdle(character)
	local animationId = "rbxassetid://17638507046"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function brightneyTwistedWalk(character)
	local animationId = "rbxassetid://17638574879"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end
local function brightneyTwistedRun(character)
	local animationId = "rbxassetid://17638734882"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- boxten
local function boxtenTwistedIdle(character)
	local animationId = "rbxassetid://17173910857"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function boxtenTwistedWalk(character)
	local animationId = "rbxassetid://17173980406"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function boxtenTwistedRun(character)
	local animationId = "rbxassetid://17174260770"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- cosmo
local function cosmoTwistedIdle(character)
	local animationId = "rbxassetid://18682187542"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function cosmoTwistedWalk(character)
	local animationId = "rbxassetid://18682136751"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function cosmoTwistedRun(character)
	local animationId = "rbxassetid://18682530957"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- connie
local function connieTwistedIdle(character)
	local animationId = "rbxassetid://140696695675999"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function connieTwistedWalk(character)
	local animationId = "rbxassetid://73609609622544"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function connieTwistedRun(character)
	local animationId = "rbxassetid://81505996760447"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- dandy
local function dandyTwistedIdle(character)
	local animationId = "rbxassetid://17515694121"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function dandyTwistedWalk(character)
	local animationId = "rbxassetid://17515542297"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function dandyTwistedRun(character)
	local animationId = "rbxassetid://17516071317"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- finn
local function finnTwistedIdle(character)
	local animationId = "rbxassetid://18740791780"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function finnTwistedWalk(character)
	local animationId = "rbxassetid://18740834988"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function finnTwistedRun(character)
	local animationId = "rbxassetid://18741061111"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- flutter
local function flutterTwistedIdle(character)
	local animationId = "rbxassetid://18226198149"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function flutterTwistedWalk(character)
	local animationId = "rbxassetid://18226261062"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function flutterTwistedRun(character)
	local animationId = "rbxassetid://18239928544"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- gigi
local function gigiTwistedIdle(character)
	local animationId = "rbxassetid://138817858272409"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function gigiTwistedWalk(character)
	local animationId = "rbxassetid://112750898606111"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function gigiTwistedRun(character)
	local animationId = "rbxassetid://124691439016513"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- glisten
local function glistenTwistedIdle(character)
	local animationId = "rbxassetid://18820870445"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function glistenTwistedWalk(character)
	local animationId = "rbxassetid://18821107251"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function glistenTwistedRun(character)
	local animationId = "rbxassetid://18833020404"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- goob
local function goobTwistedIdle(character)
	local animationId = "rbxassetid://17269810470"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function goobTwistedWalk(character)
	local animationId = "rbxassetid://17269854881"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function goobTwistedRun(character)
	local animationId = "rbxassetid://17270072413"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- looey
local function looeyTwistedIdle(character)
	local animationId = "rbxassetid://112606771950932"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function looeyTwistedWalk(character)
	local animationId = "rbxassetid://100370803921306"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function looeyTwistedRun(character)
	local animationId = "rbxassetid://131136472849981"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- pebble
local function pebbleTwistedIdle(character)
	local animationId = "rbxassetid://14544956730"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function pebbleTwistedWalk(character)
	local animationId = "rbxassetid://16468055582"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function pebbleTwistedRun(character)
	local animationId = "rbxassetid://14640401802"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- poppy
local function poppyTwistedIdle(character)
	local animationId = "rbxassetid://17000127805"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function poppyTwistedWalk(character)
	local animationId = "rbxassetid://17000195059"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function poppyTwistedRun(character)
	local animationId = "rbxassetid://17000654428"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rnd
local function razzledazzleTwistedIdle(character)
	local animationId = "rbxassetid://18987852729"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function razzledazzleTwistedWalk(character)
	local animationId = "rbxassetid://18987891015"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function razzledazzleTwistedRun(character)
	local animationId = "rbxassetid://18987897664"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rodger
local function rodgerTwistedIdle(character)
	local animationId = "rbxassetid://17108594427"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function rodgerTwistedWalk(character)
	local animationId = "rbxassetid://18988824994"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function rodgerTwistedRun(character)
	local animationId = "rbxassetid://18988830155"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- scraps
local function scrapsTwistedIdle(character)
	local animationId = "rbxassetid://17573097161"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function scrapsTwistedWalk(character)
	local animationId = "rbxassetid://17573173656"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function scrapsTwistedRun(character)
	local animationId = "rbxassetid://17574064271"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shelly
local function shellyTwistedIdle(character)
	local animationId = "rbxassetid://18212982332"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shellyTwistedWalk(character)
	local animationId = "rbxassetid://18213481024"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shellyTwistedRun(character)
	local animationId = "rbxassetid://18213671382"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shrimpo
local function shrimpoTwistedIdle(character)
	local animationId = "rbxassetid://17592191827"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shrimpoTwistedWalk(character)
	local animationId = "rbxassetid://17592227490"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function shrimpoTwistedRun(character)
	local animationId = "rbxassetid://17592396609"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- sprout
local function sproutTwistedIdle(character)
	local animationId = "rbxassetid://18698546825"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function sproutTwistedWalk(character)
	local animationId = "rbxassetid://18698688472"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function sproutTwistedRun(character)
	local animationId = "rbxassetid://18699674490"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- teagan
local function teaganTwistedIdle(character)
	local animationId = "rbxassetid://18196187882"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function teaganTwistedWalk(character)
	local animationId = "rbxassetid://18196889227"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function teaganTwistedRun(character)
	local animationId = "rbxassetid://18197017631"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- tisha
local function tishaTwistedIdle(character)
	local animationId = "rbxassetid://18167087346"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function tishaTwistedWalk(character)
	local animationId = "rbxassetid://18167280146"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function tishaTwistedRun(character)
	local animationId = "rbxassetid://18167378530"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- toodles
local function toodlesTwistedIdle(character)
	local animationId = "rbxassetid://17648960939"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function toodlesTwistedWalk(character)
	local animationId = "rbxassetid://17649028343"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function toodlesTwistedRun(character)
	local animationId = "rbxassetid://91029796934547"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- vee
local function veeTwistedIdle(character)
	local animationId = "rbxassetid://17320732816"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function veeTwistedWalk(character)
	local animationId = "rbxassetid://17320859447"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

local function veeTwistedRun(character)
	local animationId = "rbxassetid://17322657144"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

--[[---------------------------------------------------------------------------------------------------------------------------

EXTRACTION ANIMATIONS | EXTRACTION ANIMATIONS | EXTRACTION ANIMATIONS | EXTRACTION ANIMATIONS | EXTRACTION ANIMATIONS

---------------------------------------------------------------------------------------------------------------------------]]--

-- astro
local function astroExtracting(character)
	local animationId = "rbxassetid://17485172105"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- brightney
local function brightneyExtracting(character)
	local animationId = "rbxassetid://17268071696"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- boxten
local function boxtenExtracting(character)
	local animationId = "rbxassetid://16987946868"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- cosmo
local function cosmoExtracting(character)
	local animationId = "rbxassetid://18609287742"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- connie
local function connieExtracting(character)
	local animationId = "rbxassetid://133500601575506"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- dandy
local function dandyExtracting(character)
	local animationId = "rbxassetid://16496852675"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- finn
local function finnExtracting(character)
	local animationId = "rbxassetid://18718380478"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- flutter
local function flutterExtracting(character)
	local animationId = "rbxassetid://18226338406"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- gigi
local function gigiExtracting(character)
	local animationId = "rbxassetid://88765331625241"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- glisten
local function glistenExtracting(character)
	local animationId = "rbxassetid://18789412964"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- goob
local function goobExtracting(character)
	local animationId = "rbxassetid://16987946868"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- looey
local function looeyExtracting(character)
	local animationId = "rbxassetid://124702329627784"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- pebble
local function pebbleExtracting(character)
	local animationId = "rbxassetid://16470659264"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- poppy
local function poppyExtracting(character)
	local animationId = "rbxassetid://16205888741"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rnd
local function razzledazzleExtracting(character)
	local animationId = "rbxassetid://17452101828"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- rodger
local function rodgerExtracting(character)
	local animationId = "rbxassetid://17098030743"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- scraps
local function scrapsExtracting(character)
	local animationId = "rbxassetid://17559713038"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shelly
local function shellyExtracting(character)
	local animationId = "rbxassetid://18199567889"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- shrimpo
local function shrimpoExtracting(character)
	local animationId = "rbxassetid://17561277632"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- sprout
local function sproutExtracting(character)
	local animationId = "rbxassetid://18579081668"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- teagan
local function teaganExtracting(character)
	local animationId = "rbxassetid://18184069793"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- tisha
local function tishaExtracting(character)
	local animationId = "rbxassetid://18153373004"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- toodles
local function toodlesExtracting(character)
	local animationId = "rbxassetid://17506059864"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

-- vee
local function veeExtracting(character)
	local animationId = "rbxassetid://17308901433"  
	local Anim = Instance.new("Animation")
	Anim.AnimationId = animationId

	local humanoid = character.Humanoid 
	local animationTrack = humanoid:LoadAnimation(Anim)
	animationTrack:Play()
	return animationTrack 
end

--[[---------------------------------------------------------------------------------------------------------------------------

BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS | BUTTONS

-------------------------------------------------------------------------------------------------------------------------------

TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS | TOONS

---------------------------------------------------------------------------------------------------------------------------]]--
createFunctionButton("Astro's Idle", astroIdle)
createFunctionButton("Astro's Walk", astroWalk)
createFunctionButton("Brightney's Idle", brightneyIdle)
createFunctionButton("Brightney's Walk", brightneyWalk)
createFunctionButton("Boxten's Idle", boxtenIdle)
createFunctionButton("Boxten's Walk", boxtenWalk)
createFunctionButton("Cosmo's Idle", cosmoIdle)
createFunctionButton("Cosmo's Walk", cosmoWalk)
createFunctionButton("Connie's Idle", connieIdle)
createFunctionButton("Connie's Walk", connieWalk)
createFunctionButton("Dandy's Idle", dandyIdle)
createFunctionButton("Dandy's Walk", dandyWalk)
createFunctionButton("Finn's Idle", finnIdle)
createFunctionButton("Finn's Walk", finnWalk)
createFunctionButton("Flutter's Idle", flutterIdle)
createFunctionButton("Flutter's Walk", flutterWalk)
createFunctionButton("Gigi's Idle", gigiIdle)
createFunctionButton("Gigi's Walk", gigiWalk)
createFunctionButton("Glisten's Idle", glistenIdle)
createFunctionButton("Glisten's Walk", glistenWalk)
createFunctionButton("Goob's Idle", goobIdle)
createFunctionButton("Goob's Walk", goobWalk)
createFunctionButton("Looey's Idle", looeyIdle)
createFunctionButton("Looey's Walk", looeyWalk)
createFunctionButton("Looey's Run", looeyRun)
createFunctionButton("Pebble's Idle", pebbleIdle)
createFunctionButton("Pebble's Walk", pebbleWalk)
createFunctionButton("Poppy's Idle", poppyIdle)
createFunctionButton("Poppy's Walk", poppyWalk)
createFunctionButton("RnD's Idle", razzledazzleIdle)
createFunctionButton("RnD's Walk", razzledazzleWalk)
createFunctionButton("Rodger's Idle", rodgerIdle)
createFunctionButton("Rodger's Walk", rodgerWalk)
createFunctionButton("Scraps's Idle", scrapsIdle)
createFunctionButton("Scraps's Walk", scrapsWalk)
createFunctionButton("Shelly's Idle", shellyIdle)
createFunctionButton("Shelly's Walk", shellyWalk)
createFunctionButton("Shrimpo's Idle", shrimpoIdle)
createFunctionButton("Shrimpo's Walk", shrimpoWalk)
createFunctionButton("Sprout's Idle", sproutIdle)
createFunctionButton("Sprout's Walk", sproutWalk)
createFunctionButton("Teagan's Idle", teaganIdle)
createFunctionButton("Teagan's Walk", teaganWalk)
createFunctionButton("Tisha's Idle", tishaIdle)
createFunctionButton("Tisha's Walk", tishaWalk)
createFunctionButton("Toodles' Idle", toodlesIdle)
createFunctionButton("Toodles' Walk", toodlesWalk)
createFunctionButton("Vee's Idle", veeIdle)
createFunctionButton("Vee's Walk", veeWalk)

--[[---------------------------------------------------------------------------------------------------------------------------

TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS | TWISTEDS

---------------------------------------------------------------------------------------------------------------------------]]--

createFunctionButton("Astro's Twisted Idle", astroTwistedIdle)
createFunctionButton("Astro's Twisted Walk", astroTwistedWalk)
createFunctionButton("Astro's Twisted Run", astroTwistedRun)
createFunctionButton("Brightney's Twisted Idle", brightneyTwistedIdle)
createFunctionButton("Brightney's Twisted Walk", brightneyTwistedWalk)
createFunctionButton("Brightney's Twisted Run", brightneyTwistedRun)
createFunctionButton("Boxten's Twisted Idle", boxtenTwistedIdle)
createFunctionButton("Boxten's Twisted Walk", boxtenTwistedWalk)
createFunctionButton("Boxten's Twisted Run", boxtenTwistedRun)
createFunctionButton("Cosmo's Twisted Idle", cosmoTwistedIdle)
createFunctionButton("Cosmo's Twisted Walk", cosmoTwistedWalk)
createFunctionButton("Cosmo's Twisted Run", cosmoTwistedRun)
createFunctionButton("Connie's Twisted Idle", connieTwistedIdle)
createFunctionButton("Connie's Twisted Walk", connieTwistedWalk)
createFunctionButton("Connie's Twisted Run", connieTwistedRun)
createFunctionButton("Dandy's Twisted Idle", dandyTwistedIdle)
createFunctionButton("Dandy's Twisted Walk", dandyTwistedWalk)
createFunctionButton("Dandy's Twisted Run", dandyTwistedRun)
createFunctionButton("Finn's Twisted Idle", finnTwistedIdle)
createFunctionButton("Finn's Twisted Walk", finnTwistedWalk)
createFunctionButton("Finn's Twisted Run", finnTwistedRun)
createFunctionButton("Flutter's Twisted Idle", flutterTwistedIdle)
createFunctionButton("Flutter's Twisted Walk", flutterTwistedWalk)
createFunctionButton("Flutter's Twisted Run", flutterTwistedRun)
createFunctionButton("Gigi's Twisted Idle", gigiTwistedIdle)
createFunctionButton("Gigi's Twisted Walk", gigiTwistedWalk)
createFunctionButton("Gigi's Twisted Run", gigiTwistedRun)
createFunctionButton("Glisten's Twisted Idle", glistenTwistedIdle)
createFunctionButton("Glisten's Twisted Walk", glistenTwistedWalk)
createFunctionButton("Glisten's Twisted Run", glistenTwistedRun)
createFunctionButton("Goob's Twisted Idle", goobTwistedIdle)
createFunctionButton("Goob's Twisted Walk", goobTwistedWalk)
createFunctionButton("Goob's Twisted Run", goobTwistedRun)
createFunctionButton("Looey's Twisted Idle", looeyTwistedIdle)
createFunctionButton("Looey's Twisted Walk", looeyTwistedWalk)
createFunctionButton("Looey's Twisted Run", looeyTwistedRun)
createFunctionButton("Pebble's Twisted Idle", pebbleTwistedIdle)
createFunctionButton("Pebble's Twisted Walk", pebbleTwistedWalk)
createFunctionButton("Pebble's Twisted Run", pebbleTwistedRun)
createFunctionButton("Poppy's Twisted Idle", poppyTwistedIdle)
createFunctionButton("Poppy's Twisted Walk", poppyTwistedWalk)
createFunctionButton("Poppy's Twisted Run", poppyTwistedRun)
createFunctionButton("RnD's Twisted Idle", razzledazzleTwistedIdle)
createFunctionButton("RnD's Twisted Walk", razzledazzleTwistedWalk)
createFunctionButton("RnD's Twisted Run", razzledazzleTwistedRun)
createFunctionButton("Rodger's Twisted Idle", rodgerTwistedIdle)
createFunctionButton("Rodger's Twisted Walk", rodgerTwistedWalk)
createFunctionButton("Rodger's Twisted Run", rodgerTwistedRun)
createFunctionButton("Scraps's Twisted Idle", scrapsTwistedIdle)
createFunctionButton("Scraps's Twisted Walk", scrapsTwistedWalk)
createFunctionButton("Scraps's Twisted Run", scrapsTwistedRun)
createFunctionButton("Shelly's Twisted Idle", shellyTwistedIdle)
createFunctionButton("Shelly's Twisted Walk", shellyTwistedWalk)
createFunctionButton("Shelly's Twisted Run", shellyTwistedRun)
createFunctionButton("Shrimpo's Twisted Idle", shrimpoTwistedIdle)
createFunctionButton("Shrimpo's Twisted Walk", shrimpoTwistedWalk)
createFunctionButton("Shrimpo's Twisted Run", shrimpoTwistedRun)
createFunctionButton("Sprout's Twisted Idle", sproutTwistedIdle)
createFunctionButton("Sprout's Twisted Walk", sproutTwistedWalk)
createFunctionButton("Sprout's Twisted Run", sproutTwistedRun)
createFunctionButton("Teagan's Twisted Idle", teaganTwistedIdle)
createFunctionButton("Teagan's Twisted Walk", teaganTwistedWalk)
createFunctionButton("Teagan's Twisted Run", teaganTwistedRun)
createFunctionButton("Tisha's Twisted Idle", tishaTwistedIdle)
createFunctionButton("Tisha's Twisted Walk", tishaTwistedWalk)
createFunctionButton("Tisha's Twisted Run", tishaTwistedRun)
createFunctionButton("Toodles' Twisted Idle", toodlesTwistedIdle)
createFunctionButton("Toodles' Twisted Walk", toodlesTwistedWalk)
createFunctionButton("Toodles's Twisted Run", toodlesTwistedRun)
createFunctionButton("Vee's Twisted Idle", veeTwistedIdle)
createFunctionButton("Vee's Twisted Walk", veeTwistedWalk)
createFunctionButton("Vee's Twisted Run", veeTwistedRun)

--[[---------------------------------------------------------------------------------------------------------------------------

EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING | EXTRACTING

---------------------------------------------------------------------------------------------------------------------------]]--

createFunctionButton("Astro Extracting", astroExtracting)
createFunctionButton("Brightney Extracting", brightneyExtracting)
createFunctionButton("Boxten Extracting", boxtenExtracting)
createFunctionButton("Cosmo Extracting", cosmoExtracting)
createFunctionButton("Connie Extracting", connieExtracting)
createFunctionButton("Dandy Extracting", dandyExtracting)
createFunctionButton("Finn Extracting", finnExtracting)
createFunctionButton("Flutter Extracting", flutterExtracting)
createFunctionButton("Gigi Extracting", gigiExtracting)
createFunctionButton("Glisten Extracting", glistenExtracting)
createFunctionButton("Goob Extracting", goobExtracting)
createFunctionButton("Looey Extracting", looeyExtracting)
createFunctionButton("Pebble Extracting", pebbleExtracting)
createFunctionButton("Poppy Extracting", poppyExtracting)
createFunctionButton("RnD Extracting", razzledazzleExtracting)
createFunctionButton("Rodger Extracting", rodgerExtracting)
createFunctionButton("Scraps Extracting", scrapsExtracting)
createFunctionButton("Shelly Extracting", shellyExtracting)
createFunctionButton("Shrimpo Extracting", shrimpoExtracting)
createFunctionButton("Sprout Extracting", sproutExtracting)
createFunctionButton("Teagan Extracting", teaganExtracting)
createFunctionButton("Tisha Extracting", tishaExtracting)
createFunctionButton("Toodles Extracting", toodlesExtracting)
createFunctionButton("Vee Extracting", veeExtracting)

-------------------------------------------------------------------------------------------------------------------------------
