extends Node2D

class_name HUD

onready var restart_button = ($RestartButton as Button)

func set_ready():
	restart_button.visible = false
	
func set_playing():
	restart_button.visible = false
	
func set_won():
	restart_button.visible = true
	
func set_lost():
	restart_button.visible = true

func _on_Button_pressed():
	var err = get_tree().reload_current_scene()
	if err:
		print(err)
