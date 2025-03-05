# fix-controls-psychonauts

clear
echo "fix-controls-psychonauts"
echo ""
echo "Working..."
echo ""
echo "Removing joypad control entries..."
echo ""
cd "$(dirname "$0")"

sed -i '/Joy2/d' "Profile 3- zoey.ini"
sed -i '/Joy1/d' "Profile 3- zoey.ini"
sed -i '/Joy4/d' "Profile 3- zoey.ini"
sed -i '/Joy3/d' "Profile 3- zoey.ini"
sed -i '/Joy5/d' "Profile 3- zoey.ini"
sed -i '/Joy6/d' "Profile 3- zoey.ini"
sed -i '/Joy7/d' "Profile 3- zoey.ini"
sed -i '/Joy8/d' "Profile 3- zoey.ini"
sed -i '/DPadLeft/d' "Profile 3- zoey.ini"
sed -i '/DPadRight/d' "Profile 3- zoey.ini"
sed -i '/Joy12/d' "Profile 3- zoey.ini"
sed -i '/Joy9/d' "Profile 3- zoey.ini"
sed -i '/Joy11/d' "Profile 3- zoey.ini"
sed -i '/JoyRotZ/d' "Profile 3- zoey.ini"
sed -i '/JoyZ/d' "Profile 3- zoey.ini"

# Remove the final lines of the config so that we can append the good shit
sed -i '$ d' "Profile 3- zoey.ini"

echo "Jump_Alt=" >> "Profile 3- zoey.ini"

echo "Attack_Alt=" >> "Profile 3- zoey.ini"

echo "Use_Alt=" >> "Profile 3- zoey.ini"

echo "Cancel_Alt=" >> "Profile 3- zoey.ini"

echo "LockOn/Float_Alt=" >> "Profile 3- zoey.ini"

echo "PsiPower1_Alt=" >> "Profile 3- zoey.ini"

echo "PsiPower2_Alt=" >> "Profile 3- zoey.ini"

echo "PsiPower3_Alt=" >> "Profile 3- zoey.ini"

echo "InventoryMenu_Alt=" >> "Profile 3- zoey.ini"

echo "PsiPowersMenu_Alt=" >> "Profile 3- zoey.ini"

echo "FirstPerson_Alt=" >> "Profile 3- zoey.ini"

echo "Journal_Alt=" >> "Profile 3- zoey.ini"

echo "Stats_Alt=" >> "Profile 3- zoey.ini"

echo "LookUp_Alt=" >> "Profile 3- zoey.ini"

echo "LookDown_Alt=" >> "Profile 3- zoey.ini"

echo "LookLeft_Alt=" >> "Profile 3- zoey.ini"

echo "LookRight_Alt=" >> "Profile 3- zoey.ini"

# Add newline to end of file to match original
echo >> "Profile 3- zoey.ini"

echo "Done."

# EOF
