execute at @a[team=green] as @p if score @p powerup matches 1 if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run summon arrow ~ ~1.5 ~ {Tags:["bullet","homingBullet"],CustomName:'{"text":"Green Paintball","color": "#88ff88"}',Silent:1b}
execute at @a[team=red] as @p if score @p powerup matches 1 if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run summon arrow ~ ~1.5 ~ {Tags:["bullet","homingBullet"],CustomName:'{"text":"Red Paintball","color": "#ff8888"}',Silent:1b}

execute as @e[tag=bullet,tag=homingBullet,tag=green] at @s if entity @a[team=red,distance=..5,limit=1,sort=nearest] facing entity @a[team=red,distance=..5,limit=1,sort=nearest] eyes run function turtle:calculate-motion-homing
execute as @e[tag=bullet,tag=homingBullet,tag=red] at @s if entity @a[team=green,distance=..5 ,limit=1,sort=nearest] facing entity @a[team=green,distance=..5,limit=1,sort=nearest] eyes run function turtle:calculate-motion-homing

execute at @a[team=green] as @p if score @p powerup matches 2 run effect give @a[team=red] jump_boost 15 128 true
execute at @a[team=green] as @p if score @p powerup matches 2 run tellraw @a[team=red] {"text": "Someone on the green team disabled your jump for 15 seconds or until death!","color": "#88ff88"}
execute at @a[team=red] as @p if score @p powerup matches 2 run effect give @a[team=green] jump_boost 15 128 true
execute at @a[team=red] as @p if score @p powerup matches 2 run tellraw @a[team=green] {"text": "Someone on the red team disabled your jump for 15 seconds or until death!","color": "#ff8888"}
execute at @a as @p if score @p powerup matches 2 run scoreboard players set @s powerup 0

execute at @a[team=green] as @p if score @p powerup matches 3 run effect give @a[team=red] glowing infinite 1 true
execute at @a[team=red] as @p if score @p powerup matches 3 run effect give @a[team=green] glowing infinite 1 true
execute at @a as @p if score @p powerup matches 3 run scoreboard players set @s powerup 0

execute at @a[team=green] as @p if score @p powerup matches 4 run effect give @a[team=green] speed infinite 2 true
execute at @a[team=red] as @p if score @p powerup matches 4 run effect give @a[team=red] speed infinite 2 true
execute at @a[team=green] as @p if score @p powerup matches 4 run effect give @a[team=red] blindness infinite 5 true
execute at @a[team=red] as @p if score @p powerup matches 4 run effect give @a[team=green] blindness infinite 5 true
execute at @a as @p if score @p powerup matches 4 run scoreboard players set @s powerup 0

execute at @a[team=green] as @p if score @p powerup matches 5 run effect give @a[team=red] slowness infinite 4 true
execute at @a[team=red] as @p if score @p powerup matches 5 run effect give @a[team=green] slowness infinite 4 true
execute at @a[team=green] as @p if score @p powerup matches 5 run tag @a[team=red] add honeyParticle
execute at @a[team=red] as @p if score @p powerup matches 5 run tag @a[team=green] add honeyParticle
execute at @a as @p if score @p powerup matches 5 run scoreboard players set @s powerup 0

execute as @a[tag=honeyParticle] at @s run particle falling_honey ~ ~0.1 ~ 0.1 0.1 0.1 0.2 1 normal @a

execute as @a at @s if predicate turtle:crouching if score @s powerup matches 6 run playsound entity.firework_rocket.blast ambient @a ~ ~ ~
execute as @a at @s if predicate turtle:crouching if score @s powerup matches 6 run execute as @a[distance=..5] run damage @s 5 player_explosion by @p from @p
execute as @a at @s if predicate turtle:crouching if score @s powerup matches 6 run kill @s
execute as @a at @s if predicate turtle:crouching if score @s powerup matches 6 run scoreboard players set @s powerup 0

execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute as @a[team=red,distance=..15] at @s run tag @s add movee
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute as @a[team=red,distance=..15] at @s run summon minecraft:minecart ~ ~ ~ {Tags:["movee"],NoGravity:1b}
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunFirstX run data get entity @s Pos[0] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunFirstY run data get entity @s Pos[1] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunFirstZ run data get entity @s Pos[2] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute as @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @a[team=green,scores={powerup=7},distance=..15] facing entity @s feet run tp ^ ^ ^0.1
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunSecondX run data get entity @s Pos[0] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunSecondY run data get entity @s Pos[1] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result score @s gunSecondZ run data get entity @s Pos[2] 1000
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s run scoreboard players operation @s gunSecondX -= @s gunFirstX
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s run scoreboard players operation @s gunSecondY -= @s gunFirstY
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s run scoreboard players operation @s gunSecondZ -= @s gunFirstZ
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result entity @s Motion[0] double 0.015 run scoreboard players get @s gunSecondX
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result entity @s Motion[1] double 0.015 run scoreboard players get @s gunSecondY
execute as @a[team=green] at @s if predicate turtle:crouching if score @s powerup matches 7 run execute at @a[team=red,distance=..15] as @e[type=minecart,distance=..2,limit=1,sort=nearest,tag=movee] at @s store result entity @s Motion[2] double 0.015 run scoreboard players get @s gunSecondZ
execute as @e[type=minecart,tag=movee] if score @s existenceTime matches 10.. run kill @s

execute as @a at @s if predicate turtle:crouching if score @s powerup matches 7 run scoreboard players set @s powerup 0