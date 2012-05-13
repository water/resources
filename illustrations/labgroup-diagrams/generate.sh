#!/bin/bash
#
# Usage:
#
#     ./generate.sh png
#
# where the argument "png" can be others stuff to
#

for file in *.dot
do
  name=`basename $file .dot`
  dot "-T$1" $name.dot -o $name.$1
done
