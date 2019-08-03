-- sorcery v2.0
-- by sleepycrow

sorcery = {}

local own_modname = minetest.get_current_modname()
local own_modpath = minetest.get_modpath(own_modname)

-- load components
dofile(own_modpath .. "/api.lua")
dofile(own_modpath .. "/events.lua")

-- load default items
dofile(own_modpath .. "/default_wands.lua")
dofile(own_modpath .. "/default_spells.lua")
