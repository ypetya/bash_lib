#!/bin/bash

import http.get

function http.forecast() {
	http.get "http://wttr.in"
}
