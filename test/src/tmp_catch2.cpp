#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>

#include <motions/tmp.hpp>

TEST_CASE("Factorials are computed", "[factorial]")
{
  REQUIRE(tmp::add(1, 2) == 3);
}