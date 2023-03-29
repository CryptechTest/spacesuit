
spacesuit = {
	armor_use = tonumber(minetest.settings:get("spacesuit.armor_use")) or 70,
}


local MP = minetest.get_modpath("spacesuit")

dofile(MP.."/suit.lua")
dofile(MP.."/crafts.lua")
dofile(MP.."/hud.lua")
dofile(MP.."/drowning.lua")

-- legacy backwards compat
if minetest.settings:get_bool("spacesuit.enable_legacy_support") then
	minetest.log("warning:[spacesuit] Legacy armor mode enabled!  OK to ignore 3d_armor warning...")
end

print("[OK] Spacesuit")
