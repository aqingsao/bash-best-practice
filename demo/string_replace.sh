#!/bin/bash

function replace_space(){
  local string=" hello world"
  echo "string is: ${string}"

  string="${string/ /}"
  echo "string is: ${string}"
}

replace_space