# Usage Examples

Complete usage examples for the Zumu Translator Button SDK.

## Basic Integration

### Simple Rideshare App

```swift
import SwiftUI

struct TripView: View {
    let trip: Trip
    let apiKey = "zumu_your_api_key"

    var body: some View {
        ZStack {
            // Your trip UI
            MapView(trip: trip)

            VStack {
                TopNavigationBar(destination: trip.dropoff)
                Spacer()
                TripDetailsSheet(trip: trip)
            }

            // Floating translation button (bottom-right)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZumuTranslatorButton(
                        config: ZumuTranslator.TranslationConfig(
                            driverName: trip.driver.name,
                            driverLanguage: trip.driver.language,
                            passengerName: trip.passenger.name,
                            passengerLanguage: trip.passenger.language,
                            tripId: trip.id,
                            pickupLocation: trip.pickup.address,
                            dropoffLocation: trip.dropoff.address
                        ),
                        apiKey: apiKey
                    )
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 300) // Position above bottom sheet
                .zIndex(999) // Always on top
            }
        }
        .ignoresSafeArea()
    }
}
```

## Advanced Patterns

### Conditional Rendering with Settings

```swift
import SwiftUI

// AppSettings with persistent storage
class AppSettings: ObservableObject {
    @AppStorage("showAITranslator") var showAITranslator: Bool = true
    @AppStorage("autoStartTranslation") var autoStartTranslation: Bool = false

    var shouldShowButton: Bool {
        showAITranslator
    }

    var shouldAutoConnect: Bool {
        autoStartTranslation && showAITranslator
    }
}

// Trip view with conditional button
struct ActiveTripView: View {
    @EnvironmentObject var settings: AppSettings
    let trip: Trip

    var body: some View {
        ZStack {
            TripMapView(trip: trip)

            // Only show button if setting is enabled
            if settings.shouldShowButton {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZumuTranslatorButton(
                            config: ZumuTranslator.TranslationConfig(
                                driverName: trip.driver.name,
                                driverLanguage: trip.driver.language,
                                passengerName: trip.passenger.name,
                                passengerLanguage: trip.passenger.language,
                                tripId: trip.id
                            ),
                            apiKey: apiKey,
                            shouldAutoStart: settings.shouldAutoConnect // Auto-start if enabled
                        )
                        .id(trip.id) // Force re-creation for each trip
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 300)
                }
                .transition(.scale.combined(with: .opacity)) // Smooth appearance
            }
        }
    }
}
```

### Environment-Based API Key

```swift
import SwiftUI

struct MyApp: App {
    // Read API key from environment or configuration
    private var apiKey: String {
        if let key = ProcessInfo.processInfo.environment["ZUMU_API_KEY"] {
            return key
        }
        #if DEBUG
        return "zumu_dev_key_for_testing"
        #else
        fatalError("ZUMU_API_KEY not configured")
        #endif
    }

    var body: some Scene {
        WindowGroup {
            ContentView(apiKey: apiKey)
        }
    }
}

struct ContentView: View {
    let apiKey: String

    var body: some View {
        TripView(apiKey: apiKey)
    }
}
```

### Multiple Buttons (Different Trips)

```swift
import SwiftUI

struct MultiTripDashboard: View {
    @State private var activeTrips: [Trip] = []

    var body: some View {
        ZStack {
            // Dashboard UI
            TripListView(trips: activeTrips)

            // Buttons for each active trip (stacked vertically)
            VStack(alignment: .trailing, spacing: 12) {
                Spacer()

                ForEach(activeTrips) { trip in
                    HStack {
                        Spacer()
                        ZumuTranslatorButton(
                            config: ZumuTranslator.TranslationConfig(
                                driverName: trip.driver.name,
                                driverLanguage: trip.driver.language,
                                passengerName: trip.passenger.name,
                                passengerLanguage: trip.passenger.language,
                                tripId: trip.id
                            ),
                            apiKey: apiKey
                        )
                        .id(trip.id)
                    }
                }
            }
            .padding(.trailing, 20)
            .padding(.bottom, 100)
        }
    }
}
```

## State Management

### View Recreation Pattern

```swift
// Force button to re-create when trip changes
ZumuTranslatorButton(config: config, apiKey: apiKey)
    .id(trip.id) // SwiftUI will create new instance when ID changes
```

### Animation Transitions

```swift
// Smooth appearance/disappearance
if showButton {
    ZumuTranslatorButton(...)
        .transition(.scale.combined(with: .opacity))
        .animation(.spring(response: 0.3), value: showButton)
}
```

## Error Handling

### With Error Alerts

```swift
struct TripView: View {
    @State private var showError = false
    @State private var errorMessage = ""

    var body: some View {
        ZStack {
            // ... your UI ...

            ZumuTranslatorButton(...)
                .alert("Translation Error", isPresented: $showError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(errorMessage)
                }
        }
    }
}
```

## UIKit Integration

### Using in UIViewController

