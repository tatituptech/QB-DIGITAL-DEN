local QBCore = exports['qb-core']:GetCoreObject()

-- Buy Item from Digital Den
RegisterNetEvent('qb-digital-den:server:buyItem', function(itemName, itemLabel, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    if Player.Functions.RemoveMoney('cash', price, 'digital-den-purchase') then
        Player.Functions.AddItem(itemName, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, {name = itemName, label = itemLabel, amount = 1}, 'add')
        TriggerClientEvent('QBCore:Notify', src, 'You purchased ' .. itemLabel .. ' for $' .. price, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Insufficient funds! You need $' .. price, 'error')
    end
end)
