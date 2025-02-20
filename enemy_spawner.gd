extends Node2D
class_name EnemySpawner

func spawn_enemy(enemy_scene):
	var scene_instance = enemy_scene.instantiate()
	add_child(scene_instance)
	scene_instance.global_position = global_position
