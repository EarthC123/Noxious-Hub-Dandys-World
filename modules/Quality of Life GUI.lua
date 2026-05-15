--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious and Plethora (With additional help from ChatGPT) - Dandy's World Quality of Life GUI
   
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
toggleButton.Image = "rbxassetid://88505416332675"

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

-------------------------------------------------------------------------------------------------------------------------------

draggableFrame.Parent = screenGui
draggableFrame.Size = UDim2.new(0, 263, 0, 350)
draggableFrame.Position = UDim2.new(0.486003, -100, -0.001, -30)
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
	local frameWidth = 263
	local frameHeight = 350
	local centerX = (screenWidth - frameWidth) / 2
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
topframe.Text = "Dandy's World Quality Of Life GUI"
topframe.Size = UDim2.new(0, 263.1, 0, 30)
topframe.Position = UDim2.new(0.380, -100, 0, 0)
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
scrollingFrame.Size = UDim2.new(0, 263, 0, 250)
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

local TweenService = game:GetService("TweenService")

scrollingFrame.Position = UDim2.new(0, 0, 0, 80)

-- Create the search bar (TextBox)
local searchBox = Instance.new("TextBox")
searchBox.Parent = draggableFrame
searchBox.Size = UDim2.new(0, 263.1, 0, 30)
searchBox.Position = UDim2.new(0.380, -100, 0, 31) -- Position it above the buttons
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
	button.Size = UDim2.new(0, 220, 0, 50)
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
	
	-- Connect the button's click event to the provided function
	button.MouseButton1Click:Connect(function()
		functionToRun() -- Execute the function when the button is clicked
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

-------------------------------------------------------------------------------------------------------------------------------

local localplayer = game:GetService("Players").LocalPlayer

-------------------------------------------------------------------------------------------------------------------------------

function teleporttoelevator()
	local elevatorsFolder = workspace:FindFirstChild("Elevators")

	if elevatorsFolder then
		local elevatorModel = elevatorsFolder:FindFirstChildWhichIsA("Model")

		if elevatorModel then
			local monsterBlocker = elevatorModel:FindFirstChild("MonsterBlocker")

			if monsterBlocker and monsterBlocker:IsA("Part") then
				local character = localplayer.Character
				if character and character:FindFirstChild("HumanoidRootPart") then
					character.HumanoidRootPart.CFrame = monsterBlocker.CFrame
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local function teleporttogenerator()
	local currentRoom = workspace:FindFirstChild("CurrentRoom")
	local character = localplayer.Character or localplayer.CharacterAdded:Wait()

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

local function pickupallitems()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
	if currentRoom then
		for _, model in ipairs(currentRoom:GetChildren()) do
			if model:IsA("Model") then
				local itemsFolder = model:FindFirstChild("Items")
				if itemsFolder and #itemsFolder:GetChildren() > 0 then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						if item:IsA("Model") then
							humanoidRootPart.CFrame = item:GetModelCFrame()
							task.wait(0.2)
							local promptPart = item:FindFirstChild("Prompt")
							if promptPart and promptPart:IsA("BasePart") then
								local proximityPrompt = promptPart:FindFirstChildOfClass("ProximityPrompt")
								if proximityPrompt then
									for attempt = 1, 3 do
										proximityPrompt:InputHoldBegin()
										task.wait(0.05)
										proximityPrompt:InputHoldEnd()
										task.wait(0.1)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local function pickupallresearchcapsules()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
	if currentRoom then
		for _, model in ipairs(currentRoom:GetChildren()) do
			if model:IsA("Model") then
				local itemsFolder = model:FindFirstChild("Items")
				if itemsFolder and #itemsFolder:GetChildren() > 0 then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						-- Only pick up items named "ResearchCapsule"
						if item:IsA("Model") and item.Name == "ResearchCapsule" then
							humanoidRootPart.CFrame = item:GetModelCFrame()
							task.wait(0.2)
							local promptPart = item:FindFirstChild("Prompt")
							if promptPart and promptPart:IsA("BasePart") then
								local proximityPrompt = promptPart:FindFirstChildOfClass("ProximityPrompt")
								if proximityPrompt then
									for attempt = 1, 3 do
										proximityPrompt:InputHoldBegin()
										task.wait(0.05)
										proximityPrompt:InputHoldEnd()
										task.wait(0.1)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local function pickupalltapes()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
	if currentRoom then
		for _, model in ipairs(currentRoom:GetChildren()) do
			if model:IsA("Model") then
				local itemsFolder = model:FindFirstChild("Items")
				if itemsFolder and #itemsFolder:GetChildren() > 0 then
					for _, item in ipairs(itemsFolder:GetChildren()) do
						-- Only pick up items named "ResearchCapsule"
						if item:IsA("Model") and item.Name == "Tape" then
							humanoidRootPart.CFrame = item:GetModelCFrame()
							task.wait(0.2)
							local promptPart = item:FindFirstChild("Prompt")
							if promptPart and promptPart:IsA("BasePart") then
								local proximityPrompt = promptPart:FindFirstChildOfClass("ProximityPrompt")
								if proximityPrompt then
									for attempt = 1, 3 do
										proximityPrompt:InputHoldBegin()
										task.wait(0.05)
										proximityPrompt:InputHoldEnd()
										task.wait(0.1)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

createFunctionButton("Teleport to Elevator", teleporttoelevator)
createFunctionButton("Teleport to a Generator", teleporttogenerator)
createFunctionButton("Pick up all Items", pickupallitems)
createFunctionButton("Pick up Research Capsules", pickupallresearchcapsules)
createFunctionButton("Pick up Tapes", pickupalltapes)

-------------------------------------------------------------------------------------------------------------------------------
