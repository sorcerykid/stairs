-- Tree Stairs

stairs.register_all( "default:tree", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_tree_top.png" },
	description = "Tree",
	sounds = default.node_sound_wood_defaults()
} )
	
stairs.register_all( "default:wood", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_wood.png" },
	description = "Wood",
	sounds = default.node_sound_wood_defaults()
} )

stairs.register_all( "default:jungletree", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_jungletree_top.png" },
	description = "Jungle Tree",
	sounds = default.node_sound_wood_defaults()
} )
	
stairs.register_all( "default:junglewood", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_junglewood.png" },
	description = "Jungle Wood",
	sounds = default.node_sound_wood_defaults()
} )

stairs.register_all( "default:pine_tree", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_pine_tree_top.png" },
	description = "Pine Tree",
	sounds = default.node_sound_wood_defaults()
} )
	
stairs.register_all( "default:pine_wood", {
	groups = { choppy = 2, oddly_breakable_by_hand = 1, flammable = 3 },
	tiles = { "default_pine_wood.png" },
	description = "Pine Wood",
	sounds = default.node_sound_wood_defaults()
} )

stairs.register_all( "default:acacia_tree", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_acacia_tree_top.png" },
	description = "Acacia Tree",
	sounds = default.node_sound_wood_defaults()
} )
	
stairs.register_all( "default:acacia_wood", {
	groups = { choppy = 2, oddly_breakable_by_hand = 1, flammable = 3 },
	tiles = { "default_acacia_wood.png" },
	description = "Acacia Wood",
	sounds = default.node_sound_wood_defaults()
} )

stairs.register_all( "default:aspen_tree", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_aspen_tree_top.png" },
	description = "Aspen Tree",
	sounds = default.node_sound_wood_defaults()
} )
	
stairs.register_all( "default:aspen_wood", {
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 3 },
	tiles = { "default_aspen_wood.png" },
	description = "Aspen Wood",
	sounds = default.node_sound_wood_defaults()
} )

-- Stone Stairs

stairs.register_all( "default:cobble", {
	groups = { cracky = 3 },
	tiles = { "default_cobble.png" },
	description = "Cobble",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:mossycobble", {
	groups = { cracky = 3 },
	tiles = { "default_mossycobble.png" },
	description = "Mossy Cobble",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:stone", {
	groups = { cracky = 3, stone = 1 },
	tiles = { "default_stone.png" },
	description = "Stone",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:stonebrick", {
	groups = { cracky = 2 },
	tiles = { "default_stone_brick.png" },
	description = "Stone Brick",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_stair_and_slab(	"default:stone_block", {
	groups = { cracky = 2 },
	tiles = { "default_stone_block.png" },
	description = "Stone Block",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:desert_cobble", {
	groups = { cracky = 3 },
	tiles = { "default_desert_cobble.png" },
	description = "Desert Cobble", 
	sounds = stairs.stone
} )

stairs.register_all( "default:desert_stone", {
	groups = { cracky = 3 },
	tiles = { "default_desert_stone.png" },
	description = "Desert Stone",
	sounds = stairs.stone
} )

stairs.register_all( "default:desert_stonebrick", {
	groups = { cracky = 3 },
	tiles = { "default_desert_stone_brick.png" },
	description = "Desert Stone Brick",
	sounds = stairs.stone
} )

stairs.register_stair_and_slab(	"default:desert_stone_block", {
	groups = { cracky = 2 },
	tiles = { "default_desert_stone_block.png" },
	description = "Desert Stone Block",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:sandstone", {
	groups = { crumbly = 1, cracky = 3 },
	tiles = { "default_sandstone.png" },
	description = "Sandstone",
	sounds = stairs.stone
} )

stairs.register_all( "default:sandstonebrick", {
	groups = { cracky = 2 },
	tiles = { "default_sandstone_brick.png" },
	description = "Sandstone Brick",
	sounds = stairs.stone
} )

stairs.register_stair_and_slab( "default:sandstone_block", {
	groups = { cracky = 2 },
	tiles = { "default_sandstone_block.png" },
	description = "Sandstone Block",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:obsidian", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_obsidian.png" },
	description = "Obsidian",
	sounds = stairs.stone
} )

stairs.register_all( "default:obsidianbrick", {
	groups = { cracky = 1, level = 3 },
	tiles = { "default_obsidian_brick.png" },
	description = "Obsidian Brick",
	sounds = stairs.stone
} )

stairs.register_stair_and_slab( "default:obsidian_block", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_obsidian_block.png" },
	description = "Obsidian Block",
	sounds = default.node_sound_stone_defaults()
} )

-- Ore Stairs

stairs.register_all( "default:coalblock", {
	groups = { cracky = 3 },
	tiles = { "default_coal_block.png" },
	description = "Coal",
	sounds = stairs.stone
}, "coal" )

stairs.register_all( "default:steelblock", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_steel_block.png" },
	description = "Steel",
	sounds = stairs.metal
} )

stairs.register_all( "default:copperblock", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_copper_block.png" },
	description = "Copper",
	sounds = stairs.metal
} )

stairs.register_all( "default:bronzeblock", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_bronze_block.png" },
	description = "Bronze",
	sounds = default.node_sound_metal_defaults()
} )

