#ifndef BOUNDARY_H
#define BOUNDARY_H

#include "stdbool.h"

bool point_in_polygon(float x, float y, int BDRYCorners, float * BDRYlat, float * BDRYlong);

#endif //BOUNDARY_H
