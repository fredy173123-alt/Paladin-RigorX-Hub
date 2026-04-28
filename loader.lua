-- Paladin&RigorX Key System
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Gültige Keys
local validKeys = {
    "KEYAUTH-lbr8Rl-mmp0dX-91Zk9Q-utZNVt-bZV7Zq-ngUPZt",
}

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PaladinKeySystem"
ScreenGui.ResetOnSpawn = false

pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = PlayerGui
end

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.5
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 380, 0, 220)
Frame.Position = UDim2.new(0.5, -190, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
TopBar.BorderSizePixel = 0
TopBar.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 12)
UICorner2.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0.5, 0)
TopBarFix.Position = UDim2.new(0, 0, 0.5, 0)
TopBarFix.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Paladin&RigorX"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TopBar

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0.9, 0, 0, 30)
SubTitle.Position = UDim2.new(0.05, 0, 0, 60)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Gib deinen Key ein um fortzufahren"
SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SubTitle.TextScaled = true
SubTitle.Font = Enum.Font.Gotham
SubTitle.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.88, 0, 0, 45)
TextBox.Position = UDim2.new(0.06, 0, 0, 100)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.BorderSizePixel = 0
TextBox.PlaceholderText = "Key hier eingeben..."
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.Parent = Frame

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 8)
UICorner3.Parent = TextBox

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.88, 0, 0, 45)
Button.Position = UDim2.new(0.06, 0, 0, 158)
Button.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Button.BorderSizePixel = 0
Button.Text = "Bestätigen"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold
Button.Parent = Frame

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 8)
UICorner4.Parent = Button

Button.MouseButton1Click:Connect(function()
    local eingabe = TextBox.Text
    local keyGueltig = false

    for _, key in pairs(validKeys) do
        if eingabe == key then
            keyGueltig = true
            break
        end
    end

    if keyGueltig then
        SubTitle.Text = "Key gueltig! Laedt..."
        SubTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
        Button.Text = "Laedt..."
        Button.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        task.wait(1.5)
        ScreenGui:Destroy()
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/fredy173123-alt/Paladin-RigorX-Hub/refs/heads/main/abyss%20(2).txt",
            true
        ))()
    else
        SubTitle.Text = "Ungültiger Key!"
        SubTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(2)
        SubTitle.Text = "Gib deinen Key ein um fortzufahren"
        SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
end)
