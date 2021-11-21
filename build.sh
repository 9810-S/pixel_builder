echo " "
echo "  -------------------------------------  "
echo "  Pixel builder for 9810 by @dylanneve1  "
echo "  -------------------------------------  "
echo "  Creating directories...  "
mkdir -p android/twelve
cd ~/pixel_builder/android/twelve
echo "  Downloading Source...  "
echo "  -------------------------------------  "
echo " "
repo init -u https://github.com/PixelExperience/manifest -b twelve
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo " "
echo "  -------------------------------------  "
echo "  Downloading manifests for 9810...  "
cd ~/pixel_builder/android/twelve/.repo
git clone https://github.com/9810-S/local_manifests -b aosp-12
cd ~/pixel_builder/android/twelve
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags sync_log.txt
rm -rf ~/pixel_builder/android/twelve/system/tools/mkbootimg
git clone https://github.com/ArrowOS/android_system_tools_mkbootimg ~/pixel_builder/android/twelve/system/tools/mkbootimg
rm -rf ~/pixel_builder/android/twelve/.repo
echo "  Setting up build and cleaning up... "
source build/envsetup.sh
echo "  Starting build... "
brunch aosp_starlte-userdebug && brunch aosp_star2lte-userdebug && brunch aosp_crownlte-userdebug
