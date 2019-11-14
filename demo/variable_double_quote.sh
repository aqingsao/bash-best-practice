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
main "${@}"
