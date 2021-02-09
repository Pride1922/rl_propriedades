ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local spawneados = false
local estadopuerta = 0
local propietarioid = nil
local propietarionombre = nil
local venta = 0


-- funcao para atualizar propriedades (menu porta)
RegisterServerEvent('pk_casas:checkcasa')
AddEventHandler('pk_casas:checkcasa', function(nombrecasa)
local source = source
--[[MySQL.Async.fetchAll('SELECT * FROM pk_casas WHERE `propiedad` = @propiedad' , {['@propiedad'] = nombrecasa}, function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                estadopuerta = v.estado
				propietarioid = v.propietarioID
				propietarionombre = v.propietarionombre
				--garage = v.garage
				--vehicle = v.vehicle
				venta = v.enventa
				--coords = v.cordsvehiculo
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'Error ', text = ('Propriedade não encontrada.')})
        end
    end)]]
local estadopuerta = MySQL.Sync.fetchScalar("SELECT estado FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local propietarioid = MySQL.Sync.fetchScalar("SELECT propietarioID FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local propietarionombre = MySQL.Sync.fetchScalar("SELECT propietarioNombre FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local venta = MySQL.Sync.fetchScalar("SELECT enventa FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
	
	if propietarioid == nil then
		TriggerClientEvent('pk_casas:propietario',source, 0)
		TriggerClientEvent('pk_casas:venda',source, 0)
	elseif propietarioid ~= GetPlayerIdentifiers(source)[2] then 
		TriggerClientEvent('pk_casas:propietario',source, 1, propietarionombre)
		TriggerClientEvent('pk_casas:soyelpropietario',source, 0)
		TriggerClientEvent('pk_casas:venda',source, venta)
		if estadopuerta == 0 then
			TriggerClientEvent('pk_casas:estado',source, 0)
		elseif estadopuerta == 1 then
			TriggerClientEvent('pk_casas:estado',source, 1)
		end
	elseif propietarioid == GetPlayerIdentifiers(source)[2] then
		TriggerClientEvent('pk_casas:propietario',source, 1, propietarionombre)
		TriggerClientEvent('pk_casas:soyelpropietario',source, 1)
		TriggerClientEvent('pk_casas:venda',source, venta)
		if estadopuerta == 0 then
			TriggerClientEvent('pk_casas:estado',source, 0)
		elseif estadopuerta == 1 then
			TriggerClientEvent('pk_casas:estado',source, 1)
		end
	
		
	end
end)

-- Callback para dar de volta as coordenadas de 1 casa para criar blip no mapa
ESX.RegisterServerCallback('rl_propriedades:ownedhouse',function(source,cb)
	MySQL.Async.fetchAll('SELECT * FROM pk_casas WHERE `propietarioid` = @propietario' , {['@propietario'] = GetPlayerIdentifiers(source)[2]}, function(result)
		if result[1] ~= nil then
            for k, v in pairs(result) do
				nomecasa = v.propiedad
            end
			cb(nomecasa)
		end
    end)
end)

RegisterServerEvent('pk_casas:checkcasacomprada')
AddEventHandler('pk_casas:checkcasacomprada', function(nombrecasa)
local source = source
local estadopuerta = MySQL.Sync.fetchScalar("SELECT estado FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local propietarioid = MySQL.Sync.fetchScalar("SELECT propietarioID FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local propietarionombre = MySQL.Sync.fetchScalar("SELECT propietarioNombre FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})


	if propietarioid == nil then
		TriggerClientEvent('pk_casas:propietario',-1, 0)
	elseif propietarioid ~= GetPlayerIdentifiers(source)[2] then 
		TriggerClientEvent('pk_casas:propietario',-1, 1, propietarionombre)
		TriggerClientEvent('pk_casas:soyelpropietario',source, 0)
		if estadopuerta == 0 then
			TriggerClientEvent('pk_casas:estadopuerta',-1, 0)
		elseif estadopuerta == 1 then
			TriggerClientEvent('pk_casas:estadopuerta',-1, 1)
		end
	elseif propietarioid == GetPlayerIdentifiers(source)[2] then
		TriggerClientEvent('pk_casas:propietario',-1, 1, propietarionombre, nombrecasa)
		TriggerClientEvent('pk_casas:soyelpropietario',-1, 1)
		if estadopuerta == 0 then
			TriggerClientEvent('pk_casas:estadopuerta',-1, 0)
		elseif estadopuerta == 1 then
			TriggerClientEvent('pk_casas:estadopuerta',-1, 1)
		end
	end
end)

RegisterServerEvent('pk_casas:puerta')
AddEventHandler('pk_casas:puerta', function(estado,nombrecasa)
	local source = source
	local propietarioid = MySQL.Sync.fetchScalar("SELECT propietarioID FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
	local puerta = estado
	if propietarioid ~= GetPlayerIdentifiers(source)[2] then 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Esta propriedade não lhe pertence!'})
	elseif propietarioid == GetPlayerIdentifiers(source)[2] then
		MySQL.Sync.execute("UPDATE pk_casas SET estado = @estado WHERE propiedad = @propiedad", {['@estado'] = puerta,['@propiedad'] = nombrecasa})
			if estado == 0 then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Porta trancada!'})
				TriggerClientEvent('pk_casas:estadopuerta',-1, 0)
			elseif estado == 1 then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Porta destrancada!'})
				TriggerClientEvent('pk_casas:estadopuerta',-1, 1)
			end
	end
end)
	
RegisterServerEvent('pk_casas:comprarpropiedad')
AddEventHandler('pk_casas:comprarpropiedad', function(nombrecasa,precio)
local source = source
local xPlayer  = ESX.GetPlayerFromId(source)
local steamid = GetPlayerIdentifiers(source)[2]
local barrio = MySQL.Sync.fetchScalar("SELECT barrio FROM pk_casas WHERE propiedad = @propiedad", {['@propiedad'] = nombrecasa})
local vivebarrio = MySQL.Sync.fetchScalar("SELECT barrio FROM pk_casas WHERE propietarioID = @propietarioID AND barrio = @barrio" , {
	['@propietarioID'] = steamid,
	['@barrio'] = barrio}
	)
local nombreplayer = GetPlayerName(source)
local estado = 1
local canbuy = 0
	if vivebarrio == barrio then
		canbuy =  0
	elseif vivebarrio ~= barrio then
		canbuy = 1
	end

------------------------------
  local _source = source
  local sourceXPlayer = ESX.GetPlayerFromId(_source)
  local targetXPlayer = 0
  local entrega = _source
  local recive = 0
  local tipo = 'Comprar propiedad'
  local cantidad = precio
  local entreganombre = GetPlayerName(_source)
  local recivenombre = 0
------------------------------	
	
	Citizen.Wait(10)
	if canbuy == 1 then
		if sourceXPlayer.getMoney() >= precio then
			sourceXPlayer.removeMoney(precio)
			MySQL.Sync.execute("UPDATE pk_casas SET estado = @estado, propietarioID = @propietarioID, propietarioNombre = @propietarioNombre, enventa = @enventa WHERE propiedad = @propiedad", {
				['@estado'] = estado, 
				['@propietarioID'] = steamid,
				['@propietarioNombre'] = nombreplayer,
				['@enventa'] = 0,
				['@propiedad'] = nombrecasa
			})
			TriggerEvent('pk_casas:checkcasacomprada', nombrecasa)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Comprou a propriedade: ' ..nombrecasa.. '. Valor: € '..precio})
			TriggerClientEvent('pk_casas:atualiza',nombrecasa)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tem dinheiro suficiente!'})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Já possui uma proprieade!'})
	end

end)


RegisterServerEvent('pk_casas:ponerenventa')
AddEventHandler('pk_casas:ponerenventa', function(nombrecasa,precio)
local source = source
local xPlayer  = ESX.GetPlayerFromId(source)
local steamid = GetPlayerIdentifiers(source)[2]

MySQL.Sync.execute("UPDATE pk_casas SET enventa = @enventa WHERE propiedad = @propiedad", {['@enventa'] = precio,['@propiedad'] = nombrecasa})
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Propriedade no mercado por: €'..precio})
end)

RegisterServerEvent('pk_casas:sacarenventa')
AddEventHandler('pk_casas:sacarenventa', function(nombrecasa,precio)
local source = source
local xPlayer  = ESX.GetPlayerFromId(source)
local steamid = GetPlayerIdentifiers(source)[2]

MySQL.Sync.execute("UPDATE pk_casas SET enventa = @enventa WHERE propiedad = @propiedad", {['@enventa'] = precio,['@propiedad'] = nombrecasa})
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Retirou a proprieade do mercado!'})
end)


-- Funcoes para ter o guarda roupa dentro de casa
ESX.RegisterServerCallback('rl_propriedades:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('rl_propriedades:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('rl_propriedades:removeOutfit')
AddEventHandler('rl_propriedades:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

--funcões para ligar cofre ao inventoryhud
ESX.RegisterServerCallback('rl_propriedades:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local money = xPlayer.getAccount('money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		money = money,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('rl_propriedades:getPropertyInventory', function(source, cb, owner, propertyName)
	local xPlayer = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local money = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addonaccount:getAccount', 'property_money', xPlayer.identifier, function(account)
		money = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		money = money,
		weapons    = weapons
	})
end)

RegisterNetEvent('esx_property:getItem')
AddEventHandler('esx_property:getItem', function(owner, type, item, count)				
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)
	if type == 'item_standard' then
		TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)
			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
   
				-- can the player carry the said amount of x item?
				if xPlayer.canCarryItem(item, count) then
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
				else
					xPlayer.showNotification(_U('player_cannot_hold'))
				end
			else
				xPlayer.showNotification(_U('not_enough_in_property'))
			end
		end)

	elseif type == 'item_account' then

		TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
			if account.money >= count then

									
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				xPlayer.showNotification(_U('amount_invalid'))
			end
		end)

	elseif type == 'item_weapon' then

		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)											 
		end)

	end
end)

RegisterNetEvent('esx_property:putItem')
AddEventHandler('esx_property:putItem', function(owner, type, item, count)
							
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then

		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)											
			end)
		else
			xPlayer.showNotification(_U('invalid_quantity'))
		end

	elseif type == 'item_account' then

		if xPlayer.getAccount(item).money >= count and count > 0 then

												   
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			xPlayer.showNotification(_U('amount_invalid'))
		end

	elseif type == 'item_weapon' then
		if xPlayer.hasWeapon(item) then
			xPlayer.removeWeapon(item)

			TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = item,
					ammo = count
				})
				store.set('weapons', storeWeapons)											
			end)
		end
	end
end)
	
