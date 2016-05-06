#!/bin/bash

function create_week_days() {
	unset week_days
	declare -gA week_days

	week_days[1]='Mon'
	week_days[2]='Tue'
	week_days[3]='Wed'
	week_days[4]='Thu'
	week_days[5]='Fri'
	week_days[6]='Sat'
	week_days[7]='Sun'
}

create_week_days
