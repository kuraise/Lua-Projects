local Rose_Library = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local http = game:GetService("HttpService")
local mouse = game.Players.LocalPlayer:GetMouse()
local userIS = game:GetService("UserInputService")

function Rose_Library:rString()
	local l = math.random(5,35)
	local a = {}
	for v = 1, l do
		a[v] = string.char(math.random(35,130))
	end
	return table.concat(a)
end

function Rose_Library:LoadThemeFromHTTP(site)
    local app = syn.request({Url = site, Method = "GET", Headers = {["Content-Type"] = "application/json"}})
    http:JSONDecode(app)
end

function Rose_Library:Drag(f, p)
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

function Rose_Library:Tween(o, p, d, ...)
    tween:Create(o, tweeninfo(d, ...), p):Play()
end

function Rose_Library:Load(n, p, l)
    p = p or false
    n = n or "UnnamedLibrary"
    local name = n
    for g,gui in pairs(game.CoreGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            for y,i in pairs(gui:GetDescendants()) do
                if i:IsA("TextLabel") then
                    if i.Text == "<b>"..name.."</b>" then
                        gui:Destroy()
                    else
                        break
                    end
                end
            end
        end
    end
    if p == true then
        n = Rose_Library:rString()
    end
    

    local RoseLib = Instance.new("ScreenGui")
    local MainUI = Instance.new("Frame")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local Top = Instance.new("Frame")
    local Info = Instance.new("Frame")
    local Image = Instance.new("ImageLabel")
    local UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint")
    local Text = Instance.new("TextLabel")
    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
    local FrameSettings = Instance.new("Frame")
    local Close = Instance.new("Frame")
    local Interact = Instance.new("TextButton")
    local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
    local Logo = Instance.new("ImageButton")
    local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
    local Minimize = Instance.new("Frame")
    local Interact_2 = Instance.new("TextButton")
    local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
    local Logo_2 = Instance.new("ImageButton")
    local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
    local MidTop = Instance.new("Frame")
    local ItemControl = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
    local CenterBottom = Instance.new("Frame")
    local TabControl = Instance.new("Frame")
    local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
    local ConfirmClose = Instance.new("Frame")
    local Header = Instance.new("TextLabel")
    local UIAspectRatioConstraint_37 = Instance.new("UIAspectRatioConstraint")
    local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
    local Paragraph = Instance.new("TextLabel")
    local UIAspectRatioConstraint_38 = Instance.new("UIAspectRatioConstraint")
    local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
    local Accept = Instance.new("TextButton")
    local UIAspectRatioConstraint_39 = Instance.new("UIAspectRatioConstraint")
    local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
    local Decline = Instance.new("TextButton")
    local UIAspectRatioConstraint_40 = Instance.new("UIAspectRatioConstraint")
    local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
    local UIAspectRatioConstraint_41 = Instance.new("UIAspectRatioConstraint")
    
    RoseLib.Name = n
    RoseLib.Parent = game.CoreGui
    RoseLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainUI.Name = "MainUI"
    MainUI.Parent = RoseLib
    MainUI.AnchorPoint = Vector2.new(0.5, 0.5)
    MainUI.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    MainUI.BorderColor3 = Color3.fromRGB(36, 38, 43)
    MainUI.BorderSizePixel = 3
    MainUI.Position = UDim2.new(0.499739587, 0, 0.5, 0)
    MainUI.Size = UDim2.new(0.222395837, 0, 0.539928496, 0)
    MainUI.ZIndex = 99999999

    UIAspectRatioConstraint_1.Parent = MainUI
    UIAspectRatioConstraint_1.AspectRatio = 0.943

    Top.Name = "Top"
    Top.Parent = MainUI
    Top.AnchorPoint = Vector2.new(0.5, 0.5)
    Top.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    Top.BorderColor3 = Color3.fromRGB(36, 38, 43)
    Top.BorderSizePixel = 2
    Top.Position = UDim2.new(0.498829037, 0, 0.0441501103, 0)
    Top.Size = UDim2.new(1, 0, 0.0905077234, 0)
    Top.ZIndex = 99999999

    Rose_Library:Drag(Top, MainUI)

    Info.Name = "Info"
    Info.Parent = Top
    Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Info.BackgroundTransparency = 1.000
    Info.BorderSizePixel = 0
    Info.Size = UDim2.new(0.433255255, 0, 1, 0)
    Info.ZIndex = 99999999

    Image.Name = "Image"
    Image.Parent = Info
    Image.AnchorPoint = Vector2.new(0.5, 0.5)
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.BorderSizePixel = 0
    Image.Position = UDim2.new(0.129999995, 0, 0.5, 0)
    Image.Size = UDim2.new(0.270270258, 0, 1.097561, 0)
    Image.ZIndex = 99999999
    Image.Image = l
    Image.ScaleType = Enum.ScaleType.Stretch

    UIAspectRatioConstraint.Parent = Image
    UIAspectRatioConstraint.AspectRatio = 1.111

    Text.Name = "Text"
    Text.Parent = Info
    Text.AnchorPoint = Vector2.new(0.5, 0.5)
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.BorderSizePixel = 0
    Text.Position = UDim2.new(0.610000014, 0, 0.5, 0)
    Text.Size = UDim2.new(0.724324346, 0, 0.51219511, 0)
    Text.RichText = true
    Text.ZIndex = 99999999
    Text.Font = Enum.Font.Ubuntu
    Text.Text = "<b>"..name.."</b>"
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextScaled = true
    Text.TextSize = 16.000
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left

    UIAspectRatioConstraint_2.Parent = Text
    UIAspectRatioConstraint_2.AspectRatio = 6.381

    UITextSizeConstraint.Parent = Text
    UITextSizeConstraint.MaxTextSize = 16

    UIAspectRatioConstraint_3.Parent = Info
    UIAspectRatioConstraint_3.AspectRatio = 4.512

    FrameSettings.Name = "FrameSettings"
    FrameSettings.Parent = Top
    FrameSettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    FrameSettings.BackgroundTransparency = 1.000
    FrameSettings.BorderSizePixel = 0
    FrameSettings.Position = UDim2.new(0.566744745, 0, -0.048780486, 0)
    FrameSettings.Size = UDim2.new(0.433255255, 0, 1, 0)
    FrameSettings.ZIndex = 99999999

    Close.Name = "Close"
    Close.Parent = FrameSettings
    Close.AnchorPoint = Vector2.new(0.5, 0.5)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.879999995, 0, 0.5, 0)
    Close.Size = UDim2.new(0.162162155, 0, 0.731707335, 0)
    Close.ZIndex = 99999999

    Interact.Name = "Interact"
    Interact.Parent = Close
    Interact.AnchorPoint = Vector2.new(0.5, 0.5)
    Interact.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    Interact.BorderSizePixel = 0
    Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
    Interact.Size = UDim2.new(1, 0, 1, 0)
    Interact.ZIndex = 99999999
    Interact.AutoButtonColor = false
    Interact.Font = Enum.Font.Ubuntu
    Interact.Text = ""
    Interact.TextColor3 = Color3.fromRGB(255, 255, 255)
    Interact.TextSize = 14.000

    UIAspectRatioConstraint_4.Parent = Interact
    UIAspectRatioConstraint_4.AspectRatio = 1.000

    UIAspectRatioConstraint_5.Parent = Close
    UIAspectRatioConstraint_5.AspectRatio = 1.000

    Logo.Name = "Logo"
    Logo.Parent = Close
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundTransparency = 1.000
    Logo.LayoutOrder = 3
    Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
    Logo.Size = UDim2.new(0.833333373, 0, 0.833333313, 0)
    Logo.ZIndex = 99999999
    Logo.Image = "rbxassetid://3926305904"
    Logo.ImageColor3 = Color3.fromRGB(190, 190, 190)
    Logo.ImageRectOffset = Vector2.new(924, 724)
    Logo.ImageRectSize = Vector2.new(36, 36)

    UIAspectRatioConstraint_6.Parent = Logo
    UIAspectRatioConstraint_6.AspectRatio = 1.000

    Minimize.Name = "Minimize"
    Minimize.Parent = FrameSettings
    Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
    Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.680000007, 0, 0.5, 0)
    Minimize.Size = UDim2.new(0.162162155, 0, 0.731707335, 0)
    Minimize.ZIndex = 99999999

    Interact_2.Name = "Interact"
    Interact_2.Parent = Minimize
    Interact_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Interact_2.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    Interact_2.BorderSizePixel = 0
    Interact_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Interact_2.Size = UDim2.new(1, 0, 1, 0)
    Interact_2.ZIndex = 99999999
    Interact_2.AutoButtonColor = false
    Interact_2.Font = Enum.Font.Ubuntu
    Interact_2.Text = ""
    Interact_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Interact_2.TextSize = 14.000

    UIAspectRatioConstraint_7.Parent = Interact_2
    UIAspectRatioConstraint_7.AspectRatio = 1.000

    Logo_2.Name = "Logo"
    Logo_2.Parent = Minimize
    Logo_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo_2.BackgroundTransparency = 1.000
    Logo_2.LayoutOrder = 5
    Logo_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Logo_2.Size = UDim2.new(0.833333373, 0, 0.833333313, 0)
    Logo_2.ZIndex = 99999999
    Logo_2.Image = "rbxassetid://3926307971"
    Logo_2.ImageColor3 = Color3.fromRGB(190, 190, 190)
    Logo_2.ImageRectOffset = Vector2.new(884, 284)
    Logo_2.ImageRectSize = Vector2.new(36, 36)

    UIAspectRatioConstraint_8.Parent = Logo_2

    UIAspectRatioConstraint_9.Parent = Minimize
    UIAspectRatioConstraint_9.AspectRatio = 1.000

    UIAspectRatioConstraint_10.Parent = FrameSettings
    UIAspectRatioConstraint_10.AspectRatio = 4.512

    UIAspectRatioConstraint_11.Parent = Top
    UIAspectRatioConstraint_11.AspectRatio = 10.415

    MidTop.Name = "Mid-Top"
    MidTop.Parent = MainUI
    MidTop.AnchorPoint = Vector2.new(0.5, 0.5)
    MidTop.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    MidTop.BorderColor3 = Color3.fromRGB(36, 38, 43)
    MidTop.BorderSizePixel = 2
    MidTop.Position = UDim2.new(0.5, 0, 0.153602645, 0)
    MidTop.Size = UDim2.new(1, 0, 0.121412806, 0)
    MidTop.ZIndex = 99999999

    ItemControl.Name = "ItemControl"
    ItemControl.Parent = MidTop
    ItemControl.AnchorPoint = Vector2.new(0.5, 0.5)
    ItemControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ItemControl.BackgroundTransparency = 1.000
    ItemControl.BorderSizePixel = 0
    ItemControl.Position = UDim2.new(0.500351369, 0, 0.5, 0)
    ItemControl.Size = UDim2.new(0.963231981, 0, 1, 0)
    ItemControl.ZIndex = 99999999

    UIListLayout.Parent = ItemControl
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    UIAspectRatioConstraint_11.Parent = MidTop
    UIAspectRatioConstraint_11.AspectRatio = 7.764
    
    UIAspectRatioConstraint_12.Parent = ItemControl
    UIAspectRatioConstraint_12.AspectRatio = 7.478

    CenterBottom.Name = "Center-Bottom"
    CenterBottom.Parent = MainUI
    CenterBottom.AnchorPoint = Vector2.new(0.5, 0.5)
    CenterBottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CenterBottom.BackgroundTransparency = 1.000
    CenterBottom.BorderSizePixel = 0
    CenterBottom.Position = UDim2.new(0.498829037, 0, 0.607064009, 0)
    CenterBottom.Size = UDim2.new(1, 0, 0.785871983, 0)
    CenterBottom.ZIndex = 99999999

    TabControl.Name = "TabControl"
    TabControl.Parent = CenterBottom
    TabControl.AnchorPoint = Vector2.new(0.5, 0.5)
    TabControl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabControl.BackgroundTransparency = 1.000
    TabControl.BorderSizePixel = 0
    TabControl.Position = UDim2.new(0.5, 0, 0.5, 0)
    TabControl.Size = UDim2.new(1, 0, 1, 0)
    TabControl.ZIndex = 99999999

    UIAspectRatioConstraint_16.Parent = TabControl
    UIAspectRatioConstraint_16.AspectRatio = 1.199

    UIAspectRatioConstraint_17.Parent = CenterBottom
    UIAspectRatioConstraint_17.AspectRatio = 1.199

    ConfirmClose.Name = "ConfirmClose"
    ConfirmClose.Visible = false
    ConfirmClose.Parent = MainUI
    ConfirmClose.AnchorPoint = Vector2.new(0.5, 0.5)
    ConfirmClose.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
    ConfirmClose.BackgroundTransparency = 1.000
    ConfirmClose.BorderColor3 = Color3.fromRGB(36, 38, 43)
    ConfirmClose.BorderSizePixel = 2
    ConfirmClose.Position = UDim2.new(0.5, 0, 0.349999994, 0)
    ConfirmClose.Size = UDim2.new(0.550000012, 0, 0.300000012, 0)
    ConfirmClose.ZIndex = 999999999

    Header.Name = "Header"
    Header.Parent = ConfirmClose
    Header.AnchorPoint = Vector2.new(0.5, 0.5)
    Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Header.BackgroundTransparency = 1.000
    Header.BorderSizePixel = 0
    Header.Position = UDim2.new(0.51522249, 0, 0.0971302465, 0)
    Header.Size = UDim2.new(0.967, 0,0.194, 0)
    Header.ZIndex = 999999999
    Header.Font = Enum.Font.GothamSemibold
    Header.Text = "Do you want to exit?"
    Header.TextColor3 = Color3.fromRGB(225, 225, 225)
    Header.TextScaled = true
    Header.TextSize = 14.000
    Header.TextTransparency = 1.000
    Header.TextWrapped = true
    Header.TextXAlignment = Enum.TextXAlignment.Left

    UIAspectRatioConstraint_37.Parent = Header
    UIAspectRatioConstraint_37.AspectRatio = 10.318

    UITextSizeConstraint_2.Parent = Header
    UITextSizeConstraint_2.MaxTextSize = 14

    Paragraph.Name = "Paragraph"
    Paragraph.Parent = ConfirmClose
    Paragraph.AnchorPoint = Vector2.new(0.5, 0.5)
    Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph.BackgroundTransparency = 1.000
    Paragraph.BorderSizePixel = 0
    Paragraph.Position = UDim2.new(0.51522249, 0, 0.455215335, 0)
    Paragraph.Size = UDim2.new(0.966574371, 0, 0.451269269, 0)
    Paragraph.ZIndex = 999999999
    Paragraph.Font = Enum.Font.GothamSemibold
    Paragraph.Text = "Are you sure you want to exit "..name.."? Exiting will close this UI and you'll have to re-execute the script"
    Paragraph.TextColor3 = Color3.fromRGB(150, 150, 150)
    Paragraph.TextScaled = true
    Paragraph.TextSize = 13.000
    Paragraph.TextTransparency = 1.000
    Paragraph.TextWrapped = true
    Paragraph.TextXAlignment = Enum.TextXAlignment.Left
    Paragraph.TextYAlignment = Enum.TextYAlignment.Top

    UIAspectRatioConstraint_38.Parent = Paragraph
    UIAspectRatioConstraint_38.AspectRatio = 3.701

    UITextSizeConstraint_2.Parent = Paragraph
    UITextSizeConstraint_2.MaxTextSize = 13

    Accept.Name = "Accept"
    Accept.Parent = ConfirmClose
    Accept.AnchorPoint = Vector2.new(0.5, 0.5)
    Accept.BackgroundColor3 = Color3.fromRGB(26, 27, 31)
    Accept.BackgroundTransparency = 1.000
    Accept.BorderColor3 = Color3.fromRGB(36, 38, 43)
    Accept.BorderSizePixel = 2
    Accept.Position = UDim2.new(0.25, 0, 0.850000024, 0)
    Accept.Size = UDim2.new(0.449999988, 0, 0.25, 0)
    Accept.ZIndex = 999999999
    Accept.AutoButtonColor = false
    Accept.Font = Enum.Font.GothamSemibold
    Accept.Text = "Accept"
    Accept.TextColor3 = Color3.fromRGB(225, 225, 225)
    Accept.TextScaled = true
    Accept.TextSize = 14.000
    Accept.TextTransparency = 1.000
    Accept.TextWrapped = true

    UIAspectRatioConstraint_39.Parent = Accept
    UIAspectRatioConstraint_39.AspectRatio = 3.111

    UITextSizeConstraint_3.Parent = Accept
    UITextSizeConstraint_3.MaxTextSize = 14

    Decline.Name = "Decline"
    Decline.Parent = ConfirmClose
    Decline.AnchorPoint = Vector2.new(0.5, 0.5)
    Decline.BackgroundColor3 = Color3.fromRGB(26, 27, 31)
    Decline.BackgroundTransparency = 1.000
    Decline.BorderColor3 = Color3.fromRGB(36, 38, 43)
    Decline.BorderSizePixel = 2
    Decline.Position = UDim2.new(0.75, 0, 0.850000024, 0)
    Decline.Size = UDim2.new(0.449999988, 0, 0.25, 0)
    Decline.ZIndex = 999999999
    Decline.AutoButtonColor = false
    Decline.Font = Enum.Font.GothamSemibold
    Decline.Text = "Decline"
    Decline.TextColor3 = Color3.fromRGB(225, 225, 225)
    Decline.TextScaled = true
    Decline.TextSize = 14.000
    Decline.TextTransparency = 1.000
    Decline.TextWrapped = true

    UIAspectRatioConstraint_40.Parent = Decline
    UIAspectRatioConstraint_40.AspectRatio = 3.111

    UITextSizeConstraint_4.Parent = Decline
    UITextSizeConstraint_4.MaxTextSize = 14

    UIAspectRatioConstraint_41.Parent = ConfirmClose
    UIAspectRatioConstraint_41.AspectRatio = 1.728

    Close.MouseEnter:Connect(function()
        Rose_Library:Tween(Close.Logo, {ImageColor3 = Color3.fromRGB(190, 29, 31)}, .3)
    end)

    Minimize.MouseEnter:Connect(function()
        Rose_Library:Tween(Minimize.Logo, {ImageColor3 = Color3.fromRGB(190, 157, 36)}, .3)
    end)

    Close.MouseLeave:Connect(function()
        Rose_Library:Tween(Close.Logo, {ImageColor3 = Color3.fromRGB(190, 190, 190)}, .3)
    end)

    Minimize.MouseLeave:Connect(function()
        Rose_Library:Tween(Minimize.Logo, {ImageColor3 = Color3.fromRGB(190, 190, 190)}, .3)
    end)

    Close.Interact.MouseButton1Click:Connect(function()
        ConfirmClose:TweenPosition(UDim2.new(0.5,0,.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .5)
        Rose_Library:Tween(ConfirmClose, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Accept, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Accept, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Decline, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Decline, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Header, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Paragraph, {TextTransparency = 0}, .5)
    end)

    Close.Logo.MouseButton1Click:Connect(function()
        ConfirmClose.Visible = true
        ConfirmClose:TweenPosition(UDim2.new(0.5,0,.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .5)
        Rose_Library:Tween(ConfirmClose, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Accept, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Accept, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Decline, {BackgroundTransparency = 0}, .5)
        Rose_Library:Tween(Decline, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Header, {TextTransparency = 0}, .5)
        Rose_Library:Tween(Paragraph, {TextTransparency = 0}, .5)
    end)
    
    Accept.MouseButton1Click:Connect(function()
        RoseLib:Destroy()
    end)

    Decline.MouseButton1Click:Connect(function()
        ConfirmClose:TweenPosition(UDim2.new(0.5,0,.35,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, .5)
        Rose_Library:Tween(ConfirmClose, {BackgroundTransparency = 1}, .5)
        Rose_Library:Tween(Accept, {BackgroundTransparency = 1}, .5)
        Rose_Library:Tween(Accept, {TextTransparency = 1}, .5)
        Rose_Library:Tween(Decline, {BackgroundTransparency = 1}, .5)
        Rose_Library:Tween(Decline, {TextTransparency = 1}, .5)
        Rose_Library:Tween(Header, {TextTransparency = 1}, .5)
        Rose_Library:Tween(Paragraph, {TextTransparency = 1}, .5)
        task.wait(.1)
        ConfirmClose.Visible = false
    end)

    local Tabs = {}
    Tabs.First = true

    function Tabs:CreateTab(tName, tL, rO, rS)
        tName = tName or 'unnamedTab'
        local Tab = Instance.new("Frame")
        local Interact_3 = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")  
        local Sel = Instance.new("Frame")
        local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
        local Logo_3 = Instance.new("ImageButton")
        local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
        local TabName = Instance.new("Frame")
        local UIAspectRatioConstraint_32 = Instance.new("UIAspectRatioConstraint")

        UIAspectRatioConstraint_32.Parent = TabName
	    UIAspectRatioConstraint_32.AspectRatio = 1.199

        TabName.Name = tName
        TabName.Parent = TabControl
        TabName.AnchorPoint = Vector2.new(0.5, 0.5)
        TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabName.BackgroundTransparency = 1.000
        TabName.BorderSizePixel = 0
        TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabName.Size = UDim2.new(1, 0, 1, 0)
        TabName.ZIndex = 99999999
        TabName.ClipsDescendants = true

        Tab.Name = tName
        Tab.Parent = ItemControl
        Tab.AnchorPoint = Vector2.new(0.5, 0.5)
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.ClipsDescendants = true
        Tab.Position = UDim2.new(0.0692924783, 0, 0.5, 0)
        Tab.Size = UDim2.new(0.138584957, 0, 1, 0)
        Tab.ZIndex = 99999999

        Interact_3.Name = "Interact"
        Interact_3.Parent = Tab
        Interact_3.AnchorPoint = Vector2.new(0.5, 0.5)
        Interact_3.BackgroundColor3 = Color3.fromRGB(23, 24, 27) -- 36, 51, 83
        Interact_3.BackgroundTransparency = 0.400
        Interact_3.BorderSizePixel = 0
        Interact_3.Position = UDim2.new(0.5, 0, 0.5, 0)
        Interact_3.Size = UDim2.new(0.0, 0,0.0, 0)
        Interact_3.ZIndex = 99999999
        Interact_3.AutoButtonColor = false
        Interact_3.Font = Enum.Font.Ubuntu
        Interact_3.Text = ""
        Interact_3.TextColor3 = Color3.fromRGB(255, 255, 255)
        Interact_3.TextSize = 14.000

        UICorner.CornerRadius = UDim.new(1, 0)
        UICorner.Parent = Interact_3

        UIAspectRatioConstraint_13.Parent = Interact_3

        Sel.Name = "Sel"
        Sel.Parent = Tab
        Sel.AnchorPoint = Vector2.new(0.5, 0.5)
        Sel.BackgroundColor3 = Color3.fromRGB(56, 80, 129)
        Sel.BorderSizePixel = 0
        Sel.Position = UDim2.new(0.5, 0, 0.879999995, 0)
        Sel.Size = UDim2.new(0.0, 0, 0.0, 0)
        Sel.ZIndex = 99999999

        UIAspectRatioConstraint_14.Parent = Sel
        UIAspectRatioConstraint_14.AspectRatio = 6.000

        UIAspectRatioConstraint_15.Parent = Tab
        UIAspectRatioConstraint_15.AspectRatio = 1.036

        Logo_3.Name = "Logo"
        Logo_3.Parent = Tab
        Logo_3.AnchorPoint = Vector2.new(0.5, 0.5)
        Logo_3.BackgroundTransparency = 1.000
        Logo_3.LayoutOrder = 3
        Logo_3.Position = UDim2.new(0.491228074, 0, 0.4909091, 0)
        Logo_3.Size = UDim2.new(0.404, 0,0.418, 0)
        Logo_3.ZIndex = 99999999
        Logo_3.Image = tL
        Logo_3.ImageColor3 = Color3.fromRGB(200, 200, 200) -- 34, 85, 173
        Logo_3.ImageRectOffset = rO
        Logo_3.ImageRectSize = rS
        if not Tabs.First then
            TabName.Visible = false
        end

        if Tabs.First then
            task.wait(0.1)
            TabName.Visible = true
            Interact_3.BackgroundColor3 = Color3.fromRGB(36, 51, 83)
            Interact_3:TweenSize(UDim2.new(0.561, 0,0.582, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
            Sel:TweenSize(UDim2.new(0.315789461, 0, 0.0545454547, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
            Rose_Library:Tween(Logo_3, {ImageColor3 = Color3.fromRGB(34, 85, 173)}, .3)
            Tabs.First = false
        end
        for y,e in pairs(ItemControl:GetChildren()) do
            if e:IsA("Frame") then
                e.Logo.MouseButton1Click:Connect(function()
                    for i,v in pairs(ItemControl:GetChildren()) do
                        if v:IsA("Frame") then
                            if v.Name ~= e.Name then
                                Interact_3.BackgroundColor3 = Color3.fromRGB(36, 51, 83)
                                Interact_3:TweenSize(UDim2.new(0.561, 0,0.582, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
                                Sel:TweenSize(UDim2.new(0.315789461, 0, 0.0545454547, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
                                Rose_Library:Tween(Logo_3, {ImageColor3 = Color3.fromRGB(34, 85, 173)}, .3)
                            else
                                for rat, s  in pairs(ItemControl:GetChildren())  do
                                    if s:IsA("Frame") and s.Name ~= e.Name then
                                        s.Interact:TweenSize(UDim2.new(0.0, 0,0.0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
                                        s.Sel:TweenSize(UDim2.new(0.0, 0, 0.0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, .3)
                                        Rose_Library:Tween(s.Logo, {ImageColor3 = Color3.fromRGB(200, 200, 200)}, .3)
                                        s.Interact.BackgroundColor3 = Color3.fromRGB(23, 24, 27)
                                    end
                                end
                            end
                        end
                    end
                    for r,t in next, TabControl:GetChildren() do
                        if t:IsA("Frame") then
                            t.Visible = false
                        end
                    end
                    TabName.Visible = true
                end)
            end
        end

        local Section = {}

        function Section:CreateSection(sName, side)
            sName = sName or 'UnnamedSection'
            if type(side) == 'string' then
                side = side:lower()
            end

            local LeftSide = Instance.new("Frame")
            local UIListLayout_1 = Instance.new("UIListLayout")
            local Sec = Instance.new("Frame")
            local Holder = Instance.new("Frame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIAspectRatioConstraint_33 = Instance.new("UIAspectRatioConstraint")
            local Header = Instance.new("TextLabel")
            local UIAspectRatioConstraint_34 = Instance.new("UIAspectRatioConstraint")
            local UITextSizeConstraint_1 = Instance.new("UITextSizeConstraint")
            local UIAspectRatioConstraint_35 = Instance.new("UIAspectRatioConstraint")
            local UIAspectRatioConstraint_36 = Instance.new("UIAspectRatioConstraint")

            if side == 1 or side == 'left' then
                for i,v in pairs(TabName:GetChildren()) do
                    if v:IsA("Frame") and v.Name == 'LeftSide' then
                        warn('Left Side is already used, try making a new tab...')
                        return
                    else
                        break
                    end
                end

                LeftSide.Name = "LeftSide"
                LeftSide.Parent = TabName
                LeftSide.AnchorPoint = Vector2.new(0.5, 0.5)
                LeftSide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LeftSide.BackgroundTransparency = 1.000
                LeftSide.BorderColor3 = Color3.fromRGB(27, 42, 53)
                LeftSide.BorderSizePixel = 0
                LeftSide.Position = UDim2.new(0.245000005, 0, 0.5, 0)
                LeftSide.Size = UDim2.new(0.459016383, 0, 0.94101125, 0)
                LeftSide.ZIndex = 99999999

                UIListLayout_1.Parent = LeftSide
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_1.Padding = UDim.new(0, 10)

                Sec.Name = "Sec"
                Sec.Parent = LeftSide
                Sec.AnchorPoint = Vector2.new(0.5, 0.5)
                Sec.BackgroundColor3 = Color3.fromRGB(26, 27, 31)
                Sec.BorderColor3 = Color3.fromRGB(36, 38, 43)
                Sec.BorderSizePixel = 2
                Sec.Position = UDim2.new(0.5, 0, 0.5, 0)
                Sec.Size = UDim2.new(1, 0, 1.00149262, 0)
                Sec.ZIndex = 99999999

                Holder.Name = "Holder"
                Holder.Parent = Sec
                Holder.AnchorPoint = Vector2.new(0.5, 0.5)
                Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Holder.BackgroundTransparency = 1.000
                Holder.BorderSizePixel = 0
                Holder.Position = UDim2.new(0.5, 0, 0.546000004, 0)
                Holder.Size = UDim2.new(0.949000001, 0, 0.907000005, 0)
                Holder.ZIndex = 99999999

                UIListLayout_2.Parent = Holder
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 7)

                UIAspectRatioConstraint_33.Parent = Holder
                UIAspectRatioConstraint_33.AspectRatio = 0.611

                Header.Name = "Header"
                Header.Parent = Sec
                Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Header.BackgroundTransparency = 1.000
                Header.BorderSizePixel = 0
                Header.Position = UDim2.new(0.0303061344, 0, 0, 0)
                Header.Size = UDim2.new(0.943877578, 0, 0.0625931397, 0)
                Header.ZIndex = 99999999
                Header.Font = Enum.Font.Ubuntu
                Header.RichText = true
                Header.Text = "<b>"..sName.."</b>"
                Header.TextColor3 = Color3.fromRGB(200, 200, 200)
                Header.TextScaled = true
                Header.TextSize = 14.000
                Header.TextWrapped = true
                Header.TextXAlignment = Enum.TextXAlignment.Left

                UIAspectRatioConstraint_34.Parent = Header
                UIAspectRatioConstraint_34.AspectRatio = 8.810

                UITextSizeConstraint_1.Parent = Header
                UITextSizeConstraint_1.MaxTextSize = 14

                UIAspectRatioConstraint_35.Parent = Sec
                UIAspectRatioConstraint_35.AspectRatio = 0.584

                UIAspectRatioConstraint_36.Parent = LeftSide
                UIAspectRatioConstraint_36.AspectRatio = 0.585
            elseif side == 2 or side == 'right' then

                for i,v in pairs(TabName:GetChildren()) do
                    if v:IsA("Frame") and v.Name == 'RightSide' then
                        warn('Right Side is already used, try making a new tab...')
                        return
                    else
                        break
                    end
                end

                local RightSide = Instance.new("Frame")
                local UIListLayout_1 = Instance.new("UIListLayout")
                local Sec = Instance.new("Frame")
                local Holder = Instance.new("Frame")
                local UIListLayout_2 = Instance.new("UIListLayout")
                local UIAspectRatioConstraint_33 = Instance.new("UIAspectRatioConstraint")
                local Header = Instance.new("TextLabel")
                local UIAspectRatioConstraint_34 = Instance.new("UIAspectRatioConstraint")
                local UITextSizeConstraint_1 = Instance.new("UITextSizeConstraint")
                local UIAspectRatioConstraint_35 = Instance.new("UIAspectRatioConstraint")
                local UIAspectRatioConstraint_36 = Instance.new("UIAspectRatioConstraint")

                RightSide.Name = "RightSide"
                RightSide.Parent = TabName
                RightSide.AnchorPoint = Vector2.new(0.5, 0.5)
                RightSide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                RightSide.BackgroundTransparency = 1.000
                RightSide.BorderColor3 = Color3.fromRGB(27, 42, 53)
                RightSide.BorderSizePixel = 0
                RightSide.Position = UDim2.new(0.76, 0, 0.5, 0)
                RightSide.Size = UDim2.new(0.459016383, 0, 0.94101125, 0)
                RightSide.ZIndex = 99999999

                UIListLayout_1.Parent = RightSide
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_1.Padding = UDim.new(0, 10)

                Sec.Name = "Sec"
                Sec.Parent = RightSide
                Sec.AnchorPoint = Vector2.new(0.5, 0.5)
                Sec.BackgroundColor3 = Color3.fromRGB(26, 27, 31)
                Sec.BorderColor3 = Color3.fromRGB(36, 38, 43)
                Sec.BorderSizePixel = 2
                Sec.Position = UDim2.new(0.5, 0, 0.5, 0)
                Sec.Size = UDim2.new(1, 0, 1.00149262, 0)
                Sec.ZIndex = 99999999

                Holder.Name = "Holder"
                Holder.Parent = Sec
                Holder.AnchorPoint = Vector2.new(0.5, 0.5)
                Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Holder.BackgroundTransparency = 1.000
                Holder.BorderSizePixel = 0
                Holder.Position = UDim2.new(0.5, 0, 0.546000004, 0)
                Holder.Size = UDim2.new(0.949000001, 0, 0.907000005, 0)
                Holder.ZIndex = 99999999

                UIListLayout_2.Parent = Holder
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 7)

                UIAspectRatioConstraint_33.Parent = Holder
                UIAspectRatioConstraint_33.AspectRatio = 0.611

                Header.Name = "Header"
                Header.Parent = Sec
                Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Header.BackgroundTransparency = 1.000
                Header.BorderSizePixel = 0
                Header.Position = UDim2.new(0.03, 0,0, 0)
                Header.Size = UDim2.new(0.949, 0,0.063, 0)
                Header.ZIndex = 99999999
                Header.Font = Enum.Font.Ubuntu
                Header.RichText = true
                Header.Text = "<b>"..sName.."</b>"
                Header.TextColor3 = Color3.fromRGB(200, 200, 200)
                Header.TextScaled = true
                Header.TextSize = 14.000
                Header.TextWrapped = true
                Header.TextXAlignment = Enum.TextXAlignment.Left

                UIAspectRatioConstraint_34.Parent = Header
                UIAspectRatioConstraint_34.AspectRatio = 8.810

                UITextSizeConstraint_1.Parent = Header
                UITextSizeConstraint_1.MaxTextSize = 14

                UIAspectRatioConstraint_35.Parent = Sec
                UIAspectRatioConstraint_35.AspectRatio = 0.584

                UIAspectRatioConstraint_36.Parent = RightSide
                UIAspectRatioConstraint_36.AspectRatio = 0.585
            end

            local Items = {}

            function Items:CreateButton(bName, callback)
                bName = bName or 'UnnamedButton'
                callback = callback or function() end
                local Button = Instance.new("TextButton")
                local txt = Instance.new("TextLabel")
                local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
                local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
                local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

                Button.Name = bName
                Button.Parent = Holder
                Button.AnchorPoint = Vector2.new(0.5, 0.5)
                Button.BackgroundColor3 = Color3.fromRGB(52, 53, 62)
                Button.BorderColor3 = Color3.fromRGB(36, 38, 43)
                Button.Position = UDim2.new(0.0306122452, 0, 0.0995024815, 0)
                Button.Size = UDim2.new(0.950999975, 0, 0.0970000029, 0)
                Button.ZIndex = 99999999
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Ubuntu
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(200, 200, 200)
                Button.TextSize = 14.000
                Button.TextXAlignment = Enum.TextXAlignment.Left

                txt.Name = "txt"
                txt.Parent = Button
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                txt.BackgroundTransparency = 1.000
                txt.BorderSizePixel = 0
                txt.Position = UDim2.new(0.532592773, 0, 0.5, 0)
                txt.Size = UDim2.new(0.959999979, 0, 1, 0)
                txt.ZIndex = 99999999
                txt.Font = Enum.Font.GothamSemibold
                txt.Text = bName
                txt.TextColor3 = Color3.fromRGB(200, 200, 200)
                txt.TextScaled = true
                txt.TextSize = 14.000
                txt.TextWrapped = true
                txt.TextXAlignment = Enum.TextXAlignment.Left

                UITextSizeConstraint.Parent = txt
                UITextSizeConstraint.MaxTextSize = 14

                UIAspectRatioConstraint.Parent = txt
                UIAspectRatioConstraint.AspectRatio = 5.753

                UIAspectRatioConstraint_2.Parent = Button
                UIAspectRatioConstraint_2.AspectRatio = 5.993

                Button.MouseButton1Click:Connect(function()
                    callback()
                end)
            end

            function Items:CreateTextBox(tbName, tbInfo, callback)
                tbName = tbName or 'UnnamedTextbox'
                tbInfo = tbInfo or 'No Info'
                callback = callback or function() end

                local TextBox = Instance.new("TextBox")
                local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
                local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

                TextBox.Name = tbName
                TextBox.Parent = Holder
                TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
                TextBox.BackgroundColor3 = Color3.fromRGB(52, 53, 62)
                TextBox.BorderColor3 = Color3.fromRGB(36, 38, 43)
                TextBox.Size = UDim2.new(0.950999975, 0, 0.0970000029, 0)
                TextBox.ZIndex = 99999999
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.PlaceholderText = tbInfo
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(200, 200, 200)
                TextBox.TextScaled = true
                TextBox.TextSize = 14.000
                TextBox.TextWrapped = true

                UITextSizeConstraint.Parent = TextBox
                UITextSizeConstraint.MaxTextSize = 14

                UIAspectRatioConstraint.Parent = TextBox
                UIAspectRatioConstraint.AspectRatio = 5.993

                TextBox.FocusLost:Connect(function()
                    callback(TextBox.Text)
                end)
            end

            function Items:CreateSlider(slName, minValue, maxValue, callback)
                slName = slName or 'UnnamedSlider'
                minValue = minValue or 0
                maxValue = maxValue or 100
                callback = callback or function() end
                local currentValue = minValue

                local Slider = Instance.new("Frame")
                local Slide = Instance.new("TextButton")
                local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
                local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
                local txt = Instance.new("TextLabel")
                local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
                local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
                local btn = Instance.new("TextButton")

                Slider.Name = "Slider"
                Slider.Parent = Holder
                Slider.AnchorPoint = Vector2.new(0.5, 0.5)
                Slider.BackgroundColor3 = Color3.fromRGB(52, 53, 62)
                Slider.BorderColor3 = Color3.fromRGB(36, 38, 43)
                Slider.Position = UDim2.new(0.464520067, 0, 0.274650007, 0)
                Slider.Size = UDim2.new(0.950523615, 0, 0.096966438, 0)
                Slider.ZIndex = 99999999

                Slide.Name = "Slide"
                Slide.Parent = Slider
                Slide.AnchorPoint = Vector2.new(0.5, 0.5)
                Slide.BackgroundColor3 = Color3.fromRGB(76, 78, 91)
                Slide.BorderSizePixel = 0
                Slide.Position = UDim2.new(0.415721178, 0, 0.497852355, 0)
                Slide.Size = UDim2.new(0.831, 0, 0.996, 0)
                Slide.ZIndex = 999999999
                Slide.AutoButtonColor = false
                Slide.Font = Enum.Font.SourceSans
                Slide.Text = ""
                Slide.TextColor3 = Color3.fromRGB(0, 0, 0)
                Slide.TextSize = 14.000

                UIAspectRatioConstraint.Parent = Slide
                UIAspectRatioConstraint.AspectRatio = 4.982

                UIAspectRatioConstraint_2.Parent = Slider
                UIAspectRatioConstraint_2.AspectRatio = 5.992

                txt.Name = "txt"
                txt.Parent = Slider
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                txt.BackgroundTransparency = 1.000
                txt.Position = UDim2.new(0.5, 0, 0.5, 0)
                txt.Size = UDim2.new(1, 0, 1, 0)
                txt.ZIndex = 999999999
                txt.Font = Enum.Font.GothamSemibold
                txt.Text = slName..": "..currentValue.." / "..maxValue
                txt.TextColor3 = Color3.fromRGB(200, 200, 200)
                txt.TextScaled = true
                txt.TextSize = 14.000
                txt.TextWrapped = true

                UIAspectRatioConstraint_3.Parent = txt
                UIAspectRatioConstraint_3.AspectRatio = 5.992

                UITextSizeConstraint.Parent = txt
                UITextSizeConstraint.MaxTextSize = 14

                btn.Name = "btn"
                btn.Parent = Slider
                btn.AnchorPoint = Vector2.new(0.5, 0.5)
                btn.BackgroundColor3 = Color3.fromRGB(52, 53, 62)
                btn.BorderSizePixel = 0
                btn.Position = UDim2.new(0.5, 0, 0.5, 0)
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.ZIndex = 99999999
                btn.AutoButtonColor = false
                btn.Font = Enum.Font.SourceSans
                btn.Text = ""
                btn.TextColor3 = Color3.fromRGB(0, 0, 0)
                btn.TextSize = 14.000

                btn.MouseButton1Down:Connect(function()
                    currentValue = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 0.831) * btn.AbsoluteSize.X) + tonumber(minValue)) or 0
                    pcall(function()
                        callback(currentValue)
                    end)
                    btn:TweenSize(Udim2.new(math.clamp(mouse.X - btn.AbsolutePosition.X, 0, 0.831), 0, 0.996), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .05, true)
                    local moveconnection = mouse.Move:Connect(function()
                        txt.Text = currentValue
                        currentValue = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 0.831) * btn.AbsoluteSize.X) + tonumber(minValue))
                        pcall(function()
                            callback(currentValue)
                        end)
                        btn:TweenSize(Udim2.new(math.clamp(mouse.X - btn.AbsolutePosition.X, 0, 0.831), 0, 0.996), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .05, true)
                    end)
                end)
            end

            return Items
        end
        return Section
    end
    return Tabs
end
-- rbxassetid://3926305904, 964, 204  36, 36
