extends PlayerState

class_name MovimentState

static var stateName = "MOVIMENT"

const MAX_SPEED: float = 150.0
const ACCELERATION: float = 20.0

func getStateName() -> String:
	return stateName

func process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
			stateMachine.transition(JumpState.stateName)
			pass
	animy.play("run")

func phisics_process(_delta: float) -> void:
	var direction = player.direction
	
	if direction == 0.0:
		stateMachine.transition(IdleState.stateName)
		pass
	
	
	player.velocity.x += direction*ACCELERATION
	player.velocity.x = clamp(player.velocity.x, -MAX_SPEED, MAX_SPEED)
