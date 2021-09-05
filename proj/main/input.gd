extends Node2D

enum InputState { READY, DRAGGING, COOLDOWN }
var state = InputState.READY

export (NodePath) onready var arrow = get_node(arrow)
export (float) var min_drag_len

func _ready():
	change_state(InputState.READY)

func _on_player_clicked(ball):
	if state == InputState.READY:
		change_state(InputState.DRAGGING)
		arrow.position = ball.position
		
func _input(event):
	if event is InputEventMouseButton and state == InputState.DRAGGING:
		if !event.pressed:
			var pos_delta = arrow.position - event.position
			get_tree().call_group("player", "impulse", pos_delta)
			change_state(InputState.READY)

func _process(_delta):
	var pos_delta = arrow.position - get_global_mouse_position()
	arrow.rotation = Vector2.UP.angle_to(pos_delta)
	set_drag_arrow_visible(state == InputState.DRAGGING and pos_delta.length() > min_drag_len)

func change_state(newState):
	state = newState

func set_drag_arrow_visible(visible):
	arrow.visible = visible
