extends Area2D

var sod := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$animation.play("idle")
		
func _on_body_entered(_body):
	$animation.play("collected")
	#remover a colisão dupla // espera a colisão acabar para computar a coleta
	Globais.sodio += sod
	print(Globais.sodio)
	call_deferred("spawn_atomo")
	await $collision.call_deferred("queue_free") 
	
func spawn_atomo():
	var sodio_flutuante = load("res://Scenes/Itens/Na_flutuante.tscn")
	var novo_atomo = sodio_flutuante.instantiate()
	get_node("/root/fase-3/sodio").add_child(novo_atomo)	
		
func _on_animated_sprite_2d_animation_finished():
	pass
	
