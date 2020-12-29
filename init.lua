--------------------------------------------------------
-- Minetest :: Stairs Redux (stairs)
--
-- See README.txt for licensing and other information.
-- Copyright (c) 2017-2020, Leslie E. Krause
--
-- ./games/just_test_tribute/stairs/init.lua
--------------------------------------------------------

stairs = { }

local function to_subname( node_name, template )
	if template then
		return string.format( template, string.match( node_name, ":(.+)$" ) )
	else
		return string.match( node_name, ":(.+)$" )
	end
end

-- Stair Node
-- Node will be called: stairs:stair_<node_subname>

function stairs.register_stair( node_name, def, template )
	local node_subname = to_subname( node_name, template )
	local groups = by_value( def.groups )
	groups.stair = 1

	minetest.register_node( "stairs:stair_" .. node_subname, {
		description = def.description .. " Stair",
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,

		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
				{ -0.5, 0, 0, 0.5, 0.5, 0.5 },
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
				{ -0.5, 0, 0, 0.5, 0.5, 0.5 },
			},
		},
		transforms = {
			sitting = {
				[0] = { yaw = 3.15, pos = { x = 0, y = 0, z = -0.3 }, off = -7 },
				[1] = { yaw = 7.9, pos = { x = -0.3, y = 0, z = 0 }, off = -7 },
				[2] = { yaw = 6.28, pos = { x = 0, y = 0, z = 0.3 }, off = -7 },
				[3] = { yaw = 4.75, pos = { x = 0.3, y = 0, z = 0 }, off = -7 },
			}
		},

		on_place = minetest.rotate_node,

		can_dig = function( pos, player )
			local name = player:get_player_name( )
			if beds.is_occupied( pos ) then
				minetest.chat_send_player( name, "Somebody is currently sitting there!" )
				return false
			end
			return true
		end,

		on_rotate = function( pos, node, player, mode, rot, auto_rotate )
			local pos2 = vector.offset_y( pos, 1 )
			local node2 = minetest.get_node( pos2 )
			if node2.name == "default:snow" or node2.name == "default:snow_stair_inv" then
				if rot == 10 then
					rot = 0
				elseif rot == 19 then
					rot = 1
				elseif rot == 4 then
					rot = 2
				elseif rot == 13 then
					rot = 3
				end
				if rot <= 3 then
					minetest.swap_node( pos2, { name = "default:snow_stair_inv", param2 = rot } )
				elseif node2.name == "default:snow_stair_inv" then
					minetest.swap_node( pos2, { name = "default:snow" } )
				end
			end

			auto_rotate( )
			return true
		end,

		on_rightclick = function( pos, node, player, itemstack, pointed_thing )
			local name = player:get_player_name( )
			local node = minetest.get_node( pos )
			
			if not player:get_wielded_item( ):is_empty( ) then return end   -- ignore placement actions

			if minetest.registered_nodes[ minetest.get_node_above( pos ).name ].walkable == true then
				minetest.chat_send_player( name, "That is no place to sit down!" )

			elseif vector.distance( pos, player:getpos( ) ) > 2.5 then
				minetest.chat_send_player( name, "You must be closer to sit down!" )

			elseif beds.is_occupied( pos ) then
				minetest.chat_send_player( name, "Somebody is already sitting there!" )

			elseif node.param2 < 4 and vector.equals( player:get_player_velocity( ), vector.origin ) then
				-- only sit down if stair is properly oriented and player is motionless
				beds.sit_down( name, pos )
			end
		end
	})

	-- stair recipes
	minetest.register_craft( {
		output = "stairs:stair_" .. node_subname .. " 4", -- was 6
		recipe = {
			{ node_name, "", "" },
			{ node_name, node_name, "" },
			{ node_name, node_name, node_name },
		},
	} )

	minetest.register_craft({
		output = "stairs:stair_" .. node_subname .. " 4", -- was 6
		recipe = {
			{ "", "", node_name },
			{ "", node_name, node_name },
			{ node_name, node_name, node_name },
		},
	} )

	-- stair to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = node_name .. " 3",
		recipe = { "stairs:stair_" .. node_subname, "stairs:stair_" .. node_subname }
	} )

end

-- Inverted Stair Node
-- Node will be called: stairs:invstair_<node_subname>

