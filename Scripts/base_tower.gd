extends Node2D

@onready var timer: Timer = $Timer

var enemies := []
var current_target
var is_firing

@export var bullet_scene : Resource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemies.size() > 0:
		current_target = enemies[0]
		if !is_firing:
			timer.start()
			is_firing = true
	else:
		current_target = null
		is_firing = false
		timer.stop()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemies"):
		enemies.append(area.get_parent())
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	enemies.erase(area.get_parent())
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = global_position
	bullet.look_at(current_target.global_position + Vector2.LEFT * 25)
	pass # Replace with function body.
