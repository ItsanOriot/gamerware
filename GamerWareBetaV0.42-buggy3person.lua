-- made by ItsanOriot#4516
-- GamerWare Closed beta v0.32
--V0.3 features: Slightly buggy esp, triggerbot, aimbot, inventory changer, gui, toggleable aim through walls
--V0.4 planned feature: Anti aim
--V0.5 planned features: Recoded from scratch/non skidded aimbot
--V0.6 planned features: No recoil, no spread


--V0.2 known bugs: esp has a ,mirrored square opposite of the normal esp
-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Gui = Instance.new("Frame")
local logo = Instance.new("ImageLabel")
local espButton = Instance.new("TextButton")
local thirdButton = Instance.new("TextButton")
local skinchangerButton = Instance.new("TextButton")
local skinchangerButton_2 = Instance.new("TextButton")
local X = Instance.new("TextButton")
local aimbotButton = Instance.new("TextButton")
local openGui = Instance.new("Frame")
local Open = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

Gui.Name = "Gui"
Gui.Parent = ScreenGui
Gui.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
Gui.BorderColor3 = Color3.fromRGB(15, 111, 255)
Gui.BorderSizePixel = 2
Gui.Position = UDim2.new(0.332280993, 0, 0.337837845, 0)
Gui.Size = UDim2.new(0, 425, 0, 263)
Gui.Visible = false
Gui.Active = true
Gui.Draggable = true

logo.Name = "logo"
logo.Parent = Gui
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 1.000
logo.Position = UDim2.new(0.137755916, 0, -0.00438814936, 0)
logo.Size = UDim2.new(0, 306, 0, 53)
logo.Image = "rbxassetid://5629953455"
logo.ScaleType = Enum.ScaleType.Fit

espButton.Name = "espButton"
espButton.Parent = Gui
espButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
espButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
espButton.BorderSizePixel = 0
espButton.Position = UDim2.new(0.512963295, 0, 0.2984429, 0)
espButton.Size = UDim2.new(0, 198, 0, 32)
espButton.Font = Enum.Font.Gotham
espButton.Text = "ESP [H]"
espButton.TextColor3 = Color3.fromRGB(0, 170, 255)
espButton.TextSize = 23.000
espButton.TextWrapped = true
espButton.MouseButton1Down:connect(function()
	print('esp executed')
		--ESP toggle H
	bodyPart = 'Head'
	
	ESPon = false
	
	local lp = game:GetService('Players').LocalPlayer
	local char = lp.Character
	
	
	local mouse = lp:GetMouse()
	
	
	game:GetService("UserInputService").InputBegan:connect(function(inputObject)
		if inputObject.KeyCode == Enum.KeyCode.H then
			ESPon = not ESPon
			
			if ESPon == true then
				print("ESPon")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Wallhacks ON";
				})
			else
				print("ESPoff")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Wallhacks OFF";
				})
			end
		end
	end)
	
	
	
	

	function canseeESP(targ)
	    return true
	end
	
	
	


local ScreenGui = Instance.new("ScreenGui")	
ScreenGui.Parent = game.CoreGui
logoArray = {}
for i = 1, 10, 1 do
    logoArray[i] = Instance.new("ImageLabel")
    logoArray[i].Name = "logo"
    logoArray[i].Parent = ScreenGui
    logoArray[i].BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    logoArray[i].BackgroundTransparency = 1.000
    logoArray[i].Size = UDim2.new(0, 22, 0, 22)
    logoArray[i].Image = "rbxassetid://3797708309"
    logoArray[i].ScaleType = Enum.ScaleType.Fit
    logoArray[i].Visible = false
    print("logo created")
    if logoArray[i].IsLoaded == false then
        print("img not loaded")
     else
        print ("img loaded")
    end
