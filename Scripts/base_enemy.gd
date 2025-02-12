class_name BaseEnemy
extends Node2D

@export var speed := 200
@export var damage_strength := 1
@export var health := 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(-speed * delta)
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
			queue_free()
