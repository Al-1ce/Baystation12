/obj/item/flame/candle/scented
	name = "scented candle"
	desc = "A candle which releases pleasant-smelling oils into the air when burned."

	var/scent //for the desc
	var/singleton/scent_type/style
	var/list/scent_types = list(/singleton/scent_type/rose,
								/singleton/scent_type/cinnamon,
								/singleton/scent_type/vanilla,
								/singleton/scent_type/seabreeze,
								/singleton/scent_type/lavender)

/obj/item/flame/candle/scented/Initialize()
	. = ..()
	get_scent()

/obj/item/flame/candle/scented/attack_self(mob/user as mob)
	..()
	if(!lit)
		remove_extension(src, /datum/extension/scent)

/obj/item/flame/candle/scented/extinguish(mob/user, no_message)
	..()
	remove_extension(src, /datum/extension/scent)

/obj/item/flame/candle/scented/light(mob/user)
	..()
	if(lit)
		set_extension(src, style.scent_datum)

/obj/item/flame/candle/scented/proc/get_scent()
	var/scent_type = DEFAULTPICK(scent_types, null)
	if(scent_type)
		style = GET_SINGLETON(scent_type)
		color = style.color
		scent = style.scent
	if(scent)
		desc += " This one smells of [scent]."
	update_icon()

/obj/item/storage/candle_box/scented
	name = "scented candle box"
	desc = "An unbranded pack of scented candles, in a variety of scents."
	max_storage_space = 5

	startswith = list(/obj/item/flame/candle/scented = 5)
