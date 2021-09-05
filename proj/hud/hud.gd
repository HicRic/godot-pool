extends CanvasLayer

class_name HUD

onready var restart_button = ($RestartButton as Button)
onready var text = ($Message as Label)

func set_ready():
	restart_button.visible = false
	text.text = "get ready"
	
func set_playing():
	restart_button.visible = false
	text.text = "slime!"
	yield(get_tree().create_timer(2), "timeout")
	text.text = ""
	
func set_won():
	restart_button.visible = true
	text.text = "you're\nwinner !"
	
func set_lost():
	restart_button.visible = true
	text.text = "game over"

func _on_Button_pressed():
	var err = get_tree().reload_current_scene()
	if err:
		print(err)
