extends Button
class_name TowerButton
@export var tower_scene : Resource
@export var cost := 0

signal button_selected(button)

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(cost)
	pass # Replace with function body.
	

func _on_pressed() -> void:
	button_selected.emit(self)
	pass # Replace with function body.