end	
	
	
	TweenStatus = nil
	
	local TweenService = game:GetService("TweenService")
	TweenCFrame = Instance.new("CFrameValue")
	
	
	function tweenstuff(partpos)
		TweenStatus = true
		TweenCFrame.Value = workspace.CurrentCamera.CFrame
		local tweenframe = TweenService:Create(TweenCFrame, TweenInfo.new(0.2),{Value = CFrame.new(workspace.CurrentCamera.CFrame.Position, partpos)})
		tweenframe:Play()
		tweenframe.Completed:Wait()
		TweenStatus = nil
		TweenCFrame.Value = CFrame.new(0,0,0)
	end
	
 function getPlayerCoords(x, y)
        local coordsArray = {}
		local playerCount = 0
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
				local pos = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(x, y)).magnitude
				local targettable = (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0
				if canseeESP(v.Character.Head) == true and (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0 then
					playerCount = playerCount + 1
					coordsArray[playerCount] = UDim2.new(0, pos.X, 0, pos.Y)
				end
			end
		end
		return coordsArray, playerCount
	end

function updateEsp (coordsArray, playerCount)
    for i = 1, 10, 1 do
	    if i <= playerCount then
	       logoArray[i].Visible = true 
	       logoArray[i].Position = coordsArray[i]
	    else
	       logoArray[i].Visible = false
	    end
    end
end
	
	game:GetService('RunService').Heartbeat:connect(
	function()
		if ESPon == true then
			local coordsArray, playerCount = getPlayerCoords(mouse.X, mouse.Y)
			updateEsp (coordsArray, playerCount)
		else
		    logoArray[1].Visible = false
		    logoArray[2].Visible = false
		    logoArray[3].Visible = false
		    logoArray[4].Visible = false
		    logoArray[5].Visible = false
		    logoArray[6].Visible = false
		    logoArray[7].Visible = false
		    logoArray[8].Visible = false
		    logoArray[9].Visible = false
		    logoArray[10].Visible = false
        end
	end)
end)

skinchangerButton.Name = "skinchangerButton"
skinchangerButton.Parent = Gui
skinchangerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
skinchangerButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
skinchangerButton.BorderSizePixel = 0
skinchangerButton.Position = UDim2.new(0.0188456476, 0, 0.49616152, 0)
skinchangerButton.Size = UDim2.new(0, 198, 0, 32)
skinchangerButton.Font = Enum.Font.Gotham
skinchangerButton.Text = "Inventory Changer"
skinchangerButton.TextColor3 = Color3.fromRGB(0, 170, 255)
skinchangerButton.TextSize = 21.000
skinchangerButton.TextWrapped = true
skinchangerButton.MouseButton1Down:connect(function()
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	
	local allSkins = { 
		{'AK47_Ace'},
		{'AK47_Bloodboom'},
		{'AK47_Clown'},
		{'AK47_Code Orange'},
		{'AK47_Eve'},
		{'AK47_Gifted'},
		{'AK47_Glo'},
		{'AK47_Godess'},
		{'AK47_Hallows'},
		{'AK47_Halo'},
		{'AK47_Hypersonic'},
		{'AK47_Inversion'},
		{'AK47_Jester'},
		{'AK47_Maker'},
		{'AK47_Mean Green'},
		{'AK47_Outlaws'},
		{'AK47_Outrunner'},
		{'AK47_Patch'},
		{'AK47_Plated'},
		{'AK47_Precision'},
		{'AK47_Quantum'},
		{'AK47_Quicktime'},
		{'AK47_Scapter'},
		{'AK47_Secret Santa'},
		{'AK47_Shooting Star'},
		{'AK47_Skin Committee'},
		{'AK47_Survivor'},
		{'AK47_Ugly Sweater'},
		{'AK47_VAV'},
		{'AK47_Variant Camo'},
		{'AK47_Yltude'},
		{'AUG_Chilly Night'},
		{'AUG_Dream Hound'},
		{'AUG_Enlisted'},
		{'AUG_Graffiti'},
		{'AUG_Homestead'},
		{'AUG_Maker'},
		{'AUG_NightHawk'},
		{'AUG_Phoenix'},
		{'AUG_Sunsthetic'},
		{'AWP_Abaddon'},
		{'AWP_Autumness'},
		{'AWP_Blastech'},
		{'AWP_Bloodborne'},
		{'AWP_Coffin Biter'},
		{'AWP_Desert Camo'},
		{'AWP_Difference'},
		{'AWP_Dragon'},
		{'AWP_Forever'},
		{'AWP_Grepkin'},
		{'AWP_Hika'},
		{'AWP_Illusion'},
		{'AWP_Instinct'},
		{'AWP_JTF2'},
		{'AWP_Lunar'},
		{'AWP_Nerf'},
		{'AWP_Northern Lights'},
		{'AWP_Pear Tree'},
		{'AWP_Pink Vision'},
		{'AWP_Pinkie'},
		{'AWP_Quicktime'},
		{'AWP_Racer'},
		{'AWP_Regina'},
		{'AWP_Retroactive'},
		{'AWP_Scapter'},
		{'AWP_Silence'},
		{'AWP_Venomus'},
		{'AWP_Weeb'},
		{'Banana_Stock'},
		{'Bayonet_Aequalis'},
		{'Bayonet_Banner'},
		{'Bayonet_Candy Cane'},
		{'Bayonet_Consumed'},
		{'Bayonet_Cosmos'},
		{'Bayonet_Crimson Tiger'},
		{'Bayonet_Crow'},
		{'Bayonet_Delinquent'},
		{'Bayonet_Digital'},
		{'Bayonet_Easy-Bake'},
		{'Bayonet_Egg Shell'},
		{'Bayonet_Festive'},
		{'Bayonet_Frozen Dream'},
		{'Bayonet_Geo Blade'},
		{'Bayonet_Ghastly'},
		{'Bayonet_Goo'},
		{'Bayonet_Hallows'},
		{'Bayonet_Intertwine'},
		{'Bayonet_Marbleized'},
		{'Bayonet_Mariposa'},
		{'Bayonet_Naval'},
		{'Bayonet_Neonic'},
		{'Bayonet_RSL'},
		{'Bayonet_Racer'},
		{'Bayonet_Sapphire'},
		{'Bayonet_Silent Night'},
		{'Bayonet_Splattered'},
		{'Bayonet_Stock'},
		{'Bayonet_Topaz'},
		{'Bayonet_Tropical'},
		{'Bayonet_Twitch'},
		{'Bayonet_UFO'},
		{'Bayonet_Wetland'},
		{'Bayonet_Worn'},
		{'Bayonet_Wrapped'},
		{'Bearded Axe_Beast'},
		{'Bearded Axe_Splattered'},
		{'Bizon_Autumic'},
		{'Bizon_Festive'},
		{'Bizon_Oblivion'},
		{'Bizon_Saint Nick'},
		{'Bizon_Sergeant'},
		{'Bizon_Shattered'},
		{'Butterfly Knife_Aurora'},
		{'Butterfly Knife_Bloodwidow'},
		{'Butterfly Knife_Consumed'},
		{'Butterfly Knife_Cosmos'},
		{'Butterfly Knife_Crimson Tiger'},
		{'Butterfly Knife_Crippled Fade'},
		{'Butterfly Knife_Digital'},
		{'Butterfly Knife_Egg Shell'},
		{'Butterfly Knife_Freedom'},
		{'Butterfly Knife_Frozen Dream'},
		{'Butterfly Knife_Goo'},
		{'Butterfly Knife_Hallows'},
		{'Butterfly Knife_Icicle'},
		{'Butterfly Knife_Inversion'},
		{'Butterfly Knife_Jade Dream'},
		{'Butterfly Knife_Marbleized'},
		{'Butterfly Knife_Naval'},
		{'Butterfly Knife_Neonic'},
		{'Butterfly Knife_Reaper'},
		{'Butterfly Knife_Ruby'},
		{'Butterfly Knife_Scapter'},
		{'Butterfly Knife_Splattered'},
		{'Butterfly Knife_Stock'},
		{'Butterfly Knife_Topaz'},
		{'Butterfly Knife_Tropical'},
		{'Butterfly Knife_Twitch'},
		{'Butterfly Knife_Wetland'},
		{'Butterfly Knife_White Boss'},
		{'Butterfly Knife_Worn'},
		{'Butterfly Knife_Wrapped'},
		{'CZ_Designed'},
		{'CZ_Festive'},
		{'CZ_Holidays'},
		{'CZ_Lightning'},
		{'CZ_Orange Web'},
		{'CZ_Spectre'},
		{'Cleaver_Spider'},
		{'Cleaver_Splattered'},
		{'DesertEagle_Cold Truth'},
		{'DesertEagle_Cool Blue'},
		{'DesertEagle_DropX'},
		{'DesertEagle_Glittery'},
		{'DesertEagle_Grim'},
		{'DesertEagle_Heat'},
		{'DesertEagle_Honor-bound'},
		{'DesertEagle_Independence'},
		{'DesertEagle_Krystallos'},
		{'DesertEagle_Pumpkin Buster'},
		{'DesertEagle_ROLVe'},
		{'DesertEagle_Racer'},
		{'DesertEagle_Scapter'},
		{'DesertEagle_Skin Committee'},
		{'DesertEagle_Survivor'},
		{'DesertEagle_Weeb'},
		{'DesertEagle_Xmas'},
		{'DualBerettas_Carbonized'},
		{'DualBerettas_Dusty Manor'},
		{'DualBerettas_Floral'},
		{'DualBerettas_Hexline'},
		{'DualBerettas_Neon web'},
		{'DualBerettas_Old Fashioned'},
		{'DualBerettas_Xmas'},
		{'Falchion Knife_Bloodwidow'},
		{'Falchion Knife_Chosen'},
		{'Falchion Knife_Coal'},
		{'Falchion Knife_Consumed'},
		{'Falchion Knife_Cosmos'},
		{'Falchion Knife_Crimson Tiger'},
		{'Falchion Knife_Crippled Fade'},
		{'Falchion Knife_Digital'},
		{'Falchion Knife_Egg Shell'},
		{'Falchion Knife_Festive'},
		{'Falchion Knife_Freedom'},
		{'Falchion Knife_Frozen Dream'},
		{'Falchion Knife_Goo'},
		{'Falchion Knife_Hallows'},
		{'Falchion Knife_Inversion'},
		{'Falchion Knife_Late Night'},
		{'Falchion Knife_Marbleized'},
		{'Falchion Knife_Naval'},
		{'Falchion Knife_Neonic'},
		{'Falchion Knife_Racer'},
		{'Falchion Knife_Ruby'},
		{'Falchion Knife_Splattered'},
		{'Falchion Knife_Stock'},
		{'Falchion Knife_Topaz'},
		{'Falchion Knife_Tropical'},
		{'Falchion Knife_Wetland'},
		{'Falchion Knife_Worn'},
		{'Falchion Knife_Wrapped'},
		{'Falchion Knife_Zombie'},
		{'Famas_Abstract'},
		{'Famas_Centipede'},
		{'Famas_Cogged'},
		{'Famas_Goliath'},
		{'Famas_Haunted Forest'},
		{'Famas_KugaX'},
		{'Famas_MK11'},
		{'Famas_Medic'},
		{'Famas_Redux'},
		{'Famas_Shocker'},
		{'Famas_Toxic Rain'},
		{'FiveSeven_Autumn Fade'},
		{'FiveSeven_Danjo'},
		{'FiveSeven_Fluid'},
		{'FiveSeven_Gifted'},
		{'FiveSeven_Midnight Ride'},
		{'FiveSeven_Mr. Anatomy'},
		{'FiveSeven_Stigma'},
		{'FiveSeven_Sub Zero'},
		{'FiveSeven_Summer'},
		{'Flip Knife_Stock'},
		{'G3SG1_Amethyst'},
		{'G3SG1_Autumn'},
		{'G3SG1_Foliage'},
		{'G3SG1_Hex'},
		{'G3SG1_Holly Bound'},
		{'G3SG1_Mahogany'},
		{'Galil_Frosted'},
		{'Galil_Hardware 2'},
		{'Galil_Hardware'},
		{'Galil_Toxicity'},
		{'Galil_Worn'},
		{'Glock_Angler'},
		{'Glock_Anubis'},
		{'Glock_Biotrip'},
		{'Glock_Day Dreamer'},
		{'Glock_Desert Camo'},
		{'Glock_Gravestomper'},
		{'Glock_Midnight Tiger'},
		{'Glock_Money Maker'},
		{'Glock_RSL'},
		{'Glock_Rush'},
		{'Glock_Scapter'},
		{'Glock_Spacedust'},
		{'Glock_Tarnish'},
		{'Glock_Underwater'},
		{'Glock_Wetland'},
		{'Glock_White Sauce'},
		{'Gut Knife_Banner'},
		{'Gut Knife_Bloodwidow'},
		{'Gut Knife_Consumed'},
		{'Gut Knife_Cosmos'},
		{'Gut Knife_Crimson Tiger'},
		{'Gut Knife_Crippled Fade'},
		{'Gut Knife_Digital'},
		{'Gut Knife_Egg Shell'},
		{'Gut Knife_Frozen Dream'},
		{'Gut Knife_Geo Blade'},
		{'Gut Knife_Goo'},
		{'Gut Knife_Hallows'},
		{'Gut Knife_Lurker'},
		{'Gut Knife_Marbleized'},
		{'Gut Knife_Naval'},
		{'Gut Knife_Neonic'},
		{'Gut Knife_Present'},
		{'Gut Knife_Ruby'},
		{'Gut Knife_Rusty'},
		{'Gut Knife_Splattered'},
		{'Gut Knife_Topaz'},
		{'Gut Knife_Tropical'},
		{'Gut Knife_Wetland'},
		{'Gut Knife_Worn'},
		{'Gut Knife_Wrapped'},
		{'Huntsman Knife_Aurora'},
		{'Huntsman Knife_Bloodwidow'},
		{'Huntsman Knife_Consumed'},
		{'Huntsman Knife_Cosmos'},
		{'Huntsman Knife_Cozy'},
		{'Huntsman Knife_Crimson Tiger'},
		{'Huntsman Knife_Crippled Fade'},
		{'Huntsman Knife_Digital'},
		{'Huntsman Knife_Egg Shell'},
		{'Huntsman Knife_Frozen Dream'},
		{'Huntsman Knife_Geo Blade'},
		{'Huntsman Knife_Goo'},
		{'Huntsman Knife_Hallows'},
		{'Huntsman Knife_Honor Fade'},
		{'Huntsman Knife_Marbleized'},
		{'Huntsman Knife_Monster'},
		{'Huntsman Knife_Naval'},
		{'Huntsman Knife_Ruby'},
		{'Huntsman Knife_Splattered'},
		{'Huntsman Knife_Stock'},
		{'Huntsman Knife_Tropical'},
		{'Huntsman Knife_Twitch'},
		{'Huntsman Knife_Wetland'},
		{'Huntsman Knife_Worn'},
		{'Huntsman Knife_Wrapped'},
		{'Karambit_Bloodwidow'},
		{'Karambit_Consumed'},
		{'Karambit_Cosmos'},
		{'Karambit_Crimson Tiger'},
		{'Karambit_Crippled Fade'},
		{'Karambit_Death Wish'},
		{'Karambit_Digital'},
		{'Karambit_Egg Shell'},
		{'Karambit_Festive'},
		{'Karambit_Frozen Dream'},
		{'Karambit_Glossed'},
		{'Karambit_Gold'},
		{'Karambit_Goo'},
		{'Karambit_Hallows'},
		{'Karambit_Jade Dream'},
		{'Karambit_Jester'},
		{'Karambit_Lantern'},
		{'Karambit_Liberty Camo'},
		{'Karambit_Marbleized'},
		{'Karambit_Naval'},
		{'Karambit_Neonic'},
		{'Karambit_Pizza'},
		{'Karambit_Quicktime'},
		{'Karambit_Racer'},
		{'Karambit_Ruby'},
		{'Karambit_Scapter'},
		{'Karambit_Splattered'},
		{'Karambit_Stock'},
		{'Karambit_Topaz'},
		{'Karambit_Tropical'},
		{'Karambit_Twitch'},
		{'Karambit_Wetland'},
		{'Karambit_Worn'},
		{'M249_Aggressor'},
		{'M249_P2020'},
		{'M249_Spooky'},
		{'M249_Wolf'},
		{'M4A1_Animatic'},
		{'M4A1_Burning'},
		{'M4A1_Desert Camo'},
		{'M4A1_Heavens Gate'},
		{'M4A1_Impulse'},
		{'M4A1_Jester'},
		{'M4A1_Lunar'},
		{'M4A1_Necropolis'},
		{'M4A1_Tecnician'},
		{'M4A1_Toucan'},
		{'M4A1_Wastelander'},
		{'M4A4_BOT[S]'},
		{'M4A4_Candyskull'},
		{'M4A4_Delinquent'},
		{'M4A4_Desert Camo'},
		{'M4A4_Devil'},
		{'M4A4_Endline'},
		{'M4A4_Flashy Ride'},
		{'M4A4_Ice Cap'},
		{'M4A4_Jester'},
		{'M4A4_King'},
		{'M4A4_Mistletoe'},
		{'M4A4_Pinkie'},
		{'M4A4_Pinkvision'},
		{'M4A4_Pondside'},
		{'M4A4_Precision'},
		{'M4A4_Quicktime'},
		{'M4A4_Racer'},
		{'M4A4_RayTrack'},
		{'M4A4_Scapter'},
		{'M4A4_Stardust'},
		{'M4A4_Toy Soldier'},
		{'MAC10_Artists Intent'},
		{'MAC10_Blaze'},
		{'MAC10_Golden Rings'},
		{'MAC10_Pimpin'},
		{'MAC10_Skeleboney'},
		{'MAC10_Toxic'},
		{'MAC10_Turbo'},
		{'MAC10_Wetland'},
		{'MAG7_Bombshell'},
		{'MAG7_C4UTION'},
		{'MAG7_Frosty'},
		{'MAG7_Molten'},
		{'MAG7_Outbreak'},
		{'MAG7_Striped'},
		{'MP7_Calaxian'},
		{'MP7_Cogged'},
		{'MP7_Goo'},
		{'MP7_Holiday'},
		{'MP7_Industrial'},
		{'MP7_Reindeer'},
		{'MP7_Silent Ops'},
		{'MP7_Sunshot'},
		{'MP9_Blueroyal'},
		{'MP9_Cob Web'},
		{'MP9_Cookie Man'},
		{'MP9_Decked Halls'},
		{'MP9_SnowTime'},
		{'MP9_Vaporwave'},
		{'MP9_Velvita'},
		{'MP9_Wilderness'},
		{'Negev_Default'},
		{'Negev_Midnightbones'},
		{'Negev_Quazar'},
		{'Negev_Striped'},
		{'Negev_Wetland'},
		{'Negev_Winterfell'},
		{'Nova_Black Ice'},
		{'Nova_Cookie'},
		{'Nova_Paradise'},
		{'Nova_Sharkesh'},
		{'Nova_Starry Night'},
		{'Nova_Terraformer'},
		{'Nova_Tiger'},
		{'P2000_Apathy'},
		{'P2000_Camo Dipped'},
		{'P2000_Candycorn'},
		{'P2000_Comet'},
		{'P2000_Dark Beast'},
		{'P2000_Golden Age'},
		{'P2000_Lunar'},
		{'P2000_Pinkie'},
		{'P2000_Ruby'},
		{'P2000_Silence'},
		{'P250_Amber'},
		{'P250_Bomber'},
		{'P250_Equinox'},
		{'P250_Frosted'},
		{'P250_Goldish'},
		{'P250_Green Web'},
		{'P250_Shark'},
		{'P250_Solstice'},
		{'P250_TC250'},
		{'P90_Demon Within'},
		{'P90_Elegant'},
		{'P90_Krampus'},
		{'P90_Northern Lights'},
		{'P90_P-Chan'},
		{'P90_Pine'},
		{'P90_Redcopy'},
		{'P90_Skulls'},
		{'R8_Exquisite'},
		{'R8_Hunter'},
		{'R8_Spades'},
		{'R8_TG'},
		{'R8_Violet'},
		{'SG_DropX'},
		{'SG_Dummy'},
		{'SG_Kitty Cat'},
		{'SG_Knighthood'},
		{'SG_Magma'},
		{'SG_Variant Camo'},
		{'SG_Yltude'},
		{'SawedOff_Casino'},
		{'SawedOff_Colorboom'},
		{'SawedOff_Executioner'},
		{'SawedOff_Opal'},
		{'SawedOff_Spooky'},
		{'SawedOff_Sullys Blacklight'},
		{'Scout_Coffin Biter'},
		{'Scout_Flowing Mists'},
		{'Scout_Hellborn'},
		{'Scout_Hot Cocoa'},
		{'Scout_Monstruo'},
		{'Scout_Neon Regulation'},
		{'Scout_Posh'},
		{'Scout_Pulse'},
		{'Scout_Railgun'},
		{'Scout_Theory'},
		{'Scout_Xmas'},
		{'Sickle_Mummy'},
		{'Sickle_Splattered'},
		{'Tec9_Charger'},
		{'Tec9_Gift Wrapped'},
		{'Tec9_Ironline'},
		{'Tec9_Performer'},
		{'Tec9_Phol'},
		{'Tec9_Samurai'},
		{'Tec9_Skintech'},
		{'Tec9_Stocking Stuffer'},
		{'UMP_Death Grip'},
		{'UMP_Gum Drop'},
		{'UMP_Magma'},
		{'UMP_Militia Camo'},
		{'UMP_Molten'},
		{'UMP_Redline'},
		{'USP_Crimson'},
		{'USP_Dizzy'},
		{'USP_Frostbite'},
		{'USP_Holiday'},
		{'USP_Jade Dream'},
		{'USP_Kraken'},
		{'USP_Nighttown'},
		{'USP_Paradise'},
		{'USP_Racing'},
		{'USP_Skull'},
		{'USP_Unseen'},
		{'USP_Worlds Away'},
		{'USP_Yellowbelly'},
		{'XM_Artic'},
		{'XM_Atomic'},
		{'XM_Campfire'},
		{'XM_Endless Night'},
		{'XM_MK11'},
		{'XM_Predator'},
		{'XM_Red'},
		{'XM_Spectrum'},
		{'Handwraps_Wraps'},
		{'Sports Glove_Hazard'},
		{'Sports Glove_Hallows'},
		{'Sports Glove_Majesty'},
		{'Strapped Glove_Racer'},
		{'trapped Glove_Grim'},
		{'trapped Glove_Wisk'},
		{'Fingerless Glove_Scapter'},
		{'Fingerless Glove_Digital'},
		{'Fingerless Glove_Patch'},
		{'Handwraps_Guts'},
		{'Handwraps_Wetland'},
		{'trapped Glove_Molten'},
		{'Fingerless_Crystal'},
		{'Sports Glove_Royal'},
		{'Strapped Glove_Kringle'},
		{'Handwraps_MMA'},
		{'Sports Glove_Weeb'},
		{'Sports Glove_CottonTail'},
		{'Sports Glove_RSL'},
		{'Handwraps_Ghoul Hex'},
		{'Handwraps_Phantom Hex'},
		{'Handwraps_Spector Hex'},
		{'Handwraps_Orange Hex'},
		{'Handwraps_Purple Hex'},
		{'Handwraps_Green Hex'},
	}
	
	local isUnlocked
	
	local mt = getrawmetatable(game)
	local oldNamecall = mt.__namecall
	setreadonly(mt, false)
	
	local isUnlocked
	
	mt.__namecall = newcclosure(function(self, ...)
		local args = {...}
		if getnamecallmethod() == "InvokeServer" and tostring(self) == "Hugh" then
			return
		end
		if getnamecallmethod() == "FireServer" then
			if args[1] == LocalPlayer.UserId then
				return
			end
			if string.len(tostring(self)) == 38 then
				if not isUnlocked then
					isUnlocked = true
					for i,v in pairs(allSkins) do
						local doSkip
						for i2,v2 in pairs(args[1]) do
							if v[1] == v2[1] then
								doSkip = true
							end
						end
						if not doSkip then
							table.insert(args[1], v)
						end
					end
				end
				return
			end
			if tostring(self) == "DataEvent" and args[1][4] then
				local currentSkin = string.split(args[1][4][1], "_")[2]
				if args[1][2] == "Both" then
					LocalPlayer["SkinFolder"]["CTFolder"][args[1][3]].Value = currentSkin
					LocalPlayer["SkinFolder"]["TFolder"][args[1][3]].Value = currentSkin
				else
					LocalPlayer["SkinFolder"][args[1][2] .. "Folder"][args[1][3]].Value = currentSkin
				end
			end
		end
		return oldNamecall(self, ...)
	end)
	
	setreadonly(mt, true)
	
	Client.CurrentInventory = allSkins
	
	local TClone, CTClone = LocalPlayer.SkinFolder.TFolder:Clone(), game.Players.LocalPlayer.SkinFolder.CTFolder:Clone()
	LocalPlayer.SkinFolder.TFolder:Destroy()
	LocalPlayer.SkinFolder.CTFolder:Destroy()
	TClone.Parent = LocalPlayer.SkinFolder
	CTClone.Parent = LocalPlayer.SkinFolder
end)





thirdButton.Name = "thirdButton"
thirdButton.Parent = Gui
thirdButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
thirdButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
thirdButton.BorderSizePixel = 0
thirdButton.Position = UDim2.new(0.0188456476, 0, 0.69768244, 0)
thirdButton.Size = UDim2.new(0, 198, 0, 32)
thirdButton.Font = Enum.Font.Gotham
thirdButton.Text = "Third Person"
thirdButton.TextColor3 = Color3.fromRGB(0, 170, 255)
thirdButton.TextSize = 23.000
thirdButton.TextWrapped = true
thirdButton.MouseButton1Down:connect(function()
 thirdperson = not thirdperson
			
			if thirdperson == true then
				print("thirdpersonon")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "third person ON";
				})
			else
				print("thirdpersonoff")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "third person OFF";
				})
			end
    end)

	game:GetService('RunService').Heartbeat:connect(
	function()
        	while wait() do
        	      if thirdperson == true then
                game.Players.LocalPlayer.CameraMode = "Classic"
                game.Players.LocalPlayer.CameraMaxZoomDistance = 8
                game.Players.LocalPlayer.CameraMinZoomDistance = 8
        	end
        end
    while wait() do
            if thirdperson == false then
                game.Players.LocalPlayer.CameraMode = "Classic"
                game.Players.LocalPlayer.CameraMaxZoomDistance = 0
                game.Players.LocalPlayer.CameraMinZoomDistance = 0
        end
    end
end)

