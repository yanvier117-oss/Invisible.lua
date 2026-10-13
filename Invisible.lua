
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "InvisibleGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 50)
button.Position = UDim2.new(0, 20, 0.5, 0)
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Text = "👻 Invisibilidad: OFF"
button.Parent = gui

local invisible = false

local function setInvisible(character, state)
    for _, obj in ipairs(character:GetDescendants()) do
        if obj:IsA("BasePart") then
            if obj.Name ~= "HumanoidRootPart" then
                obj.LocalTransparencyModifier = state and 1 or 0
            end
        elseif obj:IsA("Decal") then
            obj.Transparency = state and 1 or 0
        end
    end
end

button.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end

    invisible = not invisible
    setInvisible(character, invisible)

    button.Text = invisible
        and "👻 Invisibilidad: ON"
        or "👻 Invisibilidad: OFF"
end)

player.CharacterAdded:Connect(function(character)
    invisible = false
    button.Text = "👻 Invisibilidad: OFF"
end)
