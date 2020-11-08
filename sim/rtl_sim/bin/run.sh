#!/bin/bash

# u or s
SIGNEDNESS=$1

# Test [s|u]fixed rounding
../../../sw/gentestround -signed -iw 4 -fw 4 -step 0.25 ../../../gen/vhdl/testrounding${SIGNEDNESS}.vhd
./testrounding${SIGNEDNESS}.sh

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running for $SECONDS $units."
