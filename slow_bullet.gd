extends BaseBullet

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemies"):
		var enemy = area.get_parent() as BaseEnemy
		enemy.take_damage(damage)
		enemy.set_speed(enemy.speed / 2, 2.0)
		queue_free()
	pass # Replace with function body.
