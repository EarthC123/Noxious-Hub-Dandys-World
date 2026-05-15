--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora -- Float GUI
   
---------------------------------------------------------------------------------------------------------------------------]]--

wait(0) local noxious = {}

-------------------------------------------------------------------------------------------------------------------------------

noxious["dandy's world lobby"] = 16116270224
noxious["dandy's world run"] = 16552821455
noxious["dandy's world roleplay server"] = 18984416148
noxious["test game"] = 118022198489171

spawn(function()
	if game.PlaceId ~= noxious["test game"] then
		for i, v in getconnections(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("HipHeight")) do
			v:Disable()
		end;
	end
end)

local screenGui = Instance.new("ScreenGui")

if game.PlaceId == 118022198489171 then
	screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
else
	screenGui.Parent = game:GetService("CoreGui")
end

screenGui.ResetOnSpawn = false

noxious["user input service"] = game:GetService("UserInputService")
noxious["run service"] = game:GetService("RunService")
noxious["tween service"] = game:GetService("TweenService")
noxious["http service"] = game:GetService("HttpService")
noxious["marketplace service"] = game:GetService("MarketplaceService")

noxious["players"] = game:GetService("Players")
noxious["local player"] = noxious["players"].LocalPlayer

-------------------------------------------------------------------------------------------------------------------------------

local toggleButton = Instance.new("ImageButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 52, 0, 52)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.BorderSizePixel = 1
toggleButton.BorderColor3 = Color3.new(1,1,1)
toggleButton.Image = "rbxassetid://101400510240806"
toggleButton.Visible = false

local function movebutton()
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	local buttonWidth = 48
	local buttonHeight = 48
	local centerX = (screenWidth - buttonWidth) / 2
	local topMargin = 20
	local centerY = topMargin

	toggleButton.Position = UDim2.new(0, centerX, 0, centerY - 150)
	toggleButton.Visible = true

	local tweenService = game:GetService("TweenService")

	local offsetY = 150
	local targetPosition = UDim2.new(0, centerX, 0, centerY - offsetY)

	local tweenInfoUp = TweenInfo.new(0, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)

	local tweenUp = tweenService:Create(toggleButton, tweenInfoUp, {Position = targetPosition})

	local function moveButtonBack()
		local tweenInfoDown = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)

		local tweenDown = tweenService:Create(toggleButton, tweenInfoDown, {Position = UDim2.new(0, centerX, 0, centerY)})

		tweenDown:Play()
	end

	toggleButton.Visible = true
	tweenUp:Play()

	tweenUp.Completed:Wait()
	moveButtonBack()
end

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.2, 0)
uiCorner.Parent = toggleButton

local borderFrame = Instance.new("Frame")
borderFrame.Size = UDim2.new(0, 54, 0, 54)
borderFrame.Position = UDim2.new(-0.02, 0, -0.02, 0)
borderFrame.BackgroundColor3 = Color3.new(1,1,1)
borderFrame.Parent = toggleButton

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0.2, 0)
uiCorner2.Parent = borderFrame

game:GetService("RunService").Heartbeat:Connect(function()
	if _G.circlebuttonshape == true then
		uiCorner.CornerRadius = UDim.new(1, 0)
		uiCorner2.CornerRadius = UDim.new(1, 0)

	elseif _G.squirclebuttonshape == true then
		uiCorner.CornerRadius = UDim.new(0.2, 0)
		uiCorner2.CornerRadius = UDim.new(0.2, 0)

	elseif _G.squarebuttonshape == true then
		uiCorner.CornerRadius = UDim.new(0, 0)
		uiCorner2.CornerRadius = UDim.new(0, 0)
	end
end)

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
}
gradient.Parent = borderFrame

local UIS = game:GetService('UserInputService')
local frame = toggleButton
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updatelipbuttoninput(input)
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
			updatelipbuttoninput(input)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local rotationSpeed = 1
