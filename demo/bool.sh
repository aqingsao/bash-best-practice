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

function boolan_check(){
  declare b=true
  if [[ ${b} == true ]]; then
  	echo "b is true"
  else
  	echo "b is false"
  fi
}

function main(){
	boolan_check
}
main "${@}"
