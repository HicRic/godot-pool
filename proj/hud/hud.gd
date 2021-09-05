extends CanvasLayer

class_name HUD

onready var restart_button = ($RestartButton as Button)
onready var text = ($Message as Label)
onready var anim = ($Anim as AnimationPlayer)

func set_msg(msg):
	text.text = msg
	anim.play("show")

func set_ready():
	restart_button.visible = false
	set_msg("get ready")
	
func set_playing():
	restart_button.visible = false
	set_msg("slime!")
	yield(get_tree().create_timer(2), "timeout")
	text.text = ""
	
func set_won():
	restart_button.visible = true
	set_msg("you're\nwinner !")
	
func set_lost():
	restart_button.visible = true
	set_msg("game over")

func _on_Button_pressed():
	var err = get_tree().reload_current_scene()
	if err:
		print(err)
