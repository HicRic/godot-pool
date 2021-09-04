extends RigidBody2D

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		self.apply_impulse(Vector2.ZERO, Vector2.RIGHT * 200)
