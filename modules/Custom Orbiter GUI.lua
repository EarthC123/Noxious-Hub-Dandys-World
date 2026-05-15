--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora -- Custom Orbiter GUI
   
---------------------------------------------------------------------------------------------------------------------------]]--

wait(0) local noxious = {}

-------------------------------------------------------------------------------------------------------------------------------

noxious["dandy's world lobby"] = 16116270224
noxious["dandy's world run"] = 16552821455
noxious["dandy's world roleplay server"] = 18984416148
noxious["test game"] = 118022198489171

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
toggleButton.Image = "rbxassetid://130577954079104"
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
drag.Size = UDim2.new(0, 340, 0, 284)
drag.BackgroundColor3 = Color3.fromRGB(0,0,0)
drag.BackgroundTransparency = 1
drag.BorderSizePixel = 1
drag.BorderColor3 = Color3.new(1,1,1)
drag.Visible = false

local frame = Instance.new("Frame")
frame.Parent = drag
frame.Size = UDim2.new(0, 340, 0, 254)
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

	local frameWidth = 340
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
topframe.Size = UDim2.new(0, 340, 0, 30)
topframe.Position = UDim2.new(0, 0, 0, 0)
topframe.Visible = false
topframe.BackgroundTransparency = 1
topframe.BorderSizePixel = 1
topframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframe.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topframeh = Instance.new("Frame")
topframeh.Parent = frame
topframeh.Size = UDim2.new(0, 340, 0, 10)
topframeh.Position = UDim2.new(0, 0, 0, 14)
topframeh.Visible = true
topframeh.BackgroundTransparency = 0
topframeh.BorderSizePixel = 1
topframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
topframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topframer = Instance.new("TextLabel")
topframer.Text = "Noxious Hub: Custom Orbiter GUI"
topframer.Parent = frame
topframer.Size = UDim2.new(0, 340, 0, 30)
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
topframerb.Size = UDim2.new(0, 342, 0, 32)
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
bottomframe.Size = UDim2.new(0, 340, 0, 30)
bottomframe.Position = UDim2.new(0, 0, 1, 0)
bottomframe.Visible = false
bottomframe.BackgroundTransparency = 0
bottomframe.BorderSizePixel = 1
bottomframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframe.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframeh = Instance.new("Frame")
bottomframeh.Parent = frame
bottomframeh.Size = UDim2.new(0, 340, 0, 10)
bottomframeh.Position = UDim2.new(0, 0, 1, -6)
bottomframeh.Visible = true
bottomframeh.BackgroundTransparency = 0
bottomframeh.BorderSizePixel = 1
bottomframeh.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomframeh.BackgroundColor3 = Color3.fromRGB(0,0,0)

local bottomframer = Instance.new("Frame")
bottomframer.Parent = frame
bottomframer.Size = UDim2.new(0, 340, 0, 30)
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
bottomframerb.Size = UDim2.new(0, 342, 0, 32)
bottomframerb.Position = UDim2.new(0, -1, 1, -7)
bottomframerb.Visible = true
bottomframerb.BackgroundTransparency = 0
bottomframerb.BorderSizePixel = 0
bottomframerb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner5 = Instance.new("UICorner")
uiCorner5.CornerRadius = UDim.new(0.3, 0)
uiCorner5.Parent = bottomframerb

-------------------------------------------------------------------------------------------------------------------------------

local startorbit = Instance.new("TextButton")
startorbit.Parent = frame
startorbit.Font = Enum.Font.Nunito
startorbit.Position = UDim2.new(0, 10, 0, 187)
startorbit.Size = UDim2.new(0, 154, 0, 50)
startorbit.Text = "Start Orbit"
startorbit.TextScaled = false
startorbit.TextSize = 21.6
startorbit.BackgroundColor3 = Color3.fromRGB(0,0,0)
startorbit.BorderColor3 = Color3.new(1,1,1)
startorbit.BorderSizePixel = 1
startorbit.TextColor3 = Color3.new(1,1,1)

local stoporbit = Instance.new("TextButton")
stoporbit.Parent = frame
stoporbit.Font = Enum.Font.Nunito
stoporbit.Position = UDim2.new(0, 175, 0, 187)
stoporbit.Size = UDim2.new(0, 155, 0, 50)
stoporbit.Text = "Stop Orbit"
stoporbit.TextScaled = false
stoporbit.TextSize = 21.6
stoporbit.BackgroundColor3 = Color3.fromRGB(0,0,0)
stoporbit.BorderColor3 = Color3.new(1,1,1)
stoporbit.BorderSizePixel = 1
stoporbit.TextColor3 = Color3.new(1,1,1)

-------------------------------------------------------------------------------------------------------------------------------

local function createLabel(text, position)
	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(0, 130, 0, 50)
	label.Position = position
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = Enum.Font.Nunito
	label.TextSize = 21.6
	label.TextScaled = false
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.ZIndex = 9
	local labeltextpadding = Instance.new("UIPadding")
	labeltextpadding.PaddingBottom = UDim.new(0, 10)
	labeltextpadding.Parent = label
	return label
end

local function createInput(default, position)
	local box = Instance.new("TextBox", frame)
	box.Size = UDim2.new(0, 180, 0, 39)
	box.Position = position
	box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	box.TextColor3 = Color3.new(1, 1, 1)
	box.BorderColor3 = Color3.new(1, 1, 1)
	box.Font = Enum.Font.Nunito
	box.Text = "Stop Orbit"
	box.PlaceholderText = "Input"
	box.PlaceholderColor3 = Color3.new(0.5, 0.5, 0.5)
	box.TextScaled = false
	box.TextSize = 21.6
	box.Text = tostring(default)
	box.ClearTextOnFocus = false
	box.ZIndex = 9
	box.ClearTextOnFocus = true
	return box
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

