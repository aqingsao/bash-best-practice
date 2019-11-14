#!/usr/bin/env bash

function f(){
  foo=(a "b c" d)	
  echo "${foo[*]}"
}
function main(){
  result=$(f)
  echo "array length: ${#result[*]} "
}

main
