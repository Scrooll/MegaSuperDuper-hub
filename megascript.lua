local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Lodochka Hub", "RJTheme5")

local Tab = Window:NewTab("Основные функции")

local Section = Tab:NewSection("Самые основы")

Section:NewSlider("Скорость", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)


Section:NewToggle("ESP", "ВХ", function(state)
    if state then
        while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
    else
        
    end
end)

local Tab = Window:NewTab("Mine")

local Section = Tab:NewSection("Скоро...")
