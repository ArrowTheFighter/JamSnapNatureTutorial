extends Node2D

@export var enemy_scene: Resource
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	spawn_enemy()
	pass # Replace with function body.

func spawn_enemy():
	var instance = enemy_scene.instantiate()
	get_parent().add_child(instance)
	instance.global_position = global_position
