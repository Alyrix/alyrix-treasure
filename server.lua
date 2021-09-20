ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('taketreasure')
AddEventHandler('taketreasure', function()
    local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('goldbar', math.random (1,7))
end)

RegisterNetEvent('alyrix-satis')
AddEventHandler('alyrix-satis', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xItem = xPlayer.getQuantity("goldbar")
    local random = math.random(1000,6000)

	xPlayer.removeInventoryItem("goldbar", xItem)
	xPlayer.addMoney(random)
end)