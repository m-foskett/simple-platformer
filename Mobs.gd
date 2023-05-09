extends Node2D
# Get the Frog scene path
const path: String = "res://Frog.tscn"
# Preload instance of a Frog scene
# Returns: a PackedScene from the filesystem located at path
var Frog: PackedScene = preload(path)



func _on_timer_timeout():
	# Get the Frog Node tree
	var frogTemp: Node = Frog.instantiate()
	# Create a RandomNumberGenerator Instance
	var rng = RandomNumberGenerator.new()
	# Generate a random x value between range
	var minX: int = 600
	var maxX: int = 800
	var ranX: int = rng.randi_range(minX, maxX)
	frogTemp.position = Vector2(ranX, 400)
	# Add it to the Scene tree
	add_child(frogTemp)
