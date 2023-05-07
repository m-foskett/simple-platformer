extends CharacterBody2D


const SPEED = 75
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Initialise a player variable for detection
var player
# Initialise chase to be false
var chase: bool = false

# Ready Function
func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Chase
	if chase:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
			player = get_node("../../Player/Player")
			# Detect which direction the player is coming from
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			elif direction.x < 0:
				get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
		chase = false
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		get_node("CollisionShape2D").queue_free()
		chase = false
		get_node("AnimatedSprite2D").play("Death")
		await get_node("AnimatedSprite2D").animation_finished
