//Redefining some robot procs, since drones can't be repaired and really shouldn't take component damage.
/mob/living/silicon/robot/drone
	var/fireloss = 0
	var/bruteloss = 0

/mob/living/silicon/robot/drone/take_overall_damage(brute = 0, burn = 0, sharp = FALSE, used_weapon = null)
	bruteloss += brute
	fireloss += burn

/mob/living/silicon/robot/drone/heal_overall_damage(brute, burn)

	bruteloss -= brute
	fireloss -= burn

	if(bruteloss<0) bruteloss = 0
	if(fireloss<0) fireloss = 0

/mob/living/silicon/robot/drone/take_organ_damage(brute = 0, burn = 0, flags = 0)
	take_overall_damage(brute, burn)

/mob/living/silicon/robot/drone/heal_organ_damage(brute, burn)
	heal_overall_damage(brute,burn)

/mob/living/silicon/robot/drone/getFireLoss()
	return fireloss

/mob/living/silicon/robot/drone/getBruteLoss()
	return bruteloss
