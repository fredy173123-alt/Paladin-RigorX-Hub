-- Paladin&RigorX Loader mit KeyAuth Key System
local KeyAuth = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/KeyAuth/KeyAuth-Roblox-Example/main/source.lua",
    true
))()

KeyAuth.init({
    Name = "Fredy173123's Application",
    OwnerID = "dfLnsohyA4",
    Secret = "67466e1b2dc241a9166c9e5ae68b193a55bc3e59365677337578e14992c48bbc",
    Version = "1.0"
})

-- Key Eingabe
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Paladin&RigorX"
Title.TextColor3 = Color3.fromRGB(255, 165, 0)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 25)
SubTitle.Position = UDim2.new(0, 0, 0, 45)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Gib deinen Key ein"
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.TextScaled = true
SubTitle.Font = Enum.Font.Gotham
SubTitle.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 40)
TextBox.Position = UDim2.new(0.075, 0, 0, 80)
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.BorderSizePixel = 0
TextBox.PlaceholderText = "Key hier eingeben..."
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.Parent = Frame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = TextBox

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.85, 0, 0, 40)
Button.Position = UDim2.new(0.075, 0, 0, 135)
Button.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
Button.BorderSizePixel = 0
Button.Text = "Bestätigen ✅"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold
Button.Parent = Frame

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 8)
UICorner3.Parent = Button

Button.MouseButton1Click:Connect(function()
    local key = TextBox.Text
    if key == "" then
        SubTitle.Text = "❌ Bitte Key eingeben!"
        SubTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    Button.Text = "Wird geprüft..."
    Button.BackgroundColor3 = Color3.fromRGB(150, 150, 150)

    local success = KeyAuth.license(key)

    if success then
        SubTitle.Text = "✅ Key gültig! Lädt..."
        SubTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/fredy173123-alt/Paladin-RigorX-Hub/refs/heads/main/abyss%20(2).txt",
            true
        ))()
    else
        SubTitle.Text = "❌ Ungültiger Key!"
        SubTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        Button.Text = "Bestätigen ✅"
        Button.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    end
end)
