extends Control
signal start_game

# Ajusta estas rutas a tu jerarquía real (según tu captura):
@onready var main_buttons: VBoxContainer = $Background/MainButtons
@onready var options: Panel               = $Options
@onready var soundPanel: Panel            = $Options/SoundPanel
@onready var labelOptions: Label          = $Options/Label

# (Opcional, no se usa aquí; Game decide qué cargar)
@export var level_scene: PackedScene = preload("res://scenes/levels/level1/level_1.tscn")


func _ready() -> void:
	# Asegura que el Title ocupe toda la ventana aunque se instancie dentro de otro nodo
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	# Menús ocultos al inicio
	options.hide()
	soundPanel.hide()

func _process(_delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	print("Iniciando Juego..")
	# El que decide qué escena cargar es Game; aquí solo emitimos la señal
	start_game.emit()

func _on_settings_pressed() -> void:
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
