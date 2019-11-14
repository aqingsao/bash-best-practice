#!/bin/bash

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