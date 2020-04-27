/*****************************************************************************
 *
 * tpoint_distance.h
 *	  Temporal distance for temporal points.
 *
 * Portions Copyright (c) 2020, Esteban Zimanyi, Arthur Lesuisse, 
 * 		Universite Libre de Bruxelles
 * Portions Copyright (c) 1996-2020, PostgreSQL Global Development Group
 * Portions Copyright (c) 1994, Regents of the University of California
 *
 *****************************************************************************/

#ifndef __TPOINT_DISTANCE_H__
#define __TPOINT_DISTANCE_H__

#include <postgres.h>
#include <catalog/pg_type.h>
#include "temporal.h"

/*****************************************************************************/

extern Datum geom_distance2d(Datum geom1, Datum geom2);
extern Datum geom_distance3d(Datum geom1, Datum geom2);
extern Datum geog_distance(Datum geog1, Datum geog2);
extern Datum pt_distance2d(Datum geom1, Datum geom2);
extern Datum pt_distance3d(Datum geom1, Datum geom2);

extern Datum distance_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum distance_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum distance_tpoint_tpoint(PG_FUNCTION_ARGS);

extern bool tpointseq_min_dist_at_timestamp(const TemporalInst *start1,
	const TemporalInst *end1, const TemporalInst *start2, const TemporalInst *end2,
	TimestampTz *t);
extern bool tgeogpointseq_min_dist_at_timestamp(const TemporalInst *start1,
	const TemporalInst *end1, const TemporalInst *start2, const TemporalInst *end2,
	double *mindist, TimestampTz *t);

extern Temporal *distance_tpoint_geo_internal(const Temporal *temp, Datum geo);
extern Temporal *distance_tpoint_tpoint_internal(const Temporal *temp1, const Temporal *temp2);

/*****************************************************************************/

#endif