skinchangerButton_2.Name = "skinchangerButton"
skinchangerButton_2.Parent = Gui
skinchangerButton_2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
skinchangerButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
skinchangerButton_2.BorderSizePixel = 0
skinchangerButton_2.Position = UDim2.new(0.510610342, 0, 0.49616152, 0)
skinchangerButton_2.Size = UDim2.new(0, 198, 0, 32)
skinchangerButton_2.Font = Enum.Font.Gotham
skinchangerButton_2.Text = "TriggerBot [T]"
skinchangerButton_2.TextColor3 = Color3.fromRGB(0, 170, 255)
skinchangerButton_2.TextSize = 23.000
skinchangerButton_2.TextWrapped = true
skinchangerButton_2.MouseButton1Down:connect(function()

	game:GetService("UserInputService").InputBegan:connect(function(inputObject)
		if inputObject.KeyCode == Enum.KeyCode.T then
			triggerboton = not triggerboton
			
			if triggerboton == true then
				print("triggerboton")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "TriggerBot ON";
				})
			else
				print("triggerbotoff")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "TriggerBot OFF";
				})
			end
		end
	end)

game:GetService('RunService').Heartbeat:connect(
	function()
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:getMouse()
if mouse.Target.Name == "UpperTorso" and triggerboton == true then
    mouse1press()
    wait(0.1)
    mouse1release()
    print("shootUT")
    elseif mouse.Target.Name == "HeadHB" and triggerboton == true then
        mouse1press()
        wait()
        mouse1release()
        print("shootHead")
        elseif mouse.Target.Name == "HumanoidRootPart" and triggerboton == true then
            mouse1press()
            wait(0.1)
            mouse1release()
            print("shootHRP")
            elseif mouse.Target.Name == "Waist" and triggerboton == true then
                mouse1press()
                wait(0.1)
                mouse1release()
                print("shoot")
                elseif mouse.Target.Name == "LeftHand" and triggerboton == true then
                    mouse1press()
                    wait(0.1)
                    mouse1release()
                    print("shoot")
                     elseif mouse.Target.Name == "RightHand" and triggerboton == true then
                        mouse1press()
                        wait(0.1)
                        mouse1release()
                        print("shoot")
                        elseif mouse.Target.Name == "RightUpperLeg" and triggerboton == true then
                            mouse1press()
                            wait(0.1)
                            mouse1release()
                            print("shoot")
                            elseif mouse.Target.Name == "LeftUpperLeg" and triggerboton == true then
                                mouse1press()
                                wait(0.1)
                                mouse1release()
                                print("shoot")
                                 elseif mouse.Target.Name == "RightLowerLeg" and triggerboton == true then
                                    mouse1press()
                                    wait(0.1)
                                    mouse1release()
                                    print("shoot")
                                    elseif mouse.Target.Name == "LeftLowerLeg" and triggerboton == true then
                                        mouse1press()
                                        wait(0.1)
                                        mouse1release()
                                        print("shoot")
                                             elseif mouse.Target.Name == "Gun" and triggerboton == true then
                                                mouse1press()
                                                wait(0.1)
                                                mouse1release()
                                                print("shoot")
                                                   elseif mouse.Target.Name == "Right Arm" and triggerboton == true then
                                                        mouse1press()
                                                        wait(0.1)
                                                        mouse1release()
                                                        print("shoot")
                                                        elseif mouse.Target.Name == "RightLowerLeg" and triggerboton == true then
                                                            mouse1press()
                                                            wait(0.1)
                                                            mouse1release()
                                                            print("shoot")
                                                            elseif mouse.Target.Name == "Handle" and triggerboton == true then
                                                                mouse1press()
                                                                wait(0.1)
                                                                mouse1release()
                                                                print("shoot")
                                                                 elseif mouse.Target.Name == "Left Arm" and triggerboton == true then
                                                                    mouse1press()
                                                                    wait(0.1)
                                                                    mouse1release()
                                                                    print("shoot")
                                                                     elseif mouse.Target.Name == "RightLowerArm" and triggerboton == true then
                                                                        mouse1press()
                                                                        wait(0.1)
                                                                        mouse1release()
                                                                        print("shoot")
                                                                         elseif mouse.Target.Name == "LeftLowerArm" and triggerboton == true then
                                                                            mouse1press()
                                                                            wait(0.1)
                                                                            mouse1release()
                                                                            print("shoot")
                                                                             elseif mouse.Target.Name == "RightUpperArm" and triggerboton == true then
                                                                                mouse1press()
                                                                                wait(0.1)
                                                                                mouse1release()
                                                                                print("shoot")
                                                                                 elseif mouse.Target.Name == "LeftUpperArm" and triggerboton == true then
                                                                                    mouse1press()
                                                                                    wait(0.1)
                                                                                    mouse1release()
                                                                                    print("shoot")
                        end
                    end)
            end)

