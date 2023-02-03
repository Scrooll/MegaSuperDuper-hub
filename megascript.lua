local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Lodochka Hub", "RJTheme4")

local Tab = Window:NewTab("Основные функции")

local Section = Tab:NewSection("Самые основы")

Section:NewSlider("Скорость", "Вы становитесь очень быстрым", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Прыжок", "Делает из вас зайца", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("ESP", "что то типо wallhack только в роблокс", function()
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
end)

Section:NewButton("Флай", "Вы можете летать!", function()

_G.FLYING = false
local LP = game:service('Players').LocalPlayer
local T = LP.Character.UpperTorso
local CONTROL = {F = 0, B = 0, L = 0, R = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
local SPEED = 5
local MOUSE = LP:GetMouse()
 
 
local function FLY()
    _G.FLYING = true
    local BG = Instance.new('BodyGyro', T)
    local BV = Instance.new('BodyVelocity', T)
    BG.P = 9e4
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = T.CFrame
    BV.velocity = Vector3.new(0, 0.1, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
 
 
    spawn(function()
      repeat wait()
        LP.Character.Humanoid.PlatformStand = true
        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
          SPEED = 50
        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
          SPEED = 0
        end
        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
          BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
          lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
        elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
          BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
        else
          BV.velocity = Vector3.new(0, 0.1, 0)
        end
        BG.cframe = game.Workspace.CurrentCamera.CoordinateFrame
      until not _G.FLYING
      CONTROL = {F = 0, B = 0, L = 0, R = 0}
      lCONTROL = {F = 0, B = 0, L = 0, R = 0}
      SPEED = 0
      BG:destroy()
      BV:destroy()
      LP.Character.Humanoid.PlatformStand = false
    end)
  end
 
  MOUSE.KeyDown:connect(function(KEY)
    if KEY:lower() == 'w' then
      CONTROL.F = 1
    elseif KEY:lower() == 's' then
      CONTROL.B = -1
    elseif KEY:lower() == 'a' then
      CONTROL.L = -1 
    elseif KEY:lower() == 'd' then 
      CONTROL.R = 1
    end
  end)
 
  MOUSE.KeyUp:connect(function(KEY)
    if KEY:lower() == 'w' then
      CONTROL.F = 0
    elseif KEY:lower() == 's' then
      CONTROL.B = 0
    elseif KEY:lower() == 'a' then
      CONTROL.L = 0
    elseif KEY:lower() == 'd' then
      CONTROL.R = 0
    end
  end)
 
 
 
 
  FLY()
end)
Section:NewButton("Aimbot", "Аимбот для шутеров(Не рекомендуется включать в режимах где нет ничего с аимом)", function()
    PLAYER  = game.Players.LocalPlayer
MOUSE   = PLAYER:GetMouse()
CC      = game.Workspace.CurrentCamera
 
ENABLED      = false
ESP_ENABLED  = false
 
_G.FREE_FOR_ALL = true
 
_G.ESP_BIND    = 52
_G.CHANGE_AIM  = 'q'
 
_G.AIM_AT = 'Head'
 
wait(1)
 
function GetNearestPlayerToMouse()
	local PLAYERS      = {}
	local PLAYER_HOLD  = {}
	local DISTANCES    = {}
	for i, v in pairs(game.Players:GetPlayers()) do
		if v ~= PLAYER then
			table.insert(PLAYERS, v)
		end
	end
	for i, v in pairs(PLAYERS) do
		if _G.FREE_FOR_ALL == false then
			if v and (v.Character) ~= nil and v.TeamColor ~= PLAYER.TeamColor then
				local AIM = v.Character:FindFirstChild(_G.AIM_AT)
				if AIM ~= nil then
					local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
					local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
					local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
					local DIFF                     = math.floor((POS - AIM.Position).magnitude)
					PLAYER_HOLD[v.Name .. i]       = {}
					PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
					PLAYER_HOLD[v.Name .. i].plr   = v
					PLAYER_HOLD[v.Name .. i].diff  = DIFF
					table.insert(DISTANCES, DIFF)
				end
			end
		elseif _G.FREE_FOR_ALL == true then
			local AIM = v.Character:FindFirstChild(_G.AIM_AT)
			if AIM ~= nil then
				local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
				local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
				local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
				local DIFF                     = math.floor((POS - AIM.Position).magnitude)
				PLAYER_HOLD[v.Name .. i]       = {}
				PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
				PLAYER_HOLD[v.Name .. i].plr   = v
				PLAYER_HOLD[v.Name .. i].diff  = DIFF
				table.insert(DISTANCES, DIFF)
			end
		end
	end
 
	if unpack(DISTANCES) == nil then
		return false
	end
 
	local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
	if L_DISTANCE > 20 then
		return false
	end
 
	for i, v in pairs(PLAYER_HOLD) do
		if v.diff == L_DISTANCE then
			return v.plr
		end
	end
	return false
end
 
GUI_MAIN                           = Instance.new('ScreenGui', game.CoreGui)
GUI_TARGET                         = Instance.new('TextLabel', GUI_MAIN)
GUI_AIM_AT                         = Instance.new('TextLabel', GUI_MAIN)
 
GUI_MAIN.Name                      = 'AIMBOT'
 
GUI_TARGET.Size                    = UDim2.new(0,200,0,30)
GUI_TARGET.BackgroundTransparency  = 0.5
GUI_TARGET.BackgroundColor         = BrickColor.new('Fossil')
GUI_TARGET.BorderSizePixel         = 0
GUI_TARGET.Position                = UDim2.new(0.5,-100,0,0)
GUI_TARGET.Text                    = 'AIMBOT : OFF'
GUI_TARGET.TextColor3              = Color3.new(1,1,1)
GUI_TARGET.TextStrokeTransparency  = 1
GUI_TARGET.TextWrapped             = true
GUI_TARGET.FontSize                = 'Size24'
GUI_TARGET.Font                    = 'SourceSansBold'
 
GUI_AIM_AT.Size                    = UDim2.new(0,200,0,20)
GUI_AIM_AT.BackgroundTransparency  = 0.5
GUI_AIM_AT.BackgroundColor         = BrickColor.new('Fossil')
GUI_AIM_AT.BorderSizePixel         = 0
GUI_AIM_AT.Position                = UDim2.new(0.5,-100,0,30)
GUI_AIM_AT.Text                    = 'AIMING : HEAD'
GUI_AIM_AT.TextColor3              = Color3.new(1,1,1)
GUI_AIM_AT.TextStrokeTransparency  = 1
GUI_AIM_AT.TextWrapped             = true
GUI_AIM_AT.FontSize                = 'Size18'
GUI_AIM_AT.Font                    = 'SourceSansBold'
 
local TRACK = false
 
function CREATE(BASE, TEAM)
	local ESP_MAIN                   = Instance.new('BillboardGui', PLAYER.PlayerGui)
	local ESP_DOT                    = Instance.new('Frame', ESP_MAIN)
	local ESP_NAME                   = Instance.new('TextLabel', ESP_MAIN)
 
	ESP_MAIN.Name                    = 'ESP'
	ESP_MAIN.Adornee                 = BASE
	ESP_MAIN.AlwaysOnTop             = true
	ESP_MAIN.ExtentsOffset           = Vector3.new(0, 1, 0)
	ESP_MAIN.Size                    = UDim2.new(0, 5, 0, 5)
 
	ESP_DOT.Name                     = 'DOT'
	ESP_DOT.BackgroundColor          = BrickColor.new('Bright red')
	ESP_DOT.BackgroundTransparency   = 0.3
	ESP_DOT.BorderSizePixel          = 0
	ESP_DOT.Position                 = UDim2.new(-0.5, 0, -0.5, 0)
	ESP_DOT.Size                     = UDim2.new(2, 0, 2, 0)
	ESP_DOT.Visible                  = true
	ESP_DOT.ZIndex                   = 10
 
	ESP_NAME.Name                    = 'NAME'
	ESP_NAME.BackgroundColor3        = Color3.new(255, 255, 255)
	ESP_NAME.BackgroundTransparency  = 1
	ESP_NAME.BorderSizePixel         = 0
	ESP_NAME.Position                = UDim2.new(0, 0, 0, -40)
	ESP_NAME.Size                    = UDim2.new(1, 0, 10, 0)
	ESP_NAME.Visible                 = true
	ESP_NAME.ZIndex                  = 10
	ESP_NAME.Font                    = 'ArialBold'
	ESP_NAME.FontSize                = 'Size14'
	ESP_NAME.Text                    = BASE.Parent.Name:upper()
	ESP_NAME.TextColor               = BrickColor.new('Bright red')
end
 
function CLEAR()
	for _,v in pairs(PLAYER.PlayerGui:children()) do
		if v.Name == 'ESP' and v:IsA('BillboardGui') then
			v:Destroy()
		end
	end
end
 
function FIND()
	CLEAR()
	TRACK = true
	spawn(function()
		while wait() do
			if TRACK then
				CLEAR()
				for i,v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Character:FindFirstChild('Head') then
						if _G.FREE_FOR_ALL == false then
							if v.TeamColor ~= PLAYER.TeamColor then
								if v.Character:FindFirstChild('Head') then
									CREATE(v.Character.Head, true)
								end
							end
						else
							if v.Character:FindFirstChild('Head') then
								CREATE(v.Character.Head, true)
							end
						end
					end
				end
			end
		end
		wait(1)
	end)
end
 
MOUSE.Button2Down:connect(function()
	ENABLED = true
end)
 
MOUSE.Button2Up:connect(function()
	ENABLED = false
end)
 
MOUSE.KeyDown:connect(function(KEY)
	KEY = KEY:lower():byte()
	if KEY == _G.ESP_BIND then
		if ESP_ENABLED == false then
			FIND()
			ESP_ENABLED = true
			print('ESP : ON')
		elseif ESP_ENABLED == true then
			wait()
			CLEAR()
			TRACK = false
			ESP_ENABLED = false
			print('ESP : OFF')
		end
	end
end)
 
MOUSE.KeyDown:connect(function(KEY)
	if KEY == _G.CHANGE_AIM then
		if _G.AIM_AT == 'Head' then
			_G.AIM_AT = 'Torso'
			GUI_AIM_AT.Text = 'AIMING : TORSO'
		elseif _G.AIM_AT == 'Torso' then
			_G.AIM_AT = 'Head'
			GUI_AIM_AT.Text = 'AIMING : HEAD'
		end
	end
end)
 
game:GetService('RunService').RenderStepped:connect(function()
	if ENABLED then
		local TARGET = GetNearestPlayerToMouse()
		if (TARGET ~= false) then
			local AIM = TARGET.Character:FindFirstChild(_G.AIM_AT)
			if AIM then
				CC.CoordinateFrame = CFrame.new(CC.CoordinateFrame.p, AIM.CFrame.p)
			end
			GUI_TARGET.Text = 'AIMBOT : '.. TARGET.Name:sub(1, 5)
		else
			GUI_TARGET.Text = 'AIMBOT : OFF'
		end
	end
end)
 
repeat
	wait()
	if ESP_ENABLED == true then
		FIND()
	end
until ESP_ENABLED == false
end)

Section:NewButton("Спин", "", function()
	power = 500 -- change this to make it more or less powerful
 
game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

local Tab = Window:NewTab("Майнер")

local Section = Tab:NewSection("Функции")

Section:NewButton("Собирать койны", "", function()
    
for i,v in pairs(game:GetDescendants()) do
if v.Name == 'Credit' then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
end)
