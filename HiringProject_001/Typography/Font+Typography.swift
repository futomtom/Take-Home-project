import SwiftUI

enum FontKind: String {
    case regular = "Roboto-Regular"
    case bold = "Roboto-Bold"
}

extension Font {
    static func regular(_ size: CGFloat) -> Font {
        .custom(.regular, size: size)
    }

    static func bold(_ size: CGFloat) -> Font {
        .custom(.bold, size: size)
            .bold()
    }
}

private extension Font {
    static func custom(_ kind: FontKind, size: CGFloat) -> Font {
        .custom(kind.rawValue, fixedSize: size)
    }
}
