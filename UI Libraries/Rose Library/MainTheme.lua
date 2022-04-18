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

function RoseLibrary:Drag(f, p)
	local dragging = false
	local dragInput, mousePos, framePos

	f.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = p.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	f.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			p.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end

function RoseLibrary:Load(n, p)
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
	
	local roseLib = Instance.new("ScreenGui")
	roseLib.Name = n
	roseLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	roseLib.ResetOnSpawn = false

	local main = Instance.new("Frame")
	main.Name = "main"
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
	main.Position = UDim2.fromScale(0.5, 0.54)
	main.Size = UDim2.fromScale(0.243, 0.529)
	main.ZIndex = 999999999

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
	itemControl.Position = UDim2.fromScale(0.206, 0.57)
	itemControl.Size = UDim2.fromScale(0.411, 0.861)
	itemControl.ZIndex = 999999999

	local search = Instance.new("Frame")
	search.Name = "search"
	search.AnchorPoint = Vector2.new(0.5, 0.5)
	search.BackgroundColor3 = Color3.fromRGB(30, 31, 32)
	search.BorderSizePixel = 0
	search.ClipsDescendants = true
	search.Position = UDim2.fromScale(0.5, 0.0432)
	search.Size = UDim2.fromScale(0.887, 0.0752)
	search.ZIndex = 999999999

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
	line.ZIndex = 999999999

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "uICorner2"
	uICorner2.CornerRadius = UDim.new(0, 2)
	uICorner2.Parent = line

	local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint.Name = "uIAspectRatioConstraint"
	uIAspectRatioConstraint.AspectRatio = 63
	uIAspectRatioConstraint.Parent = line

	line.Parent = search

	local search1 = Instance.new("ImageButton")
	search1.Name = "search1"
	search1.Image = "rbxassetid://3926305904"
	search1.ImageRectOffset = Vector2.new(964, 324)
	search1.ImageRectSize = Vector2.new(36, 36)
	search1.AnchorPoint = Vector2.new(0.5, 0.5)
	search1.BackgroundTransparency = 1
	search1.Position = UDim2.fromScale(0.93, 0.5)
	search1.Size = UDim2.fromScale(0.0899, 0.586)
	search1.ZIndex = 999999999

	local uIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint1.Name = "uIAspectRatioConstraint1"
	uIAspectRatioConstraint1.Parent = search1

	search1.Parent = search

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
	searchText.ZIndex = 999999999

	local uIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint2.Name = "uIAspectRatioConstraint2"
	uIAspectRatioConstraint2.AspectRatio = 5.68
	uIAspectRatioConstraint2.Parent = searchText

	local uITextSizeConstraint = Instance.new("UITextSizeConstraint")
	uITextSizeConstraint.Name = "uITextSizeConstraint"
	uITextSizeConstraint.MaxTextSize = 14
	uITextSizeConstraint.Parent = searchText

	searchText.Parent = search

	local uIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint3.Name = "uIAspectRatioConstraint3"
	uIAspectRatioConstraint3.AspectRatio = 5.93
	uIAspectRatioConstraint3.Parent = search

	search.Parent = itemControl

	local holder = Instance.new("ScrollingFrame")
	holder.Name = "holder"
	holder.ScrollBarImageColor3 = Color3.fromRGB(86, 196, 255)
	holder.ScrollBarThickness = 2
	holder.Active = true
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	holder.BackgroundTransparency = 1
	holder.BorderSizePixel = 0
	holder.Position = UDim2.fromScale(0.525, 0.55)
	holder.Size = UDim2.fromScale(0.929, 0.83)
	holder.ZIndex = 999999999

	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Name = "uIListLayout"
	uIListLayout.Padding = UDim.new(0, 5)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = holder

	local uIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint10.Name = "uIAspectRatioConstraint10"
	uIAspectRatioConstraint10.AspectRatio = 0.562
	uIAspectRatioConstraint10.Parent = holder

	holder.Parent = itemControl

	local uIAspectRatioConstraint11 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint11.Name = "uIAspectRatioConstraint11"
	uIAspectRatioConstraint11.AspectRatio = 0.502
	uIAspectRatioConstraint11.Parent = itemControl

	itemControl.Parent = main

	local headControl = Instance.new("Frame")
	headControl.Name = "headControl"
	headControl.AnchorPoint = Vector2.new(0.5, 0.5)
	headControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	headControl.BackgroundTransparency = 1
	headControl.BorderSizePixel = 0
	headControl.Position = UDim2.fromScale(0.5, 0.0628)
	headControl.Size = UDim2.fromScale(1, 0.126)
	headControl.ZIndex = 999999999

	local name = Instance.new("TextLabel")
	name.Name = "name"
	name.Font = Enum.Font.SourceSansBold
	name.Text = "Rose Library"
	name.TextColor3 = Color3.fromRGB(86, 196, 255)
	name.TextScaled = true
	name.TextSize = 22
	name.TextWrapped = true
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.AnchorPoint = Vector2.new(0.5, 0.5)
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.BackgroundTransparency = 1
	name.BorderSizePixel = 0
	name.Position = UDim2.fromScale(0.262, 0.432)
	name.Size = UDim2.fromScale(0.462, 0.37)
	name.ZIndex = 999999999

	local uIAspectRatioConstraint12 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint12.Name = "uIAspectRatioConstraint12"
	uIAspectRatioConstraint12.AspectRatio = 10.4
	uIAspectRatioConstraint12.Parent = name

	local uITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
	uITextSizeConstraint3.Name = "uITextSizeConstraint3"
	uITextSizeConstraint3.MaxTextSize = 22
	uITextSizeConstraint3.Parent = name

	name.Parent = headControl

	local frameControl = Instance.new("Frame")
	frameControl.Name = "frameControl"
	frameControl.AnchorPoint = Vector2.new(0.5, 0.5)
	frameControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	frameControl.BackgroundTransparency = 1
	frameControl.BorderSizePixel = 0
	frameControl.Position = UDim2.fromScale(0.817, 0.436)
	frameControl.Size = UDim2.fromScale(0.366, 0.873)
	frameControl.ZIndex = 999999999

	local close = Instance.new("ImageButton")
	close.Name = "close"
	close.Image = "rbxassetid://3926305904"
	close.ImageRectOffset = Vector2.new(924, 724)
	close.ImageRectSize = Vector2.new(36, 36)
	close.AnchorPoint = Vector2.new(0.5, 0.5)
	close.BackgroundTransparency = 1
	close.Position = UDim2.fromScale(0.86, 0.5)
	close.Size = UDim2.fromScale(0.15, 0.568)
	close.ZIndex = 999999999

	local uIAspectRatioConstraint13 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint13.Name = "uIAspectRatioConstraint13"
	uIAspectRatioConstraint13.Parent = close

	close.Parent = frameControl

	local uIAspectRatioConstraint14 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint14.Name = "uIAspectRatioConstraint14"
	uIAspectRatioConstraint14.AspectRatio = 3.51
	uIAspectRatioConstraint14.Parent = frameControl

	frameControl.Parent = headControl

	local uIAspectRatioConstraint15 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint15.Name = "uIAspectRatioConstraint15"
	uIAspectRatioConstraint15.AspectRatio = 8.37
	uIAspectRatioConstraint15.Parent = headControl

	local line1 = Instance.new("Frame")
	line1.Name = "line1"
	line1.AnchorPoint = Vector2.new(0.5, 0.5)
	line1.BackgroundColor3 = Color3.fromRGB(86, 196, 255)
	line1.BorderSizePixel = 0
	line1.Position = UDim2.fromScale(0.5, 0.825)
	line1.Size = UDim2.fromOffset(467, 1)
	line1.Parent = headControl

	headControl.Parent = main

	local uIAspectRatioConstraint16 = Instance.new("UIAspectRatioConstraint")
	uIAspectRatioConstraint16.Name = "uIAspectRatioConstraint16"
	uIAspectRatioConstraint16.AspectRatio = 1.05
	uIAspectRatioConstraint16.Parent = main

	main.Parent = roseLib
	
	RoseLibrary:Drag(headControl, main)
	
	searchText.Focused:Connect(function()
		line:TweenSize(UDim2.new(1, 0,0.103, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .4)
	end)
	searchText.FocusLost:Connect(function()
		line:TweenSize(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .4)
	end)
	
	local Tabs = {}
	Tabs.First = true
	
	function Tabs:CreateTab(tName)
		local tabButton = Instance.new("Frame")
		tabButton.Name = tName
		tabButton.AnchorPoint = Vector2.new(0.5, 0.5)
		tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabButton.BackgroundTransparency = 1
		tabButton.BorderSizePixel = 0
		tabButton.Position = UDim2.fromScale(0.475, 0.066)
		tabButton.Size = UDim2.new(0.95, 0, 0, 35)
		tabButton.ZIndex = 999999999

		local icon = Instance.new("ImageLabel")
		icon.Name = "icon"
		icon.Image = "rbxassetid://7734040271"
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.BackgroundTransparency = 1
		icon.Position = UDim2.fromScale(0.1, 0.5)
		icon.Size = UDim2.fromScale(0.133, 0.714)
		icon.ZIndex = 999999999

		local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		uIAspectRatioConstraint.Name = "uIAspectRatioConstraint"
		uIAspectRatioConstraint.Parent = icon

		icon.Parent = tabButton

		local tabText = Instance.new("TextLabel")
		tabText.Name = "tabText"
		tabText.Font = Enum.Font.SourceSansBold
		tabText.Text = tName
		tabText.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabText.TextScaled = true
		tabText.TextSize = 16
		tabText.TextWrapped = true
		tabText.TextXAlignment = Enum.TextXAlignment.Left
		tabText.AnchorPoint = Vector2.new(0.5, 0.5)
		tabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabText.BackgroundTransparency = 1
		tabText.BorderColor3 = Color3.fromRGB(27, 42, 53)
		tabText.BorderSizePixel = 0
		tabText.Position = UDim2.fromScale(0.57, 0.5)
		tabText.Size = UDim2.fromScale(0.755, 0.714)
		tabText.ZIndex = 999999999

		local uIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
		uIAspectRatioConstraint1.Name = "uIAspectRatioConstraint1"
		uIAspectRatioConstraint1.AspectRatio = 5.68
		uIAspectRatioConstraint1.Parent = tabText

		local uITextSizeConstraint = Instance.new("UITextSizeConstraint")
		uITextSizeConstraint.Name = "uITextSizeConstraint"
		uITextSizeConstraint.MaxTextSize = 16
		uITextSizeConstraint.Parent = tabText

		tabText.Parent = tabButton

		local interact = Instance.new("TextButton")
		interact.Name = "interact"
		interact.Font = Enum.Font.SourceSans
		interact.Text = ""
		interact.TextColor3 = Color3.fromRGB(0, 0, 0)
		interact.TextSize = 14
		interact.AutoButtonColor = false
		interact.AnchorPoint = Vector2.new(0.5, 0.5)
		interact.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
		interact.BackgroundTransparency = 0.05
		interact.BorderSizePixel = 0
		interact.Position = UDim2.fromScale(0.5, 0.5)
		interact.Size = UDim2.fromScale(1, 1)
		interact.ZIndex = 99999999

		local uICorner = Instance.new("UICorner")
		uICorner.Name = "uICorner"
		uICorner.CornerRadius = UDim.new(0, 5)
		uICorner.Parent = interact

		interact.Parent = tabButton

		local uIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
		uIAspectRatioConstraint2.Name = "uIAspectRatioConstraint2"
		uIAspectRatioConstraint2.AspectRatio = 5.37
		uIAspectRatioConstraint2.Parent = tabButton

		local tip = Instance.new("Frame")
		tip.Name = "tip"
		tip.AnchorPoint = Vector2.new(0.5, 0.5)
		tip.BackgroundColor3 = Color3.fromRGB(75, 188, 247)
		tip.BorderSizePixel = 0
		tip.Position = UDim2.fromScale(0.01, 0.5)
		tip.ZIndex = 999999999

		local uICorner1 = Instance.new("UICorner")
		uICorner1.Name = "uICorner1"
		uICorner1.Parent = tip

		local uIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
		uIAspectRatioConstraint3.Name = "uIAspectRatioConstraint3"
		uIAspectRatioConstraint3.AspectRatio = 0.364
		uIAspectRatioConstraint3.Parent = tip

		tip.Parent = tabButton
		
		if Tabs.First then
			RoseLibrary:Tween(interact, {BackgroundColor3 = Color3.fromRGB(47, 50, 56)}, .3)
			icon:TweenPosition(UDim2.new(0.139, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
			RoseLibrary:Tween(icon, {ImageColor3 = Color3.fromRGB(86, 196, 255)}, .3)
			wait(0.1)
			tip:TweenSize(UDim2.new(0.047, 0, 0.698, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .3)
		end
	end
	return Tabs
end

return RoseLibrary
