extends Node2D

@onready var wave_delay: Timer = $wave_delay
@onready var enemy_delay: Timer = $enemy_delay

@export var enemy_spawner : EnemySpawner
@export var waves : Array

var current_wave := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_timers()
	pass # Replace with function body.

func set_timers():
	if(current_wave > -1 + waves.size()):
		print("not enough waves")
		wave_delay.stop()
		enemy_delay.stop()
		return
	enemy_delay.wait_time = waves[current_wave].wave_duration / waves[current_wave].wave_total_enemies
	wave_delay.wait_time = waves[current_wave].wave_duration + waves[current_wave].wave_between_delay
	wave_delay.start()
	enemy_delay.start()

func _on_wave_delay_timeout() -> void:
	current_wave += 1
	set_timers()
	pass # Replace with function body.


func _on_enemy_delay_timeout() -> void:
	enemy_spawner.spawn_enemy(waves[current_wave].wave_enemy)
	pass # Replace with function body.
