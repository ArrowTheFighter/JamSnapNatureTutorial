extends BaseBullet

var enemies := []
@export var explosion_particle  : Resource

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemies"):
		for detected_enemy in enemies:
			var enemy_ref = detected_enemy as BaseEnemy
			enemy_ref.take_damage(damage)
		spawn_particle()
		queue_free()
	pass # Replace with function body.

func spawn_particle():
	var particle = explosion_particle.instantiate()
	get_tree().root.add_child(particle)
	particle.global_position = global_position
	
func _on_enemy_detection_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemies"):
		enemies.append(area.get_parent())
	pass # Replace with function body.


func _on_enemy_detection_area_exited(area: Area2D) -> void:
	enemies.erase(area.get_parent())
	pass # Replace with function body.
	
	
