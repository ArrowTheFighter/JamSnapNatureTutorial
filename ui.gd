extends Control
class_name UIScript

@export var defend_point : DefendPoint
@export var stats_manager : StatsManager
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

@onready var kills_label: Label = $KillsLabel
@onready var seeds_label: Label = $SeedsLabel
@onready var h_box_container: HBoxContainer = $HBoxContainer

var selected_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defend_point.damage_taken_signal.connect(update_health_bar)
	stats_manager.seeds_updated.connect(set_seeds_text)
	stats_manager.kills_updated.connect(set_kills_text)
	
	for child in h_box_container.get_children():
		child.button_selected.connect(set_selected_tower)
	selected_button = h_box_container.get_child(0)
	pass # Replace with function body.


func update_health_bar(new_health):
	progress_bar.value = new_health / float(defend_point.max_health)
	if new_health <= 0:
		show_you_lose_text(true)
		await get_tree().create_timer(3).timeout
		get_tree().reload_current_scene()

func show_you_lose_text(show):
	label.visible = show
	
func set_seeds_text(amount):
	seeds_label.text = "Seeds: " + str(amount)
	
func set_kills_text(amount):
	kills_label.text = "Kills: " + str(amount)
	
func set_selected_tower(button):
	selected_button = button
	
