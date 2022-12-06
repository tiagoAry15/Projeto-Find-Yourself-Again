extends Node

var firstTime = true
var score = 0
var items =  {}
var file_path = "user://game-data3.json"
var days =  0
var healthbar = 255
var playerPosition = Vector2(1001,235)
var SalaryBoost = 1
var endGame = false
func save_data():
	var file = File.new()
	var error = file.open(file_path, File.WRITE)
	if error == OK:
		file.store_line(to_json(var2str(items)))
	file.close()
	print("progress Saved!")

func load_data():
	var file = File.new()
	if file.file_exists(file_path):
		var error = file.open(file_path, File.READ)
		if error == OK:
			var text = file.get_as_text()
			var data = parse_json(text)
			items = str2var(data)
			
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
	if objectName == "Halter":
		CharacterActions._Workout()
	if objectName == "Console":
		CharacterActions._play_game()
	if objectName == "Remedio":
		CharacterActions._take_pill()
	if objectName == "Comida":
		CharacterActions._eat()

var atividades = {
	"banco_azul": 6
}
var animacoes = {
	"banco_azul": "animacao"
}


