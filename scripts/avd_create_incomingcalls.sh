echo ""
echo "---------------------------"
echo "--    get som incoming calls"

(echo "auth g3h0aeEO3WdR8fLQ";   sleep 3;
echo "gsm call 44556601"; sleep 5;
echo "gsm accept 44556601"; sleep 20;
echo "gsm cancel 44556601"; sleep 5;
echo "exit";
) | telnet localhost 5554
