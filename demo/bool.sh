#!/bin/bash

function boolan_check(){
  declare b=true
  if [[ ${b} == true ]]; then
  	echo "b is true"
  else
  	echo "b is false"
  fi
}

boolan_check