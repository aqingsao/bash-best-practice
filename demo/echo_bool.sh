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
main "${@}"