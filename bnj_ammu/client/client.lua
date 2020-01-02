local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local Licenses                = {}

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

RegisterNetEvent('bnj_ammu:loadLicenses')
AddEventHandler('bnj_ammu:loadLicenses', function (licenses)
  for i = 1, #licenses, 1 do
    Licenses[licenses[i].type] = true
  end
end)

RegisterNetEvent('bnj_ammu:PlaySoundSucces')
AddEventHandler('bnj_ammu:PlaySoundSucces', function (licenses)
  ESX.ShowAdvancedNotification('Vendeur d\'arme', 'Licence acquise.', 'Merci de ton achat , tu veux acheter quoi maintenant ?', 'CHAR_AMMUNATION', 1)
  PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", 0)
end)

RegisterNetEvent('bnj_ammu:PlaySoundRater')
AddEventHandler('bnj_ammu:PlaySoundRater', function (licenses)
  ESX.ShowAdvancedNotification('Vendeur d\'arme', 'Licence non acquise.', 'Désolé mais ta pas assez d\'argent, revient plus tard.', 'CHAR_AMMUNATION', 1)
  PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 0)
end)



_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Armurerie","Tu veux quel calibre ?", nil, nil)
_menuPool:Add(mainMenu)

function AddAmmuMenu(menu)

    local lsmenu = _menuPool:AddSubMenu(menu, "Licence d\'armes", "Si tu l\'achète pas , la LSPD va te mettre tarif !", nil)
    lsmenu.Item:SetRightBadge(BadgeStyle.Alert)

    local gunsmenu = _menuPool:AddSubMenu(menu, "Armes", nil, nil)
    gunsmenu.Item:SetRightBadge(BadgeStyle.Gun)
    
    local accsmenu2 = _menuPool:AddSubMenu(menu, "Accessoires", nil, nil)
    accsmenu2.Item:SetRightBadge(BadgeStyle.Ammo)

    local skinmenu = _menuPool:AddSubMenu(menu, "Camouflage", nil, nil)
    skinmenu.Item:SetRightBadge(BadgeStyle.Makeup)

    local ls = NativeUI.CreateItem("Licence d\'armes", "")
    lsmenu.SubMenu:AddItem(ls)
    ls:RightLabel("25000$")

    lsmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == ls then
            TriggerServerEvent('bnj_ammu:buyLicense')
            PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~25000$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté une ~b~Licence d\'armes'", "", "CHAR_AMMUNATION", 1)
        end
    end   
    
    local bat = NativeUI.CreateItem("Batte", "")
    gunsmenu.SubMenu:AddItem(bat)
    bat:RightLabel("800$")

    local pied = NativeUI.CreateItem("Pied de Biche", "")
    gunsmenu.SubMenu:AddItem(pied)
    pied:RightLabel("550$")

    local ham = NativeUI.CreateItem("Marteau", "")
    gunsmenu.SubMenu:AddItem(ham)
    ham:RightLabel("800$")

    local knif = NativeUI.CreateItem("Couteau", "")
    gunsmenu.SubMenu:AddItem(knif)
    knif:RightLabel("650$")

    local machette = NativeUI.CreateItem("Machette", "")
    gunsmenu.SubMenu:AddItem(machette)
    machette:RightLabel("750$")

    local poingam = NativeUI.CreateItem("Poing Américain", "")
    gunsmenu.SubMenu:AddItem(poingam)
    poingam:RightLabel("750$")

    local sns = NativeUI.CreateItem("Pistolet SNS", "")
    gunsmenu.SubMenu:AddItem(sns)
    sns:RightLabel("15000$")


    gunsmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == bat then
            TriggerServerEvent('buyBTT')
            PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~800$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté une ~b~Batte", "", "CHAR_AMMUNATION", 1)
        elseif item == pied then
            TriggerServerEvent('buyPied')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~550$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Pied de Biche", "", "CHAR_AMMUNATION", 1)
        elseif item == ham then
            TriggerServerEvent('buyHam')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~800$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Marteau", "", "CHAR_AMMUNATION", 1)
        elseif item == knif then
            TriggerServerEvent('buyKnife')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~650$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Couteau", "", "CHAR_AMMUNATION", 1)
        elseif item == machette then
            TriggerServerEvent('buyMachette')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~750$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté une ~b~Machette", "", "CHAR_AMMUNATION", 1)
        elseif item == poingam then
            TriggerServerEvent('buyPoinga')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~750$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Poing Américain", "", "CHAR_AMMUNATION", 1) 
        elseif item == sns then
            TriggerServerEvent('buySns')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~15000$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Pistolet SNS", "", "CHAR_AMMUNATION", 1)                    
        end
    end

    local lt = NativeUI.CreateItem("Lampe torche", "")
    accsmenu2.SubMenu:AddItem(lt)
    lt:RightLabel("100$")

    local clip = NativeUI.CreateItem("Chargeur", "")
    accsmenu2.SubMenu:AddItem(clip)
    clip:RightLabel("150$")

    local grip = NativeUI.CreateItem("Poignée", "")
    accsmenu2.SubMenu:AddItem(grip)
    grip:RightLabel("200$")

    local silent = NativeUI.CreateItem("Silencieux", "")
    accsmenu2.SubMenu:AddItem(silent)
    silent:RightLabel("250$")

    local large = NativeUI.CreateItem("Viseur Large", "")
    accsmenu2.SubMenu:AddItem(large)
    large:RightLabel("175$")

    local holo = NativeUI.CreateItem("Viseur Holo", "")
    accsmenu2.SubMenu:AddItem(holo)
    holo:RightLabel("175$")

    local medium = NativeUI.CreateItem("Viseur Médium", "")
    accsmenu2.SubMenu:AddItem(medium)
    medium:RightLabel("175$")

    local muzzle = NativeUI.CreateItem("Frein de Bouche", "")
    accsmenu2.SubMenu:AddItem(muzzle)
    muzzle:RightLabel("100$")
  
    accsmenu2.SubMenu.OnItemSelect = function(menu, item)
        if item == lt then
            TriggerServerEvent('buyLT')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~100$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté une ~b~Lampe ~b~torche", "", "CHAR_AMMUNATION", 1)
        elseif item == clip then
            TriggerServerEvent('buyClip')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~150$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Chargeur", "", "CHAR_AMMUNATION", 1)
        elseif item == grip then
            TriggerServerEvent('buyGrip')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~200$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté une ~b~Poignée", "", "CHAR_AMMUNATION", 1)
        elseif item == silent then
            TriggerServerEvent('buySilent')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~250$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Silencieux", "", "CHAR_AMMUNATION", 1)
        elseif item == large then
            TriggerServerEvent('buyLarge')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~175$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Viseur Large", "", "CHAR_AMMUNATION", 1)
        elseif item == holo then
            TriggerServerEvent('buyHolo')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~175$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Viseur Holo", "", "CHAR_AMMUNATION", 1)
        elseif item == medium then
            TriggerServerEvent('buyMedium')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~175$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Viseur Médium", "", "CHAR_AMMUNATION", 1)
        elseif item == muzzle then
            TriggerServerEvent('buyMuzzle')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~100$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un ~b~Frein de Bouche", "", "CHAR_AMMUNATION", 1)
        end    
    end

    local love = NativeUI.CreateItem("Love", "Poing Américain")
    skinmenu.SubMenu:AddItem(love)
    love:RightLabel("800$")

    local papillon = NativeUI.CreateItem("Papillon", "Pistolet 50")
    skinmenu.SubMenu:AddItem(papillon)
    papillon:RightLabel("750$")

    local platine = NativeUI.CreateItem("Platine", "Pistolet 50")
    skinmenu.SubMenu:AddItem(platine)
    platine:RightLabel("700$")

    local bois = NativeUI.CreateItem("Bois", "Pistolet Lourd")
    skinmenu.SubMenu:AddItem(bois)
    bois:RightLabel("650$")

    local bnj = NativeUI.CreateItem("BNJ", "AK-47")
    skinmenu.SubMenu:AddItem(bnj)
    bnj:RightLabel("600$")

    local zebra = NativeUI.CreateItem("Zèbre", "AK-47")
    skinmenu.SubMenu:AddItem(zebra)
    zebra:RightLabel("550$")

    local bombe = NativeUI.CreateItem("Bombe", "AK-47")
    skinmenu.SubMenu:AddItem(bombe)
    bombe:RightLabel("500$")

    local pimp = NativeUI.CreateItem("Pimp", "Poing Américain")
    skinmenu.SubMenu:AddItem(pimp)
    pimp:RightLabel("450$")

    local ballas = NativeUI.CreateItem("Ballas", "Poing Américain")
    skinmenu.SubMenu:AddItem(ballas)
    ballas:RightLabel("400$")

    local dollars = NativeUI.CreateItem("Dollars", "Poing Américain")
    skinmenu.SubMenu:AddItem(dollars)
    dollars:RightLabel("350$")

    local diamond = NativeUI.CreateItem("Diamond", "Poing Américain")
    skinmenu.SubMenu:AddItem(diamond)
    diamond:RightLabel("300$")
    
    skinmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == love then
            TriggerServerEvent('buyLove')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~800$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Love", "", "CHAR_AMMUNATION", 1)
        elseif item == papillon then
            TriggerServerEvent('buyPapillon')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~750$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Papillon", "", "CHAR_AMMUNATION", 1)
        elseif item == platine then
            TriggerServerEvent('buyPlatine')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~700$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Platine", "", "CHAR_AMMUNATION", 1)
        elseif item == bois then
            TriggerServerEvent('buyBois')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~650$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Bois", "", "CHAR_AMMUNATION", 1)
        elseif item == bnj then
            TriggerServerEvent('buybnj')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~600$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~bnj", "", "CHAR_AMMUNATION", 1)
        elseif item == zebra then
            TriggerServerEvent('buyZebra')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~550$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Zèbre", "", "CHAR_AMMUNATION", 1)
        elseif item == bombe then
            TriggerServerEvent('buyBombe')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~500$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Bombe", "", "CHAR_AMMUNATION", 1)
        elseif item == pimp then
            TriggerServerEvent('buyPimp')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~450$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Pimp", "", "CHAR_AMMUNATION", 1)
        elseif item == ballas then
            TriggerServerEvent('buyBallas')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~400$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Ballas", "", "CHAR_AMMUNATION", 1)
        elseif item == dollars then
            TriggerServerEvent('buyDollars')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~350$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Dollars", "", "CHAR_AMMUNATION", 1)
        elseif item == diamond then
            TriggerServerEvent('buyDiamond')
                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0)
            ESX.ShowNotification('Vous avez payez ~r~300$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Armurerie", "Vous avez acheté un camouflage ~b~Diamant", "", "CHAR_AMMUNATION", 1)
        end    
    end 
end

AddAmmuMenu(mainMenu)
_menuPool:RefreshIndex()

local pos = {
    { x = -662.180,   y = -934.961,   z = 20.82 },
    { x = 810.25,     y = -2157.60,   z = 28.62 },
    { x = 1693.44,    y = 3760.16,    z = 33.71 },
    { x = -330.24,    y = 6083.88,    z = 30.45 },
    { x = 252.63,     y = -50.00,     z = 68.94 },
    { x = 22.09,      y = -1107.28,   z = 28.80 },
    { x = 2567.69,    y = 294.38,     z = 107.73 },
    { x = -1117.58,   y = 2698.61,    z = 17.55 },
    { x = 842.44,     y = -1033.42,   z = 27.19 }
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(pos) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec le ~r~Vendeur")
                if IsControlJustPressed(1,51) then 
                 --   ESX.ShowAdvancedNotification("Armurerie", "Bonjour que puis-je pour vous ?", "", "CHAR_ARTHUR", 1)
                    print('^1Chargement Effectué !\n^3BNJ')
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)

local blips = {
   -- {title="Armurerie", colour=4, id=110, x = -662.180,   y = -934.961,   z = 20.82},
    --{title="Armurerie", colour=4, id=110, x = 810.25,     y = -2157.60,   z = 28.62},
    --{title="Armurerie", colour=4, id=110, x = 1693.44,    y = 3760.16,    z = 33.71},
    --{title="Armurerie", colour=4, id=110, x = -330.24,    y = 6083.88,    z = 30.45},
   -- {title="Armurerie", colour=4, id=110, x = 252.63,     y = -50.00,     z = 68.94},
    {title="~r~[Magasin]~g~ Armurerie", colour=4, id=110, x = 22.09,      y = -1107.28,   z = 28.80},
   -- {title="Armurerie", colour=4, id=110, x = 2567.69,    y = 294.38,     z = 107.73},
   -- {title="Armurerie", colour=4, id=110, x = -1117.58,   y = 2698.61,    z = 17.55},
   -- {title="Armurerie", colour=4, id=110, x = 842.44,     y = -1033.42,   z = 27.19}
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

local koordinaten = {
    {22.70, -1105.27, 28.79,"Drogendealer",150.8,1657546978,"s_m_y_armymech_01"}
}


Citizen.CreateThread(function()

    for _,v in pairs(koordinaten) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)




local zones = {

	['30'] = { ['x'] =21.86, ['y'] = -1084.80, ['z'] = 29.80}, -- Spawn aéroport

	

}

ESX = nil

local notifIn = false

local notifOut = false

local veh = false

local closestZone = 100000

local distance = 0

local safe = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()

	while true do

		local playerPed = GetPlayerPed(-1)

		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))

		local minDistance = 100000

		for k,v in pairs(zones) do

			dist = Vdist(zones[k].x, zones[k].y, zones[k].z, x, y, z)

			if dist < minDistance then

				minDistance = dist

				closestZone = k

				distance = tonumber(k)

			end

		end

		local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

		if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) and veh == false then	

		SetEntityInvincible(vehs, false)

		elseif (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) and veh == true then

		SetEntityInvincible(vehs, true)

		end

		Citizen.Wait(10000)

	end

