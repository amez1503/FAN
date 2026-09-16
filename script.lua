local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Immediate cleanup of the old interface
local oldGui = CoreGui:FindFirstChild("NeedleHyperDrive")
if oldGui then oldGui:Destroy() end

local state = { active = true }
local connections = {}

local function getHRP()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- ==========================================
-- ULTRA-FAST TARGETED NOCLIP (Keeps the ground stable)
-- ==========================================
connections["Noclip"] = RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                if part.Name ~= "LeftFoot" and part.Name ~= "RightFoot" and part.Name ~= "LowerTorso" and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- ==========================================
-- ULTRA-SMOOTH PROGRESS INTERFACE
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NeedleHyperDrive"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 100)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 85) -- Lightning Pink / Maximum Speed
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Title.Text = "   NEEDLE BOT — HYPER-DRIVE V4"
Title.TextColor3 = Color3.fromRGB(255, 0, 85)
Title.TextSize = 12
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 6)
TitleCorner.Parent = Title

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 25)
StatusLabel.Position = UDim2.new(0, 10, 0, 45)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Turbo-Scan active..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

local ProgressBg = Instance.new("Frame")
ProgressBg.Size = UDim2.new(1, -20, 0, 8)
ProgressBg.Position = UDim2.new(0, 10, 0, 75)
ProgressBg.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ProgressBg.BorderSizePixel = 0
ProgressBg.Parent = MainFrame

local ProgressBgCorner = Instance.new("UICorner")
ProgressBgCorner.CornerRadius = UDim.new(0, 4)
ProgressBgCorner.Parent = ProgressBg

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 0, 85)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressBg

local ProgressBarCorner = Instance.new("UICorner")
ProgressBarCorner.CornerRadius = UDim.new(0, 4)
ProgressBarCorner.Parent = ProgressBar

-- ==========================================
-- GRAPHICS ENGINE-TIMED LOOP (MAX SPEED)
-- ==========================================
connections["Loop"] = RunService.RenderStepped:Connect(function()
    if not state.active then return end
    
    local hrp = getHRP()
    if not hrp then return end

    -- Instant needle search
    local targetNeedle = nil
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") or obj:IsA("Tool") then
            if obj:IsDescendantOf(LocalPlayer.Character) then continue end
            
            local nameLower = string.lower(obj.Name)
            if nameLower == "needle" or nameLower == "needle" or string.find(nameLower, "needle") then
                targetNeedle = obj
                break
            end
        end
    end

    if targetNeedle then
        local targetCFrame = targetNeedle:IsA("Model") and targetNeedle:GetPivot() or targetNeedle.CFrame
        if not targetCFrame and targetNeedle:IsA("Tool") and targetNeedle:FindFirstChild("Handle") then
            targetCFrame = targetNeedle.Handle.CFrame
        end

        if targetCFrame then
            StatusLabel.Text = "Status: ⚡ INSTANT SECURING..."
            ProgressBar.Size = UDim2.new(1, 0, 1, 0)

            -- 1. Immediate teleport in front of the needle (Offset by 1.5 studs)
            local targetPos = targetCFrame.Position
            hrp.CFrame = CFrame.lookAt(targetPos + Vector3.new(0, 0.5, 1.5), targetPos)
            
            -- 2. Instant Camera Aim-Bot
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, targetPos)

            -- 3. Destructive asynchronous interaction spam (No delay)
            task.spawn(function()
                for _, prompt in ipairs(targetNeedle:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        prompt.HoldDuration = 0
                        fireproximityprompt(prompt)
                    elseif prompt:IsA("ClickDetector") then
                        fireclickdetector(prompt)
                    end
                end
            end)
        end
    else
        StatusLabel.Text = "Status: 🔍 Searching for a spawn..."
        ProgressBar.Size = UDim2.new(0.2, 0, 1, 0)
    end
end)
