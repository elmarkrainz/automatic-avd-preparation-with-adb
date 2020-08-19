echo ""
echo "---------------------------"
echo "--    get some text messages"

(echo "auth g3h0aeEO3WdR8fLQ";   sleep 5;
echo "sms send 44556601 hi, i will come 5 min later, bye"; sleep 5;
echo "sms send 0919194136 hi, see you tomorrow"; sleep 5;
) | telnet localhost 5554
