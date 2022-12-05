local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Lodochka Hub", "RJTheme5")

local Tab = Window:NewTab("Основные функции")

local Section = Tab:NewSection("Самые основы")

Section:NewSlider("Скорость", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Прыжок", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
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

local on
local keybind=Enum.KeyCode.F5
local keybindEnd=Enum.KeyCode.F6
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local plr=game:GetService("Players").LocalPlayer
local mouse=plr:GetMouse()
 
local sg=Instance.new("ScreenGui",plr.PlayerGui)
local f=Instance.new("TextLabel",sg)
f.Size=UDim2.new(0,25,0,10)
f.BackgroundColor3=Color3.fromRGB(180,50,50)
f.Visible=false
f.Text="On"
f.TextSize=11
 
local vu = game:GetService("VirtualUser")
local function CC()
vu:CaptureController();
end 
local function CB()
local v2 = Vector2.new();
vu:ClickButton1(v2);
end
 
function Start(a,b)
   if a.KeyCode==keybind then
       on=true
       a=RunService.Stepped:Connect(function()
           if on then
               CC();
               CB();
               f.Visible=true
               f.Position=UDim2.new(0,mouse.X-12.5,0,mouse.Y-15)
           else
               a:Disconnect()
           end
       end)
       f.Visible=false
   end
end
 
function Stop(a,b)
   if a.KeyCode==keybindEnd then
       on=false
       f.Visible=false
   end
end
 
UserInputService.InputBegan:connect(Start)
UserInputService.InputEnded:connect(Stop)

local Tab = Window:NewTab("Mine")

local Section = Tab:NewSection("Скоро...")
