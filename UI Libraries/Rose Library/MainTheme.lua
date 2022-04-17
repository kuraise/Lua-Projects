local RoseLibrary = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local http = game:GetService("HttpService")

function RoseLibrary:rString()
	local l = math.random(5,35)
	local a = {}
	for v = 1, l do
		a[v] = string.char(math.random(35,130))
	end
	return table.concat(a)
end

function RoseLibrary:Tween(o, p, d, ...)
	tween:Create(o, tweeninfo(d, ...), p):Play()
end

function RoseLibrary:Load(n, p, l)
	n = n or "UnnamedLibrary"
	p = p or false
	RoseLibrary.MainName = n
	for g,gui in pairs(game.CoreGui:GetChildren()) do
		if gui:IsA("ScreenGui") then
			for y,i in pairs(gui:GetDescendants()) do
				if i:IsA("TextLabel") then
					if i.Text == "<b>"..RoseLibrary.MainName.."</b>" then
						gui:Destroy()
					else
						break
					end
				end
			end
		end
	end
	if p == true then
		n = RoseLibrary:rString()
	end
	
	local RoseLib = Instance.new("ScreenGui")
	RoseLib.Parent = game.CoreGui
	RoseLib.ResetOnSpawn = false
	
	local main = Instance.new("Frame")
	main.Name = "main"
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
	main.Position = UDim2.fromScale(0.504, 0.499)
	main.Size = UDim2.fromScale(0.307, 0.448)
	main.ZIndex = 9999999999999999999
	main.Parent = RoseLib

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "uICorner"
	uICorner.CornerRadius = UDim.new(0, 5)
	uICorner.Parent = main

	local itemControl = Instance.new("Frame")
	itemControl.Name = "itemControl"
	itemControl.AnchorPoint = Vector2.new(0.5, 0.5)
	itemControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	itemControl.BackgroundTransparency = 1
	itemControl.BorderSizePixel = 0
	itemControl.Position = UDim2.fromScale(0.181, 0.575)
	itemControl.Size = UDim2.fromScale(0.362, 0.849)
	itemControl.ZIndex = 9999999999999999999

	local search = Instance.new("Frame")
	search.Name = "search"
	search.AnchorPoint = Vector2.new(0.5, 0.5)
	search.BackgroundColor3 = Color3.fromRGB(30, 31, 32)
	search.BorderSizePixel = 0
	search.ClipsDescendants = true
	search.Position = UDim2.fromScale(0.5, 0.051)
	search.Size = UDim2.fromScale(0.887, 0.0909)
	search.ZIndex = 9999999999999999999

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "uICorner1"
	uICorner1.CornerRadius = UDim.new(0, 5)
	uICorner1.Parent = search

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "uIStroke"
	uIStroke.Color = Color3.fromRGB(41, 44, 47)
	uIStroke.Parent = search

	local line = Instance.new("Frame")
	line.Name = "line"
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.BackgroundColor3 = Color3.fromRGB(70, 174, 227)
	line.BorderSizePixel = 0
	line.Position = UDim2.fromScale(0.5, 0.931)
	line.Size = UDim2.fromScale(1, 0.103)
	line.ZIndex = 9999999999999999999

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "uICorner2"
	uICorner2.CornerRadius = UDim.new(0, 2)
	uICorner2.Parent = line

	local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint.Name = "uIAspectRatioConstraint"
	uIAspectRatioConstraint.AspectRatio = 63
	uIAspectRatioConstraint.Parent = line

	line.Parent = search

	local searchText = Instance.new("TextBox")
	searchText.Name = "searchText"
	searchText.Font = Enum.Font.SourceSansBold
	searchText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	searchText.PlaceholderText = "Search for a tab"
	searchText.Text = ""
	searchText.TextColor3 = Color3.fromRGB(255, 255, 255)
	searchText.TextScaled = true
	searchText.TextSize = 14
	searchText.TextWrapped = true
	searchText.TextXAlignment = Enum.TextXAlignment.Left
	searchText.AnchorPoint = Vector2.new(0.5, 0.5)
	searchText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	searchText.BackgroundTransparency = 1
	searchText.BorderSizePixel = 0
	searchText.Position = UDim2.fromScale(0.402, 0.5)
	searchText.Size = UDim2.fromScale(0.751, 0.862)
	searchText.ZIndex = 9999999999999999999

	local uIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint1.Name = "uIAspectRatioConstraint1"
	uIAspectRatioConstraint1.AspectRatio = 5.68
	uIAspectRatioConstraint1.Parent = searchText

	local uITextSizeConstraint = Instance.new("UITextSizeConstraint")
	uITextSizeConstraint.Name = "uITextSizeConstraint"
	uITextSizeConstraint.MaxTextSize = 14
	uITextSizeConstraint.Parent = searchText

	searchText.Parent = search

	local search1 = Instance.new("ImageButton")
	search1.Name = "search1"
	search1.Image = "rbxassetid://3926305904"
	search1.ImageRectOffset = Vector2.new(964, 324)
	search1.ImageRectSize = Vector2.new(36, 36)
	search1.AnchorPoint = Vector2.new(0.5, 0.5)
	search1.BackgroundTransparency = 1
	search1.Position = UDim2.fromScale(0.93, 0.5)
	search1.Size = UDim2.fromScale(0.0899, 0.586)
	search1.ZIndex = 9999999999999999999

	local uIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint2.Name = "uIAspectRatioConstraint2"
	uIAspectRatioConstraint2.Parent = search1

	search1.Parent = search

	local uIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint3.Name = "uIAspectRatioConstraint3"
	uIAspectRatioConstraint3.AspectRatio = 6.52
	uIAspectRatioConstraint3.Parent = search

	search.Parent = itemControl

	local uIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint4.Name = "uIAspectRatioConstraint4"
	uIAspectRatioConstraint4.AspectRatio = 0.668
	uIAspectRatioConstraint4.Parent = itemControl

	itemControl.Parent = main

	local headControl = Instance.new("Frame")
	headControl.Name = "headControl"
	headControl.AnchorPoint = Vector2.new(0.5, 0.5)
	headControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	headControl.BackgroundTransparency = 1
	headControl.BorderSizePixel = 0
	headControl.Position = UDim2.fromScale(0.5, 0.0749)
	headControl.Size = UDim2.fromScale(1, 0.151)
	headControl.ZIndex = 9999999999999999999

	local name = Instance.new("TextLabel")
	name.Name = "name"
	name.Font = Enum.Font.SourceSansBold
	name.Text = RoseLibrary.MainName
	name.TextColor3 = Color3.fromRGB(86, 196, 255)
	name.TextScaled = true
	name.TextSize = 20
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.AnchorPoint = Vector2.new(0.5, 0.5)
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderSizePixel = 0
	name.Position = UDim2.fromScale(0.192, 0.4)
	name.Size = UDim2.fromScale(0.34, 0.37)
	name.ZIndex = 9999999999999999999

	local uIAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint5.Name = "uIAspectRatioConstraint5"
	uIAspectRatioConstraint5.AspectRatio = 9.5
	uIAspectRatioConstraint5.Parent = name

	local uITextSizeConstraint1 = Instance.new("UITextSizeConstraint")
	uITextSizeConstraint1.Name = "uITextSizeConstraint1"
	uITextSizeConstraint1.MaxTextSize = 20
	uITextSizeConstraint1.Parent = name

	name.Parent = headControl

	local frameControl = Instance.new("Frame")
	frameControl.Name = "frameControl"
	frameControl.AnchorPoint = Vector2.new(0.5, 0.5)
	frameControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	frameControl.BackgroundTransparency = 1
	frameControl.BorderSizePixel = 0
	frameControl.Position = UDim2.fromScale(0.851, 0.4)
	frameControl.Size = UDim2.fromScale(0.297, 0.815)
	frameControl.ZIndex = 9999999999999999999

	local close = Instance.new("ImageButton")
	close.Name = "close"
	close.Image = "rbxassetid://3926305904"
	close.ImageRectOffset = Vector2.new(924, 724)
	close.ImageRectSize = Vector2.new(36, 36)
	close.AnchorPoint = Vector2.new(0.5, 0.5)
	close.BackgroundTransparency = 1
	close.Position = UDim2.fromScale(0.86, 0.5)
	close.Size = UDim2.fromScale(0.15, 0.568)
	close.ZIndex = 9999999999999999999

	local uIAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint6.Name = "uIAspectRatioConstraint6"
	uIAspectRatioConstraint6.Parent = close

	close.Parent = frameControl

	local uIAspectRatioConstraint7 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint7.Name = "uIAspectRatioConstraint7"
	uIAspectRatioConstraint7.AspectRatio = 3.78
	uIAspectRatioConstraint7.Parent = frameControl

	frameControl.Parent = headControl

	local uIAspectRatioConstraint8 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint8.Name = "uIAspectRatioConstraint8"
	uIAspectRatioConstraint8.AspectRatio = 10.4
	uIAspectRatioConstraint8.Parent = headControl

	headControl.Parent = main

	local uIAspectRatioConstraint9 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint9.Name = "uIAspectRatioConstraint9"
	uIAspectRatioConstraint9.AspectRatio = 1.57
	uIAspectRatioConstraint9.Parent = main
	
	searchText.Focused:Connect(function()
		line:TweenSize(UDim2.new(1, 0,0.103, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .4)
	end)
	searchText.FocusLost:Connect(function()
		line:TweenSize(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .4)
	end)
end

return RoseLibrary
