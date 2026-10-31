# exteraGram 12.10.6 Android -> iOS parity map

Legend: `READY` = already present in Swiftgram/iOS base; `PORT` = implement in overlay; `IOS-EQ` = iOS-native equivalent required; `LIMIT` = Apple platform/entitlement limitation.

| Feature group | Status | iOS implementation |
|---|---|---|
| Telegram chats, media, stories, calls, folders, accounts | READY | Telegram-iOS/Swiftgram core |
| Hide phone in settings | READY | SGSimpleSettings / SGSettingsUI |
| Show user ID / DC | READY | SGPeerInfoRows + SGSettingsUI |
| Registration / creation dates | READY | SGRegDate + SGSettingsUI |
| Seconds in message time | READY | SGSimpleSettings |
| Upload boost | READY | SGSimpleSettings |
| Download boost levels | READY | SGSimpleSettings |
| Quick translate button | READY | SGTranslate / SGGTranslate |
| Translation backend | READY | SGSettingsUI |
| Whole-chat translation | READY | Telegram/Swiftgram translation UI |
| Voice transcription backend | READY | Apple/Swiftgram transcription backend |
| Message double-tap edit/action basis | READY | SGDoubleTapMessageAction |
| Wide channel posts | READY | SGSimpleSettings |
| Message context-menu extras | READY | save-to-cloud, hide-forward-name, select-from-user, restrict, report, reply, pin, save media, replies, JSON |
| JSON message inspection | READY | SGShowMessageJson |
| Compact chat list / message preview | READY | SGSettingsUI |
| Folder position / remember folder / compact names | READY | SGSettingsUI |
| Tab names / calls / contacts / wide tab bar / hide tab bar | READY | SGSettingsUI |
| Hide stories / stealth / repost / warn-before-open | READY | SGSettingsUI |
| Outgoing photo quality / large photos | READY | SGSettingsUI |
| Start video note with rear camera | READY | SGSettingsUI |
| Sticker size / timestamp | READY | SGSettingsUI |
| Hide reactions | READY | SGSettingsUI |
| Send-as button / gallery camera / preview toggles | READY | SGSettingsUI |
| Pull-to-next channel/topic | READY | SGSettingsUI |
| Player footer controls / swipe-to-PiP | READY | SGExternalVideoPlayer + settings |
| Alternate app icons | READY | Swiftgram alternate icons; extera icon assets to be added |
| Snow/lightning visual styles | READY | SGNY |
| Browser/open-url customization | READY/PARTIAL | SFSafariViewControllerPlus / SGSafariControllerUrlOpening; extera adblock still PORT |
| Settings backup/keychain helpers | READY/PARTIAL | SGKeychainBackupManager; extera full backup schema PORT |
| Pill Stack weather/crypto | PORT | native SwiftUI/Display node + HTTP providers |
| Enhanced proxy naming/pinning/VPN rules/IP info | PORT | Telegram proxy engine + Network framework |
| extera icon packs/per-icon replacement | PORT | asset-pack manager mapped to iOS alternate icon APIs |
| Avatar corner controls | PORT | TelegramUI node styling |
| extera folder/tab style variants and counters | PORT | extend existing Swiftgram tab/folder customization |
| Blur/glass visual controls | PORT | UIVisualEffectView / iOS material effects |
| Custom fonts/system emoji controls | PORT/IOS-EQ | UIFont/CTFont and system emoji constraints |
| FAB/sliders/switches/message-tail style variants | PORT | TelegramUI presentation patches |
| Drawer customization | IOS-EQ | map to iOS navigation/tab/sidebar patterns |
| Relative last seen / Zalgo filter / notification delay | PORT | presentation + notification scheduling hooks |
| Code-block helper actions | PORT | message entity/context-menu hooks |
| Arbitrary save path | IOS-EQ | Files/document picker/share sheet; iOS sandbox forbids Android-style global path |
| Archive behavior extensions | PORT | chat-list/archive hooks |
| Custom message swipe action matrix | PORT | extend TelegramUI swipe action handlers |
| AI editor / summaries / Instant View summary | PORT | remote providers + optional Apple on-device model |
| Custom AI URL/model/key/providers/roles/history/streaming | PORT | URLSession + Keychain + local store |
| Gemini Nano on-device AI | IOS-EQ | Apple Foundation Models where available; same remote fallback retained |
| Poll preview / online indicator / forward count | PORT | chat row/message node patches |
| Advanced camera/video-message controls | IOS-EQ | AVFoundation / MultiCam where hardware supports |
| Offline Vosk recognition + model manager | PORT/IOS-EQ | Vosk iOS build if compatible; Apple offline Speech fallback |
| Full player/Now Playing extensions | PORT | AVAudioSession / MPNowPlayingInfoCenter |
| Python plugin manager/runtime | PORT | embedded CPython/PythonKit-style bridge + explicit iOS hooks |
| Android Xposed/Java plugin hooks | IOS-EQ | cannot execute Java/Xposed hooks; expose equivalent native hook API to plugins |
| Update checker | PORT | GitHub/release endpoint + sideload-friendly update flow |
| Full message details | PORT | TelegramCore message metadata UI |
| extera backup/export/import | PORT | JSON/files document export/import |
| QR login helpers | READY/PARTIAL | Telegram QR login core + extera helper UI PORT |
| Browser adblock + counters | PORT | WKContentRuleList/native filter engine |
| Reverse image search | PORT | share/upload URL providers |
| Saved tracks | PORT | media store/player integration |
| Supporter/developer badges | PORT | peer/message presentation decorators |
| Bot button context menus | PORT | bot web/button context-menu hooks |
| Passkeys | IOS-EQ | AuthenticationServices passkeys where server flow permits |
| Sticker editor additions | PORT | DrawingUI/StickerEditor hooks |
| Channel feed | PORT | chat/channel aggregation controller |
| HTML/JSON export | PORT | local exporter |
| Background push parity with Android | LIMIT | AltStore/free provisioning cannot reproduce official Telegram APNs entitlement/infrastructure exactly |

## Definition of done

A feature is only marked complete after: (1) it is reachable in the iOS UI, (2) its state persists, (3) the underlying behavior is wired, and (4) an unsigned arm64 IPA builds successfully in CI. UI-only placeholders do not count.
