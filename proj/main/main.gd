extends Node

class_name Main

enum Phase { GETREADY, PLAYING, WIN, LOSE }
var active_phase
onready var hud:= $hud as HUD
onready var input:= $input as ShotInput

func _ready():
	start_sequence()
	
func start_sequence():
	set_phase(Phase.GETREADY)
	yield(get_tree().create_timer(2),"timeout")
	set_phase(Phase.PLAYING)
	
func set_phase(phase):
	active_phase = phase
	
	input.can_play(active_phase == Phase.PLAYING)
	
	if active_phase == Phase.GETREADY:
		hud.set_ready()
	
	if active_phase == Phase.PLAYING:
		hud.set_playing()
		
	if active_phase == Phase.WIN:
		hud.set_won()
		
	if active_phase == Phase.LOSE:
		hud.set_lost()


func _on_hole_player_entered():
	if active_phase == Phase.PLAYING:
		set_phase(Phase.LOSE)


func _on_hole_all_balls_inside():
	if active_phase == Phase.PLAYING:
		set_phase(Phase.WIN)