X.Name = "X"
X.Parent = Gui
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.930408299, 0, -0.00760455849, 0)
X.Size = UDim2.new(0, 30, 0, 30)
X.Font = Enum.Font.Gotham
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 0, 4)
X.TextSize = 26.000
X.TextStrokeColor3 = Color3.fromRGB(255, 0, 4)
X.MouseButton1Down:connect(function()
	Gui.Visible = false
	openGui.Visible = true
end)

aimbotButton.Name = "aimbotButton"
aimbotButton.Parent = Gui
aimbotButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
aimbotButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
aimbotButton.BorderSizePixel = 0
aimbotButton.Position = UDim2.new(0.0188456438, 0, 0.2984429, 0)
aimbotButton.Size = UDim2.new(0, 198, 0, 32)
aimbotButton.Font = Enum.Font.Gotham
aimbotButton.Text = "Aimbot [X]"
aimbotButton.TextColor3 = Color3.fromRGB(0, 170, 255)
aimbotButton.TextSize = 23.000
aimbotButton.TextWrapped = true
aimbotButton.MouseButton1Down:connect(function()
	--aimbot toggle E
	print('sup')
	bodyPart = 'Head'
	
	on = false
	
	local lp = game:GetService('Players').LocalPlayer
	local char = lp.Character
	
	
	local mouse = lp:GetMouse()
	
	
	game:GetService("UserInputService").InputBegan:connect(function(inputObject)
		if inputObject.KeyCode == Enum.KeyCode.X then
			on = not on
			
			if on == true then
				print("on")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Aimbot ON";
				})
			else
				print("off")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Aimbot OFF";
				})
			end
		end
	end)
	
	game:GetService("UserInputService").InputBegan:connect(function(inputObject)
		if inputObject.KeyCode == Enum.KeyCode.Z then
			AimThroughon = not AimThroughon
			
			if AimThroughon == true then
				print("AimThroughon")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Aimbot Through Walls ON";
				})
			else
				print("AimThroughoff")
				game:GetService("StarterGui"):SetCore("SendNotification",{
					Title = "GamerWare";
					Text = "Aimbot Through Walls OFF";
				})
			end
		end
	end)




	
	
