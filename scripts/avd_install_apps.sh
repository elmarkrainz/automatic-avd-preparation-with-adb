# install apps
echo ""
echo "---------------------------"
echo "--    install some apps"

# --- apps
for f in apps/*;
do
	 echo $f;
	 adb install $f
done
