extends RigidBody2D

export (NodePath) onready var left_eye = get_node(left_eye) as Eye
export (NodePath) onready var right_eye = get_node(right_eye) as Eye

func _process(_delta):
	var balls = get_tree().get_nodes_in_group("ball")
	var closestPos = Vector2.INF
	var closestDist = INF
	
	for ball in balls:
		if ball != self:
			var dist = global_position.distance_to(ball.global_position)
			if dist < closestDist:
				closestDist = dist
				closestPos = ball.global_position
	
	if closestPos != Vector2.INF:
		left_eye.set_look_at(closestPos)
		right_eye.set_look_at(closestPos)
