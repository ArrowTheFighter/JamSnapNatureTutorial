extends Node2D

@export var base_tower := Resource

var selected := false
var empty := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("mosue_click") && selected):
		spawn_tower(base_tower)
	pass

func spawn_tower(tower):
	if(empty):
		var tower_node = tower.instantiate()
		get_parent().add_child(tower_node)
		tower_node.position = position
		empty = false

func _on_area_2d_mouse_entered() -> void:
	selected = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	selected = false
	pass # Replace with function body.
