#!/bin/bash
set -o nounset

function main(){
  if [[ "${var}" == "hello" ]];then
  	echo "\"${var}\" equals to hello"
  else
  	echo "\"${var}\" not equals to hello"
  fi

  if [[ ${var} == "hello" ]];then
  	echo "${var} equals to hello"
  else
  	echo "${var} not equals to hello"
  fi
}

echo "${@}"
main 
