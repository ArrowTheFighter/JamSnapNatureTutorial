class_name PlayerBase
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer

@export var max_health := 5
var health : int

signal takeDamage(newDamage)
signal baseDie(hide)

func _ready() -> void:
	health = max_health

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().is_in_group("Enemy")):
		area.get_parent().queue_free()
		take_damage(1)
	pass # Replace with function body.
	
func take_damage(damageToTake):
	health -= damageToTake
	takeDamage.emit(health)
	if(health <= 0):
		timer.start()
		baseDie.emit(true)
		area_2d.queue_free()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
