extends Node2D


var locked: bool = false
@onready var sprite_2d = $Sprite2D

@onready var Dup = $Detections/Up
@onready var Ddown = $Detections/Down
@onready var Dleft = $Detections/Left
@onready var Dright = $Detections/Right

@export_subgroup("Detection")
@export var up :bool = true
@export var down :bool = true
@export var left :bool = true
@export var right :bool = true

signal blockedRight(value: bool)
signal blockedLeft(value: bool)
signal blockedUp(value: bool)
signal blockedDown(value: bool)

var process: bool = false
var wait = 0
func _ready():
	self.get_parent().processBlocks.connect(_on_process)
	
	# Enable / Disable raycasts
	Dup.enabled = up
	Ddown.enabled = down
	Dleft.enabled = left
	Dright.enabled = right

	pass

func _physics_process(delta):
	if !process:
		return
	if Ddown.is_colliding():
		blockedDown.emit(true)
		
	if Dup.is_colliding():
		blockedUp.emit(true)
		
	if Dleft.is_colliding():
		blockedLeft.emit(true)
		
	if Dright.is_colliding():
		blockedRight.emit(true)
	wait += delta
	if wait > 0.5:
		process = false
		wait = 0
	pass

func move():
	#If locked then it can not move
	if locked:
		pass
	#self.position.y += 32

func clear():
	self.queue_free()

func _on_process():
	process = true

