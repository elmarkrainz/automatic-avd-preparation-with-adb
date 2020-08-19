echo ""
echo "---------------------------"
echo "--    open some urls with browser"


array=(  "http://www.android.com" "http://amazon.com" "http://news.com" "https://images.obi.at/PROD/DE/document/319/319775_datasheet_1.pdf" )
	for i in "${array[@]}"
	do
		adb shell am start -a android.intent.action.VIEW -d $i
			sleep 3
			adb shell input keyevent 3
	done
