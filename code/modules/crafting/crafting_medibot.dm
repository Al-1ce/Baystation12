/singleton/crafting_stage/empty_storage/medibot
	begins_with_object_type = /obj/item/storage/firstaid
	progress_message = "You add the robot arm to the first aid kit."
	completion_trigger_type = /obj/item/robot_parts
	item_icon_state = "medibot_1"
	next_stages = list(/singleton/crafting_stage/scanner)

/singleton/crafting_stage/scanner
	progress_message = "You add the health sensor to the assembly"
	item_icon_state = "medibot_2"
	next_stages = list(/singleton/crafting_stage/proximity/medibot)

/singleton/crafting_stage/proximity/medibot
	progress_message = "You attach the proximity sensor and finish off the Medibot. Beep boop."
	product = /mob/living/bot/medbot

/singleton/crafting_stage/proximity/medibot/get_product(obj/item/work)
	. = ..()
	if(istype(., /mob/living/bot/medbot))
		var/mob/living/bot/medbot/bot = .
		var/obj/item/storage/firstaid/kit = locate() in work
		if(bot && kit)
			bot.skin = kit.icon_state
			bot.update_icon()
