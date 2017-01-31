#include "gtest/gtest.h"
extern "C"
{
#include "boundary.h"
}

TEST(Boundary, InSquare)
{
    float field_lat[] = {0, 1, 1, 0};
    float field_long[] = {0, 0, 1, 1};
    EXPECT_EQ(true, point_in_polygon(0.5, 0.5, 4, field_lat, field_long));
}

TEST(Boundary, OutSquare)
{
    float field_lat[] = {0, 1, 1, 0};
    float field_long[] = {0, 0, 1, 1};
    EXPECT_EQ(false, point_in_polygon(1.5, 0, 4, field_lat, field_long));
}

TEST(Boundary, OutSquare2)
{
    float field_lat[] = {0, 1, 1, 0};
    float field_long[] = {0, 0, 1, 1};
    EXPECT_EQ(false, point_in_polygon(1.5, 1.5, 4, field_lat, field_long));
}

TEST(Boundary, OutSquare3)
{
    float field_lat[] = {0, 1, 1, 0};
    float field_long[] = {0, 0, 1, 1};
    EXPECT_EQ(false, point_in_polygon(1.5, 1.5, 4, field_lat, field_long));
}