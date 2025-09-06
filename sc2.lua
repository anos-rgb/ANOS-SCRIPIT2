local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UltraExploitGUI_" .. math.random(1000, 9999)
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999
if gethui then
    screenGui.Parent = gethui()
else
    screenGui.Parent = CoreGui
end

local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 0
blurEffect.Parent = Lighting

local function createGlassEffect(parent)
    local glassFrame = Instance.new("Frame")
    glassFrame.Size = UDim2.new(1, 0, 1, 0)
    glassFrame.Position = UDim2.new(0, 0, 0, 0)
    glassFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassFrame.BackgroundTransparency = 0.95
    glassFrame.BorderSizePixel = 0
    glassFrame.Parent = parent
    
    local noise = Instance.new("ImageLabel")
    noise.Size = UDim2.new(1, 0, 1, 0)
    noise.BackgroundTransparency = 1
    noise.Image = "rbxassetid://8560915132"
    noise.ImageTransparency = 0.9
    noise.Parent = glassFrame
    
    return glassFrame
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 650)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -325)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 25)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 200, 255)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

local glassEffect = createGlassEffect(mainFrame)

local shadowFrame = Instance.new("Frame")
shadowFrame.Size = UDim2.new(1, 30, 1, 30)
shadowFrame.Position = UDim2.new(0, -15, 0, -15)
shadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadowFrame.BackgroundTransparency = 0.6
shadowFrame.BorderSizePixel = 0
shadowFrame.ZIndex = mainFrame.ZIndex - 1
shadowFrame.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 30)
shadowCorner.Parent = shadowFrame

local outerGlow = Instance.new("Frame")
outerGlow.Size = UDim2.new(1, 60, 1, 60)
outerGlow.Position = UDim2.new(0, -30, 0, -30)
outerGlow.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
outerGlow.BackgroundTransparency = 0.85
outerGlow.BorderSizePixel = 0
outerGlow.ZIndex = mainFrame.ZIndex - 2
outerGlow.Parent = mainFrame

local outerGlowCorner = Instance.new("UICorner")
outerGlowCorner.CornerRadius = UDim.new(0, 35)
outerGlowCorner.Parent = outerGlow

local rainbowGradient = Instance.new("UIGradient")
rainbowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 150)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 255, 0)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 150, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 150))
}
rainbowGradient.Rotation = 0
rainbowGradient.Parent = outerGlow

local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, 80)
headerFrame.Position = UDim2.new(0, 0, 0, 0)
headerFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
headerFrame.BackgroundTransparency = 0.2
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 25)
headerCorner.Parent = headerFrame

local headerGlass = createGlassEffect(headerFrame)

local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(0, 60, 0, 60)
logoFrame.Position = UDim2.new(0, 15, 0, 10)
logoFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
logoFrame.BorderSizePixel = 0
logoFrame.Parent = headerFrame

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 30)
logoCorner.Parent = logoFrame

local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "⚡"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.TextScaled = true
logoText.Font = Enum.Font.GothamBold
logoText.Parent = logoFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 200, 0, 35)
title.Position = UDim2.new(0, 85, 0, 10)
title.BackgroundTransparency = 1
title.Text = "ULTRA EXPLOIT"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = headerFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 200, 0, 20)
subtitle.Position = UDim2.new(0, 85, 0, 45)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Premium Edition v3.0"
subtitle.TextColor3 = Color3.fromRGB(0, 255, 127)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = headerFrame

local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 8, 0, 8)
statusDot.Position = UDim2.new(0, 290, 0, 50)
statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
statusDot.BorderSizePixel = 0
statusDot.Parent = headerFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(0, 4)
dotCorner.Parent = statusDot

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0, 100, 0, 15)
statusText.Position = UDim2.new(0, 305, 0, 47)
statusText.BackgroundTransparency = 1
statusText.Text = "ONLINE"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = headerFrame

local controlsFrame = Instance.new("Frame")
controlsFrame.Size = UDim2.new(0, 110, 0, 35)
controlsFrame.Position = UDim2.new(1, -125, 0, 15)
controlsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
controlsFrame.BackgroundTransparency = 0.3
controlsFrame.BorderSizePixel = 0
controlsFrame.Parent = headerFrame

