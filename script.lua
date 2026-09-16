-- [[ Rscripts Risk Notice ]]
-- This script is not verified by rscripts.net. Deal with caution.
--
-- Stay safe:
--   • Never log in on unofficial Roblox sites or lookalike domains.
--   • Real Roblox links use roblox.com (check the .com ending).
--   • Treat fake Roblox login / "claim reward" pages as phishing.
-- [[ End Rscripts Risk Notice ]]

--[[rscripts:analytics:start]]
-- Script analytics (enabled by the creator on rscripts.net).
-- Runs in its own thread and cannot affect the script below.
task.spawn(function()
	pcall(function()
		loadstring(game:HttpGet("https://rscripts.net/api/telemetry/v2/client.lua?s=6aaa25b0ff15732caaa14962"))()
	end)
end)
--[[rscripts:analytics:end]]

-- ══════════════════════════════════════════════════════════════════════════════
-- HACKING BROS — Discord Promo
-- Draggable prompt to join the Discord for the full script.
-- Paste this into your executor and execute.
-- ══════════════════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local DiscordLink = "https://discord.gg/4kpntS9tym"

-- Remove old instance if re-executing
if _G.HBDiscordGui then pcall(function() _G.HBDiscordGui:Destroy() end) end

-- ══════════════════════════════════════════════════════════════════════════════
-- THEME
-- ══════════════════════════════════════════════════════════════════════════════
local T = {
    bg        = Color3.fromRGB(18, 12, 12),
    card      = Color3.fromRGB(24, 16, 16),
    border    = Color3.fromRGB(50, 25, 25),
    accent    = Color3.fromRGB(220, 30, 30),
    accentDim = Color3.fromRGB(70, 18, 18),
    text      = Color3.fromRGB(255, 255, 255),
    textDim   = Color3.fromRGB(170, 140, 140),
    textAcc   = Color3.fromRGB(255, 220, 220),
    hover     = Color3.fromRGB(40, 22, 22),
    glow      = Color3.fromRGB(180, 20, 20),
}

-- ══════════════════════════════════════════════════════════════════════════════
-- SCREEN GUI
-- ══════════════════════════════════════════════════════════════════════════════
local GUI = Instance.new("ScreenGui")
GUI.Name = "HBDiscordPromo"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.DisplayOrder = 9999
pcall(function() GUI.Parent = CoreGui end)
if not GUI.Parent then
    local lp = Players.LocalPlayer
    if lp and lp:FindFirstChild("PlayerGui") then GUI.Parent = lp.PlayerGui end
end
_G.HBDiscordGui = GUI

-- ══════════════════════════════════════════════════════════════════════════════
-- BLACK OVERLAY
-- ══════════════════════════════════════════════════════════════════════════════
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.Position = UDim2.new(0, 0, 0, 0)
Overlay.BackgroundColor3 = Color3.new(0, 0, 0)
Overlay.BackgroundTransparency = 0
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 1
Overlay.Parent = GUI

-- ══════════════════════════════════════════════════════════════════════════════
-- MAIN FRAME
-- ══════════════════════════════════════════════════════════════════════════════
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 370, 0, 260)
Main.Position = UDim2.new(0.5, -185, 0.5, -130)
Main.BackgroundColor3 = T.bg
Main.BorderSizePixel = 0
Main.Active = false
Main.Draggable = false
Main.ClipsDescendants = true
Main.ZIndex = 2
Main.Parent = GUI

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = Main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = T.border
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = Main

-- Subtle glow pulse
local glowStroke = Instance.new("UIStroke")
glowStroke.Color = T.glow
glowStroke.Thickness = 2
glowStroke.Transparency = 0.7
glowStroke.Parent = Main

task.spawn(function()
    while GUI.Parent do
        local t1 = TweenService:Create(glowStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.2})
        t1:Play()
        t1.Completed:Wait()
        local t2 = TweenService:Create(glowStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.7})
        t2:Play()
        t2.Completed:Wait()
    end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- TOP BAR
-- ══════════════════════════════════════════════════════════════════════════════
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.BackgroundColor3 = T.accentDim
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 10)
topCorner.Parent = TopBar

local topFix = Instance.new("Frame")
topFix.Size = UDim2.new(1, 0, 0, 12)
topFix.Position = UDim2.new(0, 0, 1, -12)
topFix.BackgroundColor3 = T.accentDim
topFix.BorderSizePixel = 0
topFix.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "HACKING BROS"
TitleLabel.TextColor3 = T.text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar



-- ══════════════════════════════════════════════════════════════════════════════
-- MAIN CONTENT
-- ══════════════════════════════════════════════════════════════════════════════
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -24, 1, -48)
Content.Position = UDim2.new(0, 12, 0, 42)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.Parent = Content