task.spawn(function()
	while true do
		gradient.Rotation = (gradient.Rotation + rotationSpeed) % 360
		task.wait(0.03)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local clicktoggle = Instance.new("Sound")
clicktoggle.SoundId = "rbxassetid://421058925"
clicktoggle.Parent = toggleButton
clicktoggle.Volume = 0.3

-------------------------------------------------------------------------------------------------------------------------------

local drag = Instance.new("Frame")
drag.Parent = screenGui
drag.Size = UDim2.new(0, 231, 0, 284)
drag.BackgroundColor3 = Color3.fromRGB(0,0,0)
drag.BackgroundTransparency = 1
drag.BorderSizePixel = 1
drag.BorderColor3 = Color3.new(1,1,1)
drag.Visible = false

local frame = Instance.new("Frame")
frame.Parent = drag
frame.Size = UDim2.new(0, 231, 0, 254)
frame.Position = UDim2.new(0, 0, 0, 6)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 1
frame.BorderColor3 = Color3.new(1,1,1)
frame.Visible = true
frame.Active = true

function centerdraggableframe()
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	local frameWidth = 231
	local frameHeight = 284

	local centerX = (screenWidth - frameWidth) / 2
	local centerY = (screenHeight - frameHeight) / 2 - 61

	drag.Position = UDim2.new(0, centerX, 0, centerY)
end
centerdraggableframe()

function dragdraggableframe()
	local UIS = game:GetService('UserInputService')
	local frame = drag
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

local topframe = Instance.new("Frame")
topframe.Parent = frame
topframe.Size = UDim2.new(0, 231, 0, 30)
topframe.Position = UDim2.new(0, 0, 0, 0)
topframe.Visible = false
topframe.BackgroundTransparency = 1
topframe.BorderSizePixel = 1
topframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframe.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topframeh = Instance.new("Frame")
topframeh.Parent = frame
topframeh.Size = UDim2.new(0, 231, 0, 10)
topframeh.Position = UDim2.new(0, 0, 0, 14)
topframeh.Visible = true
topframeh.BackgroundTransparency = 0
topframeh.BorderSizePixel = 1
topframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topframer = Instance.new("TextLabel")
topframer.Text = "Noxious Hub: Float GUI"
topframer.Parent = frame
topframer.Size = UDim2.new(0, 231, 0, 30)
topframer.Position = UDim2.new(0, 0, 0, -6)
topframer.Visible = true
topframer.TextColor3 = Color3.new(1,1,1)
topframer.TextSize = 21.6
topframer.Font = Enum.Font.Nunito
topframer.TextScaled = false
topframer.BackgroundTransparency = 0
topframer.BorderSizePixel = 1
topframer.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframer.BackgroundColor3 = Color3.fromRGB(0,0,0)

local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0.3, 0)
uiCorner4.Parent = topframer

local topframerb = Instance.new("Frame")
topframerb.Parent = frame
topframerb.Size = UDim2.new(0, 233, 0, 32)
topframerb.Position = UDim2.new(0, -1, 0, -7)
topframerb.Visible = true
topframerb.BackgroundTransparency = 0
topframerb.BorderSizePixel = 0
topframerb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.3, 0)
uiCorner5.Parent = topframerb

local heightindicator = Instance.new("TextLabel")
heightindicator.Parent = frame
heightindicator.Text = "Current Mode: Hip Height"
heightindicator.Size = UDim2.new(0, 231, 0, 30)
heightindicator.Position = UDim2.new(0, 0, 0, 28)
heightindicator.Visible = true
heightindicator.BackgroundTransparency = 1
heightindicator.TextColor3 = Color3.new(1,1,1)
heightindicator.TextSize = 21.6
heightindicator.Font = Enum.Font.Nunito
heightindicator.TextScaled = false
heightindicator.BorderSizePixel = 1
heightindicator.BorderColor3 = Color3.fromRGB(255, 255, 255)
heightindicator.BackgroundColor3 = Color3.fromRGB(0,0,0)
heightindicator.Active = true

if game.PlaceId == noxious["dandy's world lobby"] or game.PlaceId == noxious["dandy's world roleplay server"] then
	heightindicator.Text = "Current Mode: Platform"
end

-------------------------------------------------------------------------------------------------------------------------------