local controlsCorner = Instance.new("UICorner")
controlsCorner.CornerRadius = UDim.new(0, 17)
controlsCorner.Parent = controlsFrame

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0, 5, 0, 2.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = controlsFrame

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 15)
minimizeCorner.Parent = minimizeBtn

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 40, 0, 2.5)
settingsBtn.BackgroundColor3 = Color3.fromRGB(108, 117, 125)
settingsBtn.Text = "⚙"
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.TextScaled = true
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.BorderSizePixel = 0
settingsBtn.Parent = controlsFrame

local settingsCorner = Instance.new("UICorner")
settingsCorner.CornerRadius = UDim.new(0, 15)
settingsCorner.Parent = settingsBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, 75, 0, 2.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = controlsFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 15)
closeCorner.Parent = closeBtn

local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -20, 0, 50)
tabsFrame.Position = UDim2.new(0, 10, 0, 90)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = mainFrame

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 5)
tabsLayout.Parent = tabsFrame

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -160)
contentFrame.Position = UDim2.new(0, 10, 0, 150)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 127)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
scrollFrame.Parent = contentFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 15)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

local states = {
    speed = false, teleport = false, regen = false, antifall = false,
    fly = false, jump = false, esp = false, noclip = false,
    killaura = false, aimbot = false, wallhack = false, fullbright = false,
    godmode = false, antikick = false, gravity = false, walkwater = false
}

local connections = {}
local originalValues = {
    walkSpeed = humanoid.WalkSpeed,
    jumpPower = humanoid.JumpPower,
    brightness = Lighting.Brightness,
    ambient = Lighting.Ambient
}

local currentTab = "movement"
local movementButtons = {}
local combatButtons = {}
local visualButtons = {}
local miscButtons = {}

local function createTab(text, tabId, layoutOrder)
    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(0, 100, 1, 0)
    tab.BackgroundColor3 = tabId == currentTab and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(30, 30, 40)
    tab.BackgroundTransparency = tabId == currentTab and 0.2 or 0.5
    tab.Text = text
    tab.TextColor3 = tabId == currentTab and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
    tab.TextScaled = true
    tab.Font = Enum.Font.GothamBold
    tab.BorderSizePixel = 0
    tab.LayoutOrder = layoutOrder
    tab.Parent = tabsFrame
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 12)
    tabCorner.Parent = tab
    
    if tabId == currentTab then
        local tabGlow = Instance.new("Frame")
        tabGlow.Size = UDim2.new(1, 10, 1, 10)
        tabGlow.Position = UDim2.new(0, -5, 0, -5)
        tabGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
        tabGlow.BackgroundTransparency = 0.7
        tabGlow.BorderSizePixel = 0
        tabGlow.ZIndex = tab.ZIndex - 1
        tabGlow.Parent = tab
        
        local tabGlowCorner = Instance.new("UICorner")
        tabGlowCorner.CornerRadius = UDim.new(0, 15)
        tabGlowCorner.Parent = tabGlow
    end
    
    return tab
end

