#include <stdbool.h>
#include "boundary.h"

bool point_in_polygon(float x, float y, int BDRYCorners, float * BDRYlat, float * BDRYlong)
{
    int i, j = BDRYCorners - 1 ;
    bool oddNodes = false;
    for (i = 0; i < BDRYCorners; i++) {
        if (((BDRYlat[i] < y && BDRYlat[j] >= y)
            ||   (BDRYlat[j] < y && BDRYlat[i] >= y))
            &&  (BDRYlong[i] <= x || BDRYlong[j] <= x))
        {
            if (BDRYlong[i] + (y - BDRYlat[i]) / (BDRYlat[j] - BDRYlat[i]) * (BDRYlong[j] - BDRYlong[i]) < x)
            {
                oddNodes = !oddNodes;
            }
        }
        j = i;
    }
    return oddNodes;
}