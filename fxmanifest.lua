fx_version 'cerulean'
games {'gta5' }

author 'Pride1922'
description 'Redline Properties system'
version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@async/async.lua',
	'server/server.lua',
}

client_scripts{
	'client/client.lua'
}

dependencies {
	'es_extended',
	'esx_addonaccount',
	'esx_addoninventory',
	'esx_datastore',
	'esx_skin',
	'skinchanger',
	'esx_inventoryhud',
	'mythic_notify'
}
