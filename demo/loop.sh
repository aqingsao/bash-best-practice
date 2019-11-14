#!/usr/bin/env bash

set -o errexit
set -o pipefail
#set -o nounset
#set -o xtrace

# magic variables for current file & dir
declare -r __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -r __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
declare -r __base="$(basename ${__file} .sh)"
declare -r __root="$(cd "$(dirname "${__dir}")" && pwd)"

function while_loop(){
  count=0
  while [ $count -le 10 ]
  do
    echo "$count"
    count=$(( $count + 1 ))
  done  
}

function for_loop(){
  for (( n=1; n<=10; n++ ))
  do
    echo "$n"
  done
}

function for_loop2(){
  for user in Kate Jake Patt
  do
    echo "$user"
  done
}

function until_loop(){
  count=0
  until [ $count -gt 10 ]
  do
    echo "$count"
    count=$(( $count + 1 ))
  done
}

function main(){
  while_loop
}
main "${@}"

