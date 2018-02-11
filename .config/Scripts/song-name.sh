#!/bin/bash
if [ $(mpc current | wc -l) != "0" ]
then
  mpc status -f \"%file%\" | head -n 1 | sed 's@.*/@@' | sed 's/\.[^.]*$//'
else
  echo ""
fi
