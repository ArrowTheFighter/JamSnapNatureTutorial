class_name Enemy
extends Node2D

@export var speed := 1.0
@export var health := 3
# Called when the node enters the scene t

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(-speed * delta)
	pass
	
func take_damage(damage):
	health -= damage
	if(health <= 0):
		queue_free()
