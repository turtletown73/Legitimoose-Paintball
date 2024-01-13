execute as @a[team=!spectator] run function turtle:enter-game
function turtle:reset
scoreboard players set time timeTicks 2400
scoreboard players set game roundRunning 1

scoreboard objectives setdisplay below_name kills
scoreboard objectives setdisplay list kills