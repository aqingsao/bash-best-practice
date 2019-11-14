#!/bin/bash

function function_return_true(){
  return true;
}

function function_return_false(){
  return false;
}

declare b=function_return_true
echo ${b}
b=function_return_false
echo ${b}
