extends Area2D

var dna = [Vector2(-0, 0)]

var _index : int = 0

var goal_met = false

signal died(pos, time, dna, goal_met)

func _physics_process(delta: float) -> void:
	
	for i in 5:
		global_position += dna[_index]
		
		_index +=1
		if _index == len(dna):
			_index = 0


func _on_Bug_body_entered(body: Node) -> void:
	if body.name == "Wall":
		die()
	if body.name == "Goal":
		goal_met = true
		die()

func _on_Death_time_timeout() -> void:
	die()


func die():
	emit_signal("died", position, $DeathTime.time_left, dna, goal_met)
	queue_free()
