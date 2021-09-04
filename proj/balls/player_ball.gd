extends RigidBody2D

signal clicked

func _on_player_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		emit_signal("clicked", self)
