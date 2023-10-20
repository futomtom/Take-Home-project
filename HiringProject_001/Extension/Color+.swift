import SwiftUI

extension Color {
    static var background = Color(hex: 0x1C1C29, opacity: 1)
    static var sectionBackground = Color(hex: 0x2B2B3F, opacity: 1)
    static var cellBackground = Color(hex: 0x404153, opacity: 1)

    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
