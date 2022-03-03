extends Spatial

onready var test_joint = $JointNeck
onready var test_body = $Head

var value = 0

func _ready() -> void:
	for i in 50:
		value = i
		yield(get_tree().create_timer(1), "timeout")

func _physics_process(delta: float) -> void:
	$Head.linear_velocity = Vector3(0, value, 0)
