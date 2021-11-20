echo " "
echo "  -------------------------------------  "
echo "  Pixel builder for 9810 by @dylanneve1  "
echo "  -------------------------------------  "
echo "  Creating directories...  "
mkdir -p android/eleven
cd android/eleven
echo "  Downloading Source...  "
echo "  -------------------------------------  "
echo " "
repo init -u https://github.com/PixelExperience/manifest -b twelve > source_log.txt
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags > source_log.txt
echo " "
echo "  -------------------------------------  "
echo "  Downloading manifests for 9810...  "
cd .repo
git clone https://github.com/9810-S/local_manifests -b aosp-12 > manifest_log.txt
cd ..
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags sync_log.txt
rm -rf .repo
echo "  Setting up build and cleaning up... "
source build/envsetup.sh > source_log.txt
rm -rf system/tools/mkbootimg
git clone https://github.com/ArrowOS/android_system_tools_mkbootimg system/tools/mkbootimg > mkbootimg_log.txt
echo "  Starting build... "
brunch aosp_starlte-userdebug
brunch aosp_star2lte-userdebug
brunch aosp_crownlte-userdebug
