echo " "
echo "  -------------------------------------  "
echo "  Pixel builder for 9810 by @dylanneve1  "
echo "  -------------------------------------  "
echo "  Creating directories...  "
mkdir -p android/eleven
cd android/eleven
echo "  Downloading Source...  "
repo init -u https://github.com/PixelExperience/manifest -b twelve
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "  Downloading manifests for 9810...  "
cd .repo
git clone https://github.com/9810-S/local_manifests -b aosp-12
cd ..
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf .repo
echo "  Setting up build and cleaning up... "
source build/envsetup.sh
rm -rf system/tools/mkbootimg
git clone https://github.com/ArrowOS/android_system_tools_mkbootimg system/tools/mkbootimg
echo "  Starting build... "
brunch aosp_starlte-userdebug
brunch aosp_star2lte-userdebug
brunch aosp_crownlte-userdebug
