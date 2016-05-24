#!/bin/bash

function zipf () {
	zip -r "${1? missing parameter - fileName to zip}".zip "$1"
}