--[[local function isObstructed(part)
   local hrp = char.HumanoidRootPart
   local PointA_Position = hrp.Position
   local PointB_Position = part.Position

   local Direction = (PointB_Position - PointA_Position).Unit
   local Raycast = Ray.new(PointA_Position, Direction * 100)
   local Hit = workspace:FindPartOnRay(Raycast, char)
   if Hit == part then
       return true
   else
       return false
   end
end
]]
	
	function cansee(targ)
		local cam = workspace.CurrentCamera
		local ray = Ray.new(lp.Character.Head.CFrame.p, (targ.CFrame.p - lp.Character.Head.CFrame.p).unit * 300)
		local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {lp.Character}, false, true)
		if AimThroughon == true then
		return true
		elseif part then
			local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
			
			if not humanoid then
				humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
			end
			
			if humanoid and targ and humanoid.Parent == targ.Parent then
				local blah,actualthing = cam:WorldToScreenPoint(targ.Position)
				if actualthing == true then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end
	
	
	
	
	local function getClosestPlayerToCursor(x, y)
		local closestPlayer = nil
		local shortestDistance = math.huge
		
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
				local pos = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(x, y)).magnitude
				
				local targettable = (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0
				if magnitude < shortestDistance and cansee(v.Character.Head) == true and (v.Team ~= lp.Team or v.Team == nil) and v.Character.Humanoid.Health > 0 then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer, shortestDistance
	end
	
	
	
	
	
	
	
	
	
	
	TweenStatus = nil
	
	local TweenService = game:GetService("TweenService")
	TweenCFrame = Instance.new("CFrameValue")
	
	
	function tweenstuff(partpos)
		TweenStatus = true
		TweenCFrame.Value = workspace.CurrentCamera.CFrame
		local tweenframe = TweenService:Create(TweenCFrame, TweenInfo.new(0.2),{Value = CFrame.new(workspace.CurrentCamera.CFrame.Position, partpos)})
		tweenframe:Play()
		tweenframe.Completed:Wait()
		TweenStatus = nil
		TweenCFrame.Value = CFrame.new(0,0,0)
	end
	
	
	
	
	game:GetService('RunService').Heartbeat:connect(
	function()
		if on == true then
			local plr, distance = getClosestPlayerToCursor(mouse.X, mouse.Y)
			if TweenStatus == nil and plr ~= nil and distance > 150 then
				tweenstuff(plr.Character.Head.position)
			end
			if TweenStatus == true then
				workspace.CurrentCamera.CFrame = TweenCFrame.Value
			end
			if plr ~= nil and distance < 150 and TweenStatus == nil then
				workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, plr.Character.Head.Position)
			end
		end
	end)
	
end)





openGui.Name = "openGui"
openGui.Parent = ScreenGui
openGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
openGui.Position = UDim2.new(-0.00473559601, 0, 0.433660954, 0)
openGui.Size = UDim2.new(0, 100, 0, 33)
openGui.Active = true
openGui.Draggable = true

Open.Name = "Open"
Open.Parent = openGui
Open.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(-0.00115447864, 0, -0.0045876801, 0)
Open.Size = UDim2.new(0, 100, 0, 33)
Open.Font = Enum.Font.Gotham
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(0, 170, 255)
Open.TextSize = 23.000
Open.TextWrapped = true
Open.MouseButton1Down:connect(function()
	openGui.Visible = false
	Gui.Visible = true
end)