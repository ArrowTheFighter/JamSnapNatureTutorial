extends Node2D
class_name StatsManager

signal seeds_updated(value)
signal kills_updated(value)

@export var seeds := 0:
	set(value):
		print(value)
		seeds = value
		seeds_updated.emit(seeds)
var kills := 0:
	set(value):
		kills = value
		kills_updated.emit(kills)
		
func _ready() -> void:
	seeds = seeds
