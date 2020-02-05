#!/bin/sh

export PATH="${PODS_ROOT}/SwiftGen/bin:$PATH"

LOC_SRC_FILE="${PROJECT_DIR}/NovaPlusBase/Resources/cs.lproj/Localizable.strings"
LOC_DST_FILE="${PROJECT_DIR}/NovaPlusBase/Model/Generated/LocalizedStrings.swift"

SHARED_IMG_SRC_FILE="${PROJECT_DIR}/NovaPlusBase/Resources/Images.xcassets"
APP_IMG_SRC_FILE="${PROJECT_DIR}/${TARGET_NAME}/Resources/AppImages.xcassets"
ASSETS_DST_FILE="${PROJECT_DIR}/NovaPlusBase/Model/Generated/Assets.swift"

PLIST_SRC_FILE="${ACK_ENVIRONMENT_DIR}/Current/environment.plist"
PLIST_DST_FILE="${PROJECT_DIR}/NovaPlusBase/Model/Generated/Environment.swift"

echo "[SwiftGen] Generating strings"
swiftgen strings -t structured-swift4 "$LOC_SRC_FILE" -o "${LOC_DST_FILE}"
echo "[SwiftGen] Generating assets"
swiftgen xcassets -t swift4 "$SHARED_IMG_SRC_FILE" "$APP_IMG_SRC_FILE" -o "${ASSETS_DST_FILE}"
echo "[SwiftGen] Generating environment plist"
swiftgen plist -t runtime-swift4 "$PLIST_SRC_FILE" -o "${PLIST_DST_FILE}" --param enumName="Environment"
