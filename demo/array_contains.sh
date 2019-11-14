#!/bin/bash

function array_contains(){
  local array=( "foo" "bar" )

  if [[ " ${array[@]} " !=~ " foo " ]]; then
    echo "contains"
  else
  	echo "not contains"
  fi
}

array_contains