function stairs.register_invstair( node_name, def, template )
	local node_subname = to_subname( node_name, template )
	local groups = by_value( def.groups )
	groups.stair = 1

	minetest.register_node( "stairs:invstair_" .. node_subname, {
		description = def.description .. " Inverted Stair",
		drawtype = "nodebox",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,

		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, 0, 0.5, 0, 0.5},
		},
		on_place = minetest.rotate_node
	} )

	-- invstair recipes
	minetest.register_craft( {
		output = "stairs:invstair_" .. node_subname .. " 2",
		recipe = {
			{ node_name, node_name },
			{ "", node_name },
		},
	} )

	minetest.register_craft( {
		output = "stairs:invstair_" .. node_subname .. " 2",
		recipe = {
			{ node_name, node_name },
			{ node_name, "" },
		},
	} )

	-- invstair to original material recipe
	minetest.register_craft( {
		type = "shapeless",
		output = node_name .. " 3",
		recipe = { "stairs:invstair_" .. node_subname, "stairs:invstair_" .. node_subname },
	} )
end

-- Slab Node
-- Node will be called: stairs:slab_<node_subname>

function stairs.register_slab( node_name, def, template )
	local node_subname = to_subname( node_name, template )
	local groups = by_value( def.groups )
	groups.slab = 1

	minetest.register_node( "stairs:slab_" .. node_subname, {
		description = def.description .. " Slab",
		drawtype = "nodebox",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = def.paramtype2 or "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,

		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
		},
		transforms = {
			sitting = {
				[0] = { yaw = 3.15, pos = { x = 0, y = 0, z = 0 }, off = -7 },
				[1] = { yaw = 7.9, pos = { x = 0, y = 0, z = 0 }, off = -7 },
				[2] = { yaw = 6.28, pos = { x = 0, y = 0, z = 0 }, off = -7 },
				[3] = { yaw = 4.75, pos = { x = 0, y = 0, z = 0 }, off = -7 },
			}
		},

		on_place = not def.paramtype2 and minetest.rotate_node or nil,

		can_dig = function( pos, player )
			local name = player:get_player_name( )
			if beds.is_occupied( pos ) then
				minetest.chat_send_player( name, "Somebody is currently sitting there!" )
				return false
			end
			return true
		end,

		on_rotate = function( pos, node, player, mode, param2, auto_rotate )
			local pos2 = vector.offset_y( pos )
			local node2 = minetest.get_node( pos2 )

			if node2.name == "default:snow_slab_inv" and param2 >= 4 then
				minetest.swap_node( pos2, { name = "default:snow" } )
			elseif node2.name == "default:snow" and param2 <= 3 then
				minetest.swap_node( pos2, { name = "default:snow_slab_inv" } )
			end

			auto_rotate( )
			return true
		end,

		on_rightclick = function( pos, node, player, itemstack, pointed_thing )
			local name = player:get_player_name( )
			local node = minetest.get_node( pos )
			
			if not player:get_wielded_item( ):is_empty( ) then return end   -- ignore placement actions

			if minetest.registered_nodes[ minetest.get_node_above( pos ).name ].walkable == true then
				minetest.chat_send_player( name, "That is no place to sit down!" )

			elseif vector.distance( pos, player:getpos( ) ) > 2.5 then
				minetest.chat_send_player( name, "You must be closer to sit down!" )

			elseif beds.is_occupied( pos ) then
				minetest.chat_send_player( name, "Somebody is already sitting there!" )

			elseif node.param2 < 4 and vector.equals( player:get_player_velocity( ), vector.origin ) then
				-- only sit down if stair is properly oriented and player is motionless
				beds.sit_down( name, pos )
			end
		end
	} )

	-- slab recipe
	minetest.register_craft( {
		output = "stairs:slab_" .. node_subname .. " 6",
		recipe = {
			{ node_name, node_name, node_name },
		},
	} )

	-- slab to original material recipe
	minetest.register_craft( {
		type = "shapeless",
		output = node_name,
		recipe = { "stairs:slab_" .. node_subname, "stairs:slab_" .. node_subname }
	} )
end

-- Panel Node
-- Node will be called: stairs:panel_<node_subname>

