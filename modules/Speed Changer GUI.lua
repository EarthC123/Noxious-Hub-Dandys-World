--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora (With additional help from ChatGPT) -- Speed Changer GUI
   
---------------------------------------------------------------------------------------------------------------------------]]--

wait(0) local noxious = {}

-------------------------------------------------------------------------------------------------------------------------------

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
toggleButton.Image = "rbxassetid://136266060134663"

local function movebutton()
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	local buttonWidth = 48
	local buttonHeight = 48
	local centerX = (screenWidth - buttonWidth) / 2
	local topMargin = 20
	local centerY = topMargin

	toggleButton.Position = UDim2.new(0, centerX, 0, centerY - 150)

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
drag.Size = UDim2.new(0, 564, 0, 220)
drag.BackgroundColor3 = Color3.fromRGB(0,0,0)
drag.BackgroundTransparency = 1
drag.BorderSizePixel = 1
drag.BorderColor3 = Color3.new(1,1,1)
drag.Visible = false

local frame = Instance.new("Frame")
frame.Parent = drag
frame.Size = UDim2.new(0, 564, 0, 190)
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

	local frameWidth = 564
	local frameHeight = 220

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
topframe.Size = UDim2.new(0, 564, 0, 30)
topframe.Position = UDim2.new(0, 0, 0, 0)
topframe.Visible = false
topframe.BackgroundTransparency = 0
topframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframe.BackgroundColor3 = Color3.fromRGB(0,0,0)
topframe.Active = true

local topframeh = Instance.new("Frame")
topframeh.Parent = frame
topframeh.Size = UDim2.new(0, 564, 0, 10)
topframeh.Position = UDim2.new(0, 0, 0, 14)
topframeh.Visible = true
topframeh.BackgroundTransparency = 0
topframeh.BorderSizePixel = 1
topframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topframer = Instance.new("TextLabel")
topframer.Text = "Noxious Hub: Speed Changer GUI"
topframer.Parent = frame
topframer.Size = UDim2.new(0, 564, 0, 30)
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
topframerb.Size = UDim2.new(0, 566, 0, 32)
topframerb.Position = UDim2.new(0, -1, 0, -7)
topframerb.Visible = true
topframerb.BackgroundTransparency = 0
topframerb.BorderSizePixel = 0
topframerb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.3, 0)
uiCorner5.Parent = topframerb

-------------------------------------------------------------------------------------------------------------------------------

local bottomframe = Instance.new("Frame")
bottomframe.Parent = frame
bottomframe.Size = UDim2.new(0, 564, 0, 30)
bottomframe.Position = UDim2.new(0, 0, 1, 0)
bottomframe.Visible = false
bottomframe.BackgroundTransparency = 0
bottomframe.BorderSizePixel = 1
bottomframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframe.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframeh = Instance.new("Frame")
bottomframeh.Parent = frame
bottomframeh.Size = UDim2.new(0, 564, 0, 10)
bottomframeh.Position = UDim2.new(0, 0, 1, -6)
bottomframeh.Visible = true
bottomframeh.BackgroundTransparency = 0
bottomframeh.BorderSizePixel = 1
bottomframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframer = Instance.new("Frame")
bottomframer.Parent = frame
bottomframer.Size = UDim2.new(0, 564, 0, 30)
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
bottomframerb.Size = UDim2.new(0, 566, 0, 32)
bottomframerb.Position = UDim2.new(0, -1, 1, -7)
bottomframerb.Visible = true
bottomframerb.BackgroundTransparency = 0
bottomframerb.BorderSizePixel = 0
bottomframerb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.3, 0)
uiCorner5.Parent = bottomframerb

-------------------------------------------------------------------------------------------------------------------------------

