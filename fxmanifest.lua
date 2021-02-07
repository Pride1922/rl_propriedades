fx_version 'cerulean'
games {'gta5' }

author 'Pride1922'
description 'Redline Properties system'
version '1.0.0'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@async/async.lua',
	'server/server.lua',
	'server/armario.lua'
}

client_scripts{
	'client/client.lua'
}