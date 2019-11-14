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

function main(){
	simple_declare_array
}
main "${@}"
