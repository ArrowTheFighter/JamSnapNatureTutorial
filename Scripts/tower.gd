extends Node2D

var enemies := []
var closestEnemy
var isFiring

@onready var timer: Timer = $Timer
@export var bullet_scene : Resource

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemies.size() > 0:
		closestEnemy = enemies[0]
		for enemy in enemies:
			var distance = position.distance_to(enemy.position)
			if distance < position.distance_to(closestEnemy.position):
				closestEnemy = enemy
	else:
		closestEnemy = null
	 
	if closestEnemy != null:
		if(!isFiring):
			timer.start()
			isFiring = true
	else:
		isFiring = false
		timer.stop()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().is_in_group("Enemy")):
		enemies.append(area.get_parent())
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	enemies.erase(area.get_parent())
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = global_position
	bullet.look_at(closestEnemy.position + Vector2.LEFT * 25)
	pass # Replace with function body.
	