local bottomframe = Instance.new("Frame")
bottomframe.Parent = frame
bottomframe.Size = UDim2.new(0, 231, 0, 30)
bottomframe.Position = UDim2.new(0, 0, 1, 0)
bottomframe.Visible = false
bottomframe.BackgroundTransparency = 0
bottomframe.BorderSizePixel = 1
bottomframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframe.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframeh = Instance.new("Frame")
bottomframeh.Parent = frame
bottomframeh.Size = UDim2.new(0, 231, 0, 10)
bottomframeh.Position = UDim2.new(0, 0, 1, -6)
bottomframeh.Visible = true
bottomframeh.BackgroundTransparency = 0
bottomframeh.BorderSizePixel = 1
bottomframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframer = Instance.new("Frame")
bottomframer.Parent = frame
bottomframer.Size = UDim2.new(0, 231, 0, 30)
bottomframer.Position = UDim2.new(0, 0, 1, -6)
bottomframer.Visible = true
bottomframer.BackgroundTransparency = 0
bottomframer.BorderSizePixel = 1
bottomframer.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframer.BackgroundColor3 = Color3.fromRGB(0,0,0)

local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0.3, 0)
uiCorner4.Parent = bottomframer

local bottomframerb = Instance.new("Frame")
bottomframerb.Parent = frame
bottomframerb.Size = UDim2.new(0, 233, 0, 32)
bottomframerb.Position = UDim2.new(0, -1, 1, -7)
bottomframerb.Visible = true
bottomframerb.BackgroundTransparency = 0
bottomframerb.BorderSizePixel = 0
bottomframerb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.3, 0)
uiCorner5.Parent = bottomframerb

-------------------------------------------------------------------------------------------------------------------------------

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService") -- Used for platform follow updates

-- Variables
local currentMode = "HipHeight" -- Default mode
local platform = nil
local isHolding = false -- Variable to track button hold
local defaultHipHeight = humanoid.HipHeight -- Save default HipHeight

local goup = Instance.new("TextButton")
goup.Parent = frame
goup.Font = Enum.Font.Nunito
goup.Position = UDim2.new(0, 10, 0, 62)
goup.Size = UDim2.new(0, 100, 0, 50)
goup.Text = "▲"
goup.TextScaled = false
goup.TextSize = 21.6
goup.BackgroundColor3 = Color3.fromRGB(0,0,0)
goup.BorderColor3 = Color3.new(1,1,1)
goup.BorderSizePixel = 1
goup.TextColor3 = Color3.new(1,1,1)

local godown = Instance.new("TextButton")
godown.Parent = frame
godown.Position = UDim2.new(0, 121, 0, 62)
godown.Size = UDim2.new(0, 100, 0, 50)
godown.Text = "▼"
godown.TextScaled = false
godown.TextSize = 21.6
godown.Font = Enum.Font.Nunito
godown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
godown.BorderSizePixel = 1
godown.BorderColor3 = Color3.new(1, 1, 1)
godown.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to destroy the platform
local function destroyPlatform()
	if platform and platform.Parent then
		platform:Destroy()
	end
	runService:UnbindFromRenderStep("UpdatePlatform") -- Stop updating position
end

if game.PlaceId == noxious["dandy's world lobby"] or game.PlaceId == noxious["dandy's world roleplay server"] then
	currentMode = "Platform" -- Default mode
	local hipheightmode = Instance.new("TextLabel")
	hipheightmode.Parent = frame
	hipheightmode.Position = UDim2.new(0, 10, 0, 124)
	hipheightmode.Size = UDim2.new(0, 211, 0, 50)
	hipheightmode.Text = "Hip Height Mode"
	hipheightmode.TextScaled = false
	hipheightmode.TextSize = 21.6
	hipheightmode.Font = Enum.Font.Nunito
	hipheightmode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	hipheightmode.BorderSizePixel = 1
	hipheightmode.BorderColor3 = Color3.new(0.5, 0.5, 0.5)
	hipheightmode.TextColor3 = Color3.new(0.5, 0.5, 0.5)
	hipheightmode.ZIndex = 8
else
	local hipheightmode = Instance.new("TextButton")
	hipheightmode.Parent = frame
	hipheightmode.Position = UDim2.new(0, 10, 0, 124)
	hipheightmode.Size = UDim2.new(0, 211, 0, 50)
	hipheightmode.Text = "Hip Height Mode"
	hipheightmode.TextScaled = false
	hipheightmode.TextSize = 21.6
	hipheightmode.Font = Enum.Font.Nunito
	hipheightmode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	hipheightmode.BorderSizePixel = 1
	hipheightmode.BorderColor3 = Color3.new(1, 1, 1)
	hipheightmode.TextColor3 = Color3.fromRGB(255, 255, 255)
	hipheightmode.ZIndex = 8

	hipheightmode.MouseButton1Click:Connect(function()
		clicktoggle:Play()
		currentMode = "HipHeight"
		heightindicator.Text = "Current Mode: Hip Height"
		humanoid.HipHeight = defaultHipHeight -- Reset HipHeight to its default value
		destroyPlatform()
	end)
