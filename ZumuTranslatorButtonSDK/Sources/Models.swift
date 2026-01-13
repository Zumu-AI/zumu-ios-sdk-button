import Foundation

/// Main SDK namespace for Zumu Translation Button
public class ZumuTranslator {

    // MARK: - Configuration

    /// Translation session configuration
    public struct TranslationConfig {
        public let driverName: String
        public let driverLanguage: String
        public let passengerName: String
        public let passengerLanguage: String?
        public let tripId: String
        public let pickupLocation: String?
        public let dropoffLocation: String?
        public let externalDriverId: String?
        public let memberId: String?

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
        ) {
            self.driverName = driverName
            self.driverLanguage = driverLanguage
            self.passengerName = passengerName
            self.passengerLanguage = passengerLanguage
            self.tripId = tripId ?? UUID().uuidString
            self.pickupLocation = pickupLocation
            self.dropoffLocation = dropoffLocation
            self.externalDriverId = externalDriverId
            self.memberId = memberId
        }
    }
}
