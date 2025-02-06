extends Control

@export var playerBase : PlayerBase
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var you_lose_text: Label = $you_lose_text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerBase.takeDamage.connect(updateHealth)
	playerBase.baseDie.connect(show_lose_text)
	pass # Replace with function body.
	
func updateHealth(new_health):
	progress_bar.value = new_health / float(playerBase.max_health)
	
func show_lose_text(show):
	you_lose_text.visible = show
