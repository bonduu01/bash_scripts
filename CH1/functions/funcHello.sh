#!/bin/bash

function hello() {
 echo "hello world"
}
hello


function helloTeam() {
 for NAME in $@
 do
  echo "Hello $NAME"
 done
}

helloTeam Ebuka Peter Tayo