-- Icon area
local IconFrame = Instance.new("Frame")
IconFrame.Size = UDim2.new(0, 56, 0, 56)
IconFrame.BackgroundColor3 = T.accentDim
IconFrame.BorderSizePixel = 0
IconFrame.LayoutOrder = 1
IconFrame.Parent = Content

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 28)
iconCorner.Parent = IconFrame

local IconLabel = Instance.new("TextLabel")
IconLabel.Size = UDim2.new(1, 0, 1, 0)
IconLabel.BackgroundTransparency = 1
IconLabel.Text = "HB"
IconLabel.TextColor3 = T.accent
IconLabel.Font = Enum.Font.GothamBlack
IconLabel.TextSize = 22
IconLabel.Parent = IconFrame

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = T.accent
iconStroke.Thickness = 2
iconStroke.Transparency = 0.3
iconStroke.Parent = IconFrame

-- Main message
local Message = Instance.new("TextLabel")
Message.Size = UDim2.new(1, 0, 0, 0)
Message.AutomaticSize = Enum.AutomaticSize.Y
Message.BackgroundTransparency = 1
Message.Text = "JOIN THE DISCORD\nHACKING BROS\nFOR THE FULL SCRIPT"
Message.TextColor3 = T.textAcc
Message.Font = Enum.Font.GothamBold
Message.TextSize = 18
Message.TextWrapped = true
Message.LayoutOrder = 2
Message.Parent = Content

local subMsg = Instance.new("TextLabel")
subMsg.Size = UDim2.new(1, 0, 0, 0)
subMsg.AutomaticSize = Enum.AutomaticSize.Y
subMsg.BackgroundTransparency = 1
subMsg.Text = "Access all cheats, updates & support"
subMsg.TextColor3 = T.textDim
subMsg.Font = Enum.Font.Gotham
subMsg.TextSize = 12
subMsg.LayoutOrder = 3
subMsg.Parent = Content

-- ══════════════════════════════════════════════════════════════════════════════
-- DISCORD BUTTON
-- ══════════════════════════════════════════════════════════════════════════════
local JoinBtn = Instance.new("TextButton")
JoinBtn.Size = UDim2.new(1, 0, 0, 42)
JoinBtn.BackgroundColor3 = T.accent
JoinBtn.Text = "JOIN DISCORD"
JoinBtn.TextColor3 = T.text
JoinBtn.Font = Enum.Font.GothamBold
JoinBtn.TextSize = 15
JoinBtn.BorderSizePixel = 0
JoinBtn.AutoButtonColor = false
JoinBtn.LayoutOrder = 4
JoinBtn.Parent = Content

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = JoinBtn

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = T.glow
btnStroke.Thickness = 1
btnStroke.Transparency = 0.5
btnStroke.Parent = JoinBtn

-- Hover effects
JoinBtn.MouseEnter:Connect(function()
    TweenService:Create(JoinBtn, TweenInfo.new(0.2), {BackgroundColor3 = T.glow}):Play()
    TweenService:Create(btnStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
end)
JoinBtn.MouseLeave:Connect(function()
    TweenService:Create(JoinBtn, TweenInfo.new(0.2), {BackgroundColor3 = T.accent}):Play()
    TweenService:Create(btnStroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
end)

-- Copy link to clipboard + feedback
JoinBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(DiscordLink) end)

    JoinBtn.Text = "LINK COPIED!"
    JoinBtn.BackgroundColor3 = Color3.fromRGB(30, 140, 50)

    -- Attempt to open link
    pcall(function()
        if syn and syn.request then
            syn.request({Url = DiscordLink, Method = "GET"})
        elseif request then
            request({Url = DiscordLink, Method = "GET"})
        elseif http_request then
            http_request({Url = DiscordLink, Method = "GET"})
        end
    end)

    task.delay(2, function()
        if JoinBtn and JoinBtn.Parent then
            JoinBtn.Text = "JOIN DISCORD"
            JoinBtn.BackgroundColor3 = T.accent
        end
    end)
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- ENTRANCE ANIMATION
-- ══════════════════════════════════════════════════════════════════════════════
Main.Size = UDim2.new(0, 370, 0, 0)
Main.Position = UDim2.new(0.5, -185, 0.5, 0)
Main.BackgroundTransparency = 0.5

task.wait(0.1)

local tweenIn = TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 370, 0, 260),
    Position = UDim2.new(0.5, -185, 0.5, -130),
    BackgroundTransparency = 0,
})
tweenIn:Play()

print("[Hacking Bros] Discord promo loaded.")
