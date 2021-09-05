extends Sprite

class_name Eye

func set_look_at(target):
	var delta = target - global_position
	var rot = Vector2.UP.angle_to(delta)
	($pupil as Node2D).global_rotation = rot
