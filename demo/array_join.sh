#!/bin/bash

function join(){
  foo=(a "b c" d)
  echo $(IFS=, ; echo "${foo[*]}")
}

join
