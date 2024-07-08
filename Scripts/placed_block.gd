extends Node2D


var locked: bool = false
@onready var sprite_2d = $Sprite2D

@onready var Ddown = $Detections/Down
@onready var Dleft = $Detections/Left
@onready var Dright = $Detections/Right

@export_subgroup("Detection")
@export var down :bool = true
@export var left :bool = true
@export var right :bool = true

var process: bool = false

func _ready():
	
	# Enable / Disable raycasts
	Ddown.enabled = down
	Dleft.enabled = left
	Dright.enabled = right

	pass

func _physics_process(delta):

	pass

func move():
	#If locked then it can not move
	if locked:
		pass
	#self.position.y += 32

func clear():
	self.queue_free()


