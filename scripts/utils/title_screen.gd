extends Control

signal start_game   # por si preferís que Game lo maneje

# --- Nodos de la UI ---
@onready var main_buttons: VBoxContainer = $Background/MainButtons
@onready var options: Panel = $Options
@onready var soundPanel: Panel = $Options/SoundPanel
@onready var labelOptions: Label = $Options/Label

# --- Asigná acá level1.tscn en el Inspector (arrastra la escena) ---
@export var level1_scene: PackedScene

func _ready() -> void:
	# Menús ocultos al inicio
	
	
	
	
	
	
	options.hide()
	soundPanel.hide()

func _process(_delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	print("Iniciando Juego..")
	if level1_scene:
		# Si no asignaste la escena, avisamos a Game para que la cargue/active
		emit_signal("start_game")

func _on_settings_pressed() -> void:
	# Mostrar opciones, ocultar botones principales
	main_buttons.hide()
	options.show()

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	main_buttons.show()
	options.hide()

func _on_sounds_pressed() -> void:
	print("Abriendo el menu de sonido")
	labelOptions.hide()
	main_buttons.hide()
	soundPanel.show()

func _on_backto_options_pressed() -> void:
	labelOptions.show()
	soundPanel.hide()
