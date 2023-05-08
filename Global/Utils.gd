extends Node

# Add a save path
const SAVE_PATH: String = "res://savegame.bin"

# Save game function
func saveGame():
	# Create a temp file to save to
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	# Store game state in dictionary
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"gold": Game.gold,
	}
	# Convert data to JSON
	var jstr: String = JSON.stringify(data)
	# Append game state data to file
	file.store_line(jstr)

# Load game function
func loadGame():
	# Create a temp file to load from
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	# Load the saved game file if it exists
	if FileAccess.file_exists(SAVE_PATH):
		# If end of file not reached:
		if not file.eof_reached():
			# Parse the string, returns parsed data or null
			var current_line: Variant = JSON.parse_string((file.get_line()))
			# Assign the parsed data to the Global variables
			if current_line:
				Game.playerHP = int(current_line["playerHP"])
				Game.gold = int(current_line["gold"])
		
	
