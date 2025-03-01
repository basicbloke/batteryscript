set Cap to (do shell script "ioreg -b -w 0 -f -r -c AppleSmartBattery | grep ExternalConnected")
tell Cap to set {wallPower} to {last word of paragraph 1}
if wallPower = "Yes" then
	return 0
else
    set battery_percent to (do shell script "pmset -g batt | grep -Eo '([0-9]{1,3})%' | cut -d% -f1") as number
	set low_percent to 25
	set critical_percent to 15
	set low_percent_delay_between_alerts to 180 -- number is in seconds
	set critical_percent_delay_between_alerts to 120 -- number is in seconds
	if battery_percent > critical_percent and battery_percent ≤ low_percent then
		display notification "Battery level is currently: " & battery_percent & "% which is below " & low_percent & "%. Plug in soonish." with title "Low Battery Level" sound name "Basso"
		delay low_percent_delay_between_alerts
	else if battery_percent ≤ critical_percent then
		display notification "Battery level is now: " & battery_percent & "% which is below " & criticial_percent & "%. Plug in now!" with title "Critical Battery Level" sound name "Sosumi"
		delay critical_percent_delay_between_alerts
	end if
end if
