# Automatic avd preparation with adb

Scripts create messages, phonecalls, and userdata for Android virtual devices automatically with abd and telnet

## Working with a "real" AVD

For Android development or security analysis is an *Android Virtual Device* or *AVD* very useful. If you create a new AVD it comes with all preinstalled Android apps, but for a "real" experience you need some data in your emulator.

You can use the AVD nearly like a normal Android devices, but it takes some time to prepare some "user data".

With the help of *adb* and *telnet* is it possible to create some user data automatically


**Examples of automatic User Data:**

- sdcard Data
- phone Calls
- incoming messages
- browser history
- installed apps

## adb

tool from android SDK, access to virtual and real devices
see [https://developer.android.com/studio/command-line/adb](https://developer.android.com/studio/command-line/adb) 

### SD card data

for real experice, an AVD should have some data at the sdcard

	adb push sdcard_data/test.txt sdcard/

#### open media files 

**images**

	adb shell am start  -t image/* -a android.intent.action.VIEW

**music files**

	adb shell am start -a android.intent.action.VIEW -d file:///sdcard/Music/song.mp3 -t audio/mp3

### send keyevent

e.g. send home event

	adb shell input keyevent 3




### create a browser history

open a single website via adb

	 adb shell am start -a android.intent.action.VIEW -d http://www.android.com

create some browser history

	array=( "http://www.android.com" "http://amazon.com" "http://news.com" )
	for i in "${array[@]}"
	do
		adb shell am start -a android.intent.action.VIEW -d $i
	done


### create a phone call

start the phone call

	adb shell am start -a android.intent.action.CALL  tel:0919194136

and end the call

	adb shell input keyevent 6

## telnet

run command via telnet (see [https://developer.android.com/studio/run/emulator-console
](https://developer.android.com/studio/run/emulator-console))

### connect with telnet

	telnet localhost <portNr>

	e.g.
	telnet localhost 5554

authenticate

	auth <token>

	e.g.
	auth g3h0aeEO3WdR8fLQ

you find the token in

	<user-home-dir>/.emulator_console_auth_token

send incoming call

	gsm call 44556601


send incoming SMS

	sms send 44556601 hi, i will come 5 min later, bye

scripting it

sms:

	(echo "auth <YOUR-TOKEN>";   sleep 5; echo "sms send 44556601 hi, i will come 5 min later, bye"; sleep 5; ) | telnet localhost 5554

phone call:

	(echo "auth <YOUR-TOKEN>";   sleep 3;
	echo "gsm call 44556601"; sleep 5;
	echo "gsm accept 44556601"; sleep 20;
	echo "gsm cancel 44556601"; sleep 5;
	echo "exit";
	) | telnet localhost 5554
