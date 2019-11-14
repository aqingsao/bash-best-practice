#!/usr/bin/env bash

function echo_true(){
  echo true
}
function echo_false(){
  echo false
}
function main(){
  result=$(echo_true)
  if [[ ${result} == true ]]; then
  	echo "echo_true is true"
  else
  	echo "echo_true is false"
  fi

  result=$(echo_false)
  if [[ ${result} == true ]]; then
  	echo "echo_false is true"
  else
  	echo "echo_false is false"
  fi
}

main
