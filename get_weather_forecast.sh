#!/bin/bash

import http.get

function get_weather_forecast() {
	http.get "http://wttr.in"
}
