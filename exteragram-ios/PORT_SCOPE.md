# exteraGram iOS port scope

Target source APK: `exteraGram-full-universal-20261004.apk`

Reverse-engineered baseline:
- exteraGram 12.10.6 Full
- APK git revision: `95e2bf93fd3558b8ae5233b66ba63acfd8436e48`
- 7 DEX files
- 64 native `.so` libraries
- embedded Python 3.11 / Chaquopy plugin runtime
- Vosk offline speech recognition
- native ad-block engine
- 676 extera localization strings across 48 functional sections
- ~2586 `com.exteragram.messenger` class descriptors

Base for iOS: Swiftgram/Telegram-iOS, so Telegram core functionality is preserved instead of being reimplemented as a toy client.

## Parity checklist

- [ ] Main extera settings hub / deep links
- [ ] Pill Stack: weather, crypto/rates, ordering, visibility, infinite scrolling
- [ ] Proxy enhancements, naming, pinning, VPN disable rules, IP info
- [ ] Appearance
- [ ] Icon packs and per-icon replacement
- [ ] Avatar corner controls
- [ ] Chat-list controls
- [ ] Folder/tab styles and counters
- [ ] Alternate app icons
- [ ] Blur/glass/snow visual options
- [ ] General UI styles: dividers, system fonts/emoji, sliders, switches, FAB, tablet mode, message tails, transitions
- [ ] Drawer / navigation customization
- [ ] Translation provider and target language controls
- [ ] Formatting/behavior: time seconds, relative last seen, vibration, notification delay, account notification filters, Zalgo filter
- [ ] Code block helpers
- [ ] Download/upload speed boost equivalents
- [ ] Storage/export save-path behavior where iOS allows it
- [ ] Profile: hide phone, show ID/DC
- [ ] Archive behavior
- [ ] Media/sticker controls, reaction visibility, reply background
- [ ] Chat gestures: double tap, configurable swipe actions, quick transitions
- [ ] AI editor/summaries/Instant View summaries
- [ ] Wide posts
- [ ] Admin shortcuts
- [ ] Keyboard-on-scroll / share button / edited label / send-as controls
- [ ] Poll results preview, online indicator, forward count
- [ ] Photo: default HD, camera tile behavior
- [ ] Offline speech recognition + model management + AI post-processing
- [ ] Camera: advanced capture, seamless switching, video message camera and zoom controls
- [ ] Player improvements / now-playing integration
- [ ] Plugin manager, install/update/remove, permissions, settings UI, menus and lifecycle
- [ ] Update checker
- [ ] Message details
- [ ] Backup/export/import settings
- [ ] Analytics/reset/account controls
- [ ] Login QR helpers
- [ ] Browser ad blocking and blocked-request counters
- [ ] Reverse image search / saved tracks / misc utilities
- [ ] AI services: custom URL/model/key, providers, roles, history, streaming, temperature/reasoning, image input
- [ ] On-device AI equivalent where supported
- [ ] Supporter/developer badges
- [ ] Bot-button context menus
- [ ] Main tabs
- [ ] Passkeys
- [ ] Registration/join date information
- [ ] Extra menu items
- [ ] Sticker editor additions
- [ ] Channel feed
- [ ] HTML/JSON data export

## Android -> iOS implementation mapping

Android-only APIs are not copied blindly. Equivalent iOS implementations are used:
- CameraX/Camera2 -> AVFoundation / MultiCam where hardware supports it.
- Android Monet -> dynamic iOS palette/theme engine.
- Android WebView adblock -> WKWebView + WKContentRuleList/native filtering.
- Android file paths -> Files/document picker/share sheet; iOS sandbox rules apply.
- Vosk JNI -> iOS Vosk build or native offline speech fallback.
- Gemini Nano -> Apple on-device Foundation Models where available, with the same remote custom-provider path retained.
- Python/Xposed plugin hooking -> separate embedded Python bridge; Java/Xposed hooks cannot exist 1:1 on iOS and must be mapped to explicit hook points in the iOS client.

## Important platform limitation

A sideloaded build can be made installable via AltStore, but Apple push-notification entitlements/background behavior are not identical to Android FCM. A free AltStore provisioning profile cannot reproduce every production Telegram push entitlement. Foreground Telegram functionality can be preserved; full background push parity requires appropriate Apple entitlements/infrastructure.

## Licensing

The port must preserve the applicable GPL source-license obligations of Telegram/exteraGram and publish corresponding source changes.
