ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
  TriggerEvent('esx_license:getLicenses', source, function (licenses)
    TriggerClientEvent('bnj_ammu:loadLicenses', source, licenses)
  end)
end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end

RegisterServerEvent('bnj_ammu:buyLicense')
AddEventHandler('bnj_ammu:buyLicense', function ()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.get('money') >= Config.LicensePrice then
    xPlayer.removeMoney(Config.LicensePrice)

    TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
      LoadLicenses(_source)
    end)
    TriggerClientEvent('bnj_ammu:PlaySoundSucces', _source)
  else
    --TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    TriggerClientEvent('bnj_ammu:PlaySoundRater', _source)
  end
end)


RegisterNetEvent('buyLT')
AddEventHandler('buyLT', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_FLASHLIGHT', 1)
end)

RegisterNetEvent('buyBTT')
AddEventHandler('buyBTT', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBtt
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_BAT', 1)
end)

RegisterNetEvent('buyPied')
AddEventHandler('buyPied', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePied
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_CROWBAR', 1)
end)

RegisterNetEvent('buyHam')
AddEventHandler('buyHam', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceHammer
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_HAMMER', 1)
end)

RegisterNetEvent('buyKnife')
AddEventHandler('buyKnife', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceKnife
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_KNIFE', 1)
end)

RegisterNetEvent('buyMachette')
AddEventHandler('buyMachette', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMachette
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_MACHETE', 1)
end)

RegisterNetEvent('buySns')
AddEventHandler('buySns', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSns
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_SNSPISTOL', 1)
end)

RegisterNetEvent('buyClip')
AddEventHandler('buyClip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceClip
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('clip', 1)
end)

RegisterNetEvent('buyGrip')
AddEventHandler('buyGrip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceGrip
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('grip', 1)
end)

RegisterNetEvent('buySilent')
AddEventHandler('buySilent', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSilent
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('Suppressor', 1)
end)

RegisterNetEvent('buyLarge')
AddEventHandler('buyLarge', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceLarge
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('largescope', 1)
end)

RegisterNetEvent('buyHolo')
AddEventHandler('buyHolo', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceHolo
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('holografik', 1)
end)

RegisterNetEvent('buyMedium')
AddEventHandler('buyMedium', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMedium
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('mediumscope', 1)
end)

RegisterNetEvent('buyMuzzle')
AddEventHandler('buyMuzzle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMuzzle
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('tactitalmuzle', 1)
end)

RegisterNetEvent('buyLove')
AddEventHandler('buyLove', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceLove
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('kastetpink', 1)
end)

RegisterNetEvent('buyPapillon')
AddEventHandler('buyPapillon', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePapillon
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('vipskinmotyl', 1)
end)

RegisterNetEvent('buybnj')
AddEventHandler('buybnj', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricebnj
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('czaszkidlugie', 1)
end)

RegisterNetEvent('buyPlatine')
AddEventHandler('buyPlatine', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePlatine
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('platin50', 1)
end)

RegisterNetEvent('buyBois')
AddEventHandler('buyBois', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBois
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('woodheavyp', 1)
end)

RegisterNetEvent('buyZebra')
AddEventHandler('buyZebra', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceZebra
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('zebradlugie', 1)
end)

RegisterNetEvent('buyBombe')
AddEventHandler('buyBombe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBombe
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('boomdlugie', 1)
end)

RegisterNetEvent('buyPimp')
AddEventHandler('buyPimp', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePimp
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('kastetpimp', 1)
end)

RegisterNetEvent('buyBallas')
AddEventHandler('buyBallas', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBallas
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('kastetbalas', 1)
end)

RegisterNetEvent('buyDollars')
AddEventHandler('buyDollars', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceDollars
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('kastetdollar', 1)
end)

RegisterNetEvent('buyDiamond')
AddEventHandler('buyDiamond', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceDiamond
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('kastetdiament', 1)
end)

RegisterNetEvent('buyPoinga')
AddEventHandler('buyPoinga', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePoinga
    xPlayer.removeMoney(price)
    xPlayer.addWeapon('WEAPON_KNUCKLE', 1)
end)