local speedindicator = Instance.new("TextLabel")
speedindicator.Parent = frame
speedindicator.Text = "Current Speed: Normal"
speedindicator.Size = UDim2.new(0, 564, 0, 30)
speedindicator.Position = UDim2.new(0, 0, 0, 28)
speedindicator.Visible = true
speedindicator.BackgroundTransparency = 1
speedindicator.TextColor3 = Color3.new(1,1,1)
speedindicator.TextSize = 21.6
speedindicator.Font = Enum.Font.Nunito
speedindicator.TextScaled = false
speedindicator.BorderSizePixel = 1
speedindicator.BorderColor3 = Color3.fromRGB(255, 255, 255)
speedindicator.BackgroundColor3 = Color3.fromRGB(0,0,0)
speedindicator.Active = true

-------------------------------------------------------------------------------------------------------------------------------

local onestarspeed = Instance.new("TextButton")
onestarspeed.Parent = frame
onestarspeed.Font = Enum.Font.Nunito
onestarspeed.Position = UDim2.new(0, 10, 0, 62)
onestarspeed.Size = UDim2.new(0, 100, 0, 50)
onestarspeed.Text = "20"
onestarspeed.TextScaled = false
onestarspeed.TextSize = 21.6
onestarspeed.BackgroundColor3 = Color3.fromRGB(0,0,0)
onestarspeed.BorderColor3 = Color3.new(1,1,1)
onestarspeed.BorderSizePixel = 1
onestarspeed.TextColor3 = Color3.new(1,1,1)

local twostarspeed = Instance.new("TextButton")
twostarspeed.Parent = frame
twostarspeed.Position = UDim2.new(0, 121, 0, 62)
twostarspeed.Size = UDim2.new(0, 100, 0, 50)
twostarspeed.Text = "30"
twostarspeed.TextScaled = false
twostarspeed.TextSize = 21.6
twostarspeed.Font = Enum.Font.Nunito
twostarspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
twostarspeed.BorderSizePixel = 1
twostarspeed.BorderColor3 = Color3.new(1, 1, 1)
twostarspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local threestarspeed = Instance.new("TextButton")
threestarspeed.Parent = frame
threestarspeed.Position = UDim2.new(0, 232, 0, 62)
threestarspeed.Size = UDim2.new(0, 100, 0, 50)
threestarspeed.Text = "40"
threestarspeed.TextScaled = false
threestarspeed.TextSize = 21.6
threestarspeed.Font = Enum.Font.Nunito
threestarspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
threestarspeed.BorderSizePixel = 1
threestarspeed.BorderColor3 = Color3.new(1, 1, 1)
threestarspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local fourstarspeed = Instance.new("TextButton")
fourstarspeed.Parent = frame
fourstarspeed.Position = UDim2.new(0, 343, 0, 62)
fourstarspeed.Size = UDim2.new(0, 100, 0, 50)
fourstarspeed.Text = "50"
fourstarspeed.TextScaled = false
fourstarspeed.TextSize = 21.6
fourstarspeed.Font = Enum.Font.Nunito
fourstarspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fourstarspeed.BorderSizePixel = 1
fourstarspeed.BorderColor3 = Color3.new(1, 1, 1)
fourstarspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local fivestarspeed = Instance.new("TextButton")
fivestarspeed.Parent = frame
fivestarspeed.Position = UDim2.new(0, 454, 0, 62)
fivestarspeed.Size = UDim2.new(0, 100, 0, 50)
fivestarspeed.Text = "60"
fivestarspeed.TextScaled = false
fivestarspeed.TextSize = 21.6
fivestarspeed.Font = Enum.Font.Nunito
fivestarspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fivestarspeed.BorderSizePixel = 1
fivestarspeed.BorderColor3 = Color3.new(1, 1, 1)
fivestarspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local inputcustomspeed = Instance.new("TextButton")
inputcustomspeed.Parent = frame
inputcustomspeed.Position = UDim2.new(0, 10, 0, 123)
inputcustomspeed.Size = UDim2.new(0, 211, 0, 50)
inputcustomspeed.Text = "Apply Custom Speed"
inputcustomspeed.TextScaled = false
inputcustomspeed.TextSize = 21.6
inputcustomspeed.Font = Enum.Font.Nunito
inputcustomspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
inputcustomspeed.BorderSizePixel = 1
inputcustomspeed.BorderColor3 = Color3.new(1, 1, 1)
inputcustomspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

