

armor:register_armor("spacesuit:helmet_base", {
	description = "Spacesuit Helmet",
	inventory_image = "spacesuit_inv_helmet_base.png",
	groups = {armor_head=5, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1},
	wear = 0,
	wear_represents = "spacesuit_wear",
})

armor:register_armor("spacesuit:chestplate_base", {
	description = "Spacesuit Chestplate",
	inventory_image = "spacesuit_inv_chestplate_base.png",
	groups = {armor_torso=8, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1},
	wear = 0,
	wear_represents = "spacesuit_wear",
})

armor:register_armor("spacesuit:pants_base", {
	description = "Spacesuit Pants",
	inventory_image = "spacesuit_inv_pants_base.png",
	groups = {armor_legs=7, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1},
	wear = 0,
	wear_represents = "spacesuit_wear",
})

armor:register_armor("spacesuit:boots_base", {
	description = "Spacesuit Boots",
	inventory_image = "spacesuit_inv_boots_base.png",
	groups = {armor_feet=4, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1},
	wear = 0,
	wear_represents = "spacesuit_wear",
})


-- legacy backwards compat
if minetest.settings:get_bool("spacesuit.enable_legacy_support") then

	armor:register_armor("spacesuit:helmet", {
		description = "Spacesuit Helmet",
		inventory_image = "spacesuit_inv_helmet_base.png",
		groups = {armor_head=5, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1,not_in_creative_inventory=1},
		wear = 0,
		wear_represents = "spacesuit_wear",
	})

	armor:register_armor("spacesuit:chestplate", {
		description = "Spacesuit Chestplate",
		inventory_image = "spacesuit_inv_chestplate_base.png",
		groups = {armor_torso=8, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1,not_in_creative_inventory=1},
		wear = 0,
		wear_represents = "spacesuit_wear",
	})

	armor:register_armor("spacesuit:pants", {
		description = "Spacesuit Pants",
		inventory_image = "spacesuit_inv_pants_base.png",
		groups = {armor_legs=7, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1,not_in_creative_inventory=1},
		wear = 0,
		wear_represents = "spacesuit_wear",
	})

	armor:register_armor("spacesuit:boots", {
		description = "Spacesuit Boots",
		inventory_image = "spacesuit_inv_boots_base.png",
		groups = {armor_feet=4, armor_heal=1, armor_use=spacesuit.armor_use, not_repaired_by_anvil=1,not_in_creative_inventory=1},
		wear = 0,
		wear_represents = "spacesuit_wear",
	})

	print("[Spacesuit] Initialized legacy spacesuit armor..")

end