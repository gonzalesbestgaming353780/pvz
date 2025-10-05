-- REDZ HUB (BETA v2) Tab UI for Plant vs Brainrot
-- Single-instance, draggable, with close (X) and minimize (-), styled buttons inside
-- Key system: GUI ONLY shows if correct key ("555") is entered

local player = game.Players.LocalPlayer
local guiName = "REDZHUB_Tab"
local keyCode = "555" -- CHANGE KEY HERE

-- Prevent duplicate tab
if player.PlayerGui:FindFirstChild(guiName) then
    return
end

local gui = Instance.new("ScreenGui")
gui.Name = guiName
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- Key entry frame
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Size = UDim2.new(0, 340, 0, 140)
keyFrame.Position = UDim2.new(0.5, -170, 0.4, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(30,35,50)
keyFrame.BackgroundTransparency = 0.09
keyFrame.Parent = gui
keyFrame.Active = true

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 16)
keyCorner.Parent = keyFrame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, 0, 0, 36)
keyLabel.Position = UDim2.new(0, 0, 0, 12)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Key to Unlock REDZ HUB"
keyLabel.Font = Enum.Font.GothamBold
keyLabel.TextSize = 20
keyLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
keyLabel.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 36)
keyBox.Position = UDim2.new(0.1, 0, 0, 56)
keyBox.BackgroundColor3 = Color3.fromRGB(40,40,50)
keyBox.Text = ""
keyBox.PlaceholderText = "Enter Key..."
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 18
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.Parent = keyFrame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 10)
keyBoxCorner.Parent = keyBox

local unlockBtn = Instance.new("TextButton")
unlockBtn.Size = UDim2.new(0.8, 0, 0, 36)
unlockBtn.Position = UDim2.new(0.1, 0, 0, 100)
unlockBtn.BackgroundColor3 = Color3.fromRGB(70, 170, 255)
unlockBtn.Text = "Unlock"
unlockBtn.Font = Enum.Font.GothamBold
unlockBtn.TextSize = 20
unlockBtn.TextColor3 = Color3.fromRGB(255,255,255)
unlockBtn.Parent = keyFrame

local unlockBtnCorner = Instance.new("UICorner")
unlockBtnCorner.CornerRadius = UDim.new(0, 10)
unlockBtnCorner.Parent = unlockBtn

local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, 0, 0, 22)
errorLabel.Position = UDim2.new(0, 0, 0, 120)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextSize = 16
errorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
errorLabel.Parent = keyFrame

-- Main REDZHUB tab (hidden until key entered)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 340, 0, 240)
mainFrame.Position = UDim2.new(0.5, -170, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30,35,50)
mainFrame.BackgroundTransparency = 0.09
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui
mainFrame.Visible = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -80, 0, 38)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.Text = "REDZ HUB (BETA v2)"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 38, 0, 38)
closeBtn.Position = UDim2.new(1, -38, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.TextColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Parent = mainFrame
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minBtn = Instance.new("TextButton")
minBtn.Name = "MinimizeBtn"
minBtn.Size = UDim2.new(0, 38, 0, 38)
minBtn.Position = UDim2.new(1, -76, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 32
minBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
minBtn.Parent = mainFrame

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -32, 1, -54)
contentFrame.Position = UDim2.new(0, 16, 0, 46)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local function createButton(name, text, yPosition)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.Position = UDim2.new(0, 0, 0, yPosition)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 22
    btn.AnchorPoint = Vector2.new(0,0)
    btn.BackgroundTransparency = 0.12

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = btn

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(70, 170, 255)
    UIStroke.Thickness = 2
    UIStroke.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 80, 120)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    end)

    btn.Parent = contentFrame
    return btn
end

local duplicatePlanBtn = createButton("DuplicatePlanBtn", "Duplicate Plan", 0)
local duplicateBrainrotBtn = createButton("DuplicateBrainrotBtn", "Duplicate Brainrot", 60)

duplicatePlanBtn.MouseButton1Click:Connect(function()
    print("Duplicate Plan button clicked!")
    -- TODO: Add duplication logic
end)

duplicateBrainrotBtn.MouseButton1Click:Connect(function()
    print("Duplicate Brainrot button clicked!")
    -- TODO: Add duplication logic
end)

-- Minimize/restore logic
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    contentFrame.Visible = not minimized
    if minimized then
        mainFrame.Size = UDim2.new(0, 340, 0, 38)
    else
        mainFrame.Size = UDim2.new(0, 340, 0, 240)
    end
end)

-- Key unlock logic
unlockBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == keyCode then
        keyFrame.Visible = false
        mainFrame.Visible = true
    else
        errorLabel.Text = "Incorrect key! Try again."
        task.wait(1.2)
        errorLabel.Text = ""
    end
end)
