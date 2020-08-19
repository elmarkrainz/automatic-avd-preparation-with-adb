echo ""
echo "---------------------------"
echo "--    dial some numbers"

array=(  "tel:44556601" "tel:06649194136" "tel:0919194136" )
	for i in "${array[@]}"
	do
		adb shell am start -a android.intent.action.CALL  $i
		sleep 15
		adb shell input keyevent 6
		sleep 1
	done
