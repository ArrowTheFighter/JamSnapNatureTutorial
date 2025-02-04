extends Node2D

@export var speed := 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(speed * delta)
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().is_in_group("Enemy")):
		area.get_parent().queue_free()
		queue_free()
	pass # Replace with function body.
