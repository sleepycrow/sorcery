minetest.register_on_leaveplayer(function(player)
    local playername = player:get_player_name()

    if sorcery.selected_spell[playername] ~= nil then
        sorcery.selected_spell[playername] = nil
    end
end)