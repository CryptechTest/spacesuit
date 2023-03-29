

minetest.register_craft({
	output = "spacesuit:helmet_base",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"wool:white", "default:steelblock", "wool:white"},
	},
})

minetest.register_craft({
	output = "spacesuit:chestplate_base",
	recipe = {
		{"default:steel_ingot", "default:mese", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"}
	},
})

minetest.register_craft({
	output = "spacesuit:pants_base",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"wool:white", "wool:white", "wool:white"}
	},
})

minetest.register_craft({
	output = "spacesuit:boots_base",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})


-- legacy backwards compat
if minetest.settings:get_bool("spacesuit.enable_legacy_support") then

	minetest.register_craft({
		type = "shapeless",
		output = "spacesuit:helmet_base",
		recipe = { "spacesuit:helmet" }
	})

	minetest.register_craft({
		type = "shapeless",
		output = "spacesuit:chestplate_base",
		recipe = { "spacesuit:chestplate" }
	})

	minetest.register_craft({
		type = "shapeless",
		output = "spacesuit:pants_base",
		recipe = { "spacesuit:pants" }
	})

	minetest.register_craft({
		type = "shapeless",
		output = "spacesuit:boots_base",
		recipe = { "spacesuit:boots" }
	})

	print("[Spacesuit] Initialized legacy spacesuit crafting..")

end