sorcery.register_wand({
    name = "sorcery:basic_wand",
    desc = "Basic Wand",
    full_desc = "As you hold the wand, you feel a surge of excitement wash over you. Your very own wand, at last!",
    image = "basic_wand.png",
    power = 1,
    craft_recipe = {
        {"default:glass"},
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
        {"default:mese"},
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
        {"default:diamond"},
        {"default:obsidian_shard"},
        {"default:obsidian_shard"}
    }
})