```swift
import UIKit
import SwiftUI

class TripViewController: UIViewController {
    private var hostingController: UIHostingController<ZumuTranslatorButton>?

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = ZumuTranslator.TranslationConfig(
            driverName: "Max",
            driverLanguage: "Russian",
            passengerName: "Fadi",
            passengerLanguage: "Arabic"
        )

        let button = ZumuTranslatorButton(
            config: config,
            apiKey: "zumu_your_api_key"
        )

        // Embed SwiftUI button in UIKit
        let hosting = UIHostingController(rootView: button)
        hostingController = hosting

        addChild(hosting)
        view.addSubview(hosting.view)

        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hosting.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            hosting.view.widthAnchor.constraint(equalToConstant: 200),
            hosting.view.heightAnchor.constraint(equalToConstant: 56)
        ])

        hosting.didMove(toParent: self)
    }
}
```

## Testing

### Preview Provider

```swift
#if DEBUG
struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(
            trip: Trip.sample,
            apiKey: "zumu_preview_key"
        )
        .environmentObject(AppSettings())
    }
}
#endif
```

### Mock Configuration

```swift
#if DEBUG
extension ZumuTranslator.TranslationConfig {
    static var preview: ZumuTranslator.TranslationConfig {
        ZumuTranslator.TranslationConfig(
            driverName: "John Doe",
            driverLanguage: "English",
            passengerName: "Maria Garcia",
            passengerLanguage: "Spanish",
            tripId: "preview-trip-123",
            pickupLocation: "123 Main St",
            dropoffLocation: "456 Oak Ave"
        )
    }
}
#endif
```

## Best Practices

### 1. Button Positioning

```swift
// ✅ Good: Clear z-index hierarchy
ZStack {
    ContentLayer()      // z-index: 0
    OverlayLayer()      // z-index: 1
    ButtonLayer()       // z-index: 999 (always on top)
        .zIndex(999)
}

// ❌ Bad: No z-index, may be hidden
ZStack {
    ContentLayer()
    ButtonLayer()
    OverlayLayer() // This may hide the button
}
```

### 2. View Recreation

```swift
// ✅ Good: Force re-creation for new trips
ZumuTranslatorButton(...)
    .id(trip.id)

// ❌ Bad: Button state persists across trips
ZumuTranslatorButton(...) // Same instance for all trips
```

### 3. Conditional Rendering

```swift
// ✅ Good: Smooth transitions
if showButton {
    ZumuTranslatorButton(...)
        .transition(.scale.combined(with: .opacity))
}

// ❌ Bad: Abrupt appearance
if showButton {
    ZumuTranslatorButton(...) // No transition
}
```

### 4. API Key Management

```swift
// ✅ Good: Environment-based
let apiKey = ProcessInfo.processInfo.environment["ZUMU_API_KEY"] ?? "fallback"

// ❌ Bad: Hardcoded in source
let apiKey = "zumu_abc123..." // Security risk
```

## Common Patterns

### Auto-Start on Trip Accept

```swift
struct TripView: View {
    @State private var tripAccepted = false

    var body: some View {
        ZStack {
            // ... UI ...

            if tripAccepted {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZumuTranslatorButton(
                            config: config,
                            apiKey: apiKey,
                            shouldAutoStart: true // Auto-connect when trip accepted
                        )
                    }
                }
            }
        }
    }
}
```

### Toggle Button Visibility

```swift
struct SettingsView: View {
    @AppStorage("showAITranslator") var showAITranslator: Bool = true

    var body: some View {
        Form {
            Toggle("Show AI Translator", isOn: $showAITranslator)
        }
    }
}
```

### Language Auto-Detection

```swift
// Set passengerLanguage to nil for auto-detect
ZumuTranslator.TranslationConfig(
    driverName: "Max",
    driverLanguage: "Russian",
    passengerName: "Unknown Passenger",
    passengerLanguage: nil, // Auto-detect passenger language
    tripId: trip.id
)
```

## Industry Use Cases

### Rideshare Apps

```swift
// Uber/Lyft-style apps
ZumuTranslatorButton(
    config: ZumuTranslator.TranslationConfig(
        driverName: driver.name,
        driverLanguage: driver.preferredLanguage,
        passengerName: passenger.name,
        passengerLanguage: nil, // Auto-detect
        tripId: ride.id,
        pickupLocation: ride.pickup,
        dropoffLocation: ride.dropoff,
        externalDriverId: driver.externalId,
        memberId: passenger.memberId
    ),
    apiKey: apiKey
)
```

### Delivery Apps

```swift
// DoorDash/UberEats-style apps
ZumuTranslatorButton(
    config: ZumuTranslator.TranslationConfig(
        driverName: courier.name,
        driverLanguage: courier.language,
        passengerName: customer.name,
        passengerLanguage: customer.language,
        tripId: delivery.id,
        pickupLocation: restaurant.address,
        dropoffLocation: customer.address
    ),
    apiKey: apiKey
)
```

### Hospitality Apps

```swift
// Hotel/Resort staff communication
ZumuTranslatorButton(
    config: ZumuTranslator.TranslationConfig(
        driverName: staffMember.name,
        driverLanguage: "English", // Staff language
        passengerName: guest.name,
        passengerLanguage: nil, // Auto-detect guest language
        tripId: request.id
    ),
    apiKey: apiKey
)
```
