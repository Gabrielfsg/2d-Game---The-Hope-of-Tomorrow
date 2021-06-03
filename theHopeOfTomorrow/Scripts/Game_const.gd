extends Node

const FILEPATH = "user://scoreboard.json"

var scoreBoard = {
	"names": {
		"first":"",
		"second":"",
		"third":"",
	},
	"scores" : {
		"first":0,
		"second":0,
		"third":0
	}
}

var hishScore = 0

func _ready():
	pass


func save_scoreboard():
	var save_file = File.new()
	save_file.open(FILEPATH,File.WRITE)
	save_file.store_line(to_json(scoreBoard))
	save_file.close()
	load_scoreboard()


func load_scoreboard():
	var save_file = File.new()
	if not save_file.file_exists(FILEPATH):
		print("Erro Porra")
		return
	
	save_file.open(FILEPATH, File.READ)
	print("deu certo")
	var scoreBoard = {}
	scoreBoard=parse_json(save_file.get_as_text())
	print("Salvooo")


func writeScore(name, score):
	
	if score > scoreBoard["scores"]["first"]:
		scoreBoard["names"]["third"] = scoreBoard["names"]["second"]
		scoreBoard["names"]["second"] = scoreBoard["names"]["first"]
		scoreBoard["names"]["first"] = name
		
		scoreBoard["scores"]["third"] = scoreBoard["scores"]["second"]
		scoreBoard["scores"]["second"] = scoreBoard["scores"]["first"]
		scoreBoard["scores"]["first"] = score
		
	elif score > scoreBoard["scores"]["second"] and score <= scoreBoard["scores"]["first"]:
		scoreBoard["names"]["third"] = scoreBoard["names"]["second"]
		scoreBoard["names"]["second"] = name
		scoreBoard["scores"]["third"] = scoreBoard["scores"]["second"]
		scoreBoard["scores"]["second"] = score
		
	elif score > scoreBoard["scores"]["third"]:
		scoreBoard["names"]["third"] = name
		
		scoreBoard["scores"]["third"] = score
	save_scoreboard()

func testScore(score):
	load_scoreboard()
	if score > scoreBoard["scores"]["third"]:
		return true
	else:
		return false
