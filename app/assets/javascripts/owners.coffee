# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
	$("address_zipcode").jpostal({
		postcode: ["#address_zipcode"],
		address : {
			"#address_prefecture_name" : "%3",
			"#address_city" 		   : "%4%5",
			"#address_street"		   : "%6%7"
		}
	})