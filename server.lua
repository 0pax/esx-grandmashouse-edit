ESX             = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('drp-grandmas-edited:payBill')
AddEventHandler('drp-grandmas-edited:payBill', function()
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	--change price here for revive
	xPlayer.removeAccountMoney('bank', Config.Price)
	if Config.UseESXNotification == false and Config.UseMythicNotify == true then
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'You were billed $' .. Config.Price, length = 5000, style = { ['background-color'] = '#3370a5', ['color'] = '#FFFFFF' } })
	else
		if Config.UseESXNotification == true and Config.UseMythicNotify == false then
			TriggerClientEvent('esx:showNotification', src, '~w~You were billed ~r~$1,000~w~.')
		end
	end
end)