function stairs.register_panel( node_name, def, template )
	local node_subname = to_subname( node_name, template )
	local groups = by_value( def.groups )
	groups.slab = 1

	minetest.register_node( ":stairs:slab1_" .. node_subname, {
		description = def.description .. " Panel",
		drawtype = "nodebox",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = def.paramtype2 or "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,

		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, (1/16)-0.5, 0.5 },
		},

		on_place = not def.paramtype2 and minetest.rotate_node or nil,
	} )

	-- panel recipe
	minetest.register_craft( {
		output = "stairs:slab1_" .. node_subname .. " 3",
		recipe = {
			{ "stairs:slab_" .. node_subname },
		},
	} )

	-- panel to original material recipe
	minetest.register_craft( {
		type = "shapeless",
		output = "stairs:slab_" .. node_subname,
		recipe = { "stairs:slab1_" .. node_subname, "stairs:slab1_" .. node_subname, "stairs:slab1_" .. node_subname },
	} )
end

-- Corner Node
-- Node will be called: stairs:corner_<node_subname>

function stairs.register_corner( node_name, def, template )
	local node_subname = to_subname( node_name, template )

	minetest.register_node( ":stairs:corner_" .. node_subname, {
		description = def.description .. " Corner",
		drawtype = "nodebox",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
				{ -0.5, 0, 0, 0, 0.5, 0.5 },
			},
		},
		on_place = minetest.rotate_node
	} )

	-- corner stair recipe
	minetest.register_craft( {
		output = "stairs:corner_" .. node_subname .. " 4",
		recipe = {
			{ "", "", "" },
			{ "", node_name, "" },
			{ node_name, node_name, node_name },
		},
	} )

	-- corner stair to original material recipe
	minetest.register_craft( {
		type = "shapeless",
		output = node_name,
		recipe = { "stairs:corner_" .. node_subname, "stairs:corner_" .. node_subname }
	} )
end

-- Inverted Corner Node
-- Node will be called: stairs:invcorner_<node_subname>

function stairs.register_invcorner( node_name, def, template )
	local node_subname = to_subname( node_name, template )

	minetest.register_node( ":stairs:invcorner_" .. node_subname, {
		description = def.description .. " Inverted Corner",
		drawtype = "nodebox",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = def.use_texture_alpha,
		light_source = def.light_source,
		groups = def.groups,
		sounds = def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
				{ -0.5, 0, 0, 0.5, 0.5, 0.5 },
				{ -0.5, 0, -0.5, 0, 0.5, 0 },
			},
		},
		on_place = minetest.rotate_node
	} )

	-- inside corner stair recipe
	minetest.register_craft( {
		output = "stairs:invcorner_" .. node_subname .. ' 6', -- was 8
		recipe = {
			{ node_name, node_name, "" },
			{ node_name, node_name, node_name },
			{ node_name, node_name, node_name },
		},
	} )

	-- inside corner stair to original material recipe
	minetest.register_craft( {
		type = "shapeless",
		output = node_name .. " 4",
		recipe = {
			"stairs:invcorner_" .. node_subname, "stairs:invcorner_" .. node_subname, "stairs:invcorner_" .. node_subname
		}
	} )
end

-- Nodes will be called
--  * stairs:stair_<node_subname>
--  * stairs:invstair_<node_subname>
--  * stairs:slab_<node_subname>
--  * stairs:panel_<node_subname>,

function stairs.register_stair_and_slab( node_name, def, template )
	stairs.register_stair( node_name, def, template )
	stairs.register_invstair( node_name, def, template )
	stairs.register_slab( node_name, def, template )
	stairs.register_panel( node_name, def, template )
end

-- Nodes will be called
--  * stairs:stair_<node_subname>
--  * stairs:invstair_<node_subname>
--  * stairs:slab_<node_subname>
--  * stairs:corner_<node_subname>
--  * stairs:invcorner_<node_subname>
--  * stairs:panel_<node_subname>

function stairs.register_all( node_name, def, template )
	stairs.register_stair( node_name, def, template )
	stairs.register_invstair( node_name, def, template )
	stairs.register_slab( node_name, def, template )
	stairs.register_corner( node_name, def, template )
	stairs.register_invcorner( node_name, def, template )
	stairs.register_panel( node_name, def, template )
end

-- Node Definitions

minetest.include( "nodes.lua" )
