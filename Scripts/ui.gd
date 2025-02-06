extends Control

@export var playerBase := Node
@onready var progress_bar: ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerBase.takeDamage.connect(updateHealth)
	pass # Replace with function body.
	
func updateHealth(new_health):
	progress_bar.value = new_health / 5.0
