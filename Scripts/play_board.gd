extends Node2D

#Board is 10 * 30
#Goes board[row][column]
var board : Array = []
var rows = 30
var columns = 10

func _ready():
	# Contrust board
	for i in rows:
		board.append([])
		for j in columns:
			board[i].append(0)
	print(board)

func spawnBlock():
	board[0][4] = 1
	pass	
