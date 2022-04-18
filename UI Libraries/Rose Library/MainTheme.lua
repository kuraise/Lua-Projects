local RoseLibrary = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

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
	
	local RoseLib = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ItemControl = Instance.new("Frame")
	local Search = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Line = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local search = Instance.new("ImageButton")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local SearchText = Instance.new("TextBox")
	local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
	local Holder = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Icon_2 = Instance.new("ImageLabel")
	local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
	local TabText_2 = Instance.new("TextLabel")
	local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
	local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
	local Interact_2 = Instance.new("TextButton")
	local UICorner_6 = Instance.new("UICorner")
	local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
	local Tip_2 = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
	local HeadControl = Instance.new("Frame")
	local Name = Instance.new("TextLabel")
	local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
	local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
	local FrameControl = Instance.new("Frame")
	local close = Instance.new("ImageButton")
	local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
	local Line_2 = Instance.new("Frame")
	local UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint")

	RoseLib.Name = n
	RoseLib.Parent = game.CoreGui
	RoseLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	RoseLib.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = RoseLib
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
	Main.Position = UDim2.new(0.499739647, 0, 0.539928496, 0)
	Main.Size = UDim2.new(0.243229166, 0, 0.529201448, 0)
	Main.ZIndex = 999999999

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Main

	ItemControl.Name = "ItemControl"
	ItemControl.Parent = Main
	ItemControl.AnchorPoint = Vector2.new(0.5, 0.5)
	ItemControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ItemControl.BackgroundTransparency = 1.000
	ItemControl.BorderSizePixel = 0
	ItemControl.Position = UDim2.new(0.205562487, 0, 0.569571137, 0)
	ItemControl.Size = UDim2.new(0.411124915, 0, 0.860857666, 0)
	ItemControl.ZIndex = 999999999

	Search.Name = "Search"
	Search.Parent = ItemControl
	Search.AnchorPoint = Vector2.new(0.5, 0.5)
	Search.BackgroundColor3 = Color3.fromRGB(30, 31, 32)
	Search.BorderSizePixel = 0
	Search.ClipsDescendants = true
	Search.Position = UDim2.new(0.50000006, 0, 0.0431511216, 0)
	Search.Size = UDim2.new(0.886724412, 0, 0.0751754418, 0)
	Search.ZIndex = 999999999

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Search

	Line.Name = "Line"
	Line.Parent = Search
	Line.AnchorPoint = Vector2.new(0.5, 0.5)
	Line.BackgroundColor3 = Color3.fromRGB(70, 174, 227)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0.499626368, 0, 0.931034505, 0)
	Line.ZIndex = 999999999

	UICorner_3.CornerRadius = UDim.new(0, 2)
	UICorner_3.Parent = Line

	UIAspectRatioConstraint.Parent = Line
	UIAspectRatioConstraint.AspectRatio = 63.000

	search.Name = "search"
	search.Parent = Search
	search.AnchorPoint = Vector2.new(0.5, 0.5)
	search.BackgroundTransparency = 1.000
	search.Position = UDim2.new(0.930000007, 0, 0.5, 0)
	search.Size = UDim2.new(0.0899470896, 0, 0.586206913, 0)
	search.ZIndex = 999999999
	search.Image = "rbxassetid://3926305904"
	search.ImageRectOffset = Vector2.new(964, 324)
	search.ImageRectSize = Vector2.new(36, 36)

	UIAspectRatioConstraint_2.Parent = search

	SearchText.Name = "SearchText"
	SearchText.Parent = Search
	SearchText.AnchorPoint = Vector2.new(0.5, 0.5)
	SearchText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchText.BackgroundTransparency = 1.000
	SearchText.BorderSizePixel = 0
	SearchText.Position = UDim2.new(0.402380884, 0, 0.5, 0)
	SearchText.Size = UDim2.new(0.751322746, 0, 0.862068951, 0)
	SearchText.ZIndex = 999999999
	SearchText.Font = Enum.Font.SourceSansBold
	SearchText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	SearchText.PlaceholderText = "Search for a tab"
	SearchText.Text = ""
	SearchText.TextColor3 = Color3.fromRGB(255, 255, 255)
	SearchText.TextScaled = true
	SearchText.TextSize = 14.000
	SearchText.TextWrapped = true
	SearchText.TextXAlignment = Enum.TextXAlignment.Left

	UIAspectRatioConstraint_3.Parent = SearchText
	UIAspectRatioConstraint_3.AspectRatio = 5.680

	UITextSizeConstraint.Parent = SearchText
	UITextSizeConstraint.MaxTextSize = 14

	UIAspectRatioConstraint_4.Parent = Search
	UIAspectRatioConstraint_4.AspectRatio = 5.925

	Holder.Name = "Holder"
	Holder.Parent = ItemControl
	Holder.Active = true
	Holder.AnchorPoint = Vector2.new(0.5, 0.5)
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.524999976, 0, 0.550000012, 0)
	Holder.Size = UDim2.new(0.928949416, 0, 0.830392838, 0)
	Holder.ZIndex = 999999999
	Holder.ScrollBarThickness = 2

	UIListLayout.Parent = Holder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	UIAspectRatioConstraint_13.Parent = Holder
	UIAspectRatioConstraint_13.AspectRatio = 0.562

	UIAspectRatioConstraint_14.Parent = ItemControl
	UIAspectRatioConstraint_14.AspectRatio = 0.502

	HeadControl.Name = "HeadControl"
	HeadControl.Parent = Main
	HeadControl.AnchorPoint = Vector2.new(0.5, 0.5)
	HeadControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeadControl.BackgroundTransparency = 1.000
	HeadControl.BorderSizePixel = 0
	HeadControl.Position = UDim2.new(0.5, 0, 0.0628239363, 0)
	HeadControl.Size = UDim2.new(0.999999881, 0, 0.125647873, 0)
	HeadControl.ZIndex = 999999999

	Name.Name = "Name"
	Name.Parent = HeadControl
	Name.AnchorPoint = Vector2.new(0.5, 0.5)
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.BorderSizePixel = 0
	Name.Position = UDim2.new(0.261593193, 0, 0.431565911, 0)
	Name.Size = UDim2.new(0.461804569, 0, 0.370130599, 0)
	Name.ZIndex = 999999999
	Name.Font = Enum.Font.SourceSansBold
	Name.Text = RoseLibrary.MainName
	Name.TextColor3 = Color3.fromRGB(86, 196, 255)
	Name.TextScaled = true
	Name.TextSize = 22.000
	Name.TextWrapped = true
	Name.TextXAlignment = Enum.TextXAlignment.Left

	UIAspectRatioConstraint_15.Parent = Name
	UIAspectRatioConstraint_15.AspectRatio = 10.444

	UITextSizeConstraint_4.Parent = Name
	UITextSizeConstraint_4.MaxTextSize = 22

	FrameControl.Name = "FrameControl"
	FrameControl.Parent = HeadControl
	FrameControl.AnchorPoint = Vector2.new(0.5, 0.5)
	FrameControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FrameControl.BackgroundTransparency = 1.000
	FrameControl.BorderSizePixel = 0
	FrameControl.Position = UDim2.new(0.816738844, 0, 0.43635571, 0)
	FrameControl.Size = UDim2.new(0.365795344, 0, 0.872711539, 0)
	FrameControl.ZIndex = 999999999

	close.Name = "close"
	close.Parent = FrameControl
	close.AnchorPoint = Vector2.new(0.5, 0.5)
	close.BackgroundTransparency = 1.000
	close.Position = UDim2.new(0.860000014, 0, 0.5, 0)
	close.Size = UDim2.new(0.150379702, 0, 0.568181872, 0)
	close.ZIndex = 999999999
	close.Image = "rbxassetid://3926305904"
	close.ImageRectOffset = Vector2.new(924, 724)
	close.ImageRectSize = Vector2.new(36, 36)

	UIAspectRatioConstraint_16.Parent = close

	UIAspectRatioConstraint_17.Parent = FrameControl
	UIAspectRatioConstraint_17.AspectRatio = 3.509

	UIAspectRatioConstraint_18.Parent = HeadControl
	UIAspectRatioConstraint_18.AspectRatio = 8.371

	Line_2.Name = "Line"
	Line_2.Parent = HeadControl
	Line_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Line_2.BackgroundColor3 = Color3.fromRGB(86, 196, 255)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(0.5, 0, 0.824999988, 0)
	Line_2.Size = UDim2.new(1.00000012, 0, 0.0179251134, 0)

	UIAspectRatioConstraint_19.Parent = Line_2
	UIAspectRatioConstraint_19.AspectRatio = 467.000

	UIAspectRatioConstraint_20.Parent = Main
	UIAspectRatioConstraint_20.AspectRatio = 1.052
	
	local Tabs = {}
	Tabs.First = true
	
	function Tabs:CreateTab(tName)
		tName = tName or "Unnamed Button"
		local TabButton = Instance.new("Frame")
		
		TabButton.Name = "TabButton"
		TabButton.Parent = Holder
		TabButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 1.000
		TabButton.BorderSizePixel = 0
		TabButton.Position = UDim2.new(0.475180268, 0, 0.0660376176, 0)
		TabButton.Size = UDim2.new(0.949999988, 0, 0, 35)
		TabButton.ZIndex = 999999999

		Icon_2.Name = "Icon"
		Icon_2.Parent = TabButton
		Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon_2.BackgroundTransparency = 1.000
		Icon_2.Position = UDim2.new(0.100000001, 0, 0.5, 0)
		Icon_2.Size = UDim2.new(0.132908031, 0, 0.714285731, 0)
		Icon_2.ZIndex = 999999999
		Icon_2.Image = "rbxassetid://7734040271"

		UIAspectRatioConstraint_9.Parent = Icon_2

		TabText_2.Name = tName
		TabText_2.Parent = TabButton
		TabText_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TabText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabText_2.BackgroundTransparency = 1.000
		TabText_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TabText_2.BorderSizePixel = 0
		TabText_2.Position = UDim2.new(0.569999993, 0, 0.5, 0)
		TabText_2.Size = UDim2.new(0.754917622, 0, 0.714285731, 0)
		TabText_2.ZIndex = 999999999
		TabText_2.Font = Enum.Font.SourceSansBold
		TabText_2.Text = tName
		TabText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabText_2.TextScaled = true
		TabText_2.TextSize = 16.000
		TabText_2.TextWrapped = true
		TabText_2.TextXAlignment = Enum.TextXAlignment.Left

		UIAspectRatioConstraint_10.Parent = TabText_2
		UIAspectRatioConstraint_10.AspectRatio = 5.680

		UITextSizeConstraint_3.Parent = TabText_2
		UITextSizeConstraint_3.MaxTextSize = 16

		Interact_2.Name = "Interact"
		Interact_2.Parent = TabButton
		Interact_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Interact_2.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
		Interact_2.BackgroundTransparency = 0.050
		Interact_2.BorderSizePixel = 0
		Interact_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Interact_2.Size = UDim2.new(1, 0, 1, 0)
		Interact_2.ZIndex = 99999999
		Interact_2.AutoButtonColor = false
		Interact_2.Font = Enum.Font.SourceSans
		Interact_2.Text = ""
		Interact_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Interact_2.TextSize = 14.000

		UICorner_6.CornerRadius = UDim.new(0, 5)
		UICorner_6.Parent = Interact_2

		UIAspectRatioConstraint_11.Parent = TabButton
		UIAspectRatioConstraint_11.AspectRatio = 5.374

		Tip_2.Name = "Tip"
		Tip_2.Parent = TabButton
		Tip_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Tip_2.BackgroundColor3 = Color3.fromRGB(75, 188, 247)
		Tip_2.BorderSizePixel = 0
		Tip_2.Position = UDim2.new(0.00999999978, 0, 0.5, 0)
		Tip_2.ZIndex = 999999999

		UICorner_7.Parent = Tip_2

		UIAspectRatioConstraint_12.Parent = Tip_2
		UIAspectRatioConstraint_12.AspectRatio = 0.364
		
		if Tabs.First then
			RoseLibrary:Tween(Interact_2, {BackgroundColor3 = Color3.fromRGB(47, 50, 56)}, .3)
			Icon_2:TweenPosition(UDim2.new(0.139, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
			RoseLibrary:Tween(Icon_2, {ImageColor3 = Color3.fromRGB(86, 196, 255)}, .3)
			TabText_2:TweenPosition(UDim2.new(0.617, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
			wait(0.1)
			Tip_2:TweenSize(UDim2.new(0.047, 0,0.698, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
			Tabs.First = false
		end
		
		for y,e in pairs(ItemControl:GetChildren()) do
			if e:IsA("Frame") then
				e.Interact.MouseButton1Click:Connect(function()
					for k,j in pairs(ItemControl:GetChildren()) do
						if j:IsA("Frame") then
							if j.Name ~= e.Name then
								Tip_2:TweenSize(UDim2.new(0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
								wait(0.1)
								TabText_2:TweenPosition(UDim2.new(0.57, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
								RoseLibrary:Tween(Icon_2, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .3)
								Icon_2:TweenPosition(UDim2.new(0.1, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
								RoseLibrary:Tween(Interact_2, {BackgroundColor3 = Color3.fromRGB(30, 32, 36)}, .3)
							else
								for rat, s in pairs(ItemControl:GetChildren()) do
									if s:IsA("Frame") and s.Name ~= e.Name then
										RoseLibrary:Tween(s.Interact, {BackgroundColor3 = Color3.fromRGB(47, 50, 56)}, .3)
										s.Icon:TweenPosition(UDim2.new(0.139, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
										RoseLibrary:Tween(s.Icon, {ImageColor3 = Color3.fromRGB(86, 196, 255)}, .3)
										s.TabText:TweenPosition(UDim2.new(0.617, 0,0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
										wait(0.1)
										s.Tip:TweenSize(UDim2.new(0.047, 0,0.698, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .3)
									end
								end
							end
						end
					end
				end)
			end
		end
	end
	return Tabs
end

return RoseLibrary
