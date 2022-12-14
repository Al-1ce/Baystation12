/*
These are used by machines when created to initialize their components to nonstandard configurations.
They are abstracted from machines to potentially share code and simplify inheritance.
Do not work with lazy-initialized parts.
*/

/// Associative list of singleton path -> number to apply.
/obj/machinery/var/list/stock_part_presets

/singleton/stock_part_preset
	var/expected_part_type

/singleton/stock_part_preset/proc/apply(obj/machinery/machine, obj/item/stock_parts/part)
	if(machine)
		part.on_uninstall(machine, TRUE) // don't delete
	do_apply(machine, part)
	if(machine)
		part.on_install(machine)

/singleton/stock_part_preset/proc/do_apply(obj/machinery/machine, obj/item/stock_parts/part)
