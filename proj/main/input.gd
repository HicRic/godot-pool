extends Node2D

class_name ShotInput

enum InputState { PREGAME, READY, DRAGGING }
var state = InputState.READY
var dragging_ball

export (NodePath) onready var arrow = get_node(arrow)
export (float) var min_drag_len
export (float) var max_drag_len
export (float) var power_min
export (float) var power_max

func _ready():
	change_state(InputState.PREGAME)
	
func can_play(playable):
	if playable:
		change_state(InputState.READY)
	else:
		change_state(InputState.PREGAME)

func _on_player_clicked(ball):
	if state == InputState.READY:
		change_state(InputState.DRAGGING)
		dragging_ball = ball
		
func _input(event):
	if event is InputEventMouseButton and state == InputState.DRAGGING:
		if !event.pressed:
			change_state(InputState.READY)
			var pos_delta = arrow.position - event.position
			var drag_len = pos_delta.length()
			if drag_len > min_drag_len:
				var ratio = (drag_len-min_drag_len)/(max_drag_len-min_drag_len)
				ratio = clamp(ratio, 0, 1)
				var power = lerp(power_min, power_max, ratio)
				get_tree().call_group("player", "impulse", pos_delta.normalized() * power)

func _process(_delta):
	if dragging_ball != null:
		arrow.position = dragging_ball.position
		
	var pos_delta = arrow.position - get_global_mouse_position()
	if state == InputState.DRAGGING:
		arrow.rotation = Vector2.UP.angle_to(pos_delta)
		arrow.scale.y = pos_delta.length() / 128.0
		
	set_drag_arrow_visible(state == InputState.DRAGGING and pos_delta.length() > min_drag_len)

func change_state(newState):
	state = newState

func set_drag_arrow_visible(visible):
	arrow.visible = visible
