class_name Spawner
extends Node2D

@onready var timer: Timer = $Timer

@export var enemy_scene: Resource

func spawn_enemy():
	var instance = enemy_scene.instantiate()
	get_parent().add_child(instance)
	instance.global_position = global_position + Vector2.UP * (randf_range(-1,1) * 30)
	timer.wait_time = timer.wait_time * 0.98
	