-- == Ring Drawing ==
local ringParts = {}
local running = false

local function clearRing()
	for _, part in ipairs(ringParts) do
		part:Destroy()
	end
	ringParts = {}
end

local function drawRing(center, radiusX, radiusZ, yOffset, pointCount)
	clearRing()
	for i = 1, pointCount do
		local angle = (2 * math.pi / pointCount) * i
		local nextAngle = (2 * math.pi / pointCount) * (i % pointCount + 1)

		local p1 = Vector3.new(center.X + radiusX * math.cos(angle), center.Y + yOffset, center.Z + radiusZ * math.sin(angle))
		local p2 = Vector3.new(center.X + radiusX * math.cos(nextAngle), center.Y + yOffset, center.Z + radiusZ * math.sin(nextAngle))

		local mid = (p1 + p2) / 2
		local len = (p2 - p1).Magnitude

		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.Size = Vector3.new(len, 0.2, 0.4)
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(0, 0, 0)
		part.CFrame = CFrame.new(mid, p2) * CFrame.Angles(0, math.pi / 2, 0)
		part.Parent = workspace
		part.CastShadow = false
		table.insert(ringParts, part)
	end
end

-- == Path Walking ==
local function getPoints(center, radiusX, radiusZ, yOffset, pointCount)
	local points = {}
	for i = 1, pointCount do
		local angle = (2 * math.pi / pointCount) * i
		local x = center.X + radiusX * math.cos(angle)
		local z = center.Z + radiusZ * math.sin(angle)
		local y = center.Y + yOffset
		table.insert(points, Vector3.new(x, y, z))
	end
	return points
end

local walkThread = nil
local fixedCenter = nil  -- New variable to store fixed ring center

createLabel("Radius X:", UDim2.new(0, 10, 0, 35))
local radiusXInput = createInput(7, UDim2.new(0, 150, 0, 35))

createLabel("Radius Z:", UDim2.new(0, 10, 0, 86))
local radiusZInput = createInput(7, UDim2.new(0, 150, 0, 86))

createLabel("Speed:", UDim2.new(0, 10, 0, 136))
local walkSpeedInput = createInput(16, UDim2.new(0, 150, 0, 136))

local function startWalking()
	if running then return end
	running = true

	-- Save fixed center position at start
	fixedCenter = hrp.Position

	local radiusX = tonumber(radiusXInput.Text) or 7
	local radiusZ = tonumber(radiusZInput.Text) or 7
	local speed = tonumber(walkSpeedInput.Text) or 16
	local yOffset = -3

	humanoid.WalkSpeed = speed

	walkThread = task.spawn(function()
		while running do
			-- Use fixedCenter instead of current position
			local avgRadius = (radiusX + radiusZ) / 2
			local pointCount = math.clamp(math.floor(avgRadius * 3), 12, 60)

			drawRing(fixedCenter, radiusX, radiusZ, yOffset, pointCount)
			local points = getPoints(fixedCenter, radiusX, radiusZ, yOffset, pointCount)

			for _, point in ipairs(points) do
				if not running then return end
				local movePoint = Vector3.new(point.X, hrp.Position.Y, point.Z)
				humanoid:MoveTo(movePoint)
				humanoid.MoveToFinished:Wait()
			end
		end
	end)
end

local function stopWalking()
	running = false
	fixedCenter = nil -- Clear fixed center
	if walkThread then
		task.cancel(walkThread)
		walkThread = nil
	end
end

local oldwalkspeed = humanoid.WalkSpeed

startorbit.MouseButton1Click:Connect(function() 
	clicktoggle:Play()
	startWalking()
end)
stoporbit.MouseButton1Click:Connect(function()
	clicktoggle:Play()
	humanoid.WalkSpeed = oldwalkspeed
	stopWalking()
end)

-- Update ring position only when NOT walking, so it follows player only when idle
RunService.RenderStepped:Connect(function()
	if not running then
		local pos = hrp.Position
		local radiusX = tonumber(radiusXInput.Text) or 7
		local radiusZ = tonumber(radiusZInput.Text) or 7
		local speed = tonumber(walkSpeedInput.Text) or 16
		local yOffset = -3
		local avgRadius = (radiusX + radiusZ) / 2
		local pointCount = math.clamp(math.floor(avgRadius * 3), 12, 60)

		drawRing(pos, radiusX, radiusZ, yOffset, pointCount)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.ZIndex = 999
borderFrame.ZIndex = 998

topframe.ZIndex = 8
topframeh.ZIndex = 10
topframer.ZIndex = 10
topframerb.ZIndex = 9

bottomframe.ZIndex = 8
bottomframeh.ZIndex = 10
bottomframer.ZIndex = 10
bottomframerb.ZIndex = 9

startorbit.ZIndex = 9
stoporbit.ZIndex = 9

frame.ZIndex = 7

-------------------------------------------------------------------------------------------------------------------------------

toggleButton.MouseButton1Click:Connect(function()
	clicktoggle:Play()
	drag.Visible = not drag.Visible
end)

-------------------------------------------------------------------------------------------------------------------------------

movebutton()

-------------------------------------------------------------------------------------------------------------------------------
