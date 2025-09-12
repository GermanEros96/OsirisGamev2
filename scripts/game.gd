# game.gd (Godot 4.4)
extends Node

@onready var title  : Control = $Title_Screen


func _ready() -> void:
	# Mostrar solo el título al arrancar
	title.visible = true
