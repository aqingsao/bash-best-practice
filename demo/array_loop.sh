#!/bin/bash

function loop_array(){
  array=( one two three )
  for i in "${array[@]}"
  do
	echo $i
  done
}