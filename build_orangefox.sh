#!/bin/bash

# OrangeFox Recovery Build Script for Retroid Pocket 5 (kona)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  OrangeFox Recovery Build Script${NC}"
echo -e "${GREEN}  Device: Retroid Pocket 5 (kona)${NC}"
echo -e "${GREEN}========================================${NC}"

# Check if we're in the right directory
if [ ! -f "device.mk" ] || [ ! -f "BoardConfig.mk" ]; then
    echo -e "${RED}Error: Please run this script from the device tree directory${NC}"
    exit 1
fi

# Set environment variables
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"

echo -e "${YELLOW}Setting up build environment...${NC}"

# Source build environment
if [ -f "../../../build/envsetup.sh" ]; then
    source ../../../build/envsetup.sh
elif [ -f "../../build/envsetup.sh" ]; then
    source ../../build/envsetup.sh
else
    echo -e "${RED}Error: Cannot find build/envsetup.sh${NC}"
    echo -e "${YELLOW}Please make sure you're in the correct OrangeFox source directory${NC}"
    exit 1
fi

echo -e "${YELLOW}Selecting lunch target...${NC}"
lunch twrp_kona-eng

echo -e "${YELLOW}Starting build...${NC}"
make clean
make recoveryimage -j$(nproc --all)

if [ $? -eq 0 ]; then
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  Build completed successfully!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "${YELLOW}Recovery image location:${NC}"
    find ../../../out -name "recovery.img" -type f 2>/dev/null | head -1
else
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}  Build failed!${NC}"
    echo -e "${RED}========================================${NC}"
    exit 1
fi