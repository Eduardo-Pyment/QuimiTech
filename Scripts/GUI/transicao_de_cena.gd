extends Node

func cena_transicao(alvo: String) -> void:
	get_tree().paused = false
	$AnimationPlayer.play("Dissolver")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(alvo)
	$AnimationPlayer.play_backwards("Dissolver")
