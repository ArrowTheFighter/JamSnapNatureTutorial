class_name DefendPoint
extends Node2D

@export var max_health := 5
var health : int

signal damage_taken_signal(adjusted_health)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	pass # Replace with function body.

func take_damage(damage):
	health -= damage
	damage_taken_signal.emit(health)
	if health <= 0:
		queue_free()
