extends Node2D

@export var speed := 100
@export var damage := 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(speed * delta)
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().is_in_group("Enemy")):
		var enemy = area.get_parent() as Enemy
		enemy.take_damage(damage)
		queue_free()
	pass # Replace with function body.
