extends PlayerState
class_name IdleState

static var stateName = "IDLE"

const DECELERATION: float = 10.0

func getStateName() -> String:
	return stateName

func process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
			stateMachine.transition(JumpState.stateName)
			pass

	animy.play("idle")

func phisics_process(_delta: float) -> void:
	if player.direction != 0.0:
		stateMachine.transition(MovimentState.stateName)
	
	if player.velocity.x != 0.0:
		player.velocity.x = move_toward(player.velocity.x, 0, DECELERATION)
