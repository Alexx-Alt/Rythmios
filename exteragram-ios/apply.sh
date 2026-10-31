#!/bin/bash
set -euo pipefail

ROOT="${1:?Swiftgram source root is required}"
export ROOT

python3 - <<'PY'
from pathlib import Path
import os

root = Path(os.environ['ROOT'])

def replace(path, old, new, required=True):
    p = root / path
    s = p.read_text()
    if old not in s:
        if required:
            raise SystemExit(f'overlay anchor missing in {path}: {old!r}')
        return False
    p.write_text(s.replace(old, new))
    print(f'patched {path}')
    return True

# Branding visible in the generated Bazel application bundle.
replace(
    'Telegram/Telegram-iOS/InfoBazel.plist',
    '<key>CFBundleDisplayName</key>\n\t<string>${APP_NAME}</string>',
    '<key>CFBundleDisplayName</key>\n\t<string>exteraGram</string>'
)

# Keep non-Bazel/Xcode project metadata consistent too.
replace(
    'Telegram/Telegram-iOS/Info.plist',
    '<key>CFBundleDisplayName</key>\n\t<string>${APP_NAME}</string>',
    '<key>CFBundleDisplayName</key>\n\t<string>exteraGram</string>',
    required=False
)

# Reuse Swiftgram's mature native settings infrastructure as exteraGram's iOS settings base.
replace(
    'Swiftgram/SGSettingsUI/Sources/SGSettingsController.swift',
    'title: .text("Swiftgram")',
    'title: .text("exteraGram")'
)

# A small marker in the source tree makes it obvious which build received the overlay.
marker = root / 'EXTERAGRAM_IOS_PORT.txt'
marker.write_text(
    'exteraGram iOS port overlay\n'
    'Android target: exteraGram Full 12.10.6 (2026-10-04)\n'
    'Base: Swiftgram/Telegram-iOS\n'
)
PY

echo "exteraGram iOS overlay applied"
