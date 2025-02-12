extends Node2D

@export var tower_scene : Resource

var selected := false
var empty := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MouseClick") && selected:
		spawn_tower(tower_scene)
	pass


func _on_area_2d_mouse_entered() -> void:
	selected = true
	print("mouse entered")
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	selected = false
	pass # Replace with function body.

func spawn_tower(tower):
	if empty:
		var tower_node = tower.instantiate()
		add_child(tower_node)
		empty = false
