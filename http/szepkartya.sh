import http.get
# https://www.otpszepkartya.hu/fooldal/
function http.szepkartya () {
	local card_num=${1? missing param - please enter last 10 digits\
 of the card}
	# filter the numbers from line 48
	http.get "https://www.otpbankdirekt.hu/homebank/\
do/bankkartyaEgyenlegLekerdezesCafeteriaSZEP" \
	-d "muvelet=login&azonosito=$card_num&telekod=${card_num:7:10}" | \
	sed -n '48p' | \
	sed 's/[^0-9]//g'
}

alias get_szepkartya_egyenleg='http.szepkartya'
