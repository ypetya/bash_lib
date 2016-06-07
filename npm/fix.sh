#!/bin/bash

import require_package

function npm.fix() {
  require_package npm
  npm config ls -l | grep $USER
  echo ' * Fix these config variables!'
}
