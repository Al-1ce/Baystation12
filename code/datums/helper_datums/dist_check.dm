/singleton/dist_check/proc/within_dist(atom/a, atom/b)
	return FALSE

/singleton/dist_check/adjacent/within_dist(atom/a, atom/b)
	return a.Adjacent(b)

/singleton/dist_check/in_view/within_dist(atom/a, atom/b)
	return (b in view(world.view, a))

/singleton/dist_check/in_range/within_dist(atom/a, atom/b)
	return (b in range(world.view, a))

/singleton/dist_check/same_z_level/within_dist(atom/a, atom/b)
	var/turf/turf_a = get_turf(a)
	var/turf/turf_b = get_turf(b)
	return turf_a && turf_b && turf_a.z == turf_b.z

/singleton/dist_check/connected_z_level/within_dist(atom/a, atom/b)
	var/turf/turf_a = get_turf(a)
	var/turf/turf_b = get_turf(b)
	return turf_a && turf_b && AreConnectedZLevels(turf_a.z, turf_b.z)

/singleton/dist_check/omni/within_dist()
	return TRUE