end

local platformmode = Instance.new("TextButton")
platformmode.Parent = frame
platformmode.Position = UDim2.new(0, 10, 0, 186)
platformmode.Size = UDim2.new(0, 211, 0, 50)
platformmode.Text = "Platform Mode"
platformmode.TextScaled = false
platformmode.TextSize = 21.6
platformmode.Font = Enum.Font.Nunito
platformmode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
platformmode.BorderSizePixel = 1
platformmode.BorderColor3 = Color3.new(1, 1, 1)
platformmode.TextColor3 = Color3.fromRGB(255, 255, 255)

-------------------------------------------------------------------------------------------------------------------------------

-- Function to create a platform directly under the player
local function createPlatform()
	if platform and platform.Parent then
		platform:Destroy()
	end

	-- Get the player's current position
	local playerPosition = character.PrimaryPart.Position

	-- Create platform directly under the player's feet
	platform = Instance.new("Part")
	platform.Name = "PlayerPlatform"
	platform.Size = Vector3.new(3, 1, 3)
	platform.Color = Color3.new(0, 0, 0) -- Gray color
	platform.Material = Enum.Material.Neon
	platform.Anchored = true
	platform.CanCollide = true
	platform.Parent = workspace
	platform.Position = Vector3.new(playerPosition.X, playerPosition.Y - humanoid.HipHeight - (character.PrimaryPart.Size.Y / 2) - 4.5, playerPosition.Z)

	-- Keep platform under the player
	runService:BindToRenderStep("UpdatePlatform", Enum.RenderPriority.Character.Value, function()
		if platform and character and character.PrimaryPart then
			local updatedPlayerPosition = character.PrimaryPart.Position
			platform.Position = Vector3.new(updatedPlayerPosition.X, platform.Position.Y, updatedPlayerPosition.Z)
		end
	end)
end

-- Function to handle button holds properly
local function handleButtonHold(increment)
	isHolding = true
	while isHolding do
		if currentMode == "HipHeight" then
			humanoid.HipHeight = humanoid.HipHeight + increment
		elseif currentMode == "Platform" and platform then
			platform.Position = Vector3.new(platform.Position.X, platform.Position.Y + increment, platform.Position.Z)
		end
		task.wait()
	end
end

-- Stop modifying when the button is released
local function stopButtonHold()
	isHolding = false
end

-- Connect button hold functionality
goup.MouseButton1Down:Connect(function()
	clicktoggle:Play()
	handleButtonHold(0.2)
end)
goup.MouseButton1Up:Connect(stopButtonHold)

godown.MouseButton1Down:Connect(function()
	clicktoggle:Play()
	handleButtonHold(-0.2)
end)
godown.MouseButton1Up:Connect(stopButtonHold)

-- Switch to Platform Mode
platformmode.MouseButton1Click:Connect(function()
	clicktoggle:Play()
	currentMode = "Platform"
	heightindicator.Text = "Current Mode: Platform"
	humanoid.HipHeight = defaultHipHeight -- Ensure HipHeight is reset
	createPlatform()
end)

if game.PlaceId == noxious["dandy's world lobby"] or game.PlaceId == noxious["dandy's world roleplay server"] then
	createPlatform()
end

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.ZIndex = 999
borderFrame.ZIndex = 998

platformmode.ZIndex = 8

godown.ZIndex = 8
goup.ZIndex = 8

heightindicator.ZIndex = 8
topframe.ZIndex = 8
topframeh.ZIndex = 10
topframer.ZIndex = 10
topframerb.ZIndex = 9

bottomframe.ZIndex = 8
bottomframeh.ZIndex = 10
bottomframer.ZIndex = 10
bottomframerb.ZIndex = 9

frame.ZIndex = 7

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.MouseButton1Click:Connect(function()
	clicktoggle:Play()
	drag.Visible = not drag.Visible
end)

-------------------------------------------------------------------------------------------------------------------------------

movebutton()

-------------------------------------------------------------------------------------------------------------------------------
