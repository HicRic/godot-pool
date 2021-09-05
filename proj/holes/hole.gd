extends Area2D

export (NodePath) onready var left_eye = get_node(left_eye) as Eye
export (NodePath) onready var right_eye = get_node(right_eye) as Eye

signal player_entered
signal all_balls_inside

func _process(_delta):
	var balls = get_tree().get_nodes_in_group("ball")
	var all_inside = true
	for ball in balls:
		if not self.overlaps_body(ball):
			all_inside = false
			
	
	if all_inside:
		emit_signal("all_balls_inside")
	
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		left_eye.set_look_at(players[0].global_position)
		right_eye.set_look_at(players[0].global_position)


func _on_hole_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_entered")
