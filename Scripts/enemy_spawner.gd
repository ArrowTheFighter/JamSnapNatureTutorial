extends Node2D
class_name EnemySpawner

@export var enemy_scene : Resource

func spawn_enemy():
	var scene_instance = enemy_scene.instantiate()
	add_child(scene_instance)
	scene_instance.global_position = global_position


func _on_timer_timeout() -> void:
	spawn_enemy()
	pass # Replace with function body.