local customspeed = Instance.new("TextBox")
customspeed.Parent = frame
customspeed.Position = UDim2.new(0, 232, 0, 123)
customspeed.Size = UDim2.new(0, 322, 0, 50)
customspeed.TextScaled = false
customspeed.TextSize = 21.6
customspeed.PlaceholderText = "Input Custom (Walk) Speed Value"
customspeed.Text = ""
customspeed.ClipsDescendants = true
customspeed.Font = Enum.Font.Nunito
customspeed.ClearTextOnFocus = false
customspeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
customspeed.BorderSizePixel = 1
customspeed.BorderColor3 = Color3.new(1, 1, 1)
customspeed.TextColor3 = Color3.fromRGB(255, 255, 255)

-------------------------------------------------------------------------------------------------------------------------------

local player = game.Players.LocalPlayer
local humanoid = nil
local currentSpeed = 0

-- Function to get the player's humanoid
local function getHumanoid()
	local character = player.Character or player.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
end

-- Function to update speed and text
function updateSpeed(speed)
	clicktoggle:Play()
	currentSpeed = speed
	-- Update the speed indicator with just the speed value, no stars
	speedindicator.Text = "Current Speed: " .. speed

	-- Update humanoid speed without the need for an extra loop
	if humanoid then
		noxious["run service"].RenderStepped:Connect(function()
			humanoid.WalkSpeed = currentSpeed
		end)
	end
end

-- Start monitoring the humanoid when the character loads
player.CharacterAdded:Connect(getHumanoid)

-- Speed Buttons
onestarspeed.MouseButton1Click:Connect(function()
	updateSpeed(20) -- Set WalkSpeed to 20
end)

twostarspeed.MouseButton1Click:Connect(function()
	updateSpeed(30) -- Set WalkSpeed to 30
end)

threestarspeed.MouseButton1Click:Connect(function()
	updateSpeed(40) -- Set WalkSpeed to 40
end)

fourstarspeed.MouseButton1Click:Connect(function()
	updateSpeed(50) -- Set WalkSpeed to 50
end)

fivestarspeed.MouseButton1Click:Connect(function()
	updateSpeed(60) -- Set WalkSpeed to 60
end)

-- Custom Speed Input
inputcustomspeed.MouseButton1Click:Connect(function()
	local speed = tonumber(customspeed.Text) -- Convert input to a number
	if speed and speed > 0 then
		updateSpeed(speed) -- Apply custom speed
	else
		clicktoggle:Play()
		speedindicator.Text = "Invalid Speed! Enter a valid number."
	end
end)

-- Ensure speed loop starts when character spawns
getHumanoid()

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.ZIndex = 999
borderFrame.ZIndex = 998

customspeed.ZIndex = 8
inputcustomspeed.ZIndex = 8
fivestarspeed.ZIndex = 8
fourstarspeed.ZIndex = 8
threestarspeed.ZIndex = 8
twostarspeed.ZIndex = 8
onestarspeed.ZIndex = 8

topframe.ZIndex = 8
topframeh.ZIndex = 10
topframer.ZIndex = 10
topframerb.ZIndex = 9

bottomframe.ZIndex = 8
bottomframeh.ZIndex = 10
bottomframer.ZIndex = 10
bottomframerb.ZIndex = 9
speedindicator.ZIndex = 9
frame.ZIndex = 7

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.MouseButton1Click:Connect(function()
	clicktoggle:Play()
	drag.Visible = not drag.Visible
end)

-------------------------------------------------------------------------------------------------------------------------------

movebutton()

-------------------------------------------------------------------------------------------------------------------------------
