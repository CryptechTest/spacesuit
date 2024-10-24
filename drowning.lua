local function check_player(player, timer)
    local _, armor_inv = armor.get_valid_player(armor, player, "[spacesuit]")
    if not armor_inv then
        -- inventory not found (somehow?), skip check
        return
    end

    local has_helmet = armor_inv:contains_item("armor", "spacesuit:helmet_base") or
                           armor_inv:contains_item("armor", "ctg_spacesuit:helmet_gold") or
                           armor_inv:contains_item("armor", "ctg_spacesuit:helmet_titanium") or
                           armor_inv:contains_item("armor", "spacesuit:helmet")
    local has_chestplate = armor_inv:contains_item("armor", "spacesuit:chestplate_base") or
                               armor_inv:contains_item("armor", "ctg_spacesuit:chestplate_gold") or
                               armor_inv:contains_item("armor", "ctg_spacesuit:chestplate_titanium") or
                               armor_inv:contains_item("armor", "spacesuit:chestplate")
    local has_pants = armor_inv:contains_item("armor", "spacesuit:pants_base") or
                          armor_inv:contains_item("armor", "ctg_spacesuit:pants_gold") or
                          armor_inv:contains_item("armor", "ctg_spacesuit:pants_titanium") or
                          armor_inv:contains_item("armor", "spacesuit:pants")
    local has_boots = armor_inv:contains_item("armor", "spacesuit:boots_base") or
                          armor_inv:contains_item("armor", "ctg_spacesuit:boots_gold") or
                          armor_inv:contains_item("armor", "ctg_spacesuit:boots_titanium") or
                          armor_inv:contains_item("armor", "spacesuit:boots")

    local has_full_suit = has_helmet and has_chestplate and has_pants and has_boots

    local armor_list = armor_inv:get_list("armor")

    -- does the player wear a suit?
    spacesuit.set_player_wearing(player, has_full_suit, has_helmet, armor_list)

    if has_full_suit and player:get_breath() < 10 then

        for i, stack in pairs(armor_inv:get_list("armor")) do
            if not stack:is_empty() then
                local name = stack:get_name()
                if name:sub(1, 10) == "spacesuit:" then
                    local use = minetest.get_item_group(name, "armor_use") * timer or 0
                    armor:damage(player, i, stack, use)
                elseif name:sub(1, 14) == "ctg_spacesuit:" then
                    local use = minetest.get_item_group(name, "armor_use") * timer or 0
                    armor:damage(player, i, stack, use)
                end
            end
        end

        player:set_breath(10)

    elseif not has_full_suit then
        -- check if player is in vacuum without spacesuit
        local is_admin = minetest.check_player_privs(player:get_player_name(), "privs")
        if not is_admin then
            local ppos = player:get_pos()
            local node = minetest.get_node(ppos)
            if node.name == "vacuum:vacuum" then
                -- player does not wear a suit, let him/her suffer!
                local breath = player:get_breath()
                if breath > 0 then
                    player:set_breath(math.max(0, player:get_breath() - 4))
                end
                if breath < 4 then
                    player:set_hp(player:get_hp() - 2, "drown")
                end
            elseif node.name == "vacuum:atmos_thin" then
                -- player does not wear a suit, let him/her suffer slowly?!
                local breath = player:get_breath()
                if breath > 0 then
                    player:set_breath(math.max(1, player:get_breath() - 2))
                end
            elseif node.name == ":asteroid:atmos" then
                -- player does not wear a suit, let him/her suffer slower?!
                local breath = player:get_breath()
                if breath > 1 and math.random(0, 1) == 0 then
                    player:set_breath(math.max(1, player:get_breath() - 3))
                end
            end
        end
    end
end

local timer = 0
minetest.register_globalstep(function(dtime)
    timer = timer + dtime;
    if timer >= 2 then
        for _, player in ipairs(minetest.get_connected_players()) do
            check_player(player, timer)
        end
        timer = 0
    end
end)
