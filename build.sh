#!/bin/bash

# Parameter 2: Build mode: restart | new | wipe | [leave it empty]
# restart = clean build
# new = tag as a released build
# wipe = clean build and tag as a released build
# . build.sh jfltetmo restart

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
MODE="$2"

# Time of build startup
res1=$(date +%s.%N)

# Reading mode
if [ ! -z $MODE ]; then
if [ $MODE == "restart" ]; then
       echo -e "${bldblu}Cleaning up out folder ${txtrst}"
       read -p "Press [Enter] key to proceed..."
       echo -e "${bldblu}Setting up build environment ${txtrst}"
       . build/envsetup.sh
       echo -e "${bldblu}Lunching device... ${txtrst}"
       lunch "broken_$DEVICE-userdebug"
       echo -e "${grn}Device and vendor repos synced ${txtrst}"
       mka broken
       res2=$(date +%s.%N)
       echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
fi
else
       echo -e "${bldblu}Please set a build flag${txtrst}"
fi
if [ ! -z $MODE ]; then
if [ $MODE == "new" ]; then
       echo -e "${bldblu}Cleaning up out folder ${txtrst}"
       read -p "Press [Enter] key to proceed..."
       make clobber
       echo -e "${bldblu}Setting up build environment ${txtrst}"
       . build/envsetup.sh
       echo -e "${bldblu}Lunching device... ${txtrst}"
       lunch "broken_$DEVICE-userdebug"
       echo -e "${grn}Device and vendor repos synced ${txtrst}"
       mka broken
       res2=$(date +%s.%N)
       echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
fi
else
       echo -e "${bldblu}Please set a build flag${txtrst}"
fi
if [ ! -z $MODE ]; then
if [ $MODE == "wipe" ]; then
       echo -e "${bldblu}Cleaning up out folder ${txtrst}"
       read -p "Press [Enter] key to proceed..."
       make clobber
       read -p "Press [Enter] key to proceed..."
       echo -e "${bldblu}Setting up build environment ${txtrst}"
       . build/envsetup.sh
       echo -e "${bldblu}Lunching device... ${txtrst}"
       lunch "broken_$DEVICE-userdebug"
       echo -e "${grn}Device and vendor repos synced ${txtrst}"
       mka broken
       res2=$(date +%s.%N)
       echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
fi
else
       echo -e "${bldblu}Please set a build flag${txtrst}"
fi
