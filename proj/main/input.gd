extends Node

enum InputState { READY, DRAGGING, COOLDOWN }
var state = InputState.READY
var captured_ball

func _on_player_clicked(ball):
	if state == InputState.READY:
		state = InputState.DRAGGING
		captured_ball = ball
		#ball.apply_central_impulse(Vector2.RIGHT * 200)
