extends Node2D

@onready var spawn_delay: Timer = $spawn_delay
@onready var wave_delay: Timer = $wave_delay

@export var spawner : Spawner
@export var waves := [Object]

var current_wave := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_delays()
	pass # Replace with function body.

func move_to_next_wave():
	current_wave += 1
	set_delays()
	
func set_delays():
	if(current_wave > -1 + waves.size()):
		return
	spawn_delay.wait_time = waves[current_wave].wave_time / waves[current_wave].total_enemies
	wave_delay.wait_time = waves[current_wave].wave_time
	spawn_delay.start()
	wave_delay.start()
	print(waves[current_wave].wave_time)

func _on_spawn_delay_timeout() -> void:
	spawner.spawn_enemy()
	pass # Replace with function body.

func _on_wave_delay_timeout() -> void:
	move_to_next_wave()
	pass # Replace with function body.
