#!/bin/bash

import http_get

function get_weather_forecast() {
	http_get "http://wttr.in"
}
