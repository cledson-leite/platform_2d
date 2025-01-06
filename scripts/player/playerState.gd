extends StateInterface

class_name PlayerState

var player: Player
var animy: AnimatedSprite2D
var stateMachine: Node

func _init(playerInstance: Player) -> void:
	player = playerInstance
	animy = playerInstance.animy
	stateMachine = player.stateMachine
