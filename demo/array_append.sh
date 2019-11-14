#!/bin/bash

function array_append_by_plus(){
  declare -a array=()
  array+=( 'foo' )
  array+=( 'bar' )
  echo "array length: ${#array[@]}"
}

function array_append10(){
  array=(a b c d e f g h)
  echo ${array}
  array[42]="i"
  echo ${array}
  unset array[2]
  unset array[3]
  echo ${array}
  # declare -p array     # dump the array so we can see what it contains
  # declare -a array='([0]="a" [1]="b" [4]="e" [5]="f" [6]="g" [7]="h" [42]="i")'
  # echo ${#array[@]}
  # echo ${array[${#array[@]}]}
}

array_append_by_plus