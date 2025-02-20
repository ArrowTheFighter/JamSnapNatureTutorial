extends Node2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gpu_particles_2d.emitting = true
	timer.wait_time = gpu_particles_2d.lifetime
	timer.start()
	pass # Replace with function body.




func _on_timer_timeout() -> void:
	pass # Replace with function body.
