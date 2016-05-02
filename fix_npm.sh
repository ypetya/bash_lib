#!/bin/bash

function fix_npm() {
  require_package npm
  npm config ls -l | grep $USER
  echo ' * Fix these config variables!'
}
