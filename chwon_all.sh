#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "${0##*/}: Parmission denied." >&1
  exit 1
fi

chown -R ${USER}:${USER} .
