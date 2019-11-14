#!/bin/bash

function declare_array(){
  declare -a array=( 'foo' 'bar' )
  echo "array length: ${#array[@]}"
}

function simple_declare_array(){
  local array=()
  array+=('foo')
  array+=('bar')
  echo "array length: ${#array[@]}"
}

simple_declare_array
