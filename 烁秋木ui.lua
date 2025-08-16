local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScreen"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Size = 24
blur.Parent = game:GetService("Lighting")

local image = Instance.new("ImageLabel")
image.Name = "Logo"
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0) 
image.Size = UDim2.new(0, 150, 0, 150)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://118635910294375"
image.Parent = gui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0) 
uiCorner.Parent = image

local welcomeText = Instance.new("TextLabel")
welcomeText.Name = "WelcomeText"
welcomeText.AnchorPoint = Vector2.new(0.5, 0.5)
welcomeText.Position = UDim2.new(0.5, 0, 0.3, 0) 
welcomeText.Size = UDim2.new(0, 400, 0, 50)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "欢迎使用烁秋木脚本"
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.TextSize = 36
welcomeText.Font = Enum.Font.SourceSansBold
welcomeText.TextTransparency = 1  
welcomeText.Parent = gui

local playerName = Instance.new("TextLabel")
playerName.Name = "PlayerName"
playerName.AnchorPoint = Vector2.new(0.5, 0.5)
playerName.Position = UDim2.new(0.5, 0, 0.7, 0) 
playerName.Size = UDim2.new(0, 400, 0, 40)
playerName.BackgroundTransparency = 1
playerName.Text = "你好: " .. player.Name
playerName.TextSize = 28
playerName.Font = Enum.Font.SourceSans
playerName.TextTransparency = 1  
playerName.Parent = gui

local function rainbowEffect()
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        playerName.TextColor3 = Color3.fromHSV(hue, 1, 1)
        wait(0.05)
    end
end
coroutine.wrap(rainbowEffect)()

local function fadeIn()
    local fadeTime = 1.2 
    local startTime = tick()
    
    while tick() - startTime < fadeTime do
        local alpha = (tick() - startTime) / fadeTime
        local easeAlpha = math.sin(alpha * math.pi/2) 
        
        image.Position = UDim2.new(0.5, 0, 0.5, 0)
        welcomeText.Position = UDim2.new(0.5, 0, 0.3 + (0.05 * (1 - easeAlpha)), 0)
        playerName.Position = UDim2.new(0.5, 0, 0.7 + (0.05 * (1 - easeAlpha)), 0)
        
        welcomeText.TextTransparency = 1 - easeAlpha
        playerName.TextTransparency = 1 - easeAlpha
        image.ImageTransparency = 1 - easeAlpha
        
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    welcomeText.TextTransparency = 0
    playerName.TextTransparency = 0
    image.ImageTransparency = 0
end

local function fadeOut()
    local fadeTime = 1.2 
    local startTime = tick()
    
    while tick() - startTime < fadeTime do
        local alpha = (tick() - startTime) / fadeTime
        local easeAlpha = 1 - math.cos(alpha * math.pi/2) 
        image.Position = UDim2.new(0.5, 0, 0.5 + (0.3 * easeAlpha), 0)
        welcomeText.Position = UDim2.new(0.5, 0, 0.3 + (0.3 * easeAlpha), 0)
        playerName.Position = UDim2.new(0.5, 0, 0.7 + (0.3 * easeAlpha), 0)
        
        welcomeText.TextTransparency = easeAlpha
        playerName.TextTransparency = easeAlpha
        image.ImageTransparency = easeAlpha
        
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    welcomeText.TextTransparency = 1
    playerName.TextTransparency = 1
    image.ImageTransparency = 1
    
    blur:Destroy()
    gui:Destroy()
end

fadeIn()
wait(0.5)
fadeOut()