function createAdvancedButton(icon, title, description, colorMain, colorAccent, layoutOrder, callback)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, -10, 0, 70)
    buttonFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    buttonFrame.BackgroundTransparency = 0.3
    buttonFrame.BorderSizePixel = 0
    buttonFrame.LayoutOrder = layoutOrder
    buttonFrame.Parent = scrollFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 15)
    buttonCorner.Parent = buttonFrame
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(50, 50, 70)
    buttonStroke.Thickness = 1
    buttonStroke.Transparency = 0.5
    buttonStroke.Parent = buttonFrame
    
    local buttonGlass = createGlassEffect(buttonFrame)
    
    local leftGradient = Instance.new("Frame")
    leftGradient.Size = UDim2.new(0, 5, 1, 0)
    leftGradient.Position = UDim2.new(0, 0, 0, 0)
    leftGradient.BackgroundColor3 = colorMain
    leftGradient.BorderSizePixel = 0
    leftGradient.Parent = buttonFrame
    
    local leftCorner = Instance.new("UICorner")
    leftCorner.CornerRadius = UDim.new(0, 15)
    leftCorner.Parent = leftGradient
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = buttonFrame
    
    local iconFrame = Instance.new("Frame")
    iconFrame.Size = UDim2.new(0, 50, 0, 50)
    iconFrame.Position = UDim2.new(0, 15, 0, 10)
    iconFrame.BackgroundColor3 = colorMain
    iconFrame.BorderSizePixel = 0
    iconFrame.Parent = buttonFrame
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 25)
    iconCorner.Parent = iconFrame
    
    local iconGradient = Instance.new("UIGradient")
    iconGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, colorMain),
        ColorSequenceKeypoint.new(1, colorAccent)
    }
    iconGradient.Rotation = 45
    iconGradient.Parent = iconFrame
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(1, 0, 1, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = iconFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0, 200, 0, 25)
    titleLabel.Position = UDim2.new(0, 75, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = buttonFrame
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(0, 200, 0, 20)
    descLabel.Position = UDim2.new(0, 75, 0, 35)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = description
    descLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    descLabel.TextScaled = true
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = buttonFrame
    
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(0, 80, 0, 30)
    toggleFrame.Position = UDim2.new(1, -90, 0, 20)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = buttonFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 15)
    toggleCorner.Parent = toggleFrame
    
    local toggleText = Instance.new("TextLabel")
    toggleText.Size = UDim2.new(1, 0, 1, 0)
    toggleText.BackgroundTransparency = 1
    toggleText.Text = "OFF"
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.TextScaled = true
    toggleText.Font = Enum.Font.GothamBold
    toggleText.Parent = toggleFrame
    
    local rippleEffect = Instance.new("Frame")
    rippleEffect.Size = UDim2.new(0, 0, 0, 0)
    rippleEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
    rippleEffect.AnchorPoint = Vector2.new(0.5, 0.5)
    rippleEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    rippleEffect.BackgroundTransparency = 0.8
    rippleEffect.BorderSizePixel = 0
    rippleEffect.Parent = buttonFrame
    rippleEffect.Visible = false
    
    local rippleCorner = Instance.new("UICorner")
    rippleCorner.CornerRadius = UDim.new(1, 0)
    rippleCorner.Parent = rippleEffect
    
    button.MouseEnter:Connect(function()
        TweenService:Create(buttonFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(1, -5, 0, 75),
            BackgroundTransparency = 0.1
        }):Play()
        
        TweenService:Create(buttonStroke, TweenInfo.new(0.3), {
            Color = colorMain,
            Transparency = 0.2
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(buttonFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(1, -10, 0, 70),
            BackgroundTransparency = 0.3
        }):Play()
        
        TweenService:Create(buttonStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(50, 50, 70),
            Transparency = 0.5
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        rippleEffect.Visible = true
        rippleEffect.Size = UDim2.new(0, 0, 0, 0)
        rippleEffect.BackgroundTransparency = 0.5
        
        TweenService:Create(rippleEffect, TweenInfo.new(0.5), {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        }):Play()
        
        spawn(function()
            wait(0.5)
            rippleEffect.Visible = false
        end)
        
        if callback then callback(toggleFrame, toggleText, leftGradient) end
    end)
    
    return buttonFrame, toggleFrame, toggleText, leftGradient
end

function updateToggle(toggleFrame, toggleText, leftGradient, enabled, colorMain)
    if enabled then
        TweenService:Create(toggleFrame, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(40, 167, 69)
        }):Play()
        toggleText.Text = "ON"
        
        TweenService:Create(leftGradient, TweenInfo.new(0.3), {
            BackgroundColor3 = colorMain
        }):Play()
    else
        TweenService:Create(toggleFrame, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(220, 53, 69)
        }):Play()
        toggleText.Text = "OFF"
        
        TweenService:Create(leftGradient, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        }):Play()
    end
end

