-- [[ Rscripts Risk Notice ]]
-- This script is not verified by rscripts.net. Deal with caution.
--
-- Stay safe:
--   • Never log in on unofficial Roblox sites or lookalike domains.
--   • Real Roblox links use roblox.com (check the .com ending).
--   • Treat fake Roblox login / "claim reward" pages as phishing.
-- [[ End Rscripts Risk Notice ]]

--[[
    Script for any executor - FAST VERSION
    Features:
    - Glassmorphism modern design
    - Animated elements  
    - Get Key button (copies link to clipboard)
    - Check Key button with validation
    - Unmovable, persistent across respawns
    - Error message (red) for 5 seconds on wrong key
    - Success message (green) for correct key
    - FAST execution - minimal delays
]]

-- Configuration
local KEY = "aluksx"
local LINK = "https://link-target.net/1417470/g6eKEoq2bJV9"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/morenoffproScriptsRoblox/ReaperAim/refs/heads/main/README.md"

-- Wait for game to load
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")

-- Make GUI persistent (won't disappear on respawn)
gui.Name = "KeySystemGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- Create main frame (unmovable) - Glassmorphism style
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 280)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Active = false
mainFrame.Draggable = false
mainFrame.Parent = gui

-- Add rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Add glass border effect
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 255, 255)
border.Transparency = 0.9
border.Thickness = 1.5
border.Parent = mainFrame

-- Add gradient effect
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 20))
})
gradient.Parent = mainFrame

-- Title with shadow effect
local titleShadow = Instance.new("TextLabel")
titleShadow.Name = "TitleShadow"
titleShadow.Size = UDim2.new(1, 2, 0, 50)
titleShadow.Position = UDim2.new(0, 1, 0, 12)
titleShadow.BackgroundTransparency = 1
titleShadow.Text = "🔑 KEY SYSTEM"
titleShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
titleShadow.TextTransparency = 0.6
titleShadow.TextScaled = true
titleShadow.Font = Enum.Font.GothamBold
titleShadow.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "🔑 KEY SYSTEM"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 55)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Enter your key to access the script"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 180)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame

-- Input box for key - Modern style
local inputContainer = Instance.new("Frame")
inputContainer.Name = "InputContainer"
inputContainer.Size = UDim2.new(0.85, 0, 0, 45)
inputContainer.Position = UDim2.new(0.075, 0, 0.35, 0)
inputContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
inputContainer.BackgroundTransparency = 0.4
inputContainer.BorderSizePixel = 0
inputContainer.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputContainer

local inputBorder = Instance.new("UIStroke")
inputBorder.Color = Color3.fromRGB(100, 100, 150)
inputBorder.Transparency = 0.7
inputBorder.Thickness = 1
inputBorder.Parent = inputContainer

local inputBox = Instance.new("TextBox")
inputBox.Name = "KeyInput"
inputBox.Size = UDim2.new(1, -20, 1, 0)
inputBox.Position = UDim2.new(0, 10, 0, 0)
inputBox.BackgroundTransparency = 1
inputBox.Text = ""
inputBox.PlaceholderText = "Enter your key..."
inputBox.TextColor3 = Color3.fromRGB(220, 220, 240)
inputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 130)
inputBox.TextScaled = true
inputBox.Font = Enum.Font.Gotham
inputBox.ClearTextOnFocus = false
inputBox.Parent = inputContainer

-- Button container
local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(0.85, 0, 0, 45)
buttonContainer.Position = UDim2.new(0.075, 0, 0.6, 0)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- Get Key button - Animated
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Name = "GetKeyBtn"
getKeyBtn.Size = UDim2.new(0.45, -5, 1, 0)
getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
getKeyBtn.Text = "🔗 Get Key"
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.TextScaled = true
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.Parent = buttonContainer

local getKeyCorner = Instance.new("UICorner")
getKeyCorner.CornerRadius = UDim.new(0, 10)
getKeyCorner.Parent = getKeyBtn

-- Check Key button - Animated
local checkKeyBtn = Instance.new("TextButton")
checkKeyBtn.Name = "CheckKeyBtn"
checkKeyBtn.Size = UDim2.new(0.45, -5, 1, 0)
checkKeyBtn.Position = UDim2.new(0.55, 0, 0, 0)
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
checkKeyBtn.Text = "✅ Check"
checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyBtn.TextScaled = true
checkKeyBtn.Font = Enum.Font.GothamBold
checkKeyBtn.Parent = buttonContainer

local checkKeyCorner = Instance.new("UICorner")
checkKeyCorner.CornerRadius = UDim.new(0, 10)
checkKeyCorner.Parent = checkKeyBtn

-- Status label (hidden by default)
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0.9, 0, 0, 30)
statusLabel.Position = UDim2.new(0.05, 0, 0.82, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Visible = false
statusLabel.Parent = mainFrame

-- Loading animation frame
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LoadingFrame"
loadingFrame.Size = UDim2.new(0, 30, 0, 30)
loadingFrame.Position = UDim2.new(0.5, -15, 0.82, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
loadingFrame.BackgroundTransparency = 1
loadingFrame.Visible = false
loadingFrame.Parent = mainFrame

local loadingCorner = Instance.new("UICorner")
loadingCorner.CornerRadius = UDim.new(0, 15)
loadingCorner.Parent = loadingFrame

-- Function to show status message
local function showStatus(message, color, duration)
    statusLabel.Text = message
    statusLabel.TextColor3 = color
    statusLabel.Visible = true
    loadingFrame.Visible = false
    
    -- Clear after duration (if provided)
    if duration then
        task.wait(duration)
        statusLabel.Visible = false
    end
end

-- Loading animation - FAST version
local function showLoading()
    statusLabel.Visible = false
    loadingFrame.Visible = true
    loadingFrame.BackgroundTransparency = 0.3
    -- Minimal animation, just flash quickly
    task.wait(0.3)
end

-- Button hover effects
getKeyBtn.MouseEnter:Connect(function()
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 220)
end)

getKeyBtn.MouseLeave:Connect(function()
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
end)

checkKeyBtn.MouseEnter:Connect(function()
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 90)
end)

checkKeyBtn.MouseLeave:Connect(function()
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
end)

-- Get Key button functionality
getKeyBtn.MouseButton1Click:Connect(function()
    -- Copy link to clipboard
    setclipboard(LINK)
    showStatus("✅ Link copied!", Color3.fromRGB(50, 200, 50), 1.5)
end)

-- Check Key button functionality - FAST execution
checkKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = inputBox.Text:lower()
    
    if enteredKey == KEY then
        -- Correct key - FAST loading
        showLoading()
        
        -- Show success briefly
        showStatus("✅ Loading script...", Color3.fromRGB(50, 200, 50), 0.5)
        task.wait(0.3)
        
        -- Destroy GUI immediately
        gui:Destroy()
        
        -- Load main script - FAST
        local success, err = pcall(function()
            loadstring(game:HttpGet(MAIN_SCRIPT, true))()
        end)
        
        if not success then
            warn("Failed to load main script: " .. tostring(err))
        end
    else
        -- Wrong key - 5 second error message
        showStatus("❌ Wrong key! Try again.", Color3.fromRGB(255, 50, 50), 5)
        
        -- Clear input
        inputBox.Text = ""
    end
end)

-- Also allow pressing Enter to check key
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkKeyBtn.MouseButton1Click:Fire()
    end
end)

-- Print confirmation
print("✅ Key System loaded - FAST MODE")
print("🔑 Key: " .. KEY)
