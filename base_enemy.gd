class_name BaseEnemy
extends Node2D

@export var speed := 200
var current_speed : float
@export var damage_strength := 1
@export var health := 2
@export var seed_drops := 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_speed = speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(-current_speed * delta)
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is DefendPoint:
		var defend_point = area.get_parent() as DefendPoint
		defend_point.take_damage(damage_strength)
		queue_free()
	pass # Replace with function body.
	
func take_damage(amount):
		health -= amount
		if health <= 0:
			killed()
			
func killed():
	var stats_manager = get_tree().root.get_node("main").get_node("stats_manager") as StatsManager
	stats_manager.seeds += seed_drops
	stats_manager.kills += 1
	queue_free()
	
func set_speed(new_speed,reset_to_default_delay):
	current_speed = new_speed
	if(reset_to_default_delay > 0):
		await get_tree().create_timer(reset_to_default_delay).timeout
		current_speed = speed
