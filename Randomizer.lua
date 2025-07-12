local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local userId = plr.UserId

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkSpawnerGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 400, 0, 180)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Parent = Frame
AvatarImage.Position = UDim2.new(0, 10, 0, 10)
AvatarImage.Size = UDim2.new(0, 50, 0, 50)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
AvatarImage.ScaleType = Enum.ScaleType.Fit

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Position = UDim2.new(0.5, 0, 0, 10)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Size = UDim2.new(0.8, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Darkspawner"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

local PercentText = Instance.new("TextLabel")
PercentText.Parent = Frame
PercentText.Position = UDim2.new(0.5, 0, 0, 45)
PercentText.AnchorPoint = Vector2.new(0.5, 0)
PercentText.Size = UDim2.new(0.8, 0, 0, 25)
PercentText.BackgroundTransparency = 1
PercentText.Text = "Loading: 0%"
PercentText.TextColor3 = Color3.fromRGB(200, 200, 200)
PercentText.Font = Enum.Font.Gotham
PercentText.TextScaled = true

local ProgressBarBG = Instance.new("Frame")
ProgressBarBG.Parent = Frame
ProgressBarBG.Position = UDim2.new(0.05, 0, 0.55, 0)
ProgressBarBG.Size = UDim2.new(0.9, 0, 0.15, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ProgressBarBG.BorderSizePixel = 0

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = ProgressBarBG
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ProgressBar.BorderSizePixel = 0

-- **Added Subtitle here**
local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = Frame
Subtitle.Position = UDim2.new(0, 0, 0.8, 0)
Subtitle.Size = UDim2.new(1, 0, 0.15, 0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Loading by ProjectB"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextScaled = true

TweenService:Create(ProgressBar, TweenInfo.new(15, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

task.spawn(function()
	local startTime = tick()
	local duration = 15

	local connection
	connection = RunService.RenderStepped:Connect(function()
		local elapsed = tick() - startTime
		local percent = math.clamp((elapsed / duration) * 100, 0, 100)
		PercentText.Text = ("Loading: %d%%"):format(math.floor(percent + 0.5))

		if elapsed >= duration then
			connection:Disconnect()
			ScreenGui:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectBScripts/loadinggg/refs/heads/main/loadinggui.lua"))()
		end
	end)
end)
