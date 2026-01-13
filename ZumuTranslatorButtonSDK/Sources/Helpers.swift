import SwiftUI

// MARK: - Language Icon

/// Custom language/translation icon from Font Awesome Pro
/// Represents a language whiteboard symbol for auto-detect functionality
struct LanguageIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Scale factor to fit the icon in the given rect
        let scaleX = rect.width / 640
        let scaleY = rect.height / 640

        // SVG path data (scaled to fit)
        path.move(to: CGPoint(x: 236.8 * scaleX, y: 81.4 * scaleY))
        path.addCurve(
            to: CGPoint(x: 173 * scaleX, y: 86.5 * scaleY),
            control1: CGPoint(x: 233.3 * scaleX, y: 39.7 * scaleY),
            control2: CGPoint(x: 169.9 * scaleX, y: 44.8 * scaleY)
        )
        path.addLine(to: CGPoint(x: 176.5 * scaleX, y: 130.2 * scaleY))
        path.addCurve(
            to: CGPoint(x: 56 * scaleX, y: 131.8 * scaleY),
            control1: CGPoint(x: 136.3 * scaleX, y: 130.9 * scaleY),
            control2: CGPoint(x: 95.7 * scaleX, y: 131.8 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 24 * scaleX, y: 163.8 * scaleY),
            control1: CGPoint(x: 38.3 * scaleX, y: 131.8 * scaleY),
            control2: CGPoint(x: 24 * scaleX, y: 146.1 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 56 * scaleX, y: 195.8 * scaleY),
            control1: CGPoint(x: 24 * scaleX, y: 181.5 * scaleY),
            control2: CGPoint(x: 38.3 * scaleX, y: 195.8 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 278.5 * scaleX, y: 193.3 * scaleY),
            control1: CGPoint(x: 130.3 * scaleX, y: 195.9 * scaleY),
            control2: CGPoint(x: 204.5 * scaleX, y: 192.7 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 259.6 * scaleX, y: 223.1 * scaleY),
            control1: CGPoint(x: 272.7 * scaleX, y: 203.3 * scaleY),
            control2: CGPoint(x: 266.6 * scaleX, y: 212.7 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 209.1 * scaleX, y: 294.3 * scaleY),
            control1: CGPoint(x: 243.8 * scaleX, y: 247.2 * scaleY),
            control2: CGPoint(x: 229.1 * scaleX, y: 272.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 200.7 * scaleX, y: 288.4 * scaleY),
            control1: CGPoint(x: 206.2 * scaleX, y: 292.3 * scaleY),
            control2: CGPoint(x: 203.4 * scaleX, y: 290.3 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 109.9 * scaleX, y: 248.1 * scaleY),
            control1: CGPoint(x: 168.6 * scaleX, y: 273.6 * scaleY),
            control2: CGPoint(x: 146.9 * scaleX, y: 220.4 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 164.7 * scaleX, y: 341.4 * scaleY),
            control1: CGPoint(x: 73.1 * scaleX, y: 286.2 * scaleY),
            control2: CGPoint(x: 140.6 * scaleX, y: 322.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 71.5 * scaleX, y: 393.9 * scaleY),
            control1: CGPoint(x: 138.8 * scaleX, y: 362.2 * scaleY),
            control2: CGPoint(x: 104.3 * scaleX, y: 380.8 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 56.2 * scaleX, y: 436.5 * scaleY),
            control1: CGPoint(x: 55.5 * scaleX, y: 401.5 * scaleY),
            control2: CGPoint(x: 48.7 * scaleX, y: 420.5 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 114.4 * scaleX, y: 444.9 * scaleY),
            control1: CGPoint(x: 67.6 * scaleX, y: 461 * scaleY),
            control2: CGPoint(x: 94.9 * scaleX, y: 456.4 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 219.1 * scaleX, y: 378.9 * scaleY),
            control1: CGPoint(x: 152.3 * scaleX, y: 428.9 * scaleY),
            control2: CGPoint(x: 185.8 * scaleX, y: 408.4 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 341.6 * scaleX, y: 440.2 * scaleY),
            control1: CGPoint(x: 256.6 * scaleX, y: 402.9 * scaleY),
            control2: CGPoint(x: 299.5 * scaleX, y: 425.5 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 301.4 * scaleX, y: 541.2 * scaleY),
            control1: CGPoint(x: 327.4 * scaleX, y: 472.7 * scaleY),
            control2: CGPoint(x: 314 * scaleX, y: 508 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 320 * scaleX, y: 582.4 * scaleY),
            control1: CGPoint(x: 295.2 * scaleX, y: 557.7 * scaleY),
            control2: CGPoint(x: 303.5 * scaleX, y: 576.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 381.2 * scaleX, y: 511.8 * scaleY),
            control1: CGPoint(x: 363.1 * scaleX, y: 596.2 * scaleY),
            control2: CGPoint(x: 367.7 * scaleX, y: 539 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 520 * scaleX, y: 505.4 * scaleY),
            control1: CGPoint(x: 428.3 * scaleX, y: 510.4 * scaleY),
            control2: CGPoint(x: 471.9 * scaleX, y: 510.4 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 573.4 * scaleX, y: 563 * scaleY),
            control1: CGPoint(x: 528.8 * scaleX, y: 530.9 * scaleY),
            control2: CGPoint(x: 536.4 * scaleX, y: 574.8 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 589.7 * scaleX, y: 511.5 * scaleY),
            control1: CGPoint(x: 595.7 * scaleX, y: 555.7 * scaleY),
            control2: CGPoint(x: 599.4 * scaleX, y: 530.5 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 483.4 * scaleX, y: 243.2 * scaleY),
            control1: CGPoint(x: 558 * scaleX, y: 420.2 * scaleY),
            control2: CGPoint(x: 525.9 * scaleX, y: 332 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 420.1 * scaleX, y: 252.6 * scaleY),
            control1: CGPoint(x: 467.9 * scaleX, y: 213.4 * scaleY),
            control2: CGPoint(x: 430.4 * scaleX, y: 224 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 363.2 * scaleX, y: 379.9 * scaleY),
            control1: CGPoint(x: 396.4 * scaleX, y: 292.3 * scaleY),
            control2: CGPoint(x: 377 * scaleX, y: 333.1 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 262.2 * scaleX, y: 330.3 * scaleY),
            control1: CGPoint(x: 329.9 * scaleX, y: 368.3 * scaleY),
            control2: CGPoint(x: 294.6 * scaleX, y: 350.3 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 351.3 * scaleX, y: 195.7 * scaleY),
            control1: CGPoint(x: 296.3 * scaleX, y: 288.6 * scaleY),
            control2: CGPoint(x: 322.5 * scaleX, y: 243.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 407.8 * scaleX, y: 164.1 * scaleY),
            control1: CGPoint(x: 375.3 * scaleX, y: 198.7 * scaleY),
            control2: CGPoint(x: 407.8 * scaleX, y: 195 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 375.8 * scaleX, y: 132.1 * scaleY),
            control1: CGPoint(x: 407.8 * scaleX, y: 146.4 * scaleY),
            control2: CGPoint(x: 393.5 * scaleX, y: 132.1 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 240.4 * scaleX, y: 129.1 * scaleY),
            control1: CGPoint(x: 331.5 * scaleX, y: 131.8 * scaleY),
            control2: CGPoint(x: 285.5 * scaleX, y: 128 * scaleY)
        )
        path.addLine(to: CGPoint(x: 236.6 * scaleX, y: 81.2 * scaleY))
        path.closeSubpath()

        // Second part of the path
        path.move(to: CGPoint(x: 497.3 * scaleX, y: 443.4 * scaleY))
        path.addCurve(
            to: CGPoint(x: 472.4 * scaleX, y: 445.5 * scaleY),
            control1: CGPoint(x: 488.6 * scaleX, y: 444.2 * scaleY),
            control2: CGPoint(x: 479.6 * scaleX, y: 444.9 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 423.7 * scaleX, y: 446.8 * scaleY),
            control1: CGPoint(x: 454.9 * scaleX, y: 445.8 * scaleY),
            control2: CGPoint(x: 439.2 * scaleX, y: 446.3 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 408.1 * scaleX, y: 447.3 * scaleY),
            control1: CGPoint(x: 418.5 * scaleX, y: 447 * scaleY),
            control2: CGPoint(x: 413.3 * scaleX, y: 447.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 452 * scaleX, y: 328.7 * scaleY),
            control1: CGPoint(x: 424.2 * scaleX, y: 407.5 * scaleY),
            control2: CGPoint(x: 430.7 * scaleX, y: 369.2 * scaleY)
        )
        path.addCurve(
            to: CGPoint(x: 497.2 * scaleX, y: 443.4 * scaleY),
            control1: CGPoint(x: 468.1 * scaleX, y: 366.2 * scaleY),
            control2: CGPoint(x: 482.6 * scaleX, y: 404.1 * scaleY)
        )
        path.closeSubpath()

        return path
    }
}

/// View wrapper for the LanguageIcon with customizable styling
struct LanguageIconView: View {
    var size: CGFloat = 16
    var color: Color = .orange

    var body: some View {
        LanguageIcon()
            .fill(color)
            .frame(width: size, height: size)
    }
}
