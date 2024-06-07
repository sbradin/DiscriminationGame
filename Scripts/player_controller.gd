extends Character
class_name Player
@export var speed = 150
@export var attack_dmg = 2
@onready var HP_ui = get_node("/root/World/UI/HP_Control/HP")
@onready var current_character = get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	dead.connect(die)
	HP_ui.play(str(current_hp))
#hi

func _physics_process(delta):
	HP_ui.play(str(current_hp))
	if Dialogic.current_timeline != null:
		velocity = Vector2()
		return
	move(Input.get_vector("Left","Right","Up","Down") * speed)
	if Input.is_action_just_pressed("Attack"):
		attack(attack_dmg)

func die():
	get_tree().reload_current_scene()

func heal(amt):
	current_hp += amt
	if current_hp >= total_hp:
		current_hp = total_hp

	
#func _on_hurtbox_left_body_entered(body):
	#if body is Area2D:
		#hittables_left.append(body)
#
#
#func _on_hurtbox_left_body_exited(body):
	#if body in hittables_left:
		#hittables_left.remove_at(hittables_left.find(body))
#
#func _on_hurtbox_right_body_entered(body):
	#if body is Area2D:
		#hittables_right.append(body)
#
#
#func _on_hurtbox_right_body_exited(body):
	#if body in hittables_right:
		#hittables_right.remove_at(hittables_right.find(body))
