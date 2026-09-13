#!/bin/sh
# SPDX-FileCopyrightText: 2026 Project516 <138796702+Project516@users.noreply.github.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Called by AppImage Builder to assemble the AppDir contents from the
# already-built Gradle shadow JAR.

set -e

# Build a clean AppDir layout.
mkdir -p AppDir/usr/bin
mkdir -p AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps

# Put the shadow JAR in the AppDir.
cp app/build/libs/app-all.jar AppDir/usr/bin/game.jar

# Reuse the existing Linux run script.
cp scripts/run.sh AppDir/usr/bin/run.sh
chmod +x AppDir/usr/bin/run.sh

# Desktop file so the AppImage is launchable from application menus.
cat > AppDir/usr/share/applications/numberguessinggame.desktop <<'EOF'
[Desktop Entry]
Name=Number Guessing Game
Exec=run.sh
Icon=numberguessinggame
Type=Application
Comment=Guess the randomly generated number
EOF

# Ship the README next to the desktop file for discoverability.
cp README.md AppDir/usr/share/applications/numberguessinggame.README
