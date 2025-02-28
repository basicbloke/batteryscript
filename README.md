1) Copy batteryScript.scpt to: /etc
2) In terminal: chmod +x /etc/batteryScript.scpt
3) Copy batteryAlert.plist to: ~/Library/LaunchAgents
4) In terminal: launchctl load ~/Library/LaunchAgents/batteryAlert.plist
5) In terminal: launchctl list | grep batteryAlert
   Should display: -    0     batteryAlert
6) To unload, in terminal: launchctl unload ~/Library/LaunchAgents/batteryAlert.plist`

Configuration notes:
The KeepAlive variable will keep the script running. Change this to false if you do not want this functionality.
In order to run this script periodically instead, remove the delay n lines from your .scpt file and add the following as the last element in the dict in your .plist file.

  <key>StartInterval</key>
  <integer>600</integer>

OG notes:
https://jmmoloney.com/blog/2019/02/06/batteryscript