function createNotification(title, message, color, duration)
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 350, 0, 80)
    notifFrame.Position = UDim2.new(1, 20, 0, 50)
    notifFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    notifFrame.BackgroundTransparency = 0.1
    notifFrame.BorderSizePixel = 0
    notifFrame.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 15)
    notifCorner.Parent = notifFrame
    
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = color or Color3.fromRGB(0, 255, 127)
    notifStroke.Thickness = 2
    notifStroke.Parent = notifFrame
    
    local notifGlass = createGlassEffect(notifFrame)
    
    local notifIcon = Instance.new("TextLabel")
    notifIcon.Size = UDim2.new(0, 30, 0, 30)
    notifIcon.Position = UDim2.new(0, 15, 0, 10)
    notifIcon.BackgroundTransparency = 1
    notifIcon.Text = "⚡"
    notifIcon.TextColor3 = color or Color3.fromRGB(0, 255, 127)
    notifIcon.TextScaled = true
    notifIcon.Font = Enum.Font.GothamBold
    notifIcon.Parent = notifFrame
    
    local notifTitle = Instance.new("TextLabel")
    notifTitle.Size = UDim2.new(0, 280, 0, 25)
    notifTitle.Position = UDim2.new(0, 55, 0, 10)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = title or "Notification"
    notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifTitle.TextScaled = true
    notifTitle.Font = Enum.Font.GothamBold
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
    notifTitle.Parent = notifFrame
    
    local notifMessage = Instance.new("TextLabel")
    notifMessage.Size = UDim2.new(0, 280, 0, 20)
    notifMessage.Position = UDim2.new(0, 55, 0, 35)
    notifMessage.BackgroundTransparency = 1
    notifMessage.Text = message or ""
    notifMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    notifMessage.TextScaled = true
    notifMessage.Font = Enum.Font.Gotham
    notifMessage.TextXAlignment = Enum.TextXAlignment.Left
    notifMessage.Parent = notifFrame
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(1, 0, 0, 3)
    progressBar.Position = UDim2.new(0, 0, 1, -3)
    progressBar.BackgroundColor3 = color or Color3.fromRGB(0, 255, 127)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = notifFrame
    
    TweenService:Create(notifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Position = UDim2.new(1, -370, 0, 50)
    }):Play()
    
    TweenService:Create(progressBar, TweenInfo.new(duration or 3), {
        Size = UDim2.new(0, 0, 0, 3)
    }):Play()
    
    spawn(function()
        wait(duration or 3)
        
        TweenService:Create(notifFrame, TweenInfo.new(0.5), {
            Position = UDim2.new(1, 20, 0, 50),
            BackgroundTransparency = 1
        }):Play()
        
        wait(0.5)
        notifFrame:Destroy()
    end)
end

function showTab(tabName)
    for _, button in pairs(scrollFrame:GetChildren()) do
        if button:IsA("Frame") then
            button.Visible = false
        end
    end
    
    if tabName == "movement" then
        for _, button in pairs(movementButtons) do
            if button and button.Parent then
                button.Visible = true
            end
        end
    elseif tabName == "combat" then
        for _, button in pairs(combatButtons) do
            if button and button.Parent then
                button.Visible = true
            end
        end
    elseif tabName == "visual" then
        for _, button in pairs(visualButtons) do
            if button and button.Parent then
                button.Visible = true
            end
        end
    elseif tabName == "misc" then
        for _, button in pairs(miscButtons) do
            if button and button.Parent then
                button.Visible = true
            end
        end
    end
    currentTab = tabName
end

local function clearConnections()
    for _, connection in pairs(connections) do
        if connection then
            connection:Disconnect()
        end
    end
    connections = {}
end

local function enableSpeed()
    if states.speed then
        humanoid.WalkSpeed = 100
        connections.speed = RunService.Heartbeat:Connect(function()
            if humanoid and states.speed then
                humanoid.WalkSpeed = 100
            end
        end)
    else
        humanoid.WalkSpeed = originalValues.walkSpeed
        if connections.speed then
            connections.speed:Disconnect()
            connections.speed = nil
        end
    end
end

local function enableFly()
    if states.fly then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = rootPart
        
        local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
        bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
        bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
        bodyAngularVelocity.Parent = rootPart
        
        connections.fly = RunService.Heartbeat:Connect(function()
            if states.fly and bodyVelocity.Parent then
                local moveVector = Vector3.new(0, 0, 0)
                local camera = Workspace.CurrentCamera
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveVector = moveVector + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveVector = moveVector - Vector3.new(0, 1, 0)
                end
                
                bodyVelocity.Velocity = moveVector * 50
            end
        end)
    else
        if connections.fly then
            connections.fly:Disconnect()
            connections.fly = nil
        end
        local bodyVelocity = rootPart:FindFirstChild("BodyVelocity")
        local bodyAngularVelocity = rootPart:FindFirstChild("BodyAngularVelocity")
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyAngularVelocity then bodyAngularVelocity:Destroy() end
    end
end

