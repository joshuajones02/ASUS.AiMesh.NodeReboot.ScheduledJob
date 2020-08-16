if ! ping -w 10 -c 10 1.1.1.1 > /dev/null; then
sleep 240
#wait 4 minutes in case of another router in reboot cycle.
if ! ping -w 10 -c 10 1.1.1.1 > /dev/null; then
reboot
fi
fi
