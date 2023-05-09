extends Node2D
# Get the Gem scene path
const path: String = "res://Collectables/Gem.tscn"
# Preload instance of a Gem scene
# Returns: a PackedScene from the filesystem located at path
var Gem: PackedScene = preload(path)


func _on_timer_timeout():
	# Get the Gem Node tree
	var gemTemp: Node = Gem.instantiate()
	# Create a RandomNumberGenerator Instance
	var rng = RandomNumberGenerator.new()
	# Generate a random x value between range
	var minX: int = 10
	var maxX: int = 400
	var ranX: int = rng.randi_range(minX, maxX)
	gemTemp.position = Vector2(ranX, 400)
	# Add it to the Scene tree
	add_child(gemTemp)
