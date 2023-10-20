import Foundation
import SwiftUI
import UIKit

enum Constant {
    static var screenWidth = UIScreen.main.bounds.width
}

public enum NetworkError: Error {
    case decodeFailure
    case fetchFailure

    var message: String {
        switch self {
        case .decodeFailure:
            return "Decode error"
        case .fetchFailure:
            return "fetch failure"
        }
    }
}
