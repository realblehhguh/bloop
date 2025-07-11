# OrangeFox Recovery device tree for qti Retroid Pocket 5 (kona)

## Device specifications

| Device       | Retroid Pocket 5                                    |
| -----------: | :-------------------------------------------------- |
| SoC          | Qualcomm Snapdragon 865 (kona)                     |
| CPU          | Octa-core (1x2.84 GHz Cortex-A77 & 3x2.42 GHz Cortex-A77 & 4x1.80 GHz Cortex-A55) |
| GPU          | Adreno 650                                          |
| Memory       | 8GB RAM                                             |
| Shipped Android version | 11                                       |
| Storage      | 128GB                                               |
| Display      | 5.5 inch, 1920 x 1080 px                          |

## Build Instructions

### Prerequisites
- OrangeFox Recovery source code
- Device tree placed in `device/moorechip/kona/`

### Building
1. Clone this device tree:
```bash
git clone <this-repo> device/moorechip/kona
```

2. Build using the provided script:
```bash
cd device/moorechip/kona
./build_orangefox.sh
```

Or manually:
```bash
source build/envsetup.sh
lunch twrp_kona-eng
make clean
make recoveryimage -j$(nproc --all)
```

### Features
- A/B partition support
- Decryption support
- OTA updates support
- MTP support
- ADB support
- Magisk integration

```
#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```
