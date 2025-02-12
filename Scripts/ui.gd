extends Control

@export var defend_point : DefendPoint
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defend_point.damage_taken_signal.connect(update_health_bar)
	pass # Replace with function body.


func update_health_bar(new_health):
	progress_bar.value = new_health / float(defend_point.max_health)
	if new_health <= 0:
		show_you_lose_text(true)
		await get_tree().create_timer(3).timeout
		get_tree().reload_current_scene()

func show_you_lose_text(show):
	label.visible = show
