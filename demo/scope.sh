#!/bin/bash

declare number=10

function declare_in_fun() {
  declare -i number=0

  number=20
  echo "In ${FUNCNAME[0]}: ${number}"
}

function local_in_fun() {
  local -i number=0

  number=30
  echo "In ${FUNCNAME[0]}: ${number}"
}

function declare_local() {
  declare -i declare_var=50
  var=50

  echo "In ${FUNCNAME[0]}: ${declare_var}, ${var}"
}

echo "Before declare_in_fun: ${number}"
declare_in_fun
echo "After declare_in_fun: ${number}"
local_in_fun
echo "After local_in_fun: ${number}"


declare_local
echo "After declare_local: ${declare_var}, ${var}"
