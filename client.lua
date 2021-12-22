ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local propspawned = false
local altinlaralindi = false
local itemsatildi = false
local definealindi = false
local definecoords = vector3(2844.839, -1431.41, 11.784)
 
Citizen.CreateThread(function()
    local hash = GetHashKey('a_f_m_eastsa_01')
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(1) end

    local ped = CreatePed(21, hash, 66.30624, -255.869, 52.353 -1, 56.25, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, 0)
    SetPedDropsWeaponsWhenDead(ped, false)
    SetPedDiesWhenInjured(ped, false)
    SetEntityInvincible(ped , true)
    FreezeEntityPosition(ped, true)
    
end)

local object = ("prop_ld_gold_chest")

RegisterNetEvent('alyrix-treasurewaypoint')
AddEventHandler('alyrix-treasurewaypoint', function()
exports['mythic_notify']:SendAlert('success', 'Definenin Tam Konumunu Hatırlamakta Zorlanıyorum Ancak L.S Government Yakınlarında Bir Ada Üzerinde')
TriggerEvent('alyrix-createprop')
end)


RegisterNetEvent('alyrix-createprop')
AddEventHandler('alyrix-createprop', function()
if not propspawned then
CreateObject(object, definecoords.x, definecoords.y, definecoords.z, true, true, true)
else
exports['mythic_notify']:SendAlert('error', 'Prop zaten spawnlandı')      
end)
    
RegisterNetEvent('alyrix-taketreasure')
AddEventHandler('alyrix-taketreasure', function()
    if not definealindi then
        definealindi = true
        altinlaralindi = true
        TriggerServerEvent('taketreasure')
        exports['mythic_notify']:SendAlert('success', 'Sandığı Aldın')
        TriggerEvent('alyrix-peddogur')
        Wait(3000)
        SetNewWaypoint(3801.389, 4442.382)
        exports['mythic_notify']:SendAlert('success', 'Alıcı Konumu İşaretlendi')
        DeleteObject(object)
    else
        exports['mythic_notify']:SendAlert('error', 'Zaten Sandığı Aldın')
    end
end)




RegisterNetEvent('alyrix-peddogur')
AddEventHandler('alyrix-peddogur', function()
    local hash2 = GetHashKey('a_m_m_business_01')
    RequestModel(hash2)
    while not HasModelLoaded(hash2) do Citizen.Wait(1) end

    local ped2 = CreatePed(21, hash2, 3801.389, 4442.382, 4.2035 -1, 11.25, true, true)
    SetBlockingOfNonTemporaryEvents(ped2, true)
    SetPedFleeAttributes(ped2, 0, 0)
    SetPedDropsWeaponsWhenDead(ped2, false)
    SetPedDiesWhenInjured(ped2, false)
    SetEntityInvincible(ped2, true)
    FreezeEntityPosition(ped2, true)
end)

RegisterNetEvent('treasuresatt')
AddEventHandler('treasuresatt', function()
if not itemsatildi then
TriggerServerEvent('alyrix-satis')
        exports['mythic_notify']:SendAlert('success', 'Satış başarılı polisler gelebilir hızla uzaklaş')
        itemsatildi = true
    else
exports['mythic_notify']:SendAlert('error', 'Zaten Parayı Aldın')
    end
end)
