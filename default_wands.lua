--- wand cores
minetest.register_craftitem("sorcery:basic_core", {description = "Basic Wand Core", inventory_image = "basic_core.png"})
minetest.register_craft({output = "sorcery:basic_core",
    recipe = {
        {"", "default:glass", ""},
        {"default:glass", "default:torch", "default:glass"},
        {"", "default:glass", ""}
    }})

minetest.register_craftitem("sorcery:mese_core", {description = "Mese Wand Core", inventory_image = "mese_core.png"})
minetest.register_craft({output = "sorcery:mese_core",
    recipe = {
        {"", "default:obsidian_glass", ""},
        {"default:obsidian_glass", "default:mese_crystal", "default:obsidian_glass"},
        {"", "default:obsidian_glass", ""}
    }})

minetest.register_craftitem("sorcery:diamond_core", {description = "Diamond Wand Core", inventory_image = "diamond_core.png"})
minetest.register_craft({output = "sorcery:diamond_core",
    recipe = {
        {"", "default:obsidian_glass", ""},
        {"default:obsidian_glass", "default:diamond", "default:obsidian_glass"},
        {"", "default:obsidian_glass", ""}
    }})

--- the actual wands
sorcery.register_wand({
    name = "sorcery:basic_wand",
    desc = "Basic Wand",
    full_desc = "As you hold the wand, you feel a surge of excitement wash over you. Your very own wand, at last!",
    image = "basic_wand.png",
    power = 1,
    craft_recipe = {
        {"sorcery:basic_core"},
        {"default:stick"},
        {"default:stick"},
    }
})

sorcery.register_wand({
    name = "sorcery:mese_wand",
    desc = "Mese Wand",
    full_desc = "it's yellow lol",
    image = "mese_wand.png",
    power = 2,
    craft_recipe = {
        {"sorcery:mese_core"},
        {"default:mese_crystal_fragment"},
        {"default:mese_crystal_fragment"}
    }
})

sorcery.register_wand({
    name = "sorcery:diamond_wand",
    desc = "Diamond Wand",
    full_desc = "The large diamond on the tip of the wand shimmers brightly as you put it up to the sun. So beautiful, yet so deadly...",
    image = "diamond_wand.png",
    power = 3,
    craft_recipe = {
        {"sorcery:diamond_core"},
        {"default:obsidian_shard"},
        {"default:obsidian_shard"}
    }
})
