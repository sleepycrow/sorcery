-- healing spell
sorcery.register_spell({
    name = "sorcery:healing_spell",
    desc = "Healing Spell",
    full_desc = "Ahh, the healing spell... Truely a mage's best friend. This one heals you, and everyone within a 5 block radius.",
    image = "healing_spell.png",
    mana_cost = 50,

    on_use = function(itemstack, player, pointed_thing, wand_power)
        if not mana.subtract(player:get_player_name(), 50) then
            minetest.chat_send_player(player:get_player_name(), "You do not have enough mana to execute this spell.")
            return false
        end

        for _,object in ipairs(minetest.env:get_objects_inside_radius(player:getpos(), 5)) do
            if object:is_player() then
                object:set_hp(object:get_hp() + (5 * wand_power))
            end
        end
    end,

    craft_recipe = {
        {"default:paper", "default:paper", "default:paper"},
        {"default:apple", "default:apple", "default:apple"},
        {"default:paper", "default:paper", "default:paper"}
    }
})

-- teleportation spell
sorcery.register_spell({
    name = "sorcery:teleportation_spell",
    desc = "Teleportation Spell",
    full_desc = "It's a teleportation spell. Other than being an excellent party trick, it's also quite good for escaping people.",
    image = "teleportation_spell.png",
    mana_cost = 50,

    on_use = function(itemstack, player, pointed_thing, wand_power)
        if pointed_thing.type ~= "nothing" then
            if mana.subtract(player:get_player_name(), 50) then
                player:setpos(minetest.get_pointed_thing_position(pointed_thing, true))
            end
        end
    end,

    craft_recipe = {
        {"default:paper", "default:paper", "default:paper"},
        {"doors:door_wood", "doors:trapdoor", "doors:door_wood"},
        {"default:paper", "default:paper", "default:paper"}
    }
})

-- paralyzation spell
sorcery.paralyzation_spell = {}
sorcery.paralyzation_spell.paralyzed = {}

sorcery.register_spell({
    name = "sorcery:paralyzation_spell",
    desc = "Paralyzation Spell",
    full_desc = "A basic paralyzation spell. It's not great, but it's all you could get your hands on.",
    image = "paralyzation_spell.png",
    mana_cost = 100,

    on_use = function(itemstack, player, pointed_thing, wand_power)
        if pointed_thing.type == "object" then
            if mana.subtract(player:get_player_name(), 100) then
                local obj = pointed_thing.ref
                local pos = obj:getpos()
                local time = wand_power

                table.insert(sorcery.paralyzation_spell.paralyzed, {obj=obj, pos=pos, delta=0, time=time})
            end
        end
    end,

    craft_recipe = {
        {"default:paper", "default:paper", "default:paper"},
        {"default:fence_wood", "default:fence_wood", "default:fence_wood"},
        {"default:paper", "default:paper", "default:paper"}
    }
})

minetest.register_globalstep(function(dtime)
    for index, value in pairs(sorcery.paralyzation_spell.paralyzed) do
        if value.delta < value.time then
            value.obj:setpos(value.pos)
            value.delta = value.delta + dtime
        else
            table.remove(sorcery.paralyzation_spell.paralyzed, index)
        end
    end
end)

-- curse spell
sorcery.curse_spell = {}
sorcery.curse_spell.cursed = {}

sorcery.register_spell({
    name = "sorcery:curse_spell",
    desc = "Curse Spell",
    full_desc = "An old curse written in ancient krakish. Oh, the stuff you had to do to get your hands on this beauty...",
    image = "curse_spell.png",
    mana_cost = 150,

    on_use = function(itemstack, player, pointed_thing, wand_power)
        if pointed_thing.type == "object" then
            if mana.subtract(player:get_player_name(), 150) then
                local obj = pointed_thing.ref
                local time = wand_power
                local damage = wand_power

                table.insert(sorcery.curse_spell.cursed, {obj=obj, damage=damage, delta=0, time=time, frequency=frequency})
            end
        end
    end,

    craft_recipe = {
        {"default:paper", "default:paper", "default:paper"},
        {"default:sword_wood", "default:sword_wood", "default:sword_wood"},
        {"default:paper", "default:paper", "default:paper"}
    }
})

local delta = 0
minetest.register_globalstep(function(dtime)
    delta = delta + dtime

    if delta >= 1 then
        for index, value in pairs(sorcery.curse_spell.cursed) do
            if value.delta < value.time then
                value.obj:set_hp(value.obj:get_hp() - value.damage)
                value.delta = value.delta + delta
            else
                table.remove(sorcery.curse_spell.cursed, index)
            end
        end

        delta = 0
    end
end)