end)



Citizen.CreateThread(function()

	while true do

		Citizen.Wait(5)

		local player = GetPlayerPed(-1)

		local x,y,z = table.unpack(GetEntityCoords(player, true))

		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)

	

		if dist <= distance then

			if not notifIn then	

				veh = true				

				local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

				if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) then	

				SetEntityInvincible(vehs, true)

				end

				safe = true

				SetEntityInvincible(player, true)												  

				NetworkSetFriendlyFireOption(false)

				SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

                ESX.ShowAdvancedNotification("Armurerie", "Bonjour que puis-je pour vous ?", "", "CHAR_ARTHUR", 1)
                print('^1Entrée dans la Zone')
            

				notifIn = true

				notifOut = false

			end

		else

			if not notifOut then

				veh = false

				local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

				if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) then	

				SetEntityInvincible(vehs, false)

				end

				safe = false

				SetEntityInvincible(player, false)

				NetworkSetFriendlyFireOption(true)

                ESX.ShowAdvancedNotification("Armurerie", "Merci ! Aurevoir", "", "CHAR_ARTHUR", 1)
                print('^1Sortie de la Zone')

				notifOut = true

				notifIn = false

			end

		end

	

	

	end

end)



AddEventHandler('safe:Check', function(cb)

cb(safe)

end)