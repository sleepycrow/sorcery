sorcery.selected_spell = {}

sorcery.register_wand = function(info)
    minetest.register_craftitem(info.name, {
        description = info.desc,
        inventory_image = info.image,
        stack_max = 1,

        on_use = function(itemstack, player, pointed_thing)
            local playername = player:get_player_name()

            if sorcery.selected_spell[playername] ~= nil then
                sorcery.selected_spell[playername].on_use(itemstack, player, pointed_thing, info.power)
            end
        end,

        on_place = function(itemstack, player, pointed_thing)
            local playername = player:get_player_name()

            minetest.chat_send_player(playername, info.full_desc)
            
            if sorcery.selected_spell[playername] ~= nil then   
                minetest.chat_send_player(playername, "Current spell: "..sorcery.selected_spell[playername].desc)
            else
                minetest.chat_send_player(playername, "No spell equipped!")
            end

            return nil
        end
    })

    if info.craft_recipe ~= nil then
        minetest.register_craft({
            output = info.name,
            recipe = info.craft_recipe
        })
    end
end

sorcery.register_spell = function(info)
    minetest.register_craftitem(info.name, {
        description = info.desc,
        inventory_image = info.image,
        stack_max = 1,

        on_use = function(itemstack, player, pointed_thing)
            local playername = player:get_player_name()

            sorcery.selected_spell[playername] = info

            minetest.chat_send_player(player:get_player_name(), "Equipped " .. info.desc)
        end,

        on_place = function(itemstack, player, pointed_thing)
            minetest.chat_send_player(player:get_player_name(), info.full_desc)
            minetest.chat_send_player(player:get_player_name(), "This spell uses " .. info.mana_cost .. " mana.")
            return nil
        end
    })

    if info.craft_recipe ~= nil then
        minetest.register_craft({
            output = info.name,
            recipe = info.craft_recipe
        })
    end
end
