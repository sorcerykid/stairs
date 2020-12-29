Stairs Redux Mod v1.0
By Leslie E. Krause

Stairs Redux is a complete rewrite of the Stairs Redo mod from Minetest Game, including a 
fully refactored API for registering stair nodes. This mod has been in use on the JT2
server in various states of development since 2018, with the addition of sitting routines
from my Beds Redux Mod in 2020.

The following stair types can be crafted:

  * Stair
  * Slab
  * Inverted Stair
  * Corner
  * Inverted Corner
  * Panel

For ease of customization, all stair registrations are included in the nodes.lua file.


Repository
----------------------

Browse source code...
  https://bitbucket.org/sorcerykid/stairs

Download archive...
  https://bitbucket.org/sorcerykid/stairs/get/master.zip
  https://bitbucket.org/sorcerykid/stairs/get/master.tar.gz

Compatability
----------------------

Minetest 0.4.15+ required

Dependencies
----------------------

Default Mod (required)
  https://github.com/minetest-game-mods/default

Screwdriver Mod (required)
  https://github.com/minetest-game-mods/screwdriver

Wool Mod (required)
  https://github.com/minetest-game-mods/wool

Beds Redux Mod (required)
  https://bitbucket.org/sorcerykid/bedss

Installation
----------------------

  1) Unzip the archive into the mods directory of your game.
  2) Rename the beds-master directory to "stairs".
  3) Update the nodes.lua file as needed for your game.

License of source code
----------------------------------------------------------

GNU Lesser General Public License v3 (LGPL-3.0)

Copyright (c) 2018-2020, Leslie E. Krause (leslie@searstower.org)

This program is free software; you can redistribute it and/or modify it under the terms of
the GNU Lesser General Public License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

http://www.gnu.org/licenses/lgpl-2.1.html

Multimedia License (textures, sounds, and models)
----------------------------------------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)

	/models/stairs_stair.obj
	by kilbith
	obtained from https://github.com/minetest-game-mods/stairs

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/
