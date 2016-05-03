#!/bin/bash

function get_szepkartya_egyenleg () {
	local card_num=${1? missing param - please enter last 10 digits of the card}
	curl -sL https://www.otpbankdirekt.hu/homebank/do/bankkartyaEgyenlegLekerdezesCafeteriaSZEP -d "muvelet=login&azonosito=$card_num&telekod=${card_num:7:10}" | sed -n '48p' | sed -r s/[^0-9]//g
}
