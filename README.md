# Zumu Translator Button SDK for iOS

> **Floating AI translation button for real-time voice-to-voice translation in iOS apps**

<p align="center">
  <img src="https://img.shields.io/badge/iOS-17.0+-blue.svg" alt="iOS 17.0+">
  <img src="https://img.shields.io/badge/Swift-5.9+-orange.svg" alt="Swift 5.9+">
  <img src="https://img.shields.io/badge/Xcode-15.0+-blue.svg" alt="Xcode 15.0+">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License">
</p>

## Overview

A lightweight, drop-in SwiftUI component that adds real-time AI translation to your iOS app. Built with LiveKit for enterprise-grade voice-to-voice translation between drivers and passengers in rideshare applications.

**Key Features:**
- 🚀 **Drag & Drop Installation** - No package manager needed
- 🎯 **Floating Button UI** - Compact, non-intrusive design
- 🔊 **Real-Time Translation** - Voice-to-voice with visual feedback
- 🤖 **Auto-Start Mode** - Automatically connect when needed (optional)
- 📊 **State Visualization** - Animated gradient backgrounds for each state
- 🎨 **SwiftUI Native** - Clean, modern iOS design
- 🎤 **Microphone Control** - Built-in mute/unmute functionality

## Requirements

- **iOS**: 17.0+
- **Xcode**: 15.0+
- **Swift**: 5.9+
- **Dependencies**: LiveKit Swift SDK (17.0.0+) and LiveKit Components
- **API**: Zumu API key ([Get one here](https://translator.zumu.ai))

## Installation

### Step 1: Install LiveKit Dependencies

Since this SDK uses drag-and-drop installation (not Swift Package Manager), you'll need to manually install LiveKit dependencies first.

**Using CocoaPods:**

Add to your `Podfile`:

```ruby
pod 'LiveKit', '~> 2.0'
pod 'LiveKitComponents', '~> 0.1'
```

Then run:
```bash
pod install
```

**Or using Swift Package Manager for LiveKit only:**

1. In Xcode: File → Add Package Dependencies
2. Add LiveKit: `https://github.com/livekit/client-sdk-swift`
3. Add LiveKitComponents: `https://github.com/livekit/components-swift`

### Step 2: Add the SDK to Your Project

1. **Download** or clone this repository
2. **Drag** the entire `ZumuTranslatorButtonSDK` folder into your Xcode project
3. **Check** "Copy items if needed" when prompted
4. **Ensure** "Add to targets" includes your app target

Your project structure should look like:
```
YourProject/
├── YourProject/
│   ├── ... your existing files ...
│   └── ZumuTranslatorButtonSDK/
│       └── Sources/
│           ├── ZumuTranslatorButton.swift
│           ├── Models.swift
│           ├── ZumuTokenSource.swift
│           └── Helpers.swift
```

### Step 3: Configure Microphone Permissions

Add to your `Info.plist`:

```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs microphone access for real-time translation</string>
```

## Usage

### Basic Example

```swift
import SwiftUI

struct MyView: View {
    var body: some View {
        ZStack {
            // Your existing UI
            MyAppContent()

            // Add floating translation button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZumuTranslatorButton(
                        config: ZumuTranslator.TranslationConfig(
                            driverName: "Max",
                            driverLanguage: "Russian",
                            passengerName: "Fadi",
                            passengerLanguage: "Arabic", // or nil for auto-detect
                            tripId: "trip-ABC123",
                            pickupLocation: "123 Main St",
                            dropoffLocation: "456 Oak Ave"
                        ),
                        apiKey: "zumu_your_api_key_here"
                    )
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 100)
            }
        }
    }
}
```

### With Auto-Start

```swift
ZumuTranslatorButton(
    config: ZumuTranslator.TranslationConfig(
        driverName: "Max",
        driverLanguage: "Russian",
        passengerName: "Fadi",
        passengerLanguage: "Arabic"
    ),
    apiKey: "zumu_your_api_key",
    shouldAutoStart: true  // Automatically connects when button appears
)
```

### With Analytics IDs

```swift
ZumuTranslatorButton(
    config: ZumuTranslator.TranslationConfig(
        driverName: "Max",
        driverLanguage: "Russian",
        passengerName: "Fadi",
        passengerLanguage: nil, // Auto-detect
        tripId: "trip-ABC123",
        pickupLocation: "123 Main St",
        dropoffLocation: "456 Oak Ave",
        externalDriverId: "DRV-00456",  // Your driver ID
        memberId: "MEMBER-78901"         // Your user/member ID
    ),
    apiKey: "zumu_your_api_key"
)
```

### Conditional Rendering

```swift
struct MyView: View {
    @AppStorage("showTranslator") var showTranslator: Bool = true

    var body: some View {
        ZStack {
            MyAppContent()

            if showTranslator {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZumuTranslatorButton(
                            config: myConfig,
                            apiKey: apiKey
                        )
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 100)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}
```

## Configuration

### TranslationConfig

```swift
public struct TranslationConfig {
    let driverName: String               // Required: Driver's name
    let driverLanguage: String           // Required: Driver's language (e.g., "English", "Russian")
    let passengerName: String            // Required: Passenger's name
    let passengerLanguage: String?       // Optional: Passenger language or nil for auto-detect
    let tripId: String                   // Optional: Unique trip ID (auto-generated if nil)
    let pickupLocation: String?          // Optional: Pickup address
    let dropoffLocation: String?         // Optional: Dropoff address
    let externalDriverId: String?        // Optional: Your system's driver ID for analytics
    let memberId: String?                // Optional: Your system's user/member ID
}
```

### Button Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `config` | `TranslationConfig` | Required | Session configuration |
| `apiKey` | `String` | Required | Zumu API key |
| `shouldAutoStart` | `Bool` | `false` | Auto-connect when button appears |

## Button States

The button displays different states with visual feedback:

| State | Color | Description |
|-------|-------|-------------|
| **Inactive** | Purple/Indigo | Not connected, tap to start |
| **Connecting** | Purple/Indigo | Establishing session, show "Cancel" |
| **Listening** | Bright Purple | Capturing driver speech |
| **Thinking** | Deep Indigo | Processing translation |
| **Speaking** | Blue | Playing translated audio |
| **Error** | Red | Connection or translation error |

Each state has a unique animated gradient and visualization:
- **Listening**: Waveform visualizer showing audio input
- **Thinking**: Pulsating dot animation
- **Speaking**: Waveform showing agent's speech output

## Features

### Microphone Control

The button automatically shows a mute/unmute control when connected:

- **Mute button** appears on the left side when active
- **Tap** to toggle microphone on/off
- **Red icon** indicates muted state
- **White icon** indicates active microphone

### Transcript Popover

Long-press the button (1 second) to view recent message transcripts:

- Shows last 5 messages
- Displays both driver and passenger speech
- Includes role labels (Driver/Passenger)
- Tap X to close

### Connection Management

- **Single tap inactive button**: Start connection
- **Tap while connecting**: Cancel connection
- **Tap while active**: Disconnect and return to inactive
- **Auto-disconnect**: On view disappear

## API Reference

### ZumuTranslatorButton

```swift
public struct ZumuTranslatorButton: View {
    public init(
        config: ZumuTranslator.TranslationConfig,
        apiKey: String,
        shouldAutoStart: Bool = false
    )
}
```

### ZumuTranslator.TranslationConfig

```swift
public init(
    driverName: String,
    driverLanguage: String,
    passengerName: String,
    passengerLanguage: String? = nil,
    tripId: String? = nil,
    pickupLocation: String? = nil,
    dropoffLocation: String? = nil,
    externalDriverId: String? = nil,
    memberId: String? = nil
)
```

## Troubleshooting

### "No such module 'LiveKit'" Build Error

**Solution**: Ensure LiveKit SDK is properly installed via CocoaPods or Swift Package Manager before adding the button SDK.

### Microphone Not Working

**Solution**:
1. Check `Info.plist` has `NSMicrophoneUsageDescription`
2. Verify microphone permissions in Settings → Privacy → Microphone
3. Restart the app after granting permissions

### Button Not Appearing

**Solution**:
1. Check ZStack layering - button should be in top layer
2. Verify button is not hidden by other views
3. Ensure `showButton` conditional is `true`

### Waveform Not Animating

**Expected Behavior**: Brief delay (100-200ms) before waveform starts due to audio track publishing async. This is normal and doesn't affect functionality.

### Connection Fails

**Solution**:
1. Verify API key is valid
2. Check network connection
3. Review console logs for specific error messages
4. Ensure backend is reachable at `https://translator.zumu.ai`

## Demo App

See the full demo app implementation at: [zumu-ios-sdk-demo-button](https://github.com/Zumu-AI/zumu-ios-sdk-demo-button)

The demo includes:
- Homepage with settings configuration
- Multiple trip presets
- Auto-start functionality
- Conditional button rendering

## Architecture

The SDK consists of 4 main files:

1. **ZumuTranslatorButton.swift**: Main button component with UI and state management
2. **Models.swift**: Data models and configuration types
3. **ZumuTokenSource.swift**: API client for LiveKit token generation
4. **Helpers.swift**: Utility views (LanguageIconView, etc.)

### Design Principles

- **SwiftUI-First**: Native SwiftUI with Combine for reactivity
- **Observable Pattern**: @StateObject for lifecycle management
- **Delegate Pattern**: LiveKit RoomDelegate for event handling
- **State Machine**: Clear state transitions (inactive → connecting → active)
- **Async/Await**: Modern Swift concurrency throughout

## Performance

- **Button Size**: 200px width × 56px height
- **Memory**: < 5MB typical usage
- **CPU**: < 5% when active
- **Network**: ~50-100 KB/s during translation
- **Battery**: Minimal impact with standard voice calls

## Security

- **API Key**: Stored in memory only, never persisted
- **Encryption**: All LiveKit communication is encrypted
- **Privacy**: No data retention beyond session
- **Permissions**: Microphone access required and requested

## Production Checklist

Before deploying to production:

- [ ] Replace hardcoded API keys with secure storage (Keychain)
- [ ] Add error tracking (Sentry/Firebase)
- [ ] Implement analytics for session metrics
- [ ] Test on physical devices across iOS versions
- [ ] Review App Store privacy requirements
- [ ] Add accessibility labels for VoiceOver
- [ ] Test with poor network conditions
- [ ] Localize UI strings for target markets

## Support

- **Documentation**: [https://docs.zumu.ai](https://docs.zumu.ai)
- **Issues**: [GitHub Issues](https://github.com/Zumu-AI/zumu-ios-sdk-button/issues)
- **Email**: support@zumu.ai

## License

MIT License - see LICENSE file for details.

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

**Built with ❤️ by [Zumu AI](https://zumu.ai)**