stairs.register_all( "default:goldblock", {
	groups = { cracky = 1 },
	tiles = { "default_gold_block.png" },
	description = "Gold",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:diamondblock", {
	groups = { cracky = 1, level = 3 },
	tiles = { "default_diamond_block.png" },
	description = "Diamond",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:mese", {
	groups = { cracky = 1, level = 2 },
	tiles = { "default_mese_block.png" },
	description = "Mese",
	sounds = default.node_sound_stone_defaults()
} )

stairs.register_all( "default:clay", {
	groups = { crumbly = 3 },
	tiles = { "default_clay.png" },
	description = "Clay",
	sounds = default.node_sound_dirt_defaults()
} )

stairs.register_all( "default:brick", {
	groups = { cracky = 3 },
	tiles = { "default_brick.png" },
	description = "Brick",
	sounds = default.node_sound_stone_defaults()
} )

-- Dirt Stairs

stairs.register_all( "default:dirt", {
	groups = { crumbly = 3 },
	tiles = { "default_dirt.png" },
	description = "Dirt",
	sounds = default.node_sound_dirt_defaults()
} )

stairs.register_slab( "default:dirt_with_grass", {
	groups = { crumbly = 3 },
	tiles = { "default_grass.png", "default_dirt.png",
		{ name = "default_dirt.png^[combine:16x16:0,8=default_grass_side.png",
			tileable_vertical = false } },
	description = "Dirt with Grass",
	paramtype2 = "none",
	sounds = default.node_sound_dirt_defaults({
		footstep = { name = "default_grass_footstep", gain = 0.25 },
	})
} )

stairs.register_slab( "default:dirt_with_snow", {
	groups = { crumbly = 3 },
	tiles = { "default_snow.png", "default_dirt.png",
		{ name = "default_dirt.png^[combine:16x16:0,8=default_snow_side.png",
			tileable_vertical = false } },
	description = "Dirt with Snow",
	paramtype2 = "none",
	sounds = default.node_sound_dirt_defaults({
		footstep = { name = "default_snow_footstep", gain = 0.15 },
	})
} )

stairs.register_slab( "default:dirt_with_dry_grass", {
	groups = { crumbly = 3 },
	tiles = { "default_dry_grass.png", "default_dirt.png",
		{ name = "default_dirt.png^[combine:16x16:0,8=default_dry_grass_side.png",
			tileable_vertical = false } },
	description = "Dirt with Dry Grass",
	paramtype2 = "none",
	sounds = default.node_sound_dirt_defaults({
		footstep = { name = "default_grass_footstep", gain = 0.4 },
	})
} )

-- Glass Stairs
	
stairs.register_all( "default:glass", {
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	tiles = { "default_glass.png" },
	description = "Glass",
	sounds = default.node_sound_glass_defaults()
} )

stairs.register_all( "default:obsidian_glass", {
	groups = { cracky = 2 },
	tiles = { "default_obsidian_glass.png" },
	description = "Obsidian Glass",
	sounds = default.node_sound_glass_defaults()
} )

-- Lamp Stairs

stairs.register_all( "default:meselamp", {
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	tiles = { "default_meselamp.png" },
	description = "Meselamp",
	sounds = default.node_sound_glass_defaults(),
	use_texture_alpha = true,
	light_source = 14,
} )
	
-- Wool Stairs

local colors = {
	{ "black",      "Black",      "#000000b0" },
	{ "blue",       "Blue",       "#015dbb70" },
	{ "brown",      "Brown",      "#a78c4570" },
	{ "cyan",       "Cyan",       "#01ffd870" },
	{ "dark_green", "Dark Green", "#005b0770" },
	{ "dark_grey",  "Dark Grey",  "#303030b0" },
	{ "green",      "Green",      "#61ff0170" },
	{ "grey",       "Grey",       "#5b5b5bb0" },
	{ "magenta",    "Magenta",    "#ff05bb70" },
	{ "orange",     "Orange",     "#ff840170" },
	{ "pink",       "Pink",       "#ff65b570" },
	{ "red",        "Red",        "#ff000070" },
	{ "violet",     "Violet",     "#2000c970" },
	{ "white",      "White",      "#abababc0" },
	{ "yellow",     "Yellow",     "#e3ff0070" },
}

for i = 1, #colors do
	stairs.register_all( "wool:" .. colors[ i ][ 1 ], {
		groups = { snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		tiles = { "wool_" .. colors[ i ][ 1 ] .. ".png" },
		description = colors[ i ][ 2 ] .. " Wool",
		sounds = default.node_sound_wool_defaults(),
	}, "wool_%s" )
end

-- Misc Stairs

stairs.register_all( "farming:straw", {
	groups = { snappy = 3, flammable = 4 },
	tiles = { "farming_straw.png" },
	description = "Straw",
	sounds = default.node_sound_leaves_defaults()
} )

stairs.register_stair_and_slab( "bones:bones", {
	groups = { dig_immediate = 2 },
	tiles = { "bones_bottom.png" },	-- bones_side, bones_rear
	description = "Bones",
	sounds = default.node_sound_sand_defaults()
} )


