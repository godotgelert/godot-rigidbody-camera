extends RigidBody

onready var camera = get_node("Camera")

export var scrollSpeed = 10.0

export var rotateSpeed = 10.0

export var moveSpeed = 1.0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		apply_impulse(Vector3(), Vector3(-1, 0, 0).rotated(transform.basis.y, rotation.y) * moveSpeed)
	if Input.is_action_pressed("ui_right"):
		apply_impulse(Vector3(), Vector3(1, 0, 0).rotated(transform.basis.y, rotation.y) * moveSpeed)
	if Input.is_action_pressed("ui_up"):
		apply_impulse(Vector3(), Vector3(0, 0, -1).rotated(transform.basis.y, rotation.y) * moveSpeed)
	if Input.is_action_pressed("ui_down"):
		apply_impulse(Vector3(), Vector3(0, 0, 1).rotated(transform.basis.y, rotation.y) * moveSpeed)
		
	if Input.is_action_pressed("ui_rotate_left"):
		apply_torque_impulse(transform.basis.y * (rotateSpeed / 100.0))
	
	if Input.is_action_pressed("ui_rotate_right"):
		apply_torque_impulse(-transform.basis.y * (rotateSpeed / 100.0))
		
	if Input.is_action_just_released("ui_zoom_in"):
		camera.global_transform.origin = lerp(camera.global_transform.origin, global_transform.origin, delta * scrollSpeed)
		
		
	if Input.is_action_just_released("ui_zoom_out"):
		camera.global_transform.origin = lerp(camera.global_transform.origin, global_transform.origin + Vector3(0, 13, 10), delta * scrollSpeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
