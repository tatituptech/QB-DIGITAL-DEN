local QBCore = exports['qb-core']:GetCoreObject()
local NPCSpawned = false
local NPC = nil

local function SpawnNPC()
    local model = Config.NPC.model
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(10)
    end
    
    NPC = CreatePed(4, GetHashKey(model), Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z, Config.NPC.heading, false, false)
    SetBlockingOfNonTemporaryEvents(NPC, true)
    FreezeEntityPosition(NPC, true)
    
    -- Add blip
    if Config.NPC.blip then
        local blip = AddBlipForCoord(Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z)
        SetBlipSprite(blip, Config.NPC.blipSprite)
        SetBlipColour(blip, Config.NPC.blipColor)
        SetBlipScale(blip, Config.NPC.blipScale)
        SetBlipAsNoEntry(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.NPC.name)
        EndTextCommandSetBlipName(blip)
    end
    
    NPCSpawned = true
    print('Digital Den NPC Spawned at ' .. tostring(Config.NPC.coords))
end

local function OpenShop()
    local menuOptions = {
        {
            id = 'digital-den-header',
            header = '💻 Digital Den Shop',
            isMenuHeader = true,
        }
    }
    
    for idx, item in ipairs(Config.Items) do
        table.insert(menuOptions, {
            id = 'item-' .. idx,
            header = item.label,
            txt = item.description .. ' - $' .. item.price,
            params = {
                event = 'qb-digital-den:client:buyItem',
                args = {
                    itemName = item.name,
                    itemLabel = item.label,
                    price = item.price
                }
            }
        })
    end
    
    table.insert(menuOptions, {
        id = 'close-shop',
        header = '❌ Close',
        txt = 'Close the shop',
        params = {
            event = 'qb-digital-den:client:closeShop'
        }
    })
    
    exports['qb-menu']:openMenu(menuOptions)
end

local function SetupTargetZone()
    if not NPCSpawned then return end
    
    exports['qb-target']:AddCircleZone('digital-den-npc', Config.NPC.coords, Config.InteractionDistance, {
        name = 'digital-den-npc',
        heading = Config.NPC.heading,
        debugPoly = false,
        minZ = Config.NPC.coords.z - 1,
        maxZ = Config.NPC.coords.z + 2,
    }, {
        options = {
            {
                type = 'client',
                event = 'qb-digital-den:client:openShop',
                icon = 'fas fa-laptop',
                label = 'Digital Den Shop',
            },
        },
        distance = Config.InteractionDistance
    })
end

RegisterNetEvent('qb-digital-den:client:openShop', function()
    OpenShop()
end)

RegisterNetEvent('qb-digital-den:client:buyItem', function(data)
    TriggerServerEvent('qb-digital-den:server:buyItem', data.itemName, data.itemLabel, data.price)
    exports['qb-menu']:closeMenu()
end)

RegisterNetEvent('qb-digital-den:client:closeShop', function()
    exports['qb-menu']:closeMenu()
end)

-- Initialize on script start
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Wait(500)
    SpawnNPC()
    SetupTargetZone()
end)

-- Cleanup on script stop
AddEventHandler('onClientResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if NPCSpawned and NPC ~= nil then
        DeleteEntity(NPC)
        NPCSpawned = false
    end
end)
