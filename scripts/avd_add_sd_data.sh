# create some Data on sdcard
 echo ""
 echo "---------------------------"
 echo "   add data on the SD card "

adb push sdcard_data/test.txt sdcard/

echo ""
echo "---------------------------"
echo "--    add images and open gallery"


# --- images
for f in sdcard_data/imgs/*;
do
	# echo $f;
	 adb push $f sdcard/DCIM
done


# show gallery
adb shell am start  -t image/* -a android.intent.action.VIEW
sleep 2
adb shell input keyevent 4
sleep 5
adb shell input keyevent 3


echo ""
echo "---------------------------"
echo "--    add add and play music"

# --- music
for f in sdcard_data/music/*;
do
	# echo $f;
	 adb push $f sdcard/Music
done

# play song 5s
adb shell am start -a android.intent.action.VIEW -d file:///sdcard/Music/JohnnyCash-itaintme.mp3 -t audio/mp3
sleep 5
adb shell input keyevent 3


echo ""
echo "---------------------------"
echo "--    add misc. data"


# --- downloads
for f in sdcard_data/download/*;
do
	# echo $f;
	 adb push $f sdcard/Download
done