local function enableNoclip()
    if states.noclip then
        connections.noclip = RunService.Stepped:Connect(function()
            if states.noclip and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if connections.noclip then
            connections.noclip:Disconnect()
            connections.noclip = nil
        end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = true
                end
            end
        end
    end
end

local function enableESP()
    if states.esp then
        connections.esp = RunService.Heartbeat:Connect(function()
            if states.esp then
                for _, otherPlayer in pairs(Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local char = otherPlayer.Character
                        if not char:FindFirstChild("ESPBox") then
                            local box = Instance.new("BoxHandleAdornment")
                            box.Name = "ESPBox"
                            box.Adornee = char.HumanoidRootPart
                            box.AlwaysOnTop = true
                            box.ZIndex = 10
                            box.Size = char.HumanoidRootPart.Size + Vector3.new(2, 4, 2)
                            box.Transparency = 0.7
                            box.Color3 = Color3.fromRGB(255, 0, 0)
                            box.Parent = char.HumanoidRootPart
                            
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPLabel"
                            billboard.Adornee = char.Head
                            billboard.Size = UDim2.new(0, 200, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.Parent = char.Head
                            
                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.BackgroundTransparency = 1
                            label.Text = otherPlayer.Name
                            label.TextColor3 = Color3.fromRGB(255, 255, 255)
                            label.TextScaled = true
                            label.Font = Enum.Font.GothamBold
                            label.TextStrokeTransparency = 0
                            label.TextStrokeColor3 = Color3.new(0, 0, 0)
                            label.Parent = billboard
                        end
                    end
                end
            end
        end)
    else
        if connections.esp then
            connections.esp:Disconnect()
            connections.esp = nil
        end
        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer.Character then
                local espBox = otherPlayer.Character:FindFirstChild("ESPBox", true)
                local espLabel = otherPlayer.Character:FindFirstChild("ESPLabel", true)
                if espBox then espBox:Destroy() end
                if espLabel then espLabel:Destroy() end
            end
        end
    end
end

local function enableGodMode()
    if states.godmode then
        connections.godmode = humanoid.HealthChanged:Connect(function()
            if states.godmode and humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
        end)
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    else
        if connections.godmode then
            connections.godmode:Disconnect()
            connections.godmode = nil
        end
        humanoid.MaxHealth = 100
        humanoid.Health = 100
    end
end

local movementTab = createTab("MOVEMENT", "movement", 1)
local combatTab = createTab("COMBAT", "combat", 2)
local visualTab = createTab("VISUAL", "visual", 3)
local miscTab = createTab("MISC", "misc", 4)

local function switchTab(newTab)
    for _, tab in pairs(tabsFrame:GetChildren()) do
        if tab:IsA("TextButton") then
            TweenService:Create(tab, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(30, 30, 40),
                BackgroundTransparency = 0.5
            }):Play()
            tab.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    end
    
    local activeTab = newTab == "movement" and movementTab or 
                     newTab == "combat" and combatTab or 
                     newTab == "visual" and visualTab or miscTab
    
    TweenService:Create(activeTab, TweenInfo.new(0.3), {
        BackgroundColor3 = Color3.fromRGB(0, 255, 127),
        BackgroundTransparency = 0.2
    }):Play()
    activeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    showTab(newTab)
end

movementTab.MouseButton1Click:Connect(function() switchTab("movement") end)
combatTab.MouseButton1Click:Connect(function() switchTab("combat") end)
visualTab.MouseButton1Click:Connect(function() switchTab("visual") end)
miscTab.MouseButton1Click:Connect(function() switchTab("misc") end)

local speedButton, speedToggle, speedText, speedGradient = createAdvancedButton("🚀", "Speed Hack", "Increase your movement speed", Color3.fromRGB(0, 150, 255), Color3.fromRGB(0, 200, 255), 1, function(toggleFrame, toggleText, leftGradient)
    states.speed = not states.speed
    updateToggle(toggleFrame, toggleText, leftGradient, states.speed, Color3.fromRGB(0, 150, 255))
    enableSpeed()
    createNotification("Speed Hack", states.speed and "Enabled speed hack" or "Disabled speed hack", states.speed and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(220, 53, 69), 3)
end)
table.insert(movementButtons, speedButton)

local flyButton, flyToggle, flyText, flyGradient = createAdvancedButton("🕊", "Fly Hack", "Fly around the map (WASD + Space/Shift)", Color3.fromRGB(108, 117, 125), Color3.fromRGB(200, 200, 200), 2, function(toggleFrame, toggleText, leftGradient)
    states.fly = not states.fly
    updateToggle(toggleFrame, toggleText, leftGradient, states.fly, Color3.fromRGB(108, 117, 125))
    enableFly()
    createNotification("Fly Hack", states.fly and "Enabled fly hack - Use WASD + Space/Shift" or "Disabled fly hack", states.fly and Color3.fromRGB(108, 117, 125) or Color3.fromRGB(220, 53, 69), 3)
end)
table.insert(movementButtons, flyButton)

local noclipButton, noclipToggle, noclipText, noclipGradient = createAdvancedButton("👻", "NoClip", "Walk through walls and objects", Color3.fromRGB(150, 150, 150), Color3.fromRGB(200, 200, 200), 3, function(toggleFrame, toggleText, leftGradient)
    states.noclip = not states.noclip
    updateToggle(toggleFrame, toggleText, leftGradient, states.noclip, Color3.fromRGB(150, 150, 150))
    enableNoclip()
    createNotification("NoClip", states.noclip and "Enabled noclip" or "Disabled noclip", states.noclip and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(220, 53, 69), 3)
end)
table.insert(movementButtons, noclipButton)

local jumpButton, jumpToggle, jumpText, jumpGradient = createAdvancedButton("⬆", "Super Jump", "Jump higher than normal", Color3.fromRGB(255, 140, 0), Color3.fromRGB(255, 180, 50), 4, function(toggleFrame, toggleText, leftGradient)
    states.jump = not states.jump
    updateToggle(toggleFrame, toggleText, leftGradient, states.jump, Color3.fromRGB(255, 140, 0))
    humanoid.JumpPower = states.jump and 120 or originalValues.jumpPower
    createNotification("Super Jump", states.jump and "Enabled super jump" or "Disabled super jump", states.jump and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(220, 53, 69), 3)
end)
table.insert(movementButtons, jumpButton)

local killauraButton, killauraToggle, killauraText, killauraGradient = createAdvancedButton("⚔", "Kill Aura", "Automatically attack nearby players", Color3.fromRGB(220, 53, 69), Color3.fromRGB(255, 100, 100), 1, function(toggleFrame, toggleText, leftGradient)
    states.killaura = not states.killaura
    updateToggle(toggleFrame, toggleText, leftGradient, states.killaura, Color3.fromRGB(220, 53, 69))
    createNotification("Kill Aura", states.killaura and "Enabled kill aura" or "Disabled kill aura", states.killaura and Color3.fromRGB(220, 53, 69) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(combatButtons, killauraButton)

local aimbotButton, aimbotToggle, aimbotText, aimbotGradient = createAdvancedButton("🎯", "Aim Bot", "Automatically aim at enemies", Color3.fromRGB(255, 193, 7), Color3.fromRGB(255, 220, 100), 2, function(toggleFrame, toggleText, leftGradient)
    states.aimbot = not states.aimbot
    updateToggle(toggleFrame, toggleText, leftGradient, states.aimbot, Color3.fromRGB(255, 193, 7))
    createNotification("Aim Bot", states.aimbot and "Enabled aim bot" or "Disabled aim bot", states.aimbot and Color3.fromRGB(255, 193, 7) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(combatButtons, aimbotButton)

local espButton, espToggle, espText, espGradient = createAdvancedButton("👁", "Player ESP", "See players through walls", Color3.fromRGB(0, 255, 127), Color3.fromRGB(100, 255, 180), 1, function(toggleFrame, toggleText, leftGradient)
    states.esp = not states.esp
    updateToggle(toggleFrame, toggleText, leftGradient, states.esp, Color3.fromRGB(0, 255, 127))
    enableESP()
    createNotification("Player ESP", states.esp and "Enabled ESP" or "Disabled ESP", states.esp and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(visualButtons, espButton)

local fullbrightButton, fullbrightToggle, fullbrightText, fullbrightGradient = createAdvancedButton("💡", "FullBright", "Brighten up the world", Color3.fromRGB(255, 193, 7), Color3.fromRGB(255, 220, 100), 2, function(toggleFrame, toggleText, leftGradient)
    states.fullbright = not states.fullbright
    updateToggle(toggleFrame, toggleText, leftGradient, states.fullbright, Color3.fromRGB(255, 193, 7))
    
    if states.fullbright then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 10
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
    else
        Lighting.Ambient = originalValues.ambient
        Lighting.Brightness = originalValues.brightness
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
    end
    
    createNotification("FullBright", states.fullbright and "Enabled fullbright" or "Disabled fullbright", states.fullbright and Color3.fromRGB(255, 193, 7) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(visualButtons, fullbrightButton)

local godmodeButton, godmodeToggle, godmodeText, godmodeGradient = createAdvancedButton("🛡", "God Mode", "Become invincible to damage", Color3.fromRGB(40, 167, 69), Color3.fromRGB(100, 220, 130), 1, function(toggleFrame, toggleText, leftGradient)
    states.godmode = not states.godmode
    updateToggle(toggleFrame, toggleText, leftGradient, states.godmode, Color3.fromRGB(40, 167, 69))
    enableGodMode()
    createNotification("God Mode", states.godmode and "Enabled god mode" or "Disabled god mode", states.godmode and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(miscButtons, godmodeButton)

local antifallButton, antifallToggle, antifallText, antifallGradient = createAdvancedButton("🔻", "Anti Fall", "Prevent falling into the void", Color3.fromRGB(108, 117, 125), Color3.fromRGB(180, 180, 180), 2, function(toggleFrame, toggleText, leftGradient)
    states.antifall = not states.antifall
    updateToggle(toggleFrame, toggleText, leftGradient, states.antifall, Color3.fromRGB(108, 117, 125))
    
    if states.antifall then
        connections.antifall = RunService.Heartbeat:Connect(function()
            if states.antifall and rootPart and rootPart.Position.Y < -100 then
                rootPart.CFrame = CFrame.new(rootPart.Position.X, 100, rootPart.Position.Z)
            end
        end)
    else
        if connections.antifall then
            connections.antifall:Disconnect()
            connections.antifall = nil
        end
    end
    
    createNotification("Anti Fall", states.antifall and "Enabled anti fall" or "Disabled anti fall", states.antifall and Color3.fromRGB(108, 117, 125) or Color3.fromRGB(150, 150, 150), 3)
end)
table.insert(miscButtons, antifallButton)

local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 450, 0, 80)
        }):Play()
        
        contentFrame.Visible = false
        tabsFrame.Visible = false
        minimizeBtn.Text = "+"
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 450, 0, 650)
        }):Play()
        
        contentFrame.Visible = true
        tabsFrame.Visible = true
        minimizeBtn.Text = "—"
    end
end)

settingsBtn.MouseButton1Click:Connect(function()
    createNotification("Settings", "Settings menu coming soon!", Color3.fromRGB(108, 117, 125), 3)
end)

closeBtn.MouseButton1Click:Connect(function()
    clearConnections()
    
    for state, _ in pairs(states) do
        states[state] = false
    end
    
    humanoid.WalkSpeed = originalValues.walkSpeed
    humanoid.JumpPower = originalValues.jumpPower
    
    TweenService:Create(mainFrame, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    TweenService:Create(blurEffect, TweenInfo.new(0.5), {
        Size = 0
    }):Play()
    
    wait(0.5)
    screenGui:Destroy()
end)

showTab("movement")

spawn(function()
    while screenGui.Parent do
        for i = 0, 360, 2 do
            if not screenGui.Parent then break end
            rainbowGradient.Rotation = i
            wait(0.05)
        end
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    originalValues.walkSpeed = humanoid.WalkSpeed
    originalValues.jumpPower = humanoid.JumpPower
    
    wait(2)
    
    if states.speed then enableSpeed() end
    if states.fly then enableFly() end
    if states.noclip then enableNoclip() end
    if states.godmode then enableGodMode() end
    if states.jump then humanoid.JumpPower = 120 end
    if states.antifall then
        connections.antifall = RunService.Heartbeat:Connect(function()
            if states.antifall and rootPart and rootPart.Position.Y < -100 then
                rootPart.CFrame = CFrame.new(rootPart.Position.X, 100, rootPart.Position.Z)
            end
        end)
    end
end)

TweenService:Create(blurEffect, TweenInfo.new(1), {Size = 10}):Play()

createNotification("ULTRA EXPLOIT", "Successfully loaded! Welcome " .. player.Name, Color3.fromRGB(0, 255, 127), 5)