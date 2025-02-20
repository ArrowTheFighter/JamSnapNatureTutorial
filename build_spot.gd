extends Node2D

@export var tower_scene : Resource

var selected := false
var empty := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MouseClick") && selected:
		var selected_button = get_tree().root.get_node("main").get_node("CanvasLayer").get_node("UI").selected_button
		if(selected_button.tower_scene == null and !empty):
			remove_tower()
			return
		if(!empty):
			return
		var stats_manager = get_tree().root.get_node("main").get_node("stats_manager") as StatsManager
		if(stats_manager.seeds >= selected_button.cost):
			stats_manager.seeds -= selected_button.cost
			spawn_tower(selected_button.tower_scene)
	pass

func remove_tower():
	var children = get_children()
	for child in children:
		if child is BaseTower:
			child.queue_free()
	empty = true

func _on_area_2d_mouse_entered() -> void:
	selected = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	selected = false
	pass # Replace with function body.

func spawn_tower(tower):
	if(tower == null):
		return
	if empty:
		var tower_node = tower.instantiate()
		add_child(tower_node)
		empty = false
