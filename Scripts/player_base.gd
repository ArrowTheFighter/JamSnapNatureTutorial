extends Node2D

var health := 5
signal takeDamage(newDamage)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().is_in_group("Enemy")):
		area.get_parent().queue_free()
		take_damage(1)
	pass # Replace with function body.
	
func take_damage(damageToTake):
	health -= damageToTake
	takeDamage.emit(health)
	if(health <= 0):
		queue_free()
