extends Node

var firstTime = true
var score = 0
var items =  {}
var file_path = "user://savegame.dat"
var days =  0
var healthbar = 255
var playerPosition = Vector2(1001,235)
var SalaryBoost = 1
var endGame = false
func save_data():
	var file = File.new()
	var error = file.open(file_path, File.WRITE)
	if error == OK:
		file.store_var(to_json(items))
	file.close()
	print("progress Saved!")

func load_data():
	var file = File.new()
	if file.file_exists(file_path):
		var error = file.open(file_path, File.READ)
		print("items: " +  file.get_var())
		if error == OK:
			
				items = parse_json(file.get_var())
		file.close()
		print("data loaded")

func delete_data():
	var file = File.new()
	if file.file_exists(file_path):
		var error = file.open(file_path, File.WRITE)
		if error == OK:
			items = {}
			file.store_var(items)

func object_interact(objectName):
	print("entrou na conexão")
	if objectName == "Bed":
		CharacterActions._Sleep()
	if objectName == "cadeira_desk":
		CharacterActions._Work()	
	if objectName == "Door":
		CharacterActions._End_Game()	
	
		